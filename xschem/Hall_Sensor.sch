v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 370 -260 450 -320 {lab=HALL_BOTTOM}
N 230 -400 290 -380 {lab=HALL_LEFT}
N 230 -400 290 -420 {lab=HALL_LEFT}
N 450 -420 500 -400 {lab=HALL_RIGHT}
N 450 -380 500 -400 {lab=HALL_RIGHT}
N 290 -480 370 -540 {lab=HALL_TOP}
N 370 -540 450 -480 {lab=HALL_TOP}
N 290 -320 370 -260 {lab=HALL_BOTTOM}
C {iopin.sym} 370 -540 1 1 {name=p3 lab=HALL_TOP}
C {iopin.sym} 370 -260 3 1 {name=p5 lab=HALL_BOTTOM}
C {iopin.sym} 230 -400 0 1 {name=p6 lab=HALL_LEFT}
C {iopin.sym} 500 -400 2 1 {name=p7 lab=HALL_RIGHT}
C {title.sym} 160 -30 0 0 {name=l1 author="Hector Mclean"}
C {res.sym} 290 -450 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 450 -450 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 290 -350 0 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 450 -350 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {code_shown.sym} 700 -490 0 0 {name=MAGNETIC_MODEL
value="
* Dummy voltage representing the magnetic field (B_FIELD)
* We initialize it to 0. The testbench will alter this!
VB B_FIELD 0 0

* Phase 1: Bias flowing Top->Bottom creates a Hall current Left->Right
B_LR HALL_RIGHT HALL_LEFT I = V(HALL_TOP, HALL_BOTTOM) * V(B_FIELD) * 35e-6

* Phase 2: Bias flowing Left->Right creates a Hall current Top->Bottom
B_TB HALL_TOP HALL_BOTTOM I = V(HALL_LEFT, HALL_RIGHT) * V(B_FIELD) * 35e-6
"}
