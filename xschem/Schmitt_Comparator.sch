v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 240 -150 260 -150 {lab=IN}
N 240 -250 240 -150 {lab=IN}
N 240 -250 260 -250 {lab=IN}
N 240 -350 260 -350 {lab=IN}
N 240 -450 260 -450 {lab=IN}
N 300 -400 300 -380 {lab=#net1}
N 300 -300 300 -280 {lab=#net2}
N 300 -200 300 -180 {lab=#net3}
N 490 -200 510 -200 {lab=VDD}
N 490 -400 510 -400 {lab=VSS}
N 300 -400 430 -400 {lab=#net1}
N 300 -200 430 -200 {lab=#net3}
N 300 -220 300 -200 {lab=#net3}
N 300 -420 300 -400 {lab=#net1}
N 240 -450 240 -350 {lab=IN}
N 240 -300 240 -250 {lab=IN}
N 300 -300 460 -300 {lab=#net2}
N 300 -320 300 -300 {lab=#net2}
N 460 -300 460 -240 {lab=#net2}
N 460 -360 460 -300 {lab=#net2}
N 300 -100 320 -100 {lab=VSS}
N 300 -120 300 -100 {lab=VSS}
N 300 -500 300 -480 {lab=VDD}
N 300 -500 320 -500 {lab=VDD}
N 240 -350 240 -300 {lab=IN}
N 460 -460 460 -400 {lab=VDD}
N 300 -450 360 -450 {lab=VDD}
N 300 -350 360 -350 {lab=VDD}
N 300 -150 360 -150 {lab=VSS}
N 300 -250 360 -250 {lab=VSS}
N 600 -510 630 -510 {lab=VSS}
N 600 -490 630 -490 {lab=VDD}
N 460 -300 620 -300 {lab=#net2}
N 600 -450 630 -450 {lab=IN}
N 600 -470 630 -470 {lab=OUT}
N 160 -300 240 -300 {lab=IN}
N 160 -300 160 -280 {lab=IN}
N 140 -300 160 -300 {lab=IN}
N 160 -220 160 -200 {lab=VSS}
N 870 -220 870 -200 {lab=VSS}
N 460 -210 460 -140 {lab=VSS}
N 680 -300 680 -280 {lab=OUT}
N 680 -300 870 -300 {lab=OUT}
N 680 -320 680 -300 {lab=OUT}
N 620 -250 640 -250 {lab=#net2}
N 620 -300 620 -250 {lab=#net2}
N 620 -350 640 -350 {lab=#net2}
N 620 -350 620 -300 {lab=#net2}
N 680 -250 730 -250 {lab=VSS}
N 680 -350 730 -350 {lab=VDD}
N 680 -400 680 -380 {lab=VDD}
N 680 -400 700 -400 {lab=VDD}
N 680 -220 680 -200 {lab=VSS}
N 680 -200 700 -200 {lab=VSS}
N 870 -300 870 -280 {lab=OUT}
N 870 -300 890 -300 {lab=OUT}
N 620 -250 620 -210 {lab=#net2}
N 620 -150 620 -130 {lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} 280 -450 0 0 {name=M1
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 280 -350 0 0 {name=M2
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 280 -250 0 0 {name=M3
l=0.13u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 280 -150 0 0 {name=M4
l=0.13u
w=4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 460 -380 3 0 {name=M5
l=2u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 460 -220 1 0 {name=M6
l=2u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 510 -400 0 1 {name=p1 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 510 -200 0 1 {name=p2 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 320 -500 0 1 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 320 -100 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 460 -460 3 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 360 -450 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 360 -350 0 1 {name=p9 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 360 -250 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 360 -150 0 1 {name=p11 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 460 -140 1 1 {name=p12 sig_type=std_logic lab=VSS}
C {iopin.sym} 630 -510 0 0 {name=p13 lab=VSS}
C {lab_pin.sym} 600 -510 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {iopin.sym} 630 -490 0 0 {name=p15 lab=VDD}
C {lab_pin.sym} 600 -490 0 0 {name=p16 sig_type=std_logic lab=VDD}
C {iopin.sym} 630 -470 0 0 {name=p6 lab=OUT}
C {iopin.sym} 630 -450 0 0 {name=p18 lab=IN}
C {lab_pin.sym} 890 -300 0 1 {name=p17 sig_type=std_logic lab=OUT}
C {lab_pin.sym} 140 -300 0 0 {name=p5 sig_type=std_logic lab=IN}
C {lab_pin.sym} 600 -470 0 0 {name=p19 sig_type=std_logic lab=OUT}
C {lab_pin.sym} 600 -450 0 0 {name=p20 sig_type=std_logic lab=IN}
C {sg13g2_pr/cap_cmim.sym} 160 -250 0 0 {name=C1
model=cap_cmim
w=2e-6
l=2e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 160 -200 2 1 {name=p21 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 870 -250 0 0 {name=C18
model=cap_cmim
w=5e-6
l=5e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 870 -200 2 0 {name=p22 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_pmos.sym} 660 -350 0 0 {name=M7
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 660 -250 0 0 {name=M8
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 730 -250 2 0 {name=p23 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 730 -350 0 1 {name=p24 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 700 -400 0 1 {name=p25 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 700 -200 2 0 {name=p26 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 620 -180 0 0 {name=C2
model=cap_cmim
w=4e-6
l=4e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 620 -130 2 0 {name=p27 sig_type=std_logic lab=VSS}
