v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 600 -360 600 -200 {lab=BIAS}
N 780 -360 780 -200 {lab=BIAS}
N 540 -390 560 -390 {lab=IN_P}
N 600 -640 600 -620 {lab=VDD}
N 600 -640 780 -640 {lab=VDD}
N 780 -640 780 -620 {lab=VDD}
N 540 -590 600 -590 {lab=VDD}
N 660 -590 740 -590 {lab=#net1}
N 600 -440 600 -420 {lab=#net1}
N 600 -440 660 -440 {lab=#net1}
N 660 -590 660 -440 {lab=#net1}
N 640 -590 660 -590 {lab=#net1}
N 600 -560 600 -440 {lab=#net1}
N 780 -520 780 -420 {lab=AMP_OUT}
N 340 -440 360 -440 {lab=VDD}
N 340 -420 360 -420 {lab=VSS}
N 780 -590 840 -590 {lab=VDD}
N 600 -390 780 -390 {lab=VSS}
N 780 -520 800 -520 {lab=AMP_OUT}
N 780 -560 780 -520 {lab=AMP_OUT}
N 820 -390 840 -390 {lab=IN_N}
N 690 -200 780 -200 {lab=BIAS}
N 690 -200 690 -180 {lab=BIAS}
N 600 -200 690 -200 {lab=BIAS}
C {sg13g2_pr/sg13_lv_pmos.sym} 620 -590 0 1 {name=M_LOAD1
l=1u
w=4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 340 -440 0 1 {name=p1 lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 580 -390 0 0 {name=M_IN_P
l=1u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 800 -390 0 1 {name=M_IN_N
l=1u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 690 -390 1 0 {name=p9 sig_type=std_logic lab=VSS}
C {iopin.sym} 840 -390 0 0 {name=p10 lab=IN_N}
C {iopin.sym} 540 -390 2 0 {name=p11 lab=IN_P}
C {sg13g2_pr/sg13_lv_pmos.sym} 760 -590 0 0 {name=M_LOAD2
l=1u
w=4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 690 -640 1 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 540 -590 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 840 -590 0 1 {name=p15 sig_type=std_logic lab=VDD}
C {iopin.sym} 800 -520 0 0 {name=p16 lab=AMP_OUT}
C {lab_pin.sym} 360 -440 0 1 {name=p17 sig_type=std_logic lab=VDD}
C {iopin.sym} 340 -420 0 1 {name=p18 lab=VSS}
C {lab_pin.sym} 360 -420 0 1 {name=p19 sig_type=std_logic lab=VSS}
C {iopin.sym} 690 -180 3 1 {name=p2 lab=BIAS}
