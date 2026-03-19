v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 600 -680 600 -640 {lab=GND}
N 420 -640 420 -620 {lab=GND}
N 420 -780 420 -700 {lab=clk}
N 420 -780 450 -780 {lab=clk}
N 510 -940 510 -920 {lab=GND}
N 600 -1020 600 -880 {lab=VDD}
N 750 -850 770 -850 {lab=COMP1}
N 750 -830 770 -830 {lab=COMP2}
N 750 -810 770 -810 {lab=COMP3}
N 750 -790 770 -790 {lab=COMP4}
N 750 -730 770 -730 {lab=COMP7}
N 750 -710 770 -710 {lab=COMP8}
N 750 -770 770 -770 {lab=COMP5}
N 750 -750 770 -750 {lab=COMP6}
N 570 -1020 600 -1020 {lab=VDD}
N 570 -1020 570 -880 {lab=VDD}
N 510 -1020 510 -1000 {lab=VDD}
N 510 -1020 570 -1020 {lab=VDD}
C {title.sym} 160 -30 0 0 {name=l1 author="Hector Mclean"}
C {devices/code_shown.sym} 1145 -1325 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="* Slow-Slow Transistors (High Vth, Low Mobility)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_ss

* Maximum Resistance (Worst case for your 700um bias resistor)
.lib $::SG13G2_MODELS/cornerRES.lib res_typ

* Minimum Capacitance (Worst case for filtering)
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ"}
C {lab_pin.sym} 420 -780 0 0 {name=p6 sig_type=std_logic lab=clk}
C {gnd.sym} 600 -640 0 0 {name=l2 lab=GND}
C {iopin.sym} 770 -830 0 0 {name=p34 lab=COMP2}
C {iopin.sym} 770 -810 0 0 {name=p36 lab=COMP3}
C {iopin.sym} 770 -790 0 0 {name=p38 lab=COMP4}
C {iopin.sym} 770 -770 0 0 {name=p40 lab=COMP5}
C {iopin.sym} 770 -750 0 0 {name=p42 lab=COMP6}
C {iopin.sym} 770 -730 0 0 {name=p44 lab=COMP7}
C {iopin.sym} 770 -710 0 0 {name=p46 lab=COMP8}
C {iopin.sym} 770 -850 0 0 {name=p48 lab=COMP1}
C {/headless/eda/Hall_Xschem_Logic/hall_sensor_core.sym} 600 -750 0 0 {name=x1}
C {vsource.sym} 510 -970 0 1 {name=V1 value=1.2 savecurrent=false}
C {vsource.sym} 420 -670 0 1 {name=Vclk value="PULSE(0 1.2 0 0.1n 0.1n 5u 10u)" savecurrent=false}
C {gnd.sym} 420 -620 0 0 {name=l3 lab=GND}
C {gnd.sym} 510 -920 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 600 -1020 0 1 {name=p1 sig_type=std_logic lab=VDD}
C {code_shown.sym} 1140 -1140 0 0 {name=NGSPICE_HYSTERESIS_TEST1 only_toplevel=true
value=".control
  save all 
  
  * ==========================================
  * HYSTERESIS SWEEP: 10ms
  * ==========================================
  * Route through X1 (Core) down to X_HALL (Hall block)
  alter @r.x1.x1.r1[resistance] = 1000
  alter @r.x1.x1.r2[resistance] = 1000
  alter @r.x1.x1.r3[resistance] = 1000
  alter @r.x1.x1.r4[resistance] = 1000

  * Route the PWL voltage sweep directly into the 2nd layer
  alter @v.x1.x1.vb[pwl] = [ 0 0 5m 0.1905 10m 0 ]

  * (Keep your MAGIC SAUCE options here)
  .options itl4=100 reltol=0.01 method=gear cshunt=10f

  tran 100n 10m

  plot v(x1.amp_out) v(comp1) v(comp2) v(comp3) v(comp4) v(comp5) v(comp6) v(comp7) v(comp8) title 'Hysteresis_and_Comparators'
.endc"}
