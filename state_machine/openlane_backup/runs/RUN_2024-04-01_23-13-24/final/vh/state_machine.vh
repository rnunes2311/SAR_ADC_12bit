// Auto-generated by OpenLane
module state_machine(
`ifdef USE_POWER_PINS
  inout VDD,
  inout VSS,
`endif
  output SAMPLE_O,
  output[10:0] VCM_O,
  output EN_COMP,
  output VCM_DUMMY_O,
  output HI,
  output LO,
  output EN_VCM_SW_O,
  output OFFSET_CAL_CYCLE,
  output EN_OFFSET_CAL_O,
  output DAC_SETTLE,
  output CLK_DATA,
  output[5:0] DATA,
  output DEBUG_OUT,
  output[10:0] VREF_Z_P_O,
  output[10:0] VSS_P_O,
  output[10:0] VREF_Z_N_O,
  output[10:0] VSS_N_O,
  input RST_Z,
  input START,
  input COMP_P,
  input COMP_N,
  input VIN_P_SW_ON,
  input VIN_N_SW_ON,
  input EN_OFFSET_CAL,
  input DAC_SETTLE_D,
  input SAMPLE_D,
  input[3:0] DEBUG_MUX
);
endmodule
