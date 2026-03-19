v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {1.2V supply (logic)} 930 -770 0 0 0.2 0.2 {}
N 610 -570 690 -570 {lab=#net1}
N 630 -530 690 -530 {lab=#net2}
N 630 -530 630 -450 {lab=#net2}
N 510 -470 510 -450 {lab=#net2}
N 510 -450 630 -450 {lab=#net2}
N 670 -490 690 -490 {lab=#net3}
N 670 -490 670 -410 {lab=#net3}
N 390 -410 670 -410 {lab=#net3}
N 390 -570 390 -410 {lab=#net3}
N 390 -570 410 -570 {lab=#net3}
N 630 -610 690 -610 {lab=#net4}
N 630 -690 630 -610 {lab=#net4}
N 510 -690 630 -690 {lab=#net4}
N 510 -690 510 -670 {lab=#net4}
N 1260 -510 1260 -360 {lab=clk}
N 990 -510 1260 -510 {lab=clk}
N 820 -810 820 -680 {lab=VDD}
N 860 -810 860 -680 {lab=VDD}
N 860 -810 910 -810 {lab=VDD}
N 910 -810 910 -790 {lab=VDD}
N 910 -730 910 -710 {lab=GND}
N 840 -420 840 -400 {lab=GND}
N 910 -810 930 -810 {lab=VDD}
N 1410 -590 1410 -570 {lab=out_n}
N 1410 -650 1410 -630 {lab=out_p}
N 1410 -750 1410 -710 {lab=GND}
N 1410 -750 1430 -750 {lab=GND}
N 1430 -750 1430 -730 {lab=GND}
N 1410 -510 1410 -470 {lab=GND}
N 990 -590 1410 -590 {lab=out_n}
N 990 -630 1410 -630 {lab=out_p}
N 1260 -270 1260 -250 {lab=GND}
N 820 -810 860 -810 {lab=VDD}
N 1410 -590 1430 -590 {lab=out_n}
N 1410 -630 1430 -630 {lab=out_p}
N 1160 -310 1160 -290 {lab=GND}
N 1160 -430 1160 -410 {lab=VDD}
N 1260 -360 1260 -330 {lab=clk}
N 1240 -360 1260 -360 {lab=clk}
N 1000 -360 1010 -360 {lab=!clk}
N 1000 -470 1000 -360 {lab=!clk}
N 990 -470 1000 -470 {lab=!clk}
C {/headless/eda/Hall_Xschem_Logic/Hall_Sensor.sym} 510 -570 0 0 {name=x1}
C {title.sym} 160 -30 0 0 {name=l1 author="Hector Mclean"}
C {/headless/eda/Hall_Xschem_Logic/Rotator.sym} 840 -550 0 0 {name=x2}
C {vsource.sym} 910 -760 0 1 {name=V1 value=1.2 savecurrent=false}
C {gnd.sym} 910 -710 0 0 {name=l3 lab=GND}
C {gnd.sym} 840 -400 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 930 -810 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 185 -1245 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {sg13g2_pr/cap_cmim.sym} 1410 -540 0 0 {name=C2
model=cap_cmim
w=7.0e-5
l=7.0e-5
m=1
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} 1410 -680 2 0 {name=C3
model=cap_cmim
w=7.0e-5
l=7.0e-5
m=1
spiceprefix=X}
C {gnd.sym} 1410 -470 0 0 {name=l7 lab=GND}
C {gnd.sym} 1430 -730 0 0 {name=l9 lab=GND}
C {vsource.sym} 1260 -300 0 0 {name=Vclk value="PULSE(0 1.2 0 1n 1n 5u 10u)" savecurrent=false}
C {gnd.sym} 1260 -250 0 0 {name=l8 lab=GND}
C {code_shown.sym} 200 -1150 0 0 {name=NGSPICE_ROTATOR only_toplevel=true 
value=".param temp=27
.control
  save all 
  
  * Run a 50 microsecond simulation (shows 5 full clock cycles at 100kHz)
  * Step size is 50ns for good resolution
  tran 50n 50u
  
  * 1. Plot the clocks to verify they are pulsing in opposition
  plot v(clk) v(!clk)
  
  * 2. Plot the raw outputs of the rotator
  plot v(out_p) v(out_n)
  
  * 3. Plot the differential voltage (This is your chopped Hall signal!)
  plot v(out_p)-v(out_n)
  
  write tran_rotator.raw
.endc
"}
C {lab_pin.sym} 1260 -360 0 1 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} 1000 -360 0 0 {name=p7 sig_type=std_logic lab=!clk}
C {lab_pin.sym} 1430 -630 0 1 {name=p8 sig_type=std_logic lab=out_p}
C {lab_pin.sym} 1430 -590 0 1 {name=p9 sig_type=std_logic lab=out_n}
C {/headless/eda/Hall_Xschem_Logic/Inverter.sym} 1160 -360 0 1 {name=x4}
C {lab_pin.sym} 1160 -430 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {gnd.sym} 1160 -290 0 0 {name=l2 lab=GND}
