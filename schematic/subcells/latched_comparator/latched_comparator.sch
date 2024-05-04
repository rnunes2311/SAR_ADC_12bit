v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Simulation Results:
Offset: ~ 2.8 mV 1 sigma
Propagation delay @ 1 mV overdrive:
Propagation delay @ 100 uV overdrive:
Propagation delay @ 10 uV overdrive:
Energy per cycle: 392, 413, 440 fJ
} 2060 -920 0 0 0.4 0.4 {}
T {Simulation Results:
} 2060 -970 0 0 0.6 0.6 {}
N 1010 -630 1010 -600 {
lab=#net1}
N 1290 -630 1290 -600 {
lab=#net1}
N 1010 -750 1010 -690 {
lab=#net2}
N 1290 -750 1290 -690 {
lab=#net3}
N 1010 -880 1010 -810 {
lab=OUT_Ni}
N 1290 -880 1290 -810 {
lab=OUT_Pi}
N 1230 -780 1250 -780 {
lab=OUT_Ni}
N 1230 -910 1230 -780 {
lab=OUT_Ni}
N 1230 -920 1250 -920 {
lab=OUT_Ni}
N 1050 -920 1070 -920 {
lab=OUT_Pi}
N 1070 -910 1070 -780 {
lab=OUT_Pi}
N 1050 -780 1070 -780 {
lab=OUT_Pi}
N 1150 -600 1150 -560 {
lab=#net1}
N 1010 -990 1010 -950 {
lab=VDD}
N 1290 -990 1290 -950 {
lab=VDD}
N 1010 -1000 1010 -990 {
lab=VDD}
N 1290 -1000 1290 -990 {
lab=VDD}
N 1290 -890 1290 -880 {
lab=OUT_Pi}
N 1230 -920 1230 -910 {
lab=OUT_Ni}
N 1070 -920 1070 -910 {
lab=OUT_Pi}
N 1010 -890 1010 -880 {
lab=OUT_Ni}
N 870 -890 870 -860 {
lab=OUT_Ni}
N 870 -860 1010 -860 {
lab=OUT_Ni}
N 870 -1000 870 -950 {
lab=VDD}
N 1430 -890 1430 -860 {
lab=OUT_Pi}
N 1290 -840 1430 -840 {
lab=OUT_Pi}
N 1430 -1000 1430 -950 {
lab=VDD}
N 730 -890 730 -720 {
lab=#net2}
N 730 -720 1010 -720 {
lab=#net2}
N 730 -1000 730 -950 {
lab=VDD}
N 730 -1000 870 -1000 {
lab=VDD}
N 1570 -890 1570 -720 {
lab=#net3}
N 1290 -720 1570 -720 {
lab=#net3}
N 1570 -1000 1570 -950 {
lab=VDD}
N 1430 -1000 1570 -1000 {
lab=VDD}
N 1120 -680 1120 -670 {
lab=#net1}
N 1430 -860 1430 -840 {
lab=OUT_Pi}
N 1010 -600 1150 -600 {
lab=#net1}
N 1150 -600 1290 -600 {
lab=#net1}
N 1010 -840 1230 -840 {
lab=OUT_Ni}
N 1070 -860 1290 -860 {
lab=OUT_Pi}
N 870 -1000 1430 -1000 {
lab=VDD}
N 950 -660 970 -660 {
lab=VIN_P}
N 1330 -660 1350 -660 {
lab=VIN_N}
N 710 -1000 730 -1000 {
lab=VDD}
N 710 -460 1150 -460 {
lab=VSS}
N 1150 -500 1150 -460 {
lab=VSS}
N 710 -580 730 -580 {
lab=EN}
N 810 -580 830 -580 {
lab=ENi}
N 1860 -620 1880 -620 {
lab=OUT_N}
N 1860 -700 1880 -700 {
lab=OUT_P}
N 1120 -690 1130 -690 {
lab=#net1}
N 1170 -740 1170 -720 {
lab=#net1}
N 1120 -740 1170 -740 {
lab=#net1}
N 1120 -740 1120 -680 {
lab=#net1}
N 1120 -670 1120 -600 {
lab=#net1}
N 1170 -660 1170 -600 {
lab=#net1}
C {devices/ipin.sym} 950 -660 0 0 {name=p1 lab=VIN_P}
C {devices/ipin.sym} 1350 -660 0 1 {name=p2 lab=VIN_N}
C {devices/ipin.sym} 710 -1000 0 0 {name=p3 lab=VDD}
C {devices/ipin.sym} 710 -460 0 0 {name=p4 lab=VSS}
C {devices/ipin.sym} 710 -580 0 0 {name=p5 lab=EN}
C {devices/lab_pin.sym} 830 -580 0 1 {name=p6 sig_type=std_logic lab=ENi}
C {devices/lab_pin.sym} 1110 -530 0 0 {name=p7 sig_type=std_logic lab=ENi}
C {devices/lab_pin.sym} 690 -920 0 0 {name=p8 sig_type=std_logic lab=ENi}
C {devices/lab_pin.sym} 830 -920 0 0 {name=p9 sig_type=std_logic lab=ENi}
C {devices/lab_pin.sym} 1470 -920 0 1 {name=p11 sig_type=std_logic lab=ENi}
C {devices/lab_pin.sym} 1610 -920 0 1 {name=p12 sig_type=std_logic lab=ENi}
C {devices/opin.sym} 1880 -620 0 0 {name=p13 lab=OUT_N}
C {devices/lab_wire.sym} 1370 -840 0 0 {name=p14 sig_type=std_logic lab=OUT_Pi}
C {devices/lab_wire.sym} 950 -860 0 0 {name=p15 sig_type=std_logic lab=OUT_Ni}
C {devices/lab_pin.sym} 1700 -620 0 0 {name=p16 sig_type=std_logic lab=OUT_Ni}
C {devices/title.sym} 660 -320 0 0 {name=l1 author="Ricardo Nunes"}
C {devices/opin.sym} 1880 -700 0 0 {name=p17 lab=OUT_P}
C {devices/lab_pin.sym} 1700 -700 0 0 {name=p18 sig_type=std_logic lab=OUT_Pi}
C {sky130_stdcells/buf_4.sym} 770 -580 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/pfet_01v8.sym} 710 -920 0 0 {name=M10
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 730 -920 0 1 {name=p23 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 850 -920 0 0 {name=M5
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 870 -920 0 1 {name=p24 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 1030 -920 0 1 {name=M6
W=4
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1270 -920 0 0 {name=M9
W=4
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1010 -920 0 0 {name=p25 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1290 -920 0 1 {name=p27 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1430 -920 0 0 {name=p28 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1570 -920 0 0 {name=p29 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 1030 -780 0 1 {name=M3
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1270 -780 0 0 {name=M4
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1010 -780 0 0 {name=p30 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1290 -780 0 1 {name=p31 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1290 -660 0 0 {name=p33 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1170 -690 0 1 {name=p34 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 1130 -530 0 0 {name=M18
W=2
L=0.15
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1150 -530 0 1 {name=p35 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1310 -660 0 1 {name=M16
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 990 -660 0 0 {name=M1
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} 1010 -660 0 1 {name=p32 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_01v8.sym} 1450 -920 0 1 {name=M11
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1590 -920 0 1 {name=M12
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_stdcells/inv_1.sym} 1740 -700 0 0 {name=x4 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 1740 -620 0 0 {name=x5 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 1820 -620 0 0 {name=x6 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 1820 -700 0 0 {name=x7 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8_lvt.sym} 1150 -690 0 0 {name=M2
W=1
L=0.15
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
