v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 100 -820 900 -420 {flags=graph
y1=0.018
y2=0.66
ypos1=-0.13
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=9e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


digital=0































color="7 10"
node="x1.vdac_p
x1.vdac_n"}
B 2 990 -820 1790 -420 {flags=graph
y1=-0.036
y2=1.9
ypos1=-0.036
ypos2=1.9
divy=5
subdivy=1
unity=1
x1=0
x2=9e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


digital=1









color="6 6 7 7 10 10 10 10"
node="result;result[5],result[4],result[3],result[2],result[1],result[0]
clk_data
clk
x1.x8.counter\\\\[4\\\\]
x1.en_comp
x1.offset_cal_cycle
x1.x8.state\\\\[1\\\\]
x1.x8.state\\\\[0\\\\]"}
B 2 1490 -340 2290 60 {flags=graph
y1=-0.0012
y2=3.9e-05
ypos1=-0.13
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=9e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0


digital=0


























color=9
node=i(v3)}
N 900 -150 980 -150 {
lab=#net1}
N 900 -130 980 -130 {
lab=#net2}
N 900 -80 980 -80 {
lab=#net3}
N 900 -100 980 -100 {
lab=#net4}
C {devices/lab_pin.sym} 840 -80 0 0 {name=p2 lab=VCM}
C {devices/lab_pin.sym} 840 -100 0 0 {name=p4 lab=VREF}
C {devices/lab_pin.sym} 840 -150 0 0 {name=p5 lab=VIN_P}
C {devices/lab_pin.sym} 840 -130 0 0 {name=p6 lab=VIN_N}
C {devices/lab_pin.sym} 980 -220 0 0 {name=p7 lab=RST_Z}
C {devices/lab_pin.sym} 1280 -150 0 1 {name=p8 lab=CLK_DATA}
C {devices/lab_pin.sym} 1280 -130 0 1 {name=p9 lab=RESULT[5:0]}
C {devices/lab_pin.sym} 980 -200 0 0 {name=p10 lab=START}
C {devices/lab_wire.sym} 1130 -240 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 1130 0 2 1 {name=p3 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 320 -90 0 0 {name=V1 value=1.8 savecurrent=true}
C {devices/lab_wire.sym} 320 -60 2 1 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 320 -120 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 400 -90 0 0 {name=V2 value=0.6 savecurrent=true}
C {devices/lab_wire.sym} 400 -60 2 1 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 400 -120 0 0 {name=p14 sig_type=std_logic lab=VCM}
C {devices/vsource.sym} 480 -90 0 0 {name=V3 value=1.2 savecurrent=true}
C {devices/lab_wire.sym} 480 -60 2 1 {name=p15 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 480 -120 0 0 {name=p16 sig_type=std_logic lab=VREF}
C {devices/vsource.sym} 560 -90 0 0 {name=V4 value=0 savecurrent=false}
C {devices/lab_wire.sym} 560 -60 2 1 {name=p17 sig_type=std_logic lab=GND}
C {devices/lab_wire.sym} 560 -120 0 0 {name=p18 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 320 -180 2 1 {name=p19 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 320 -240 0 0 {name=p20 sig_type=std_logic lab=VIN_P}
C {devices/lab_wire.sym} 480 -180 2 1 {name=p21 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 480 -240 0 0 {name=p22 sig_type=std_logic lab=VIN_N}
C {devices/vsource.sym} 480 -210 0 0 {name=V6 value=0.05 savecurrent=false}
C {devices/vsource.sym} 640 -90 0 0 {name=V7 value="pulse(0 1.8 20n 1n 1n 0.9 1)" savecurrent=false}
C {devices/lab_wire.sym} 640 -60 2 1 {name=p23 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 640 -120 0 0 {name=p24 sig_type=std_logic lab=START}
C {devices/vsource.sym} 640 -210 0 0 {name=V8 value="pwl(0 0 10n 0 10.1n 1.8)" savecurrent=false}
C {devices/lab_wire.sym} 640 -180 2 1 {name=p25 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 640 -240 0 0 {name=p26 sig_type=std_logic lab=RST_Z}
C {devices/code.sym} 80 -160 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval(@value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include /opt/pdk/share/pdk/sky130A/libs.tech/combined/continuous/models_diodes.spice
.include /opt/pdk/share/pdk/sky130A/libs.tech/ngspice/sky130_fd_pr__model__r+c.model.spice
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
.include ~/Desktop/SAR_ADC_12b/SAR_ADC_12bit/CDAC/New_CDAC/CDAC_12bit.spice
.include ~/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/layout/state_machine_single_ended.spice
*.include ~/Desktop/SAR_ADC_12b/SAR_ADC_12bit/layout/SAR_ADC_12bit_flat.spice
"
spice_ignore=false
place=header}
C {devices/launcher.sym} 360 -380 0 0 {name=h2 
descr="Simulate" 
tclcommand="xschem netlist; xschem simulate"}
C {devices/launcher.sym} 360 -330 0 0 {name=h5
descr="Load waveforms" 
tclcommand="xschem raw_read $netlist_dir/SAR_ADC_12bit_sim.raw tran"
}
C {devices/code.sym} 73.58642578125 -355.07080078125 0 0 {name=NGSPICE
only_toplevel=true
value="
.save all
*.save start rst_z vin_p vin_n vref vcm x1.vdac_p x1.vdac_n x1.vdac_pi x1.vdac_ni x1.smpl x1.en_comp x1.comp_p x1.comp_n x1.cal_p x1.cal_n
*.save result[5] result[4] result[3] result[2] result[1] result[0] clk_data debug_out
*.save x1.C10_p_btm x1.C10_n_btm x1.C9_p_btm x1.C9_n_btm x1.C8_p_btm x1.C8_n_btm x1.C7_p_btm x1.C7_n_btm x1.C6_p_btm x1.C6_n_btm x1.C5_p_btm x1.C5_n_btm x1.C4_p_btm x1.C4_n_btm x1.C3_p_btm x1.C3_n_btm x1.C2_p_btm x1.C2_n_btm x1.C1_p_btm x1.C1_n_btm x1.C0_p_btm x1.C0_n_btm x1.C0_dummy_p_btm x1.C0_dummy_n_btm
*.save x1.en_vin_bstr_p x1.en_vin_bstr_n
*.option method = gear
.option GMIN=1e-12 reltol=1e-5
.control
		set num_threads=8
		tran 10n 0.9u
		write SAR_ADC_12bit_sim.raw
.endc
"}
C {devices/vsource.sym} 320 -210 0 0 {name=V5 value=0.850 savecurrent=false}
C {SAR_ADC_12bit.sym} 1130 -160 0 0 {name=x1}
C {devices/lab_pin.sym} 980 -20 0 0 {name=p27 lab=VSS,VSS,VDD,VDD}
C {devices/lab_pin.sym} 980 -40 0 0 {name=p28 lab=VDD}
C {devices/lab_pin.sym} 1280 -90 0 1 {name=p29 lab=DEBUG_OUT}
C {devices/res.sym} 870 -150 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 870 -130 1 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 870 -100 1 0 {name=R3
value=500
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 870 -80 1 0 {name=R4
value=500
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 640 50 0 0 {name=V9 value="pulse(0 1.8 0 1n 1n 40n 50n)" savecurrent=false}
C {devices/lab_wire.sym} 640 80 2 1 {name=p30 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 640 20 0 0 {name=p31 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 980 -180 0 0 {name=p32 lab=CLK}
