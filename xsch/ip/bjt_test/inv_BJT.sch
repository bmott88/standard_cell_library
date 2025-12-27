v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -20 0 20 {lab=VOUT}
N -60 -50 -40 -50 {lab=VIN}
N -60 -50 -60 50 {lab=VIN}
N -60 50 -40 50 {lab=VIN}
N -80 -0 -60 -0 {lab=VIN}
N 0 -0 20 -0 {lab=VOUT}
N 0 -100 0 -80 {lab=VDD}
N 0 80 0 100 {lab=GND}
N 0 50 10 50 {lab=GND}
N 10 50 10 80 {lab=GND}
N 0 80 10 80 {lab=GND}
C {devices/gnd.sym} 0 100 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -250 0 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -250 30 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 0 -100 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -250 -30 1 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -190 0 0 0 {name=V2 value=0 savecurrent=false}
C {devices/gnd.sym} -190 30 0 0 {name=l3 lab=GND
value=VIN}
C {devices/lab_pin.sym} -190 -30 1 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} -80 0 0 0 {name=p4 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 20 0 2 0 {name=p5 sig_type=std_logic lab=VOUT}
C {sky130_fd_pr/corner.sym} 150 -130 0 0 {name=CORNER only_toplevel=true corner=tt}
C {devices/code_shown.sym} 160 40 0 0 {name=s1 only_toplevel=false value="

.control
dc V2 0 1.8 0.01
plot v(VOUT)
.endc

"}
C {sky130_fd_pr/npn_05v5.sym} -20 50 0 0 {name=Q1
model=npn_05v5_w1p00l2p00
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} -20 -50 0 0 {name=Q2
model=pnp_05v5_W0p68L0p68
spiceprefix=X
}
