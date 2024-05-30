v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 80 40 880 440 {flags=graph
y1=-0.016
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vin
vin_smpl"
color="4 12"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 80 470 880 870 {flags=graph
y1=-0.63
y2=2.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="10 9 11"
node="x2.vtop
x2.vbottom
\\"x2.vtop x2.vbottom -\\""}
B 2 920 40 1720 440 {flags=graph
y1=-1.3
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="11 10"
node="\\"vgate vin -\\"
\\"vgate vin_smpl -\\""}
B 2 920 470 1720 870 {flags=graph
y1=-0.087
y2=2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
color="11 7 10"
node="x2.vd
x2.vgate_1v8
sw_on"}
B 2 1760 470 2560 870 {flags=graph
y1=-0.6
y2=2.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0

color="11 6 8"
node="x2.vtop
x2.en_z
x2.en_z_lvl_shft"}
B 2 1760 40 2560 440 {flags=graph
y1=-0.6
y2=1.9
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-05
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0





color=8
node="\\"vgate x2.en_z_lvl_shft -\\""}
N 1120 -260 1120 -220 {
lab=VGATE}
N 960 -260 1120 -260 {
lab=VGATE}
N 1040 -180 1090 -180 {
lab=VIN}
N 1150 -180 1260 -180 {
lab=VIN_SMPL}
N 1260 -180 1260 -160 {
lab=VIN_SMPL}
N 740 -180 740 -160 {
lab=VIN}
N 900 -180 1040 -180 {
lab=VIN}
N 740 -180 900 -180 {
lab=VIN}
N 740 -260 740 -180 {
lab=VIN}
N 740 -260 840 -260 {
lab=VIN}
N 520 -290 840 -290 {
lab=EN}
N 520 -290 520 -270 {
lab=EN}
C {devices/vsource.sym} 280 -130 0 0 {name=V1 value=\{VDD\} savecurrent=true}
C {devices/lab_wire.sym} 280 -100 2 1 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 280 -160 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 360 -130 0 0 {name=V4 value=0 savecurrent=false}
C {devices/lab_wire.sym} 360 -100 2 1 {name=p17 sig_type=std_logic lab=GND}
C {devices/lab_wire.sym} 360 -160 0 0 {name=p18 sig_type=std_logic lab=VSS}
C {devices/code.sym} 50 -180 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval(@value )"
value="
* Skywater 130 nm PDK models
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

* Models for standard digital cells
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false
place=header}
C {devices/launcher.sym} 120 -460 0 0 {name=h2 
descr="Simulate" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/code.sym} 43.58642578125 -375.07080078125 0 0 {name=NGSPICE
only_toplevel=true
value="
.param VDD = 1.8
.option temp = 27
.save all

.option GMIN=1e-12 reltol=1e-6
.control
		set ngbehavior=hsa
          		set skywaterpdk
          		set ng_nomodcheck
          		set num_threads=4
          		option noinit
          		option klu
		tran 10n 10u
		write bootstrap_sim.raw
.endc
"}
C {devices/vsource.sym} 520 -240 0 0 {name=V9 value="pulse(0 \{VDD\} 0 0.1n 0.1n 20n 100n)" savecurrent=false}
C {devices/lab_wire.sym} 520 -210 2 1 {name=p30 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 780 -290 0 0 {name=p31 sig_type=std_logic lab=EN}
C {devices/launcher.sym} 360 -460 0 0 {name=h5
descr="Load Waveforms" 
tclcommand="xschem raw_read $netlist_dir/bootstrap_sim.raw tran"
}
C {subcells/bootstrap/bootstrap.sym} 900 -260 0 0 {name=x2}
C {sky130_fd_pr/nfet_01v8.sym} 1120 -200 1 0 {name=M1
W=40
L=0.15
nf=10 
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
C {devices/lab_pin.sym} 1120 -180 1 1 {name=p1 sig_type=std_logic lab=VSS}
C {devices/capa.sym} 1260 -130 0 0 {name=C1
m=1
value=1.8p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 1260 -100 2 1 {name=p3 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1060 -260 0 0 {name=p8 sig_type=std_logic lab=VGATE}
C {devices/lab_wire.sym} 1170 -180 0 1 {name=p9 sig_type=std_logic lab=VIN_SMPL}
C {devices/lab_wire.sym} 740 -100 2 1 {name=p27 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 740 -130 0 0 {name=V13 value="sin(0.6 0.6 100k 0 0 0)" savecurrent=false}
C {devices/lab_wire.sym} 780 -180 0 1 {name=p28 sig_type=std_logic lab=VIN}
C {devices/lab_wire.sym} 900 -220 2 0 {name=p29 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 900 -320 0 1 {name=p32 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 960 -290 0 1 {name=p33 sig_type=std_logic lab=SW_ON}
