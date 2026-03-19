v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 380 -280 380 -260 {lab=VBIAS_N}
N 560 -230 620 -230 {lab=VSS}
N 560 -180 580 -180 {lab=VSS}
N 560 -200 560 -180 {lab=VSS}
N 320 -230 380 -230 {lab=VSS}
N 360 -180 380 -180 {lab=VSS}
N 380 -200 380 -180 {lab=VSS}
N 380 -280 440 -280 {lab=VBIAS_N}
N 440 -280 440 -230 {lab=VBIAS_N}
N 420 -230 440 -230 {lab=VBIAS_N}
N 440 -230 520 -230 {lab=VBIAS_N}
N 560 -370 560 -260 {lab=BIAS}
N 80 -70 100 -70 {lab=VSS}
N 80 -90 100 -90 {lab=VDD}
N 380 -300 380 -280 {lab=VBIAS_N}
N 380 -400 380 -360 {lab=#net1}
N 360 -480 380 -480 {lab=VDD}
N 380 -480 380 -460 {lab=VDD}
N 380 -430 430 -430 {lab=VDD}
N 320 -430 340 -430 {lab=ENA}
C {sg13g2_pr/sg13_lv_nmos.sym} 400 -230 0 1 {name=M1
l=1u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 380 -280 0 0 {name=p12 sig_type=std_logic lab=VBIAS_N}
C {lab_pin.sym} 360 -480 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 320 -230 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 360 -180 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 540 -230 0 0 {name=M_TAIL1
l=5u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 620 -230 0 1 {name=p16 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 580 -180 0 1 {name=p25 sig_type=std_logic lab=VSS}
C {iopin.sym} 80 -90 0 1 {name=p1 lab=VDD}
C {iopin.sym} 80 -70 0 1 {name=p18 lab=VSS}
C {iopin.sym} 560 -370 1 1 {name=p2 lab=BIAS}
C {lab_pin.sym} 100 -90 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 100 -70 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {sg13g2_pr/rhigh.sym} 380 -330 0 0 {name=R1
w=0.5e-6
l=400e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 430 -430 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {iopin.sym} 320 -430 0 1 {name=p6 lab=ENA}
C {sg13g2_pr/sg13_lv_pmos.sym} 360 -430 0 0 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
