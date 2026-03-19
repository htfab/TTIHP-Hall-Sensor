v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 730 -640 1530 -240 {flags=graph
y1=-0.1
ypos1=0
ypos2=2
subdivy=1
unity=1
x1=0
x2=0.01
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="4 5"
node="out
in"
hilight_wave=0
y2=1.3
divy=13}
N 280 -330 280 -310 {lab=VDD}
N 280 -250 280 -230 {lab=GND}
N 410 -330 410 -230 {lab=VDD}
N 280 -330 410 -330 {lab=VDD}
N 260 -330 280 -330 {lab=VDD}
N 540 -170 560 -170 {lab=out}
N 480 -170 540 -170 {lab=out}
N 410 -110 410 -90 {lab=GND}
N 540 -50 540 -30 {lab=GND}
N 220 -170 340 -170 {lab=in}
N 220 -170 220 -150 {lab=in}
N 200 -170 220 -170 {lab=in}
N 220 -90 220 -70 {lab=GND}
N 540 -170 540 -110 {lab=out}
C {gnd.sym} 410 -90 0 0 {name=l1 lab=GND}
C {vsource.sym} 280 -280 0 0 {name=Vdd value=1.2 savecurrent=false}
C {gnd.sym} 280 -230 0 0 {name=l2 lab=GND}
C {gnd.sym} 220 -70 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 560 -170 0 1 {name=p2 sig_type=std_logic lab=out}
C {devices/code_shown.sym} 15 -575 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {lab_pin.sym} 260 -330 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 200 -170 0 0 {name=p1 sig_type=std_logic lab=in}
C {sg13g2_pr/cap_cmim.sym} 540 -80 0 0 {name=C1
model=cap_cmim
w=7.0e-6
l=7.0e-6
m=1
spiceprefix=X}
C {gnd.sym} 540 -30 0 0 {name=l4 lab=GND}
C {/headless/eda/Hall_Xschem_Logic/Schmitt_Comparator.sym} 410 -170 0 0 {name=x1}
C {vsource.sym} 220 -120 0 0 {name=Vin value="pwl(0 0  5m 1.2  10m 0)"
}
C {code_shown.sym} -660 -540 0 0 {name=NGSPICE only_toplevel=true 
value=".param temp=27
.control
save all 
tran 500n 10m
meas tran tdelay TRIG v(in) VAl=0.9 FALl=1 TARG v(out) VAl=0.9 RISE=1
write tran_logic_comp.raw
.endc
.param temp=27
.control
save all 
tran 500n 10m

* 1. Measure Lower Trip Point (V_TL)
* Finds the input voltage right as the output crosses 0.9V and goes HIGH
meas tran v_tl FIND v(in) WHEN v(out)=0.9 RISE=1

* 2. Measure Upper Trip Point (V_TH)
* Finds the input voltage right as the output crosses 0.9V and goes LOW
meas tran v_th FIND v(in) WHEN v(out)=0.9 FALL=1

* 3. Calculate and print the hysteresis width
let v_hyst = v_th - v_tl
print v_tl v_th v_hyst

write tran_logic_comp.raw
.endc"}
C {devices/launcher.sym} 1020 -170 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_comp.raw tran"
}
