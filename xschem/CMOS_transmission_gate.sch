v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 200 -400 280 -400 {lab=Vin}
N 200 -310 200 -230 {lab=Vin}
N 200 -230 280 -230 {lab=Vin}
N 340 -400 420 -400 {lab=Vout}
N 420 -310 420 -230 {lab=Vout}
N 340 -230 420 -230 {lab=Vout}
N 420 -310 460 -310 {lab=Vout}
N 420 -400 420 -310 {lab=Vout}
N 160 -310 200 -310 {lab=Vin}
N 200 -400 200 -310 {lab=Vin}
N 310 -270 310 -230 {lab=gnd}
N 310 -400 310 -380 {lab=vdd}
N 310 -480 310 -440 {lab=!Control}
N 310 -190 310 -150 {lab=Control}
C {sg13g2_pr/sg13_lv_nmos.sym} 310 -210 3 0 {name=M1
l=0.13u
w=0.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 310 -420 1 0 {name=M2
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 460 -310 0 0 {name=p1 lab=Vout}
C {iopin.sym} 160 -310 0 1 {name=p2 lab=Vin}
C {iopin.sym} 310 -480 0 1 {name=p3 lab=!Control}
C {iopin.sym} 310 -150 0 1 {name=p4 lab=Control}
C {iopin.sym} 310 -270 1 1 {name=p5 lab=gnd}
C {iopin.sym} 310 -380 3 1 {name=p6 lab=vdd}
