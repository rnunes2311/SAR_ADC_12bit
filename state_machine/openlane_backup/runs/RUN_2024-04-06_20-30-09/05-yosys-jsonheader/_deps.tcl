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
read_verilog -sv -lib /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane_backup/runs/RUN_2024-04-06_20-30-09/tmp/432f9c6d25e0497982ba4e5169eb3500.bb.v
set ::env(SYNTH_LIBS) /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane_backup/runs/RUN_2024-04-06_20-30-09/tmp/7f5ca3f88277450897bb7ef360fc0b80.lib
