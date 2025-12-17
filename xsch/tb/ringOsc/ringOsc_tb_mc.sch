v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 250 -20 290 -20 {lab=out}
N 30 -10 50 -10 {lab=GND}
N 30 -10 30 10 {lab=GND}
N -30 -40 50 -40 {lab=#net1}
C {ip/ringOsc/ringOsc.sym} 150 -20 0 0 {name=x1}
C {devices/noconn.sym} 290 -20 2 0 {name=l1}
C {devices/lab_pin.sym} 270 -20 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/gnd.sym} 30 10 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -30 -10 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -30 20 0 0 {name=l3 lab=GND}
C {devices/code.sym} -210 -140 0 0 {name=SIM only_toplevel=false value="

.control
set temp=27
tran 0.1p 5n
wrdata ringOsc_tran_mc.csv v(out)
.endc
"}
C {sky130_fd_pr/corner.sym} -210 10 0 0 {name=CORNER only_toplevel=false corner=tt}
