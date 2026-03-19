v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -320 350 -300 {lab=#net1}
N 350 -220 350 -200 {lab=VBIAS_N}
N 690 -170 750 -170 {lab=VSS}
N 690 -120 710 -120 {lab=VSS}
N 690 -140 690 -120 {lab=VSS}
N 600 -360 600 -340 {lab=#net2}
N 780 -360 780 -340 {lab=#net2}
N 690 -340 780 -340 {lab=#net2}
N 600 -390 780 -390 {lab=VSS}
N 540 -390 560 -390 {lab=IN_P}
N 370 -590 390 -590 {lab=VDD}
N 370 -570 390 -570 {lab=VSS}
N 290 -170 350 -170 {lab=VSS}
N 330 -120 350 -120 {lab=VSS}
N 350 -140 350 -120 {lab=VSS}
N 350 -220 410 -220 {lab=VBIAS_N}
N 410 -220 410 -170 {lab=VBIAS_N}
N 350 -240 350 -220 {lab=VBIAS_N}
N 390 -170 410 -170 {lab=VBIAS_N}
N 690 -340 690 -200 {lab=#net2}
N 600 -340 690 -340 {lab=#net2}
N 820 -390 840 -390 {lab=IN_N}
N 600 -460 600 -420 {lab=OUT_P}
N 580 -460 600 -460 {lab=OUT_P}
N 780 -460 780 -420 {lab=OUT_N}
N 780 -460 800 -460 {lab=OUT_N}
N 600 -480 600 -460 {lab=OUT_P}
N 600 -480 660 -480 {lab=OUT_P}
N 660 -500 660 -480 {lab=OUT_P}
N 780 -480 780 -460 {lab=OUT_N}
N 720 -480 780 -480 {lab=OUT_N}
N 720 -500 720 -480 {lab=OUT_N}
N 720 -580 720 -560 {lab=VDD}
N 690 -580 720 -580 {lab=VDD}
N 660 -580 660 -560 {lab=VDD}
N 690 -600 690 -580 {lab=VDD}
N 660 -580 690 -580 {lab=VDD}
N 330 -400 350 -400 {lab=VDD}
N 350 -400 350 -380 {lab=VDD}
N 350 -350 400 -350 {lab=VDD}
N 290 -350 310 -350 {lab=ENA}
N 410 -170 650 -170 {lab=VBIAS_N}
C {sg13g2_pr/sg13_lv_nmos.sym} 370 -170 0 1 {name=M2
l=1.0u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 370 -590 0 1 {name=p1 lab=VDD}
C {lab_pin.sym} 350 -220 0 0 {name=p2 sig_type=std_logic lab=VBIAS_N}
C {sg13g2_pr/rhigh.sym} 350 -270 0 0 {name=R1
w=0.5e-6
l=30e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 290 -170 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 330 -120 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 670 -170 0 0 {name=M_TAIL
l=1.0u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 750 -170 0 1 {name=p6 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 710 -120 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 580 -390 0 0 {name=M_IN_P
l=1.0u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 800 -390 0 1 {name=M_IN_N
l=1.0u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 690 -390 3 1 {name=p9 sig_type=std_logic lab=VSS}
C {iopin.sym} 840 -390 0 0 {name=p10 lab=IN_N}
C {iopin.sym} 540 -390 2 0 {name=p11 lab=IN_P}
C {iopin.sym} 800 -460 0 0 {name=p16 lab=OUT_N}
C {lab_pin.sym} 390 -590 0 1 {name=p17 sig_type=std_logic lab=VDD}
C {iopin.sym} 370 -570 0 1 {name=p18 lab=VSS}
C {lab_pin.sym} 390 -570 0 1 {name=p19 sig_type=std_logic lab=VSS}
C {iopin.sym} 580 -460 0 1 {name=p8 lab=OUT_P}
C {sg13g2_pr/rhigh.sym} 660 -530 0 1 {name=R2
w=0.5e-6
l=30e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rhigh.sym} 720 -530 0 0 {name=R3
w=0.5e-6
l=30e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 690 -600 1 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 330 -400 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 400 -350 0 1 {name=p14 sig_type=std_logic lab=VDD}
C {iopin.sym} 290 -350 0 1 {name=p15 lab=ENA}
C {sg13g2_pr/sg13_lv_pmos.sym} 330 -350 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
