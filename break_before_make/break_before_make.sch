v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -260 240 -260 {
lab=EN_VSS_I[10:0]}
N 200 -20 240 -20 {
lab=EN_VREF_Z_I[10:0]}
N 360 -240 380 -240 {
lab=EN_VSS_O[10:0]}
N 360 -40 380 -40 {
lab=EN_VREF_Z_O[10:0]}
N 380 -40 400 -40 {
lab=EN_VREF_Z_O[10:0]}
N 200 -220 240 -220 {
lab=EN_VREF_Z_O[10:0]}
N 380 -240 400 -240 {
lab=EN_VSS_O[10:0]}
N 200 -60 240 -60 {
lab=EN_VSS_O[10:0]}
N 380 -100 380 -40 {
lab=EN_VREF_Z_O[10:0]}
N 200 -100 200 -60 {
lab=EN_VSS_O[10:0]}
N 200 -220 200 -180 {
lab=EN_VREF_Z_O[10:0]}
N 380 -240 380 -180 {
lab=EN_VSS_O[10:0]}
N 200 -180 380 -100 {
lab=EN_VREF_Z_O[10:0]}
N 200 -100 380 -180 {
lab=EN_VSS_O[10:0]}
C {sky130_stdcells/and2_4.sym} 300 -240 0 0 {name=x1[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 200 -260 0 0 {name=p1 lab=EN_VSS_I[10:0]}
C {devices/ipin.sym} 200 -20 0 0 {name=p2 lab=EN_VREF_Z_I[10:0]}
C {sky130_stdcells/or2_4.sym} 300 -40 0 0 {name=x2[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -40 -260 0 0 {name=p3 lab=VDD}
C {devices/ipin.sym} -40 -240 0 0 {name=p4 lab=VSS}
C {devices/opin.sym} 400 -240 0 0 {name=p5 lab=EN_VSS_O[10:0]}
C {devices/opin.sym} 400 -40 0 0 {name=p6 lab=EN_VREF_Z_O[10:0]}
