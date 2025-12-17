v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 120 -400 920 0 {flags=graph
y1=-0.068
y2=2.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-09
x2=1.1e-08
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
B 2 120 0 920 400 {flags=graph
y1=0
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1e-09
x2=1.1e-08
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="in
sel"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0
}
N 50 -0 70 -0 {lab=out}
N -70 0 -50 0 {lab=in}
N 70 0 80 0 {lab=out}
C {ip/tgate/tgate_2t.sym} 0 0 0 0 {name=x1}
C {devices/lab_pin.sym} 70 0 1 0 {name=p1 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} -70 0 0 0 {name=p2 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -30 -30 1 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 0 30 3 0 {name=p5 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} 0 -30 1 0 {name=p6 sig_type=std_logic lab=selb}
C {sky130_fd_pr/corner.sym} -480 -120 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code.sym} -480 40 0 0 {name=SIM only_toplevel=false value="

.control
save v(in) v(out) v(sel) v(selb)
tran 1p 10n
write tgate_2t_tran.raw
quit
.endc
"}
C {devices/vsource.sym} -330 0 0 0 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} -330 30 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -30 30 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -330 -30 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -250 0 0 0 {name=V2 value="pulse(1.8 0 0 1p 1p 4n 8n)" savecurrent=false}
C {devices/gnd.sym} -250 30 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -250 150 0 0 {name=V3 value="pulse(0 1.8 0 1p 1p 4n 8n)" savecurrent=false}
C {devices/gnd.sym} -250 180 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -250 120 1 0 {name=p7 sig_type=std_logic lab=selb}
C {devices/lab_pin.sym} -250 -30 1 0 {name=p8 sig_type=std_logic lab=sel}
C {devices/vsource.sym} -250 -130 0 0 {name=V4 value="pulse(1.8 0 0 1p 1p 2n 4n)" savecurrent=false}
C {devices/gnd.sym} -250 -100 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -250 -160 1 0 {name=p9 sig_type=std_logic lab=in}
C {devices/noconn.sym} 80 0 2 0 {name=l6}
