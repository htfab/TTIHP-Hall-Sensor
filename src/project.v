/*
 * Copyright (c) 2024
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Hecmac_Hall(
  input  wire [7:0] ui_in,    // Dedicated inputs (8-bit hall sensor comparator inputs)
  output wire [7:0] uo_out,   // Dedicated outputs (VGA signals)
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path (uio_out[0] = 100kHz clock)
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered
  input  wire       clk,      // clock (Assuming 25.175 MHz VGA clock)
  input  wire       rst_n     // reset_n - low to reset
);

  // ==========================================
  // DECLARATIONS 
  // ==========================================
  wire hsync;
  wire vsync;
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;
  wire video_active;
  wire [9:0] pix_x;
  wire [9:0] pix_y;
  wire _unused_ok;

  reg [9:0] frame_counter;
  
  // Background
  wire [9:0] cx;
  wire [9:0] cy;
  wire checker_bit;
  wire [1:0] bg_B;

  // Graphics: 8 Squares
  wire [9:0] x_shifted;
  wire [2:0] box_idx;
  wire [5:0] local_x;
  wire [5:0] dx_box;
  wire [9:0] dy_box;
  wire in_boxes_area;
  wire is_box_outer;
  wire is_box_stroke;
  wire current_box_active;
  wire [1:0] box_R, box_G, box_B;

  // Text Routing
  wire y_in_str1, x_in_str1, y_in_str2, x_in_str2;
  wire [4:0] char_idx1, char_idx2;
  wire [1:0] px_in_char, py_in_char;

  // Mexican wave: per-character Y offset for top string
  wire [4:0] wave_phase1;      // phase = char_idx + frame_counter offset
  wire [3:0] tri_wave1;        // 0..15 triangle value for current char
  wire [9:0] char_y_base1;     // animated Y start for current top-string char
  wire       y_in_str1_wave;   // pix_y falls inside this char's animated row
  
  reg [3:0] char_code;
  reg [11:0] bitmap;     
  wire [3:0] bit_idx;
  reg draw_text;
  
  wire [1:0] text_R, text_G, text_B;
  wire [1:0] active_text_R, active_text_G, active_text_B;
  wire [1:0] out_R, out_G, out_B;

  // Calibration and 100kHz Clock Logic
  reg [6:0] clk_div_100k;
  reg clk_100k;
  
  reg [21:0] calib_timer;
  reg [7:0] trigger_mask;
  reg calib_done;
  wire text_trigger;

  // ==========================================
  // ASSIGNMENTS & COMBINATIONAL LOGIC
  // ==========================================

  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};
  
  assign uio_out = {7'b0000000, clk_100k};
  assign uio_oe  = 8'b00000001; 
  
  assign _unused_ok = &{ena, uio_in};

  // --- Background: Moving Checkerboard ---
  assign cx = pix_x + frame_counter;
  assign cy = pix_y + frame_counter;
  assign checker_bit = cx[5] ^ cy[5];
  assign bg_B = checker_bit ? 2'b10 : 2'b01;

  // --- Graphics: 8 Status Squares ---
  assign x_shifted = pix_x - 64;
  assign box_idx = x_shifted[8:6];
  assign local_x = x_shifted[5:0];
  
  assign dx_box = (local_x > 32) ? (local_x - 32) : (32 - local_x);
  assign dy_box = (pix_y > 240) ? (pix_y - 240) : (240 - pix_y);

  assign in_boxes_area = (pix_x >= 64) && (pix_x < 576);
  assign is_box_outer = in_boxes_area && (dx_box < 24) && (dy_box < 24);
  assign is_box_stroke = is_box_outer && ((dx_box > 20) || (dy_box > 20));

  assign current_box_active = ui_in[box_idx];

  assign box_R = is_box_stroke ? 2'b01 : (current_box_active ? 2'b00 : 2'b11);
  assign box_G = is_box_stroke ? 2'b01 : (current_box_active ? 2'b11 : 2'b00);
  assign box_B = is_box_stroke ? 2'b01 : 2'b00;

  // --- Text Rendering (4x scaling) ---
  // Bottom string: static, no wave
  assign y_in_str2 = (pix_y >= 400) && (pix_y < 416);
  assign x_in_str2 = (pix_x >= 176) && (pix_x < 464);

  // Top string X window (same as before)
  assign x_in_str1 = (pix_x >= 128) && (pix_x < 512);

  // Character indices
  assign char_idx1 = (pix_x - 128) >> 4;
  assign char_idx2 = (pix_x - 176) >> 4;

  // --- Mexican Wave for top string ---
  // phase = char_idx1 + (frame_counter >> 1), wraps naturally in 5 bits
  // Using frame_counter[5:1] slows the wave to a comfortable speed
  assign wave_phase1 = char_idx1 + frame_counter[5:1];

  // Triangle wave from phase: fold on bit[4]
  //   phase[3:0] counts 0..15, bit[4] inverts it → 0→15→0→15... per char
  assign tri_wave1 = wave_phase1[4] ? ~wave_phase1[3:0] : wave_phase1[3:0];

  // Animated Y base for the current character (64 ± up to 15 px)
  // When triggered: bob up by tri_wave (subtract so wave goes upward)
  // When not triggered: sit at fixed Y=64
  assign char_y_base1 = text_trigger ? (10'd64 - {6'b0, tri_wave1}) : 10'd64;

  // This pixel's Y is inside the current top-string character's animated row
  assign y_in_str1_wave = (pix_y >= char_y_base1) && (pix_y < char_y_base1 + 10'd16);

  // Combine X and Y for top string active region
  assign y_in_str1 = y_in_str1_wave;

  // Pixel position within the 4x4 character cell
  // px_in_char uses pix_x as before; py_in_char uses the per-char animated base
  assign px_in_char = x_in_str1 ? ((pix_x - 128) >> 2) & 3 : ((pix_x - 176) >> 2) & 3;
  assign py_in_char = y_in_str1 ? ((pix_y - char_y_base1) >> 2) & 3 : ((pix_y - 400) >> 2) & 3;
  
  assign bit_idx = (3 - py_in_char) * 3 + (2 - px_in_char);

  // --- Animated Text Colors (top string only) ---
  assign text_trigger = calib_done && (|(ui_in & trigger_mask));

  assign text_R = {frame_counter[5], frame_counter[6] ^ pix_x[4]};
  assign text_G = {~frame_counter[6], frame_counter[5] ^ pix_x[5]};
  assign text_B = {frame_counter[7], ~frame_counter[5] ^ pix_x[6]};

  assign active_text_R = text_trigger ? text_R : 2'b11;
  assign active_text_G = text_trigger ? text_G : 2'b11;
  assign active_text_B = text_trigger ? text_B : 2'b11;

  // --- Compositing Priority: Text -> Boxes -> Background ---
  // Bottom string is always white; top string uses animated color
  wire draw_text_str1 = draw_text && (y_in_str1 && x_in_str1);
  wire draw_text_str2 = draw_text && (y_in_str2 && x_in_str2);

  assign out_R = draw_text_str1 ? active_text_R :
                 draw_text_str2 ? 2'b11 :
                 (is_box_outer  ? box_R : 2'b00);
  assign out_G = draw_text_str1 ? active_text_G :
                 draw_text_str2 ? 2'b11 :
                 (is_box_outer  ? box_G : 2'b00);
  assign out_B = draw_text_str1 ? active_text_B :
                 draw_text_str2 ? 2'b11 :
                 (is_box_outer  ? box_B : bg_B);

  assign R = video_active ? out_R : 2'b00;
  assign G = video_active ? out_G : 2'b00;
  assign B = video_active ? out_B : 2'b00;

  // ==========================================
  // INSTANTIATIONS & PROCEDURAL BLOCKS
  // ==========================================
  
  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(video_active),
    .hpos(pix_x),
    .vpos(pix_y)
  );

  // --- Frame Counter ---
  always @(posedge vsync or negedge rst_n) begin
    if (~rst_n) frame_counter <= 0;
    else frame_counter <= frame_counter + 1;
  end

  // --- Calibration Timer & 100kHz Clock Gen ---
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      clk_div_100k <= 0;
      clk_100k <= 0;
      calib_timer <= 0;
      calib_done <= 0;
      trigger_mask <= 0;
    end else begin
      if (clk_div_100k == 124) begin
        clk_div_100k <= 0;
        clk_100k <= ~clk_100k;
      end else begin
        clk_div_100k <= clk_div_100k + 1;
      end

      if (!calib_done) begin
        if (calib_timer == 22'd2_500_000) begin
          trigger_mask <= ~ui_in & (ui_in + 1);
          calib_done <= 1;
        end else begin
          calib_timer <= calib_timer + 1;
        end
      end
    end
  end

  // --- Text Dictionaries ---
  always @(*) begin
    char_code = 0;
    if (y_in_str1 && x_in_str1) begin
      case(char_idx1)
        0, 7: char_code = 4; // G
        1, 11, 19: char_code = 11; // R
        2, 3: char_code = 2; // E
        4, 18: char_code = 13; // T
        5, 22: char_code = 6; // I
        6: char_code = 9; // N
        8, 17: char_code = 12; // S
        10: char_code = 3; // F
        12: char_code = 10; // O
        13: char_code = 8; // M
        15, 20, 23: char_code = 1; // A
        16: char_code = 14; // U
        21: char_code = 7; // L
        default: char_code = 0;
      endcase
    end else if (y_in_str2 && x_in_str2) begin
      case(char_idx2)
        0: char_code = 5; // H
        1, 14: char_code = 1; // A
        2, 3: char_code = 7; // L
        5, 8, 12, 17: char_code = 12; // S
        6: char_code = 2; // E
        7: char_code = 9; // N
        9: char_code = 10; // O
        10: char_code = 11; // R
        13, 15: char_code = 13; // T
        16: char_code = 14; // U
        default: char_code = 0;
      endcase
    end
  end

  always @(*) begin
    case(char_code)
      1:  bitmap = 12'b010_101_111_101; // A
      2:  bitmap = 12'b111_110_100_111; // E
      3:  bitmap = 12'b111_110_100_100; // F
      4:  bitmap = 12'b111_100_101_111; // G
      5:  bitmap = 12'b101_111_101_101; // H
      6:  bitmap = 12'b010_010_010_010; // I
      7:  bitmap = 12'b100_100_100_111; // L
      8:  bitmap = 12'b101_111_101_101; // M 
      9:  bitmap = 12'b111_101_101_101; // N
      10: bitmap = 12'b111_101_101_111; // O
      11: bitmap = 12'b110_101_110_101; // R
      12: bitmap = 12'b011_100_011_110; // S
      13: bitmap = 12'b111_010_010_010; // T
      14: bitmap = 12'b101_101_101_111; // U
      default: bitmap = 12'b0;
    endcase
  end

  always @(*) begin
    if ((y_in_str1 && x_in_str1) || (y_in_str2 && x_in_str2)) begin
      if (px_in_char < 3 && bit_idx < 12)
        draw_text = bitmap[bit_idx];
      else
        draw_text = 1'b0;
    end else begin
      draw_text = 1'b0;
    end
  end

endmodule

// ==========================================
// HVSYNC GENERATOR MODULE
// ==========================================
module hvsync_generator(clk, reset, hsync, vsync, display_on, hpos, vpos);

  input clk;
  input reset;
  output reg hsync, vsync;
  output display_on;
  output reg [9:0] hpos;
  output reg [9:0] vpos;

  parameter H_DISPLAY       = 640; 
  parameter H_BACK          =  48; 
  parameter H_FRONT         =  16; 
  parameter H_SYNC          =  96; 
  
  parameter V_DISPLAY       = 480; 
  parameter V_TOP           =  33; 
  parameter V_BOTTOM        =  10; 
  parameter V_SYNC          =   2; 
  
  parameter H_SYNC_START    = H_DISPLAY + H_FRONT;
  parameter H_SYNC_END      = H_DISPLAY + H_FRONT + H_SYNC - 1;
  parameter H_MAX           = H_DISPLAY + H_BACK + H_FRONT + H_SYNC - 1;
  parameter V_SYNC_START    = V_DISPLAY + V_BOTTOM;
  parameter V_SYNC_END      = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
  parameter V_MAX           = V_DISPLAY + V_TOP + V_BOTTOM + V_SYNC - 1;

  wire hmaxxed = (hpos == H_MAX) || reset;  
  wire vmaxxed = (vpos == V_MAX) || reset;  
  
  always @(posedge clk) begin
    hsync <= ~(hpos>=H_SYNC_START && hpos<=H_SYNC_END);
    if(hmaxxed)
      hpos <= 0;
    else
      hpos <= hpos + 1;
  end

  always @(posedge clk) begin
    vsync <= ~(vpos>=V_SYNC_START && vpos<=V_SYNC_END);
    if(hmaxxed)
      if (vmaxxed)
        vpos <= 0;
      else
        vpos <= vpos + 1;
  end
  
  assign display_on = (hpos<H_DISPLAY) && (vpos<V_DISPLAY);

endmodule
