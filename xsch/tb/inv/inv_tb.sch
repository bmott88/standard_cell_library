v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 190 -200 990 200 {flags=graph
y1=0
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-0.049821981
x2=1.8109191
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="out
in"
dataset=-1
unitx=1
logx=0
logy=0
color="5 12"}
N 100 0 140 0 {lab=out}
N -130 -0 -60 0 {lab=in}
N 0 40 0 60 {lab=GND}
N -130 -120 0 -120 {lab=#net1}
N 0 -120 0 -40 {lab=#net1}
N -0 30 -0 40 {lab=GND}
N 60 0 100 0 {lab=out}
N 0 -40 0 -30 {lab=#net1}
C {sky130_fd_pr/corner.sym} -290 -140 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code.sym} -290 40 0 0 {name=SIM only_toplevel=false value="

.control

dc V1 0 1.8 1m
wrdata OUTPUT.csv v(out)
quit
.endc
"}
C {ip/inv/inv.sym} 0 0 0 0 {name=x1}
C {devices/lab_pin.sym} 120 0 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/noconn.sym} 140 0 2 0 {name=l1}
C {devices/vsource.sym} -130 30 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -130 60 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 0 60 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -130 -90 0 0 {name=V2 value=1.8 savecurrent=false}
C {devices/gnd.sym} -130 -60 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -90 0 1 0 {name=p2 sig_type=std_logic lab=in}
