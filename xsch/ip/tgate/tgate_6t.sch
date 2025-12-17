v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 170 -80 210 {lab=selb}
N -140 140 -120 140 {lab=en}
N -140 150 -140 240 {lab=en}
N -140 240 -120 240 {lab=en}
N -140 140 -140 150 {lab=en}
N -160 190 -140 190 {lab=en}
N -80 90 -80 110 {lab=VDD}
N -80 270 -80 290 {lab=VSS}
N -80 240 -70 240 {lab=VSS}
N -70 240 -70 270 {lab=VSS}
N -80 270 -70 270 {lab=VSS}
N -80 140 -70 140 {lab=VDD}
N -70 110 -70 140 {lab=VDD}
N -80 110 -70 110 {lab=VDD}
N -80 190 0 190 {lab=selb}
N 80 170 80 210 {lab=sel}
N 20 140 40 140 {lab=selb}
N 20 150 20 240 {lab=selb}
N 20 240 40 240 {lab=selb}
N 20 140 20 150 {lab=selb}
N 0 190 20 190 {lab=selb}
N 80 90 80 110 {lab=VDD}
N 80 270 80 290 {lab=VSS}
N 80 240 90 240 {lab=VSS}
N 90 240 90 270 {lab=VSS}
N 80 270 90 270 {lab=VSS}
N 80 140 90 140 {lab=VDD}
N 90 110 90 140 {lab=VDD}
N 80 110 90 110 {lab=VDD}
N 80 190 160 190 {lab=sel}
N -80 -200 -30 -200 {lab=a}
N -80 -200 -80 -60 {lab=a}
N -80 -60 -30 -60 {lab=a}
N 30 -60 80 -60 {lab=b}
N 80 -200 80 -60 {lab=b}
N 30 -200 80 -200 {lab=b}
N -120 -130 -80 -130 {lab=a}
N 80 -130 120 -130 {lab=b}
C {sky130_fd_pr/nfet_01v8.sym} -100 240 0 0 {name=M2
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -100 140 0 0 {name=M11
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 60 240 0 0 {name=M1
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 60 140 0 0 {name=M3
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} -80 90 1 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 80 90 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 80 290 3 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -80 290 3 0 {name=p6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 160 190 2 0 {name=p8 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} 20 190 2 0 {name=p9 sig_type=std_logic lab=selb}
C {sky130_fd_pr/pfet_01v8.sym} 0 -220 1 0 {name=M4
L=0.15
W=2
nf=1 mult=1
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 0 -40 3 0 {name=M5
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 0 -200 3 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 0 -60 1 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 0 -20 3 0 {name=p12 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} 0 -240 1 0 {name=p13 sig_type=std_logic lab=selb}
C {devices/iopin.sym} -120 -130 2 0 {name=p14 lab=a}
C {devices/iopin.sym} 120 -130 0 0 {name=p15 lab=b}
C {devices/ipin.sym} -160 190 0 0 {name=p7 lab=en}
C {devices/iopin.sym} -220 -210 2 0 {name=p16 lab=VDD}
C {devices/iopin.sym} -220 -190 2 0 {name=p17 lab=VSS}
