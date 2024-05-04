v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -220 460 -220 {
lab=VCM}
N 460 -220 460 -170 {
lab=VCM}
N 460 -50 480 -50 {
lab=Cbtm}
N 460 -70 460 -50 {
lab=Cbtm}
N 360 -140 380 -140 {
lab=EN_VCM}
N 460 -110 460 -70 {
lab=Cbtm}
N 380 -140 420 -140 {
lab=EN_VCM}
C {devices/ipin.sym} 440 -220 0 0 {name=p6 lab=VCM}
C {devices/ipin.sym} 360 -140 0 0 {name=p11 lab=EN_VCM}
C {devices/lab_pin.sym} 460 -140 0 1 {name=p13 sig_type=std_logic lab=VSS}
C {devices/opin.sym} 480 -50 0 0 {name=p9 lab=Cbtm}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 440 -140 0 0 {name=M5
W=64
L=0.15
nf=8
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
C {devices/ipin.sym} 180 -20 0 0 {name=p1 lab=VSS}
C {devices/ipin.sym} 180 -240 0 0 {name=p2 lab=VDD}
