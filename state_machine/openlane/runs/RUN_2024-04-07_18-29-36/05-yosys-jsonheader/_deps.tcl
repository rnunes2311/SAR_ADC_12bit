set ::_synlig_defines [list]
verilog_defines -DPDK_sky130A
lappend ::_synlig_defines +define+PDK_sky130A
verilog_defines "-DSCL_sky130_fd_sc_hd\""
lappend ::_synlig_defines "+define+SCL_sky130_fd_sc_hd\""
verilog_defines -D__openlane__
lappend ::_synlig_defines +define+__openlane__
verilog_defines -D__pnr__
lappend ::_synlig_defines +define+__pnr__
verilog_defines -DUSE_POWER_PINS
lappend ::_synlig_defines +define+USE_POWER_PINS
read_verilog -sv -lib /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane/runs/RUN_2024-04-07_18-29-36/tmp/0f3a1429c2ab4c37b2711051796eada0.bb.v
set ::env(SYNTH_LIBS) /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane/runs/RUN_2024-04-07_18-29-36/tmp/55ccff4a01a347cbaf04f5f29f570700.lib
