v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 -70 -30 -70 {lab=a}
N -80 -70 -80 70 {lab=a}
N -80 70 -30 70 {lab=a}
N 30 70 80 70 {lab=b}
N 80 -70 80 70 {lab=b}
N 30 -70 80 -70 {lab=b}
N -120 0 -80 0 {lab=a}
N 80 0 120 0 {lab=b}
C {sky130_fd_pr/pfet_01v8.sym} 0 -90 1 0 {name=MP
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 0 90 3 0 {name=MN
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 0 -70 3 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 0 70 1 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 0 110 3 0 {name=p12 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} 0 -110 1 0 {name=p13 sig_type=std_logic lab=selb}
C {devices/iopin.sym} -120 0 2 0 {name=p14 lab=a}
C {devices/iopin.sym} 120 0 0 0 {name=p15 lab=b}
C {devices/iopin.sym} -200 -50 2 0 {name=p16 lab=VDD}
C {devices/iopin.sym} -200 -30 2 0 {name=p17 lab=VSS}
C {devices/ipin.sym} -200 30 0 0 {name=p1 lab=sel}
C {devices/ipin.sym} -200 50 0 0 {name=p2 lab=selb}
