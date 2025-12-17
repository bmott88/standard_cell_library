v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 240 -10 280 -10 {lab=out}
N 20 0 40 0 {lab=GND}
N 20 0 20 20 {lab=GND}
N -40 -30 40 -30 {lab=#net1}
C {ip/ringOsc/ringOsc.sym} 140 -10 0 0 {name=x1}
C {devices/noconn.sym} 280 -10 2 0 {name=l1}
C {devices/lab_pin.sym} 260 -10 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/gnd.sym} 20 20 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -40 0 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -40 30 0 0 {name=l3 lab=GND}
C {devices/code.sym} -220 -130 0 0 {name=SIM only_toplevel=false value="

.control
set temp=27
tran 0.1p 10n
wrdata ringOsc_tran_corners.csv v(out)
.endc
"}
C {sky130_fd_pr/corner.sym} -220 20 0 0 {name=CORNER only_toplevel=false corner=tt}
