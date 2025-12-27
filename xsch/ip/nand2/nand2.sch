v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -0 100 0 120 {lab=#net1}
N 0 70 10 70 {lab=VSS}
N 10 70 10 180 {lab=VSS}
N -60 -70 -50 -70 {lab=VDD}
N -50 -120 -50 -70 {lab=VDD}
N -60 -120 -60 -100 {lab=VDD}
N -60 -120 60 -120 {lab=VDD}
N 60 -120 60 -100 {lab=VDD}
N 60 -70 70 -70 {lab=VDD}
N 70 -120 70 -70 {lab=VDD}
N 60 -120 70 -120 {lab=VDD}
N -0 0 -0 40 {lab=out}
N -0 -0 60 -0 {lab=out}
N 60 -40 60 -0 {lab=out}
N -60 -40 -60 -0 {lab=out}
N -60 -0 -0 0 {lab=out}
N 60 0 80 0 {lab=out}
N 10 -70 20 -70 {lab=b}
N -110 -70 -100 -70 {lab=a}
N -50 70 -40 70 {lab=a}
N -50 150 -40 150 {lab=b}
N -0 180 -0 200 {lab=VSS}
N 10 180 10 200 {lab=VSS}
N 0 200 10 200 {lab=VSS}
N 0 150 10 150 {lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} -20 70 0 0 {name=MN1
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -80 -70 0 0 {name=MP1
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} -160 -110 0 0 {name=p1 lab=a}
C {devices/opin.sym} 80 0 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 0 -120 3 0 {name=p3 lab=VDD}
C {devices/iopin.sym} 0 200 1 0 {name=p4 lab=VSS}
C {devices/ipin.sym} -160 -90 0 0 {name=p5 lab=b}
C {sky130_fd_pr/pfet_01v8.sym} 40 -70 0 0 {name=MP2
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -20 150 0 0 {name=MN2
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -110 -70 0 0 {name=p6 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} 10 -70 0 0 {name=p7 sig_type=std_logic lab=b}
C {devices/lab_pin.sym} -50 70 0 0 {name=p8 sig_type=std_logic lab=a}
C {devices/lab_pin.sym} -50 150 0 0 {name=p9 sig_type=std_logic lab=b}
