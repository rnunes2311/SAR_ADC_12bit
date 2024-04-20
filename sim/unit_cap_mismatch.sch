v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 580 -420 580 -400 {
lab=VC}
N 680 -420 800 -420 {
lab=VC}
N 580 -420 680 -420 {
lab=VC}
N 800 -420 800 -400 {
lab=VC}
N 660 -420 660 -400 {
lab=VC}
C {devices/code.sym} 80 -160 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval(@value )"
value=".lib $::SKYWATER_MODELS/sky130.lib.spice tt_mm
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
.control
		echo > unit_cap_mismatch.txt
		if run > 0
      			reset
      			set appendwrite
    		end
		let run=0
  		dowhile run <= 200
		print run
		ac dec 10 10Meg 100Meg
		meas ac vcap find vm(vc) AT=100e6
		write unit_cap_mismatch.raw
		echo "$&vcap" >> unit_cap_mismatch.txt
    		let run = run + 1
		reset
  	end
.endc
"}
C {sky130_fd_pr/cap_mim_m3_1.sym} 800 -370 0 0 {name=C1 model=cap_mim_m3_1 W=1 L=1 MF=1 spiceprefix=X}
C {devices/lab_wire.sym} 800 -340 2 0 {name=p1 sig_type=std_logic lab=GND}
C {devices/isource.sym} 580 -370 0 0 {name=I0 value="ac 1"}
C {devices/lab_wire.sym} 580 -340 2 0 {name=p2 sig_type=std_logic lab=GND}
C {devices/lab_wire.sym} 745 -420 0 1 {name=p3 sig_type=std_logic lab=VC}
C {devices/res.sym} 660 -370 0 0 {name=R1
value=1T
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 660 -340 2 0 {name=p4 sig_type=std_logic lab=GND}
