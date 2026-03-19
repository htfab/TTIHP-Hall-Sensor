v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 600 -360 600 -340 {lab=#net1}
N 780 -360 780 -340 {lab=#net1}
N 690 -340 780 -340 {lab=#net1}
N 540 -390 560 -390 {lab=IN_P}
N 600 -640 600 -620 {lab=VDD}
N 600 -640 780 -640 {lab=VDD}
N 780 -640 780 -620 {lab=VDD}
N 540 -590 600 -590 {lab=VDD}
N 660 -590 740 -590 {lab=#net2}
N 600 -440 600 -420 {lab=#net2}
N 600 -440 660 -440 {lab=#net2}
N 660 -590 660 -440 {lab=#net2}
N 640 -590 660 -590 {lab=#net2}
N 600 -560 600 -440 {lab=#net2}
N 780 -520 780 -420 {lab=AMP_OUT}
N 330 -520 350 -520 {lab=VDD}
N 330 -500 350 -500 {lab=VSS}
N 780 -590 840 -590 {lab=VDD}
N 360 -320 360 -300 {lab=#net3}
N 360 -220 360 -200 {lab=VBIAS_N}
N 690 -170 750 -170 {lab=VSS}
N 690 -120 710 -120 {lab=VSS}
N 690 -140 690 -120 {lab=VSS}
N 300 -170 360 -170 {lab=VSS}
N 340 -120 360 -120 {lab=VSS}
N 360 -140 360 -120 {lab=VSS}
N 360 -220 420 -220 {lab=VBIAS_N}
N 420 -220 420 -170 {lab=VBIAS_N}
N 360 -240 360 -220 {lab=VBIAS_N}
N 400 -170 420 -170 {lab=VBIAS_N}
N 690 -340 690 -200 {lab=#net1}
N 600 -340 690 -340 {lab=#net1}
N 600 -390 780 -390 {lab=VSS}
N 780 -520 800 -520 {lab=AMP_OUT}
N 780 -560 780 -520 {lab=AMP_OUT}
N 820 -390 840 -390 {lab=IN_N}
N 340 -400 360 -400 {lab=VDD}
N 360 -400 360 -380 {lab=VDD}
N 360 -350 410 -350 {lab=VDD}
N 300 -350 320 -350 {lab=ENA}
N 420 -170 650 -170 {lab=VBIAS_N}
C {sg13g2_pr/sg13_lv_pmos.sym} 620 -590 0 1 {name=M_LOAD1
l=0.5u
w=4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 330 -520 0 1 {name=p1 lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 580 -390 0 0 {name=M_IN_P
l=0.5u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 800 -390 0 1 {name=M_IN_N
l=0.5u
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
l=0.5u
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
C {lab_pin.sym} 350 -520 0 1 {name=p17 sig_type=std_logic lab=VDD}
C {iopin.sym} 330 -500 0 1 {name=p18 lab=VSS}
C {lab_pin.sym} 350 -500 0 1 {name=p19 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 380 -170 0 1 {name=M1
l=0.5u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 360 -220 0 0 {name=p20 sig_type=std_logic lab=VBIAS_N}
C {sg13g2_pr/rhigh.sym} 360 -270 0 0 {name=R2
w=0.5e-6
l=5e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 300 -170 0 0 {name=p22 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 340 -120 0 0 {name=p23 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 670 -170 0 0 {name=M_TAIL1
l=0.5u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 750 -170 0 1 {name=p24 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 710 -120 0 1 {name=p25 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 340 -400 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 410 -350 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {iopin.sym} 300 -350 0 1 {name=p4 lab=ENA}
C {sg13g2_pr/sg13_lv_pmos.sym} 340 -350 0 0 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
