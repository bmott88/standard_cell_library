v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 180 -190 980 210 {flags=graph
y1=-0.21997767
y2=2.1608223
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=5
node=out}
N 100 0 140 0 {lab=out}
N -120 10 -100 10 {lab=GND}
N -120 10 -120 30 {lab=GND}
N -180 -20 -100 -20 {lab=#net1}
C {ip/ringOsc/ringOsc.sym} 0 0 0 0 {name=x1}
C {devices/noconn.sym} 140 0 2 0 {name=l1}
C {devices/lab_pin.sym} 120 0 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/gnd.sym} -120 30 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} -180 10 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -180 40 0 0 {name=l3 lab=GND}
C {devices/code.sym} -360 -120 0 0 {name=SIM only_toplevel=false value="

.control
save v(out) i(V1)
tran 0.1p 10n
write ringOsc_tran.raw
quit
.endc
"}
C {sky130_fd_pr/corner.sym} -360 30 0 0 {name=CORNER only_toplevel=false corner=tt}
