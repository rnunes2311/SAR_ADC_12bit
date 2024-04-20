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
read_verilog -sv -lib /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane/runs/RUN_2024-04-14_19-21-46/tmp/bb114c9127f3401ca151727e0f924638.bb.v
set ::env(SYNTH_LIBS) /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane/runs/RUN_2024-04-14_19-21-46/tmp/a538cbd8e3e94f24b4f84f2d9d1db2e9.lib
