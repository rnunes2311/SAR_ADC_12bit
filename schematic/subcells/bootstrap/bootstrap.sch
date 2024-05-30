v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 340 900 340 560 820 560 820 900 340 900 {}
T {Added to avoid VGS of M2 > VDD} 500 570 0 0 0.4 0.4 {}
N 220 180 240 180 {
lab=Vtop}
N 240 180 320 180 {
lab=Vtop}
N 540 180 580 180 {
lab=Vd}
N 640 180 700 180 {
lab=VSS}
N 60 180 120 180 {
lab=VDD}
N 510 120 510 140 {
lab=VDD}
N 60 360 120 360 {
lab=VSS}
N 290 180 290 280 {
lab=Vtop}
N 260 180 260 280 {
lab=Vtop}
N 230 180 230 280 {
lab=Vtop}
N 180 180 220 180 {
lab=Vtop}
N 260 320 260 360 {
lab=Vbottom}
N 180 360 260 360 {
lab=Vbottom}
N 400 180 480 180 {
lab=VGATE}
N 320 180 340 180 {
lab=Vtop}
N 60 620 80 620 {
lab=EN}
N 370 120 370 140 {
lab=EN_Z_LVL_SHFT}
N 150 80 150 140 {
lab=VGATE}
N 150 80 440 80 {
lab=VGATE}
N 440 80 440 180 {
lab=VGATE}
N 150 300 150 320 {
lab=EN_Z}
N 610 120 610 140 {
lab=EN_Z}
N 350 280 350 320 {
lab=VGATE}
N 370 280 440 280 {
lab=VGATE}
N 440 180 440 280 {
lab=VGATE}
N 150 180 150 200 {
lab=Vtop}
N 150 200 200 200 {
lab=Vtop}
N 200 180 200 200 {
lab=Vtop}
N 370 180 370 200 {
lab=Vtop}
N 320 200 370 200 {
lab=Vtop}
N 320 180 320 200 {
lab=Vtop}
N 260 360 320 360 {
lab=Vbottom}
N 380 360 390 360 {
lab=VIN}
N 390 360 390 440 {
lab=VIN}
N 350 280 370 280 {
lab=VGATE}
N 160 620 180 620 {
lab=EN_Z}
N 440 280 700 280 {
lab=VGATE}
N 60 440 390 440 {
lab=VIN}
N 600 440 620 440 {
lab=#net1}
N 700 440 720 440 {
lab=SW_ON}
N 500 440 520 440 {
lab=VGATE_1V8}
N 500 390 500 440 {
lab=VGATE_1V8}
N 500 280 500 330 {
lab=VGATE}
N 460 710 460 750 {
lab=EN_Z_LVL_SHFT}
N 460 810 460 840 {
lab=Vbottom}
N 460 620 460 650 {
lab=VDD}
N 400 780 420 780 {
lab=EN}
N 400 680 400 780 {
lab=EN}
N 400 680 420 680 {
lab=EN}
N 70 620 70 740 {
lab=EN}
N 70 740 400 740 {
lab=EN}
N 460 840 640 840 {
lab=Vbottom}
N 640 810 640 840 {
lab=Vbottom}
N 440 840 460 840 {
lab=Vbottom}
N 460 730 640 730 {
lab=EN_Z_LVL_SHFT}
N 640 730 640 750 {
lab=EN_Z_LVL_SHFT}
N 440 620 460 620 {
lab=VDD}
N 640 730 660 730 {
lab=EN_Z_LVL_SHFT}
C {sky130_fd_pr/pfet_01v8.sym} 150 160 1 0 {name=M1
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
C {sky130_fd_pr/pfet_01v8.sym} 370 160 3 1 {name=M2
W=16
L=0.15
nf=4
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
C {sky130_fd_pr/nfet_05v0_nvt.sym} 510 160 3 1 {name=M3
W=8
L=0.9
nf=2
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_05v0_nvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 610 160 3 1 {name=M4
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
C {devices/ipin.sym} 60 180 0 0 {name=p1 lab=VDD}
C {devices/lab_wire.sym} 510 120 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 60 360 0 0 {name=p3 lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 150 340 1 0 {name=M5
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
C {sky130_fd_pr/pfet_01v8.sym} 260 300 3 0 {name=M6
W=13.6
L=16.6
nf=4
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
C {devices/ipin.sym} 60 440 0 0 {name=p4 lab=VIN}
C {devices/opin.sym} 700 280 0 0 {name=p5 lab=VGATE}
C {sky130_stdcells/inv_4.sym} 120 620 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 60 620 0 0 {name=p6 lab=EN}
C {devices/lab_wire.sym} 370 120 0 0 {name=p8 sig_type=std_logic lab=EN_Z_LVL_SHFT}
C {devices/lab_wire.sym} 150 300 0 0 {name=p9 sig_type=std_logic lab=EN_Z}
C {devices/lab_wire.sym} 610 120 0 0 {name=p10 sig_type=std_logic lab=EN_Z}
C {sky130_fd_pr/nfet_01v8.sym} 350 340 1 0 {name=M8
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
C {devices/lab_pin.sym} 700 180 0 1 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 270 180 0 0 {name=p12 sig_type=std_logic lab=Vtop}
C {devices/lab_wire.sym} 260 350 0 0 {name=p13 sig_type=std_logic lab=Vbottom}
C {devices/lab_wire.sym} 570 180 0 0 {name=p15 sig_type=std_logic lab=Vd}
C {devices/lab_pin.sym} 350 360 1 1 {name=p17 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 150 360 1 1 {name=p18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 180 1 1 {name=p19 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 610 180 1 1 {name=p20 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 180 620 0 1 {name=p7 sig_type=std_logic lab=EN_Z}
C {sky130_fd_pr/nfet_05v0_nvt.sym} 480 360 0 0 {name=M7
W=4
L=0.9
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_05v0_nvt
spiceprefix=X
}
C {devices/lab_pin.sym} 500 360 0 1 {name=p16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 460 360 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {sky130_stdcells/inv_2.sym} 560 440 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 660 440 0 0 {name=x3 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 720 440 0 0 {name=p21 lab=SW_ON}
C {devices/lab_pin.sym} 500 420 0 0 {name=p22 sig_type=std_logic lab=VGATE_1V8}
C {sky130_fd_pr/pfet_01v8.sym} 440 680 0 0 {name=M9
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
C {devices/lab_pin.sym} 460 780 0 1 {name=p24 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 440 780 0 0 {name=M10
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
C {sky130_fd_pr/nfet_01v8.sym} 660 780 0 1 {name=M11
W=4
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
C {devices/lab_pin.sym} 440 840 2 1 {name=p23 sig_type=std_logic lab=Vbottom}
C {devices/lab_pin.sym} 680 780 2 0 {name=p26 sig_type=std_logic lab=VGATE}
C {devices/lab_pin.sym} 440 620 2 1 {name=p25 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 460 680 2 0 {name=p27 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 640 780 0 0 {name=p28 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 660 730 2 0 {name=p29 sig_type=std_logic lab=EN_Z_LVL_SHFT}
