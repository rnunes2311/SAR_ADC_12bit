v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -260 220 -260 {
lab=VIN}
N 220 -260 220 -210 {
lab=VIN}
N 220 -150 220 -100 {
lab=Cbtm}
N 220 -100 220 -60 {
lab=Cbtm}
N 220 -60 460 -60 {
lab=Cbtm}
N 460 -60 660 -60 {
lab=Cbtm}
N 160 -180 180 -180 {
lab=EN_VIN}
N 660 -60 700 -60 {
lab=Cbtm}
N 920 -260 940 -260 {
lab=VCM}
N 700 -60 900 -60 {
lab=Cbtm}
N 900 -60 940 -60 {
lab=Cbtm}
N 940 -150 940 -60 {
lab=Cbtm}
N 940 -260 940 -210 {
lab=VCM}
N 660 -60 660 40 {
lab=Cbtm}
N 660 60 680 60 {
lab=Cbtm}
N 660 40 660 60 {
lab=Cbtm}
C {sky130_fd_pr/nfet_01v8.sym} 200 -180 0 0 {name=M1
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
C {devices/ipin.sym} 200 -260 0 0 {name=p1 lab=VIN}
C {devices/ipin.sym} 160 -180 0 0 {name=p2 lab=EN_VIN}
C {devices/ipin.sym} 920 -260 0 0 {name=p6 lab=VCM}
C {devices/ipin.sym} 900 -180 0 0 {name=p11 lab=EN_VCM}
C {devices/lab_pin.sym} 940 -180 0 1 {name=p13 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 680 60 0 0 {name=p9 lab=Cbtm}
C {devices/lab_pin.sym} 220 -180 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 920 -180 0 0 {name=M5
W=2
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
C {devices/ipin.sym} 200 -320 0 0 {name=p3 lab=VSS}
