v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -150 50 -130 50 {lab=en}
N -120 -130 -80 -130 {lab=a}
N 80 -130 120 -130 {lab=b}
N 50 -130 80 -130 {lab=b}
N -80 -130 -50 -130 {lab=a}
N -10 50 20 50 {lab=selb}
N 20 50 30 50 {lab=selb}
C {devices/iopin.sym} -120 -130 2 0 {name=p14 lab=a}
C {devices/iopin.sym} 120 -130 0 0 {name=p15 lab=b}
C {devices/ipin.sym} -150 50 0 0 {name=p7 lab=en}
C {devices/iopin.sym} -220 -210 2 0 {name=p16 lab=VDD}
C {devices/iopin.sym} -220 -190 2 0 {name=p17 lab=VSS}
C {ip/inv/inv.sym} -70 50 0 0 {name=x1}
C {ip/inv/inv.sym} 90 50 0 0 {name=x2}
C {ip/tgate/tgate_2t.sym} 0 -130 0 0 {name=x3}
C {devices/lab_pin.sym} -30 -160 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -30 -100 3 0 {name=p2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 0 -160 1 0 {name=p10 sig_type=std_logic lab=selb}
C {devices/lab_pin.sym} 0 -100 3 0 {name=p11 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} -70 20 1 0 {name=p3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 90 20 1 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -70 80 3 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 90 80 3 0 {name=p6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 150 50 2 0 {name=p8 sig_type=std_logic lab=sel}
C {devices/lab_pin.sym} 10 50 1 0 {name=p9 sig_type=std_logic lab=selb}
