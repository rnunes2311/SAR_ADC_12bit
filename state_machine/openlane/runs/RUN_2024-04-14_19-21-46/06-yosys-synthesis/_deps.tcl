set ::_synlig_defines [list]
verilog_defines -DPDK_sky130A
lappend ::_synlig_defines +define+PDK_sky130A
verilog_defines "-DSCL_sky130_fd_sc_hd\""
lappend ::_synlig_defines "+define+SCL_sky130_fd_sc_hd\""
verilog_defines -D__openlane__
lappend ::_synlig_defines +define+__openlane__
verilog_defines -D__pnr__
lappend ::_synlig_defines +define+__pnr__
read_liberty -lib -ignore_miss_dir -setattr blackbox /Users/ricardonunes/.volare/volare/sky130/versions/bdc9412b3e468c102d01b7cf6337be06ec6e9c9a/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
set ::env(SYNTH_LIBS) /Users/ricardonunes/Desktop/SAR_ADC_12b/SAR_ADC_12bit/state_machine/openlane/runs/RUN_2024-04-14_19-21-46/tmp/a538cbd8e3e94f24b4f84f2d9d1db2e9.lib
