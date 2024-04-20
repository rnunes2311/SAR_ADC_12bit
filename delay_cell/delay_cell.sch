v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 880 -90 880 -0 {
lab=VSS}
N 800 -420 800 -120 {
lab=IN_Z}
N 800 -120 840 -120 {
lab=IN_Z}
N 800 -820 800 -680 {
lab=IN_Z}
N 800 -820 840 -820 {
lab=IN_Z}
N 880 -790 880 -760 {
lab=t_10ns}
N 800 -680 800 -460 {
lab=IN_Z}
N 800 -460 800 -420 {
lab=IN_Z}
N 880 -400 880 -360 {
lab=t_3p7ns}
N 880 -500 880 -460 {
lab=t_5p3ns}
N 880 -700 880 -660 {
lab=t_8p5ns}
N 880 -300 880 -260 {
lab=t_2p1ns}
N 880 -200 880 -150 {
lab=RAMP}
N 740 -120 800 -120 {
lab=IN_Z}
N 600 -120 660 -120 {
lab=IN}
N 880 -180 1080 -180 {
lab=RAMP}
N 900 0 1020 0 {
lab=VSS}
N 1020 0 1050 -0 {
lab=VSS}
N 1050 0 1080 0 {
lab=VSS}
N 1080 0 1110 0 {
lab=VSS}
N 1080 -180 1180 -180 {
lab=RAMP}
N 1360 -80 1400 -80 {
lab=RAMP}
N 1360 -280 1360 -80 {
lab=RAMP}
N 1440 -250 1440 -110 {
lab=ST_OUT}
N 1440 -50 1440 -0 {
lab=VSS}
N 1110 0 1260 0 {
lab=VSS}
N 880 -880 1260 -880 {
lab=VDD}
N 880 -880 880 -850 {
lab=VDD}
N 1620 -50 1620 -0 {
lab=VSS}
N 1440 -0 1620 -0 {
lab=VSS}
N 1620 -180 1620 -110 {
lab=ST_OUT}
N 1440 -180 1620 -180 {
lab=ST_OUT}
N 1620 -180 1700 -180 {
lab=ST_OUT}
N 1260 0 1440 0 {
lab=VSS}
N 1180 -180 1260 -180 {
lab=RAMP}
N 1260 -180 1360 -180 {
lab=RAMP}
N 1260 -880 1440 -880 {
lab=VDD}
N 820 -120 820 60 {
lab=IN_Z}
N 1700 -120 1700 60 {
lab=IN_Z}
N 820 60 1700 60 {
lab=IN_Z}
N 1700 -140 1700 -120 {
lab=IN_Z}
N 1700 -140 1740 -140 {
lab=IN_Z}
N 1700 -180 1740 -180 {
lab=ST_OUT}
N 1860 -160 1880 -160 {
lab=n1}
N 2100 -160 2140 -160 {
lab=OUT}
N 880 -600 880 -560 {
lab=t_7ns}
N 1980 -160 2000 -160 {
lab=#net1}
N 1880 -160 1900 -160 {
lab=n1}
N 2000 -160 2020 -160 {
lab=#net1}
N 1440 -390 1440 -360 {
lab=#net2}
N 1440 -300 1440 -250 {
lab=ST_OUT}
N 1360 -420 1360 -280 {
lab=RAMP}
N 1360 -420 1400 -420 {
lab=RAMP}
N 1440 -880 1440 -450 {
lab=VDD}
N 1680 -330 1680 -80 {
lab=n1}
N 1480 -330 1680 -330 {
lab=n1}
N 1660 -80 1680 -80 {
lab=n1}
N 1880 -330 1880 -160 {
lab=n1}
N 1680 -330 1880 -330 {
lab=n1}
N 1140 -180 1140 -120 {
lab=RAMP}
N 1140 -60 1140 0 {
lab=VSS}
N 880 -780 1020 -780 {
lab=t_10ns}
N 880 -680 1020 -680 {
lab=t_8p5ns}
N 880 -580 1020 -580 {
lab=t_7ns}
N 880 -480 1020 -480 {
lab=t_5p3ns}
N 880 -380 1020 -380 {
lab=t_3p7ns}
N 880 -280 1020 -280 {
lab=t_2p1ns}
N 740 0 900 0 {
lab=VSS}
N 600 0 740 0 {
lab=VSS}
N 580 -880 880 -880 {
lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 860 -120 0 0 {name=M1
W=8
L=0.15
nf=2 
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
C {sky130_fd_pr/pfet_01v8.sym} 860 -820 0 0 {name=M2
W=12
L=0.15
nf=3
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
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -730 0 0 {name=R1
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -630 0 0 {name=R2
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -530 0 0 {name=R3
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -430 0 0 {name=R4
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -330 0 0 {name=R5
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_stdcells/inv_2.sym} 700 -120 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_fd_pr/nfet_01v8.sym} 1420 -80 0 0 {name=M4
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
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1420 -420 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 1640 -80 0 1 {name=M6
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
C {sky130_stdcells/nor2_2.sym} 1800 -160 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 1940 -160 0 0 {name=x3 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 2060 -160 0 0 {name=x4 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 2140 -160 0 0 {name=p1 lab=OUT}
C {devices/lab_wire.sym} 1010 60 0 0 {name=p6 sig_type=std_logic lab=IN_Z}
C {devices/lab_wire.sym} 1040 -180 0 0 {name=p7 sig_type=std_logic lab=RAMP}
C {devices/lab_wire.sym} 1540 -180 0 0 {name=p8 sig_type=std_logic lab=ST_OUT}
C {devices/lab_pin.sym} 880 -120 0 1 {name=p9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1440 -80 0 1 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1620 -80 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -230 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -330 0 0 {name=p14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -430 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -530 0 0 {name=p16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -630 0 0 {name=p17 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 860 -730 0 0 {name=p18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 880 -820 0 1 {name=p19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1440 -420 0 1 {name=p20 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 1750 -330 0 0 {name=p22 sig_type=std_logic lab=n1}
C {sky130_fd_pr/res_high_po_0p35.sym} 880 -230 0 0 {name=R6
L=12.5
model=res_high_po_0p35
spiceprefix=X
mult=1}
C {sky130_fd_pr/pfet_01v8.sym} 1460 -330 0 1 {name=M7
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
C {devices/lab_pin.sym} 1440 -330 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1140 -90 0 0 {name=C2 model=cap_mim_m3_1 W=12.5 L=8 MF=1 spiceprefix=X}
C {devices/iopin.sym} 1020 -780 0 0 {name=p23 lab=t_10ns}
C {devices/iopin.sym} 1020 -680 0 0 {name=p24 lab=t_8p5ns}
C {devices/iopin.sym} 1020 -580 0 0 {name=p25 lab=t_7ns}
C {devices/iopin.sym} 1020 -480 0 0 {name=p26 lab=t_5p3ns}
C {devices/iopin.sym} 1020 -380 0 0 {name=p27 lab=t_3p7ns}
C {devices/iopin.sym} 1020 -280 0 0 {name=p28 lab=t_2p1ns}
C {devices/ipin.sym} 600 0 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} 600 -120 0 0 {name=p4 lab=IN}
C {devices/ipin.sym} 580 -880 0 0 {name=p3 lab=VDD}
