v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -0 60 20 {lab=out}
N -0 -0 -0 50 {lab=in}
N 0 -50 20 -50 {lab=in}
N -0 50 20 50 {lab=in}
N -20 -0 -0 -0 {lab=in}
N 0 -50 -0 -0 {lab=in}
N 60 -0 150 -0 {lab=out}
N 60 -20 60 -0 {lab=out}
N 60 80 60 100 {lab=VSS}
N 60 100 110 100 {lab=VSS}
N 60 -100 60 -80 {lab=VDD}
N 60 50 110 50 {lab=VSS}
N 110 50 110 100 {lab=VSS}
N 110 100 120 100 {lab=VSS}
N 60 -100 110 -100 {lab=VDD}
N 60 -50 110 -50 {lab=VDD}
N 110 -100 110 -50 {lab=VDD}
C {sg13g2_pr/sg13_lv_nmos.sym} 40 50 0 0 {name=M1
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 40 -50 0 0 {name=M2
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 110 -100 2 1 {name=p1 lab=VDD}
C {iopin.sym} 120 100 0 0 {name=p2 lab=VSS}
C {iopin.sym} -20 0 0 1 {name=p3 lab=in}
C {iopin.sym} 150 0 0 0 {name=p4 lab=out}
