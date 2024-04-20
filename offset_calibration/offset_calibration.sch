v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 580 -50 580 -10 {
lab=#net1}
N 580 -410 580 -110 {
lab=#net2}
N 580 -510 580 -470 {
lab=#net3}
N 580 -700 580 -570 {
lab=VDD}
N 320 -210 380 -210 {
lab=CAL_P}
N 320 -350 380 -350 {
lab=CAL_P}
N 320 -350 320 -270 {
lab=CAL_P}
N 470 -350 580 -350 {
lab=#net2}
N 470 -210 580 -210 {
lab=#net2}
N 380 -210 410 -210 {
lab=CAL_P}
N 380 -350 410 -350 {
lab=CAL_P}
N 280 -700 580 -700 {
lab=VDD}
N -180 -50 -180 -10 {
lab=#net4}
N -180 -410 -180 -110 {
lab=#net5}
N -180 -510 -180 -470 {
lab=#net6}
N -180 -700 -180 -570 {
lab=VDD}
N 20 -210 80 -210 {
lab=CAL_N}
N 20 -350 80 -350 {
lab=CAL_N}
N 80 -350 80 -270 {
lab=CAL_N}
N -180 -350 -70 -350 {
lab=#net5}
N -180 -210 -70 -210 {
lab=#net5}
N -10 -210 20 -210 {
lab=CAL_N}
N -10 -350 20 -350 {
lab=CAL_N}
N -700 -320 -680 -320 {
lab=LOAD_CAL_Z}
N -680 -320 -600 -320 {
lab=LOAD_CAL_Z}
N 320 -270 320 -210 {
lab=CAL_P}
N 80 -270 80 -210 {
lab=CAL_N}
N 80 -700 80 -610 {
lab=VDD}
N 40 -610 50 -610 {
lab=VDD}
N 40 -700 40 -610 {
lab=VDD}
N 110 -610 120 -610 {
lab=VDD}
N 120 -700 120 -610 {
lab=VDD}
N 80 -570 80 -350 {
lab=CAL_N}
N 320 -700 320 -610 {
lab=VDD}
N 350 -610 360 -610 {
lab=VDD}
N 360 -700 360 -610 {
lab=VDD}
N 280 -610 290 -610 {
lab=VDD}
N 280 -700 280 -610 {
lab=VDD}
N 320 -570 320 -350 {
lab=CAL_P}
N -180 -700 280 -700 {
lab=VDD}
N -280 -700 -180 -700 {
lab=VDD}
N -280 160 580 160 {
lab=VSS}
N 80 -210 100 -210 {
lab=CAL_N}
N 300 -210 320 -210 {
lab=CAL_P}
N -180 50 -180 160 {
lab=VSS}
N 580 50 580 160 {
lab=VSS}
N -40 -590 -40 -540 {
lab=CAL_N}
N -40 -540 80 -540 {
lab=CAL_N}
N 440 -590 440 -540 {
lab=CAL_P}
N 320 -540 440 -540 {
lab=CAL_P}
N -840 -560 -820 -560 {
lab=CAL_RESULT}
N -700 -540 -600 -540 {
lab=CAL_RESULT_Z}
N -840 -520 -820 -520 {
lab=CAL_CYCLE}
N -700 -440 -600 -440 {
lab=EN_COMP_Z}
N -840 -420 -820 -420 {
lab=CAL_CYCLE}
N -840 -460 -820 -460 {
lab=EN_COMP}
N -900 -260 -880 -260 {
lab=#net7}
N -900 -320 -820 -320 {
lab=#net8}
N -840 -360 -820 -360 {
lab=EN}
N -880 -260 -840 -260 {
lab=#net7}
N -840 -280 -840 -260 {
lab=#net7}
N -840 -280 -820 -280 {
lab=#net7}
N -40 -700 -40 -650 {
lab=VDD}
N 440 -700 440 -650 {
lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 600 -80 0 1 {name=M26
W=0.42
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
C {sky130_fd_pr/nfet_01v8.sym} 600 20 0 1 {name=M27
W=0.42
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
C {sky130_fd_pr/pfet_01v8.sym} 600 -440 0 1 {name=M28
W=0.42
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
C {sky130_fd_pr/pfet_01v8.sym} 600 -540 0 1 {name=M29
W=0.42
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
C {devices/lab_pin.sym} 580 -540 0 0 {name=p43 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 580 -440 0 0 {name=p44 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 440 -190 1 1 {name=M30
W=0.42
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
C {sky130_fd_pr/pfet_01v8.sym} 440 -370 3 1 {name=M31
W=0.42
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
C {devices/lab_pin.sym} 440 -210 3 1 {name=p45 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 440 -350 3 0 {name=p46 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -180 -540 0 1 {name=p47 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -180 -440 0 1 {name=p48 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -40 -210 1 0 {name=p49 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -40 -350 1 1 {name=p50 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -520 -320 0 1 {name=p53 sig_type=std_logic lab=LOAD_CALi}
C {devices/ipin.sym} -840 -460 0 0 {name=p59 lab=EN_COMP}
C {sky130_stdcells/nand3_1.sym} -760 -320 0 0 {name=x22 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} -690 -320 0 1 {name=p61 sig_type=std_logic lab=LOAD_CAL_Z}
C {devices/lab_pin.sym} 620 -80 0 1 {name=p64 sig_type=std_logic lab=EN_COMPi}
C {devices/lab_pin.sym} 620 -440 0 1 {name=p65 sig_type=std_logic lab=EN_COMP_Z}
C {devices/lab_pin.sym} -220 -440 0 0 {name=p66 sig_type=std_logic lab=EN_COMP_Z}
C {devices/lab_pin.sym} -220 -80 0 0 {name=p67 sig_type=std_logic lab=EN_COMPi}
C {sky130_stdcells/inv_1.sym} -560 -320 0 0 {name=x3 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 440 -170 3 0 {name=p54 sig_type=std_logic lab=LOAD_CALi}
C {devices/lab_pin.sym} 440 -390 1 0 {name=p55 sig_type=std_logic lab=LOAD_CAL_Z}
C {devices/lab_pin.sym} -40 -170 1 1 {name=p56 sig_type=std_logic lab=LOAD_CALi}
C {devices/lab_pin.sym} -40 -390 3 1 {name=p57 sig_type=std_logic lab=LOAD_CAL_Z}
C {devices/lab_pin.sym} 580 20 2 1 {name=p68 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 580 -80 2 1 {name=p69 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -180 20 2 0 {name=p70 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -180 -80 2 0 {name=p71 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_01v8.sym} -40 -370 1 0 {name=M32
W=0.42
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
C {sky130_fd_pr/nfet_01v8.sym} -40 -190 3 0 {name=M33
W=0.42
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
C {sky130_fd_pr/pfet_01v8.sym} -200 -440 0 0 {name=M34
W=0.42
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
C {sky130_fd_pr/pfet_01v8.sym} -200 -540 0 0 {name=M35
W=0.42
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
C {sky130_fd_pr/nfet_01v8.sym} -200 -80 0 0 {name=M36
W=0.42
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
C {sky130_fd_pr/nfet_01v8.sym} -200 20 0 0 {name=M37
W=0.42
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 80 -590 3 0 {name=M24
W=10
L=10
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 320 -590 1 1 {name=M25
W=10
L=10
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/lab_pin.sym} -220 20 0 0 {name=p2 sig_type=std_logic lab=CAL_RESULT_Z}
C {devices/lab_pin.sym} -220 -540 0 0 {name=p3 sig_type=std_logic lab=CAL_RESULT_Z}
C {devices/lab_pin.sym} 620 20 0 1 {name=p4 sig_type=std_logic lab=CAL_RESULTi}
C {devices/lab_pin.sym} 620 -540 0 1 {name=p5 sig_type=std_logic lab=CAL_RESULTi}
C {devices/opin.sym} 100 -210 0 0 {name=p6 lab=CAL_N}
C {devices/opin.sym} 300 -210 0 1 {name=p7 lab=CAL_P}
C {devices/ipin.sym} -280 -700 0 0 {name=p8 lab=VDD}
C {devices/ipin.sym} -280 160 0 0 {name=p9 lab=VSS}
C {devices/ipin.sym} -840 -360 0 0 {name=p10 lab=EN}
C {sky130_fd_pr/pfet_01v8.sym} -60 -620 0 0 {name=M1
W=0.42
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
C {devices/lab_pin.sym} -80 -620 0 0 {name=p11 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} -40 -620 0 1 {name=p12 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 460 -620 0 1 {name=M2
W=0.42
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
C {devices/lab_pin.sym} 480 -620 0 1 {name=p13 sig_type=std_logic lab=EN}
C {devices/lab_pin.sym} 440 -620 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {sky130_stdcells/nand2_1.sym} -760 -540 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -840 -560 0 0 {name=p15 lab=CAL_RESULT}
C {sky130_stdcells/inv_1.sym} -560 -540 0 0 {name=x4 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} -610 -540 0 0 {name=p16 sig_type=std_logic lab=CAL_RESULT_Z}
C {devices/lab_pin.sym} -520 -540 0 1 {name=p17 sig_type=std_logic lab=CAL_RESULTi}
C {devices/ipin.sym} -840 -520 0 0 {name=p18 lab=CAL_CYCLE}
C {sky130_stdcells/nand2_1.sym} -760 -440 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} -560 -440 0 0 {name=x5 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} -610 -440 0 0 {name=p19 sig_type=std_logic lab=EN_COMP_Z}
C {devices/lab_pin.sym} -520 -440 0 1 {name=p20 sig_type=std_logic lab=EN_COMPi}
C {devices/lab_pin.sym} -840 -420 0 0 {name=p1 sig_type=std_logic lab=CAL_CYCLE}
C {devices/lab_pin.sym} -980 -320 0 0 {name=p21 sig_type=std_logic lab=EN_COMPi}
C {devices/lab_pin.sym} -980 -260 0 0 {name=p22 sig_type=std_logic lab=CAL_CYCLE}
C {sky130_stdcells/inv_1.sym} -940 -320 0 0 {name=x6 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} -940 -260 0 0 {name=x7 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
