module state_machine (CLK_DATA,
    COMP_N,
    COMP_P,
    DAC_SETTLE,
    DAC_SETTLE_D,
    DEBUG_OUT,
    EN_COMP,
    EN_OFFSET_CAL,
    EN_OFFSET_CAL_O,
    EN_VCM_SW_O,
    HI,
    LO,
    OFFSET_CAL_CYCLE,
    RST_Z,
    SAMPLE_D,
    SAMPLE_O,
    START,
    VCM_DUMMY_O,
    VIN_N_SW_ON,
    VIN_P_SW_ON,
    VDD,
    VSS,
    DATA,
    DEBUG_MUX,
    VCM_O,
    VREF_Z_N_O,
    VREF_Z_P_O,
    VSS_N_O,
    VSS_P_O);
 output CLK_DATA;
 input COMP_N;
 input COMP_P;
 output DAC_SETTLE;
 input DAC_SETTLE_D;
 output DEBUG_OUT;
 output EN_COMP;
 input EN_OFFSET_CAL;
 output EN_OFFSET_CAL_O;
 output EN_VCM_SW_O;
 output HI;
 output LO;
 output OFFSET_CAL_CYCLE;
 input RST_Z;
 input SAMPLE_D;
 output SAMPLE_O;
 input START;
 output VCM_DUMMY_O;
 input VIN_N_SW_ON;
 input VIN_P_SW_ON;
 input VDD;
 input VSS;
 output [5:0] DATA;
 input [3:0] DEBUG_MUX;
 output [10:0] VCM_O;
 output [10:0] VREF_Z_N_O;
 output [10:0] VREF_Z_P_O;
 output [10:0] VSS_N_O;
 output [10:0] VSS_P_O;

 wire ALLOW_VCM_SW;
 wire \ALLOW_VREF_SW[0] ;
 wire \ALLOW_VREF_SW[10] ;
 wire \ALLOW_VREF_SW[1] ;
 wire \ALLOW_VREF_SW[2] ;
 wire \ALLOW_VREF_SW[3] ;
 wire \ALLOW_VREF_SW[4] ;
 wire \ALLOW_VREF_SW[5] ;
 wire \ALLOW_VREF_SW[6] ;
 wire \ALLOW_VREF_SW[7] ;
 wire \ALLOW_VREF_SW[8] ;
 wire \ALLOW_VREF_SW[9] ;
 wire CLK_CMP;
 wire CLK_COUNTER_Z;
 wire CLK_PULSE;
 wire COMP_DECIDED;
 wire CONVERT;
 wire \COUNTER[0] ;
 wire \COUNTER[10] ;
 wire \COUNTER[11] ;
 wire \COUNTER[1] ;
 wire \COUNTER[2] ;
 wire \COUNTER[3] ;
 wire \COUNTER[4] ;
 wire \COUNTER[5] ;
 wire \COUNTER[6] ;
 wire \COUNTER[7] ;
 wire \COUNTER[8] ;
 wire \COUNTER[9] ;
 wire DONE;
 wire \EN_DAC_OUT[0] ;
 wire \EN_DAC_OUT[10] ;
 wire \EN_DAC_OUT[11] ;
 wire \EN_DAC_OUT[1] ;
 wire \EN_DAC_OUT[2] ;
 wire \EN_DAC_OUT[3] ;
 wire \EN_DAC_OUT[4] ;
 wire \EN_DAC_OUT[5] ;
 wire \EN_DAC_OUT[6] ;
 wire \EN_DAC_OUT[7] ;
 wire \EN_DAC_OUT[8] ;
 wire \EN_DAC_OUT[9] ;
 wire FINISH;
 wire IDLE;
 wire LOAD;
 wire LOAD_D;
 wire \RESULT_Z[0] ;
 wire \RESULT_Z[10] ;
 wire \RESULT_Z[11] ;
 wire \RESULT_Z[1] ;
 wire \RESULT_Z[2] ;
 wire \RESULT_Z[3] ;
 wire \RESULT_Z[4] ;
 wire \RESULT_Z[5] ;
 wire \RESULT_Z[6] ;
 wire \RESULT_Z[7] ;
 wire \RESULT_Z[8] ;
 wire \RESULT_Z[9] ;
 wire \RESULTi[0] ;
 wire \RESULTi[10] ;
 wire \RESULTi[11] ;
 wire \RESULTi[1] ;
 wire \RESULTi[2] ;
 wire \RESULTi[3] ;
 wire \RESULTi[4] ;
 wire \RESULTi[5] ;
 wire \RESULTi[6] ;
 wire \RESULTi[7] ;
 wire \RESULTi[8] ;
 wire \RESULTi[9] ;
 wire RST_RES_REG_Z;
 wire RST_Zi;
 wire RSTi;
 wire R_CLK_PULSE_Z;
 wire R_CONVERT_Z;
 wire R_IDLE_Z;
 wire R_SAMPLE_Z;
 wire SAMPLE;
 wire S_CLK_PULSE_Z;
 wire S_CONVERT_Z;
 wire S_IDLE_Z;
 wire S_SAMPLE_Z;
 wire \VCM_Z_O[0] ;
 wire \VCM_Z_O[10] ;
 wire \VCM_Z_O[1] ;
 wire \VCM_Z_O[2] ;
 wire \VCM_Z_O[3] ;
 wire \VCM_Z_O[4] ;
 wire \VCM_Z_O[5] ;
 wire \VCM_Z_O[6] ;
 wire \VCM_Z_O[7] ;
 wire \VCM_Z_O[8] ;
 wire \VCM_Z_O[9] ;
 wire net1;
 wire \net10[0] ;
 wire \net10[10] ;
 wire \net10[11] ;
 wire \net10[1] ;
 wire \net10[2] ;
 wire \net10[3] ;
 wire \net10[4] ;
 wire \net10[5] ;
 wire \net10[6] ;
 wire \net10[7] ;
 wire \net10[8] ;
 wire \net10[9] ;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire \net24[0] ;
 wire \net24[10] ;
 wire \net24[1] ;
 wire \net24[2] ;
 wire \net24[3] ;
 wire \net24[4] ;
 wire \net24[5] ;
 wire \net24[6] ;
 wire \net24[7] ;
 wire \net24[8] ;
 wire \net24[9] ;
 wire net25;
 wire net26;
 wire \net27[0] ;
 wire \net27[10] ;
 wire \net27[1] ;
 wire \net27[2] ;
 wire \net27[3] ;
 wire \net27[4] ;
 wire \net27[5] ;
 wire \net27[6] ;
 wire \net27[7] ;
 wire \net27[8] ;
 wire \net27[9] ;
 wire \net28[0] ;
 wire \net28[10] ;
 wire \net28[1] ;
 wire \net28[2] ;
 wire \net28[3] ;
 wire \net28[4] ;
 wire \net28[5] ;
 wire \net28[6] ;
 wire \net28[7] ;
 wire \net28[8] ;
 wire \net28[9] ;
 wire \net29[0] ;
 wire \net29[10] ;
 wire \net29[1] ;
 wire \net29[2] ;
 wire \net29[3] ;
 wire \net29[4] ;
 wire \net29[5] ;
 wire \net29[6] ;
 wire \net29[7] ;
 wire \net29[8] ;
 wire \net29[9] ;
 wire net3;
 wire \net30[0] ;
 wire \net30[10] ;
 wire \net30[1] ;
 wire \net30[2] ;
 wire \net30[3] ;
 wire \net30[4] ;
 wire \net30[5] ;
 wire \net30[6] ;
 wire \net30[7] ;
 wire \net30[8] ;
 wire \net30[9] ;
 wire \net31[0] ;
 wire \net31[10] ;
 wire \net31[1] ;
 wire \net31[2] ;
 wire \net31[3] ;
 wire \net31[4] ;
 wire \net31[5] ;
 wire \net31[6] ;
 wire \net31[7] ;
 wire \net31[8] ;
 wire \net31[9] ;
 wire net32;
 wire net33;
 wire \net34[0] ;
 wire \net34[10] ;
 wire \net34[1] ;
 wire \net34[2] ;
 wire \net34[3] ;
 wire \net34[4] ;
 wire \net34[5] ;
 wire \net34[6] ;
 wire \net34[7] ;
 wire \net34[8] ;
 wire \net34[9] ;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire \net39[0] ;
 wire \net39[1] ;
 wire \net39[2] ;
 wire \net39[3] ;
 wire \net39[4] ;
 wire \net39[5] ;
 wire net4;
 wire net40;
 wire net41;
 wire \net42[0] ;
 wire \net42[1] ;
 wire \net42[2] ;
 wire \net42[3] ;
 wire \net42[4] ;
 wire \net42[5] ;
 wire \net43[0] ;
 wire \net43[1] ;
 wire \net43[2] ;
 wire \net43[3] ;
 wire \net43[4] ;
 wire \net43[5] ;
 wire \net44[0] ;
 wire \net44[1] ;
 wire \net44[2] ;
 wire \net44[3] ;
 wire \net44[4] ;
 wire \net44[5] ;
 wire net45;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__nand2_1 x1 (.A(S_IDLE_Z),
    .B(net1),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(IDLE));
 sky130_fd_sc_hd__nand2_1 x10 (.A(START),
    .B(IDLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(S_SAMPLE_Z));
 sky130_fd_sc_hd__inv_1 x10_0 (.A(VCM_O[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[0] ));
 sky130_fd_sc_hd__inv_1 x10_1 (.A(VCM_O[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[1] ));
 sky130_fd_sc_hd__inv_1 x10_10 (.A(VCM_O[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[10] ));
 sky130_fd_sc_hd__inv_1 x10_2 (.A(VCM_O[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[2] ));
 sky130_fd_sc_hd__inv_1 x10_3 (.A(VCM_O[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[3] ));
 sky130_fd_sc_hd__inv_1 x10_4 (.A(VCM_O[4]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[4] ));
 sky130_fd_sc_hd__inv_1 x10_5 (.A(VCM_O[5]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[5] ));
 sky130_fd_sc_hd__inv_1 x10_6 (.A(VCM_O[6]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[6] ));
 sky130_fd_sc_hd__inv_1 x10_7 (.A(VCM_O[7]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[7] ));
 sky130_fd_sc_hd__inv_1 x10_8 (.A(VCM_O[8]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[8] ));
 sky130_fd_sc_hd__inv_1 x10_9 (.A(VCM_O[9]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\VCM_Z_O[9] ));
 sky130_fd_sc_hd__inv_2 x11 (.A(net3),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(SAMPLE));
 sky130_fd_sc_hd__nand2_1 x11_0 (.A(\VCM_Z_O[0] ),
    .B(\COUNTER[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[0] ));
 sky130_fd_sc_hd__nand2_1 x11_1 (.A(\VCM_Z_O[1] ),
    .B(\COUNTER[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[1] ));
 sky130_fd_sc_hd__nand2_1 x11_10 (.A(\VCM_Z_O[10] ),
    .B(\COUNTER[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[10] ));
 sky130_fd_sc_hd__nand2_1 x11_2 (.A(\VCM_Z_O[2] ),
    .B(\COUNTER[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[2] ));
 sky130_fd_sc_hd__nand2_1 x11_3 (.A(\VCM_Z_O[3] ),
    .B(\COUNTER[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[3] ));
 sky130_fd_sc_hd__nand2_1 x11_4 (.A(\VCM_Z_O[4] ),
    .B(\COUNTER[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[4] ));
 sky130_fd_sc_hd__nand2_1 x11_5 (.A(\VCM_Z_O[5] ),
    .B(\COUNTER[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[5] ));
 sky130_fd_sc_hd__nand2_1 x11_6 (.A(\VCM_Z_O[6] ),
    .B(\COUNTER[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[6] ));
 sky130_fd_sc_hd__nand2_1 x11_7 (.A(\VCM_Z_O[7] ),
    .B(\COUNTER[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[7] ));
 sky130_fd_sc_hd__nand2_1 x11_8 (.A(\VCM_Z_O[8] ),
    .B(\COUNTER[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[8] ));
 sky130_fd_sc_hd__nand2_1 x11_9 (.A(\VCM_Z_O[9] ),
    .B(\COUNTER[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net34[9] ));
 sky130_fd_sc_hd__nor2_1 x12 (.A(net5),
    .B(RSTi),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(R_SAMPLE_Z));
 sky130_fd_sc_hd__inv_1 x12_0 (.A(\net34[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[0] ));
 sky130_fd_sc_hd__inv_1 x12_1 (.A(\net34[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[1] ));
 sky130_fd_sc_hd__inv_1 x12_10 (.A(\net34[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[10] ));
 sky130_fd_sc_hd__inv_1 x12_2 (.A(\net34[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[2] ));
 sky130_fd_sc_hd__inv_1 x12_3 (.A(\net34[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[3] ));
 sky130_fd_sc_hd__inv_1 x12_4 (.A(\net34[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[4] ));
 sky130_fd_sc_hd__inv_1 x12_5 (.A(\net34[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[5] ));
 sky130_fd_sc_hd__inv_1 x12_6 (.A(\net34[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[6] ));
 sky130_fd_sc_hd__inv_1 x12_7 (.A(\net34[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[7] ));
 sky130_fd_sc_hd__inv_1 x12_8 (.A(\net34[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[8] ));
 sky130_fd_sc_hd__inv_1 x12_9 (.A(\net34[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\ALLOW_VREF_SW[9] ));
 sky130_fd_sc_hd__and2_0 x13 (.A(CONVERT),
    .B(SAMPLE_D),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net5));
 sky130_fd_sc_hd__mux2_1 x13_0 (.A0(\RESULT_Z[6] ),
    .A1(\RESULT_Z[0] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[0] ));
 sky130_fd_sc_hd__mux2_1 x13_1 (.A0(\RESULT_Z[7] ),
    .A1(\RESULT_Z[1] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[1] ));
 sky130_fd_sc_hd__mux2_1 x13_2 (.A0(\RESULT_Z[8] ),
    .A1(\RESULT_Z[2] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[2] ));
 sky130_fd_sc_hd__mux2_1 x13_3 (.A0(\RESULT_Z[9] ),
    .A1(\RESULT_Z[3] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[3] ));
 sky130_fd_sc_hd__mux2_1 x13_4 (.A0(\RESULT_Z[10] ),
    .A1(\RESULT_Z[4] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[4] ));
 sky130_fd_sc_hd__mux2_1 x13_5 (.A0(\RESULT_Z[11] ),
    .A1(\RESULT_Z[5] ),
    .S(net16),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net39[5] ));
 sky130_fd_sc_hd__nand2_1 x14 (.A(S_CONVERT_Z),
    .B(net6),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net7));
 sky130_fd_sc_hd__inv_16 x14_0 (.A(\net44[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[0]));
 sky130_fd_sc_hd__inv_16 x14_1 (.A(\net44[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[1]));
 sky130_fd_sc_hd__inv_16 x14_2 (.A(\net44[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[2]));
 sky130_fd_sc_hd__inv_16 x14_3 (.A(\net44[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[3]));
 sky130_fd_sc_hd__inv_16 x14_4 (.A(\net44[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[4]));
 sky130_fd_sc_hd__inv_16 x14_5 (.A(\net44[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DATA[5]));
 sky130_fd_sc_hd__nand2_1 x15 (.A(net7),
    .B(R_CONVERT_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net6));
 sky130_fd_sc_hd__inv_2 x16 (.A(net6),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(CONVERT));
 sky130_fd_sc_hd__inv_1 x17 (.A(IDLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(R_CONVERT_Z));
 sky130_fd_sc_hd__nand2_1 x18 (.A(SAMPLE),
    .B(SAMPLE_D),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(S_CONVERT_Z));
 sky130_fd_sc_hd__inv_4 x19 (.A(net40),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net41));
 sky130_fd_sc_hd__dfrtp_1 x1_0 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[1] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[0] ));
 sky130_fd_sc_hd__dfrtp_1 x1_1 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[2] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[1] ));
 sky130_fd_sc_hd__dfrtp_1 x1_10 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[11] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[10] ));
 sky130_fd_sc_hd__dfrtp_1 x1_11 (.CLK(CLK_COUNTER_Z),
    .D(HI),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[11] ));
 sky130_fd_sc_hd__dfrtp_1 x1_2 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[3] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[2] ));
 sky130_fd_sc_hd__dfrtp_1 x1_3 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[4] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[3] ));
 sky130_fd_sc_hd__dfrtp_1 x1_4 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[5] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[4] ));
 sky130_fd_sc_hd__dfrtp_1 x1_5 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[6] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[5] ));
 sky130_fd_sc_hd__dfrtp_1 x1_6 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[7] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[6] ));
 sky130_fd_sc_hd__dfrtp_1 x1_7 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[8] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[7] ));
 sky130_fd_sc_hd__dfrtp_1 x1_8 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[9] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[8] ));
 sky130_fd_sc_hd__dfrtp_1 x1_9 (.CLK(CLK_COUNTER_Z),
    .D(\COUNTER[10] ),
    .RESET_B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\COUNTER[9] ));
 sky130_fd_sc_hd__nand2_1 x2 (.A(IDLE),
    .B(R_IDLE_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net1));
 sky130_fd_sc_hd__conb_1 x20 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .HI(net15),
    .LO(net14));
 sky130_fd_sc_hd__nor2_1 x21 (.A(VIN_P_SW_ON),
    .B(VIN_N_SW_ON),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(ALLOW_VCM_SW));
 sky130_fd_sc_hd__inv_4 x21_0 (.A(\net24[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[0]));
 sky130_fd_sc_hd__inv_4 x21_1 (.A(\net24[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[1]));
 sky130_fd_sc_hd__inv_4 x21_10 (.A(\net24[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[10]));
 sky130_fd_sc_hd__inv_4 x21_2 (.A(\net24[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[2]));
 sky130_fd_sc_hd__inv_4 x21_3 (.A(\net24[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[3]));
 sky130_fd_sc_hd__inv_4 x21_4 (.A(\net24[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[4]));
 sky130_fd_sc_hd__inv_4 x21_5 (.A(\net24[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[5]));
 sky130_fd_sc_hd__inv_4 x21_6 (.A(\net24[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[6]));
 sky130_fd_sc_hd__inv_4 x21_7 (.A(\net24[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[7]));
 sky130_fd_sc_hd__inv_4 x21_8 (.A(\net24[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[8]));
 sky130_fd_sc_hd__inv_4 x21_9 (.A(\net24[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_O[9]));
 sky130_fd_sc_hd__nand2_4 x22 (.A(net13),
    .B(CLK_PULSE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(CLK_COUNTER_Z));
 sky130_fd_sc_hd__and2b_1 x23 (.A_N(CLK_PULSE),
    .B(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(DAC_SETTLE));
 sky130_fd_sc_hd__nand2_1 x24 (.A(S_CLK_PULSE_Z),
    .B(net8),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net9));
 sky130_fd_sc_hd__nand2_1 x25 (.A(net9),
    .B(R_CLK_PULSE_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net8));
 sky130_fd_sc_hd__inv_1 x26 (.A(net8),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(CLK_PULSE));
 sky130_fd_sc_hd__inv_1 x27 (.A(DAC_SETTLE_D),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(S_CLK_PULSE_Z));
 sky130_fd_sc_hd__nor2b_1 x28 (.A(CLK_CMP),
    .B_N(CONVERT),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(R_CLK_PULSE_Z));
 sky130_fd_sc_hd__and3b_1 x29 (.A_N(\COUNTER[0] ),
    .B(CLK_PULSE),
    .C(COMP_DECIDED),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(CLK_CMP));
 sky130_fd_sc_hd__nor2b_2 x2_0 (.A(\RESULTi[1] ),
    .B_N(\ALLOW_VREF_SW[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[0] ));
 sky130_fd_sc_hd__nor2b_2 x2_1 (.A(\RESULTi[2] ),
    .B_N(\ALLOW_VREF_SW[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[1] ));
 sky130_fd_sc_hd__nor2b_2 x2_10 (.A(\RESULTi[11] ),
    .B_N(\ALLOW_VREF_SW[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[10] ));
 sky130_fd_sc_hd__nor2b_2 x2_2 (.A(\RESULTi[3] ),
    .B_N(\ALLOW_VREF_SW[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[2] ));
 sky130_fd_sc_hd__nor2b_2 x2_3 (.A(\RESULTi[4] ),
    .B_N(\ALLOW_VREF_SW[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[3] ));
 sky130_fd_sc_hd__nor2b_2 x2_4 (.A(\RESULTi[5] ),
    .B_N(\ALLOW_VREF_SW[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[4] ));
 sky130_fd_sc_hd__nor2b_2 x2_5 (.A(\RESULTi[6] ),
    .B_N(\ALLOW_VREF_SW[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[5] ));
 sky130_fd_sc_hd__nor2b_2 x2_6 (.A(\RESULTi[7] ),
    .B_N(\ALLOW_VREF_SW[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[6] ));
 sky130_fd_sc_hd__nor2b_2 x2_7 (.A(\RESULTi[8] ),
    .B_N(\ALLOW_VREF_SW[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[7] ));
 sky130_fd_sc_hd__nor2b_2 x2_8 (.A(\RESULTi[9] ),
    .B_N(\ALLOW_VREF_SW[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[8] ));
 sky130_fd_sc_hd__nor2b_2 x2_9 (.A(\RESULTi[10] ),
    .B_N(\ALLOW_VREF_SW[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net28[9] ));
 sky130_fd_sc_hd__nor2_1 x3 (.A(net2),
    .B(RSTi),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(S_IDLE_Z));
 sky130_fd_sc_hd__nand2_1 x30 (.A(COMP_P),
    .B(COMP_N),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(COMP_DECIDED));
 sky130_fd_sc_hd__and3_1 x31 (.A(FINISH),
    .B(\COUNTER[0] ),
    .C(CLK_PULSE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(LOAD));
 sky130_fd_sc_hd__dlymetal6s6s_1 x32 (.A(net35),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(LOAD_D));
 sky130_fd_sc_hd__mux4_1 x33 (.A0(SAMPLE),
    .A1(IDLE),
    .A2(CONVERT),
    .A3(CLK_PULSE),
    .S0(DEBUG_MUX[0]),
    .S1(DEBUG_MUX[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net17));
 sky130_fd_sc_hd__mux4_1 x34 (.A0(CLK_COUNTER_Z),
    .A1(EN_COMP),
    .A2(SAMPLE_D),
    .A3(DAC_SETTLE),
    .S0(DEBUG_MUX[0]),
    .S1(DEBUG_MUX[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net18));
 sky130_fd_sc_hd__inv_2 x35 (.A(\COUNTER[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net40));
 sky130_fd_sc_hd__and2_1 x36 (.A(CONVERT),
    .B(ALLOW_VCM_SW),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net11));
 sky130_fd_sc_hd__inv_4 x37 (.A(net32),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VCM_DUMMY_O));
 sky130_fd_sc_hd__inv_2 x38 (.A(net33),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net32));
 sky130_fd_sc_hd__inv_2 x38_0 (.A(\net27[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[0] ));
 sky130_fd_sc_hd__inv_2 x38_1 (.A(\net27[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[1] ));
 sky130_fd_sc_hd__inv_2 x38_10 (.A(\net27[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[10] ));
 sky130_fd_sc_hd__inv_2 x38_2 (.A(\net27[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[2] ));
 sky130_fd_sc_hd__inv_2 x38_3 (.A(\net27[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[3] ));
 sky130_fd_sc_hd__inv_2 x38_4 (.A(\net27[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[4] ));
 sky130_fd_sc_hd__inv_2 x38_5 (.A(\net27[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[5] ));
 sky130_fd_sc_hd__inv_2 x38_6 (.A(\net27[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[6] ));
 sky130_fd_sc_hd__inv_2 x38_7 (.A(\net27[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[7] ));
 sky130_fd_sc_hd__inv_2 x38_8 (.A(\net27[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[8] ));
 sky130_fd_sc_hd__inv_2 x38_9 (.A(\net27[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net24[9] ));
 sky130_fd_sc_hd__inv_4 x39 (.A(net26),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(SAMPLE_O));
 sky130_fd_sc_hd__nor2b_2 x3_0 (.A(\RESULT_Z[1] ),
    .B_N(\ALLOW_VREF_SW[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[0] ));
 sky130_fd_sc_hd__nor2b_2 x3_1 (.A(\RESULT_Z[2] ),
    .B_N(\ALLOW_VREF_SW[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[1] ));
 sky130_fd_sc_hd__nor2b_2 x3_10 (.A(\RESULT_Z[11] ),
    .B_N(\ALLOW_VREF_SW[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[10] ));
 sky130_fd_sc_hd__nor2b_2 x3_2 (.A(\RESULT_Z[3] ),
    .B_N(\ALLOW_VREF_SW[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[2] ));
 sky130_fd_sc_hd__nor2b_2 x3_3 (.A(\RESULT_Z[4] ),
    .B_N(\ALLOW_VREF_SW[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[3] ));
 sky130_fd_sc_hd__nor2b_2 x3_4 (.A(\RESULT_Z[5] ),
    .B_N(\ALLOW_VREF_SW[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[4] ));
 sky130_fd_sc_hd__nor2b_2 x3_5 (.A(\RESULT_Z[6] ),
    .B_N(\ALLOW_VREF_SW[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[5] ));
 sky130_fd_sc_hd__nor2b_2 x3_6 (.A(\RESULT_Z[7] ),
    .B_N(\ALLOW_VREF_SW[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[6] ));
 sky130_fd_sc_hd__nor2b_2 x3_7 (.A(\RESULT_Z[8] ),
    .B_N(\ALLOW_VREF_SW[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[7] ));
 sky130_fd_sc_hd__nor2b_2 x3_8 (.A(\RESULT_Z[9] ),
    .B_N(\ALLOW_VREF_SW[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[8] ));
 sky130_fd_sc_hd__nor2b_2 x3_9 (.A(\RESULT_Z[10] ),
    .B_N(\ALLOW_VREF_SW[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net30[9] ));
 sky130_fd_sc_hd__inv_1 x4 (.A(SAMPLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(R_IDLE_Z));
 sky130_fd_sc_hd__nand3b_2 x40 (.A_N(\COUNTER[11] ),
    .B(net22),
    .C(net23),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net26));
 sky130_fd_sc_hd__nor2b_1 x41 (.A(LO),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net33));
 sky130_fd_sc_hd__and2b_1 x41_0 (.A_N(\COUNTER[0] ),
    .B(\COUNTER[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[0] ));
 sky130_fd_sc_hd__and2b_1 x41_1 (.A_N(\COUNTER[1] ),
    .B(\COUNTER[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[1] ));
 sky130_fd_sc_hd__and2b_1 x41_10 (.A_N(\COUNTER[10] ),
    .B(\COUNTER[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[10] ));
 sky130_fd_sc_hd__and2b_1 x41_11 (.A_N(\COUNTER[11] ),
    .B(HI),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[11] ));
 sky130_fd_sc_hd__and2b_1 x41_2 (.A_N(\COUNTER[2] ),
    .B(\COUNTER[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[2] ));
 sky130_fd_sc_hd__and2b_1 x41_3 (.A_N(\COUNTER[3] ),
    .B(\COUNTER[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[3] ));
 sky130_fd_sc_hd__and2b_1 x41_4 (.A_N(\COUNTER[4] ),
    .B(\COUNTER[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[4] ));
 sky130_fd_sc_hd__and2b_1 x41_5 (.A_N(\COUNTER[5] ),
    .B(\COUNTER[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[5] ));
 sky130_fd_sc_hd__and2b_1 x41_6 (.A_N(\COUNTER[6] ),
    .B(\COUNTER[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[6] ));
 sky130_fd_sc_hd__and2b_1 x41_7 (.A_N(\COUNTER[7] ),
    .B(\COUNTER[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[7] ));
 sky130_fd_sc_hd__and2b_1 x41_8 (.A_N(\COUNTER[8] ),
    .B(\COUNTER[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[8] ));
 sky130_fd_sc_hd__and2b_1 x41_9 (.A_N(\COUNTER[9] ),
    .B(\COUNTER[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\EN_DAC_OUT[9] ));
 sky130_fd_sc_hd__mux4_4 x42 (.A0(net17),
    .A1(net18),
    .A2(net20),
    .A3(net21),
    .S0(DEBUG_MUX[2]),
    .S1(DEBUG_MUX[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net19));
 sky130_fd_sc_hd__nand2_2 x42_0 (.A(\RESULTi[1] ),
    .B(\ALLOW_VREF_SW[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[0] ));
 sky130_fd_sc_hd__nand2_2 x42_1 (.A(\RESULTi[2] ),
    .B(\ALLOW_VREF_SW[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[1] ));
 sky130_fd_sc_hd__nand2_2 x42_10 (.A(\RESULTi[11] ),
    .B(\ALLOW_VREF_SW[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[10] ));
 sky130_fd_sc_hd__nand2_2 x42_2 (.A(\RESULTi[3] ),
    .B(\ALLOW_VREF_SW[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[2] ));
 sky130_fd_sc_hd__nand2_2 x42_3 (.A(\RESULTi[4] ),
    .B(\ALLOW_VREF_SW[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[3] ));
 sky130_fd_sc_hd__nand2_2 x42_4 (.A(\RESULTi[5] ),
    .B(\ALLOW_VREF_SW[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[4] ));
 sky130_fd_sc_hd__nand2_2 x42_5 (.A(\RESULTi[6] ),
    .B(\ALLOW_VREF_SW[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[5] ));
 sky130_fd_sc_hd__nand2_2 x42_6 (.A(\RESULTi[7] ),
    .B(\ALLOW_VREF_SW[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[6] ));
 sky130_fd_sc_hd__nand2_2 x42_7 (.A(\RESULTi[8] ),
    .B(\ALLOW_VREF_SW[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[7] ));
 sky130_fd_sc_hd__nand2_2 x42_8 (.A(\RESULTi[9] ),
    .B(\ALLOW_VREF_SW[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[8] ));
 sky130_fd_sc_hd__nand2_2 x42_9 (.A(\RESULTi[10] ),
    .B(\ALLOW_VREF_SW[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net29[9] ));
 sky130_fd_sc_hd__or2_1 x43 (.A(SAMPLE),
    .B(EN_VCM_SW_O),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net22));
 sky130_fd_sc_hd__inv_4 x43_0 (.A(\net30[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[0]));
 sky130_fd_sc_hd__inv_4 x43_1 (.A(\net30[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[1]));
 sky130_fd_sc_hd__inv_4 x43_10 (.A(\net30[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[10]));
 sky130_fd_sc_hd__inv_4 x43_2 (.A(\net30[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[2]));
 sky130_fd_sc_hd__inv_4 x43_3 (.A(\net30[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[3]));
 sky130_fd_sc_hd__inv_4 x43_4 (.A(\net30[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[4]));
 sky130_fd_sc_hd__inv_4 x43_5 (.A(\net30[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[5]));
 sky130_fd_sc_hd__inv_4 x43_6 (.A(\net30[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[6]));
 sky130_fd_sc_hd__inv_4 x43_7 (.A(\net30[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[7]));
 sky130_fd_sc_hd__inv_4 x43_8 (.A(\net30[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[8]));
 sky130_fd_sc_hd__inv_4 x43_9 (.A(\net30[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_N_O[9]));
 sky130_fd_sc_hd__dfrtp_1 x44 (.CLK(LOAD_D),
    .D(HI),
    .RESET_B(net12),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(DONE));
 sky130_fd_sc_hd__inv_4 x44_0 (.A(\net31[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[0]));
 sky130_fd_sc_hd__inv_4 x44_1 (.A(\net31[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[1]));
 sky130_fd_sc_hd__inv_4 x44_10 (.A(\net31[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[10]));
 sky130_fd_sc_hd__inv_4 x44_2 (.A(\net31[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[2]));
 sky130_fd_sc_hd__inv_4 x44_3 (.A(\net31[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[3]));
 sky130_fd_sc_hd__inv_4 x44_4 (.A(\net31[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[4]));
 sky130_fd_sc_hd__inv_4 x44_5 (.A(\net31[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[5]));
 sky130_fd_sc_hd__inv_4 x44_6 (.A(\net31[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[6]));
 sky130_fd_sc_hd__inv_4 x44_7 (.A(\net31[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[7]));
 sky130_fd_sc_hd__inv_4 x44_8 (.A(\net31[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[8]));
 sky130_fd_sc_hd__inv_4 x44_9 (.A(\net31[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_N_O[9]));
 sky130_fd_sc_hd__nor2_1 x45 (.A(SAMPLE),
    .B(RSTi),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net12));
 sky130_fd_sc_hd__inv_1 x45_0 (.A(\RESULTi[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[0] ));
 sky130_fd_sc_hd__inv_1 x45_1 (.A(\RESULTi[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[1] ));
 sky130_fd_sc_hd__inv_1 x45_10 (.A(\RESULTi[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[10] ));
 sky130_fd_sc_hd__inv_1 x45_11 (.A(\RESULTi[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[11] ));
 sky130_fd_sc_hd__inv_1 x45_2 (.A(\RESULTi[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[2] ));
 sky130_fd_sc_hd__inv_1 x45_3 (.A(\RESULTi[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[3] ));
 sky130_fd_sc_hd__inv_1 x45_4 (.A(\RESULTi[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[4] ));
 sky130_fd_sc_hd__inv_1 x45_5 (.A(\RESULTi[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[5] ));
 sky130_fd_sc_hd__inv_1 x45_6 (.A(\RESULTi[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[6] ));
 sky130_fd_sc_hd__inv_1 x45_7 (.A(\RESULTi[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[7] ));
 sky130_fd_sc_hd__inv_1 x45_8 (.A(\RESULTi[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[8] ));
 sky130_fd_sc_hd__inv_1 x45_9 (.A(\RESULTi[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\RESULT_Z[9] ));
 sky130_fd_sc_hd__inv_4 x46 (.A(net36),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(EN_VCM_SW_O));
 sky130_fd_sc_hd__mux2_1 x46_0 (.A0(\RESULTi[0] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[0] ));
 sky130_fd_sc_hd__mux2_1 x46_1 (.A0(\RESULTi[1] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[1] ));
 sky130_fd_sc_hd__mux2_1 x46_10 (.A0(\RESULTi[10] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[10] ));
 sky130_fd_sc_hd__mux2_1 x46_11 (.A0(\RESULTi[11] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[11] ));
 sky130_fd_sc_hd__mux2_1 x46_2 (.A0(\RESULTi[2] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[2] ));
 sky130_fd_sc_hd__mux2_1 x46_3 (.A0(\RESULTi[3] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[3] ));
 sky130_fd_sc_hd__mux2_1 x46_4 (.A0(\RESULTi[4] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[4] ));
 sky130_fd_sc_hd__mux2_1 x46_5 (.A0(\RESULTi[5] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[5] ));
 sky130_fd_sc_hd__mux2_1 x46_6 (.A0(\RESULTi[6] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[6] ));
 sky130_fd_sc_hd__mux2_1 x46_7 (.A0(\RESULTi[7] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[7] ));
 sky130_fd_sc_hd__mux2_1 x46_8 (.A0(\RESULTi[8] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[8] ));
 sky130_fd_sc_hd__mux2_1 x46_9 (.A0(\RESULTi[9] ),
    .A1(COMP_P),
    .S(\EN_DAC_OUT[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(\net10[9] ));
 sky130_fd_sc_hd__inv_4 x47 (.A(CLK_COUNTER_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(EN_COMP));
 sky130_fd_sc_hd__dlymetal6s6s_1 x48 (.A(LOAD),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net35));
 sky130_fd_sc_hd__nor2_2 x49 (.A(\COUNTER[0] ),
    .B(SAMPLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net36));
 sky130_fd_sc_hd__nand2_2 x4_0 (.A(\RESULT_Z[1] ),
    .B(\ALLOW_VREF_SW[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[0] ));
 sky130_fd_sc_hd__nand2_2 x4_1 (.A(\RESULT_Z[2] ),
    .B(\ALLOW_VREF_SW[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[1] ));
 sky130_fd_sc_hd__nand2_2 x4_10 (.A(\RESULT_Z[11] ),
    .B(\ALLOW_VREF_SW[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[10] ));
 sky130_fd_sc_hd__nand2_2 x4_2 (.A(\RESULT_Z[3] ),
    .B(\ALLOW_VREF_SW[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[2] ));
 sky130_fd_sc_hd__nand2_2 x4_3 (.A(\RESULT_Z[4] ),
    .B(\ALLOW_VREF_SW[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[3] ));
 sky130_fd_sc_hd__nand2_2 x4_4 (.A(\RESULT_Z[5] ),
    .B(\ALLOW_VREF_SW[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[4] ));
 sky130_fd_sc_hd__nand2_2 x4_5 (.A(\RESULT_Z[6] ),
    .B(\ALLOW_VREF_SW[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[5] ));
 sky130_fd_sc_hd__nand2_2 x4_6 (.A(\RESULT_Z[7] ),
    .B(\ALLOW_VREF_SW[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[6] ));
 sky130_fd_sc_hd__nand2_2 x4_7 (.A(\RESULT_Z[8] ),
    .B(\ALLOW_VREF_SW[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[7] ));
 sky130_fd_sc_hd__nand2_2 x4_8 (.A(\RESULT_Z[9] ),
    .B(\ALLOW_VREF_SW[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[8] ));
 sky130_fd_sc_hd__nand2_2 x4_9 (.A(\RESULT_Z[10] ),
    .B(\ALLOW_VREF_SW[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net31[9] ));
 sky130_fd_sc_hd__inv_4 x5 (.A(RST_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(RSTi));
 sky130_fd_sc_hd__mux4_1 x50 (.A0(DAC_SETTLE_D),
    .A1(COMP_DECIDED),
    .A2(COMP_P),
    .A3(COMP_N),
    .S0(DEBUG_MUX[0]),
    .S1(DEBUG_MUX[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net20));
 sky130_fd_sc_hd__nand2b_1 x51 (.A_N(EN_OFFSET_CAL),
    .B(\COUNTER[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net13));
 sky130_fd_sc_hd__nand2b_1 x52 (.A_N(COMP_DECIDED),
    .B(EN_OFFSET_CAL),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(FINISH));
 sky130_fd_sc_hd__nand2_2 x53 (.A(\COUNTER[0] ),
    .B(EN_OFFSET_CAL),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net37));
 sky130_fd_sc_hd__inv_4 x54 (.A(net37),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(OFFSET_CAL_CYCLE));
 sky130_fd_sc_hd__nand2_1 x55 (.A(RST_Zi),
    .B(EN_OFFSET_CAL),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net38));
 sky130_fd_sc_hd__inv_2 x56 (.A(net38),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(EN_OFFSET_CAL_O));
 sky130_fd_sc_hd__inv_4 x57 (.A(net15),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(LO));
 sky130_fd_sc_hd__inv_4 x58 (.A(net14),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(HI));
 sky130_fd_sc_hd__or2_1 x59 (.A(\COUNTER[4] ),
    .B(DONE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net16));
 sky130_fd_sc_hd__dfrtp_1 x5_0 (.CLK(CLK_COUNTER_Z),
    .D(\net10[0] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[0] ));
 sky130_fd_sc_hd__dfrtp_1 x5_1 (.CLK(CLK_COUNTER_Z),
    .D(\net10[1] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[1] ));
 sky130_fd_sc_hd__dfrtp_1 x5_10 (.CLK(CLK_COUNTER_Z),
    .D(\net10[10] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[10] ));
 sky130_fd_sc_hd__dfrtp_1 x5_11 (.CLK(CLK_COUNTER_Z),
    .D(\net10[11] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[11] ));
 sky130_fd_sc_hd__dfrtp_1 x5_2 (.CLK(CLK_COUNTER_Z),
    .D(\net10[2] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[2] ));
 sky130_fd_sc_hd__dfrtp_1 x5_3 (.CLK(CLK_COUNTER_Z),
    .D(\net10[3] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[3] ));
 sky130_fd_sc_hd__dfrtp_1 x5_4 (.CLK(CLK_COUNTER_Z),
    .D(\net10[4] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[4] ));
 sky130_fd_sc_hd__dfrtp_1 x5_5 (.CLK(CLK_COUNTER_Z),
    .D(\net10[5] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[5] ));
 sky130_fd_sc_hd__dfrtp_1 x5_6 (.CLK(CLK_COUNTER_Z),
    .D(\net10[6] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[6] ));
 sky130_fd_sc_hd__dfrtp_1 x5_7 (.CLK(CLK_COUNTER_Z),
    .D(\net10[7] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[7] ));
 sky130_fd_sc_hd__dfrtp_1 x5_8 (.CLK(CLK_COUNTER_Z),
    .D(\net10[8] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[8] ));
 sky130_fd_sc_hd__dfrtp_1 x5_9 (.CLK(CLK_COUNTER_Z),
    .D(\net10[9] ),
    .RESET_B(RST_RES_REG_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\RESULTi[9] ));
 sky130_fd_sc_hd__inv_4 x6 (.A(RSTi),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(RST_Zi));
 sky130_fd_sc_hd__mux4_1 x60 (.A0(DONE),
    .A1(\COUNTER[11] ),
    .A2(\COUNTER[5] ),
    .A3(\COUNTER[0] ),
    .S0(DEBUG_MUX[0]),
    .S1(DEBUG_MUX[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net21));
 sky130_fd_sc_hd__inv_4 x60_0 (.A(\net42[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[0] ));
 sky130_fd_sc_hd__inv_4 x60_1 (.A(\net42[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[1] ));
 sky130_fd_sc_hd__inv_4 x60_2 (.A(\net42[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[2] ));
 sky130_fd_sc_hd__inv_4 x60_3 (.A(\net42[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[3] ));
 sky130_fd_sc_hd__inv_4 x60_4 (.A(\net42[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[4] ));
 sky130_fd_sc_hd__inv_4 x60_5 (.A(\net42[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net43[5] ));
 sky130_fd_sc_hd__inv_1 x61 (.A(IDLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net23));
 sky130_fd_sc_hd__inv_2 x61_0 (.A(\net39[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[0] ));
 sky130_fd_sc_hd__inv_2 x61_1 (.A(\net39[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[1] ));
 sky130_fd_sc_hd__inv_2 x61_2 (.A(\net39[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[2] ));
 sky130_fd_sc_hd__inv_2 x61_3 (.A(\net39[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[3] ));
 sky130_fd_sc_hd__inv_2 x61_4 (.A(\net39[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[4] ));
 sky130_fd_sc_hd__inv_2 x61_5 (.A(\net39[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net42[5] ));
 sky130_fd_sc_hd__nor2_2 x62 (.A(RSTi),
    .B(SAMPLE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(RST_RES_REG_Z));
 sky130_fd_sc_hd__inv_8 x63 (.A(net19),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net25));
 sky130_fd_sc_hd__inv_16 x64 (.A(net25),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(DEBUG_OUT));
 sky130_fd_sc_hd__inv_16 x65 (.A(net45),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(CLK_DATA));
 sky130_fd_sc_hd__inv_4 x66 (.A(net41),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net45));
 sky130_fd_sc_hd__inv_8 x6_0 (.A(\net43[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[0] ));
 sky130_fd_sc_hd__inv_8 x6_1 (.A(\net43[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[1] ));
 sky130_fd_sc_hd__inv_8 x6_2 (.A(\net43[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[2] ));
 sky130_fd_sc_hd__inv_8 x6_3 (.A(\net43[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[3] ));
 sky130_fd_sc_hd__inv_8 x6_4 (.A(\net43[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[4] ));
 sky130_fd_sc_hd__inv_8 x6_5 (.A(\net43[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net44[5] ));
 sky130_fd_sc_hd__and2_0 x7 (.A(CONVERT),
    .B(DONE),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net2));
 sky130_fd_sc_hd__inv_4 x7_0 (.A(\net29[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[0]));
 sky130_fd_sc_hd__inv_4 x7_1 (.A(\net29[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[1]));
 sky130_fd_sc_hd__inv_4 x7_10 (.A(\net29[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[10]));
 sky130_fd_sc_hd__inv_4 x7_2 (.A(\net29[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[2]));
 sky130_fd_sc_hd__inv_4 x7_3 (.A(\net29[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[3]));
 sky130_fd_sc_hd__inv_4 x7_4 (.A(\net29[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[4]));
 sky130_fd_sc_hd__inv_4 x7_5 (.A(\net29[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[5]));
 sky130_fd_sc_hd__inv_4 x7_6 (.A(\net29[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[6]));
 sky130_fd_sc_hd__inv_4 x7_7 (.A(\net29[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[7]));
 sky130_fd_sc_hd__inv_4 x7_8 (.A(\net29[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[8]));
 sky130_fd_sc_hd__inv_4 x7_9 (.A(\net29[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VSS_P_O[9]));
 sky130_fd_sc_hd__nand2_1 x8 (.A(S_SAMPLE_Z),
    .B(net3),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net4));
 sky130_fd_sc_hd__inv_4 x8_0 (.A(\net28[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[0]));
 sky130_fd_sc_hd__inv_4 x8_1 (.A(\net28[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[1]));
 sky130_fd_sc_hd__inv_4 x8_10 (.A(\net28[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[10]));
 sky130_fd_sc_hd__inv_4 x8_2 (.A(\net28[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[2]));
 sky130_fd_sc_hd__inv_4 x8_3 (.A(\net28[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[3]));
 sky130_fd_sc_hd__inv_4 x8_4 (.A(\net28[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[4]));
 sky130_fd_sc_hd__inv_4 x8_5 (.A(\net28[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[5]));
 sky130_fd_sc_hd__inv_4 x8_6 (.A(\net28[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[6]));
 sky130_fd_sc_hd__inv_4 x8_7 (.A(\net28[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[7]));
 sky130_fd_sc_hd__inv_4 x8_8 (.A(\net28[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[8]));
 sky130_fd_sc_hd__inv_4 x8_9 (.A(\net28[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(VREF_Z_P_O[9]));
 sky130_fd_sc_hd__nand2_1 x9 (.A(net4),
    .B(R_SAMPLE_Z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net3));
 sky130_fd_sc_hd__nor2b_1 x9_0 (.A(\COUNTER[1] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[0] ));
 sky130_fd_sc_hd__nor2b_1 x9_1 (.A(\COUNTER[2] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[1] ));
 sky130_fd_sc_hd__nor2b_1 x9_10 (.A(\COUNTER[11] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[10] ));
 sky130_fd_sc_hd__nor2b_1 x9_2 (.A(\COUNTER[3] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[2] ));
 sky130_fd_sc_hd__nor2b_1 x9_3 (.A(\COUNTER[4] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[3] ));
 sky130_fd_sc_hd__nor2b_1 x9_4 (.A(\COUNTER[5] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[4] ));
 sky130_fd_sc_hd__nor2b_1 x9_5 (.A(\COUNTER[6] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[5] ));
 sky130_fd_sc_hd__nor2b_1 x9_6 (.A(\COUNTER[7] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[6] ));
 sky130_fd_sc_hd__nor2b_1 x9_7 (.A(\COUNTER[8] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[7] ));
 sky130_fd_sc_hd__nor2b_1 x9_8 (.A(\COUNTER[9] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[8] ));
 sky130_fd_sc_hd__nor2b_1 x9_9 (.A(\COUNTER[10] ),
    .B_N(net11),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(\net27[9] ));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_10 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_11 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_12 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_13 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_14 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_15 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_16 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_17 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_18 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_19 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_20 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_21 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_22 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_23 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_24 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_25 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_26 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_27 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_28 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_29 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_30 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_31 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_32 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_33 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_34 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_35 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_36 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_37 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_38 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_39 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_40 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_41 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_42 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_43 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_44 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_45 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_46 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_47 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_48 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_49 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_50 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_51 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_52 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_53 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_54 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_55 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_56 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_57 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_58 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_59 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_60 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_61 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_62 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_63 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_64 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_65 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_66 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_67 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_68 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_69 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_70 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_71 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_72 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_73 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_74 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_75 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_76 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_77 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_78 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_79 (.VGND(VSS),
    .VPWR(VDD));
 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(VIN_P_SW_ON),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_0_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_16 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_41 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_77 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_95 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_102 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_113 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_126 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_138 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_144 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_160 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_167 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_177 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_184 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_197 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_238 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_242 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_251 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_253 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_4 FILLER_0_0_265 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_269 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_281 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_0_287 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_19 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_8 FILLER_0_1_31 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_39 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_46 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_100 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_110 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_113 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_128 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_135 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_142 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_1_222 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_1_228 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_240 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_244 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_250 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_254 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_1_265 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_1_276 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_281 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_1_287 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_20 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_26 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_34 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_38 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_49 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_79 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_159 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_195 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_197 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_218 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_2_231 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_2_237 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_248 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_2_253 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_2_266 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_273 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_2_284 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_9 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_3_29 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_3_41 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_49 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_57 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_108 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_3_116 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_147 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_3_172 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_186 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_233 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_3_244 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_3_255 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_3_264 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_3_273 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_281 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_3_287 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_4_11 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_20 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_29 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_4_49 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_53 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_74 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_79 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_88 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_4_132 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_153 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_4_167 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_179 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_194 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_210 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_4_219 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_231 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_4_268 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_4_285 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_20 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_37 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_51 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_55 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_57 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_69 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_96 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_5_100 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_109 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_113 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_117 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_5_156 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_175 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_190 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_222 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_233 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_5_237 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_5_243 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_5_264 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_5_286 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_11 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_29 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_49 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_55 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_76 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_81 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_6_85 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_106 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_118 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_129 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_6_170 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_6_191 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_6_195 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_218 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_6_241 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_6_249 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_14 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_18 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_24 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_30 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_39 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_46 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_55 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_60 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_7_68 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_111 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_122 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_134 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_140 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_164 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_185 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_7_208 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_214 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_223 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_225 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_229 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_7_250 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_258 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_7_270 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_7_279 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_7_286 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_8_26 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_8_38 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_8_55 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_8_63 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_80 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_8_101 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_8_108 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_117 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_123 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_8_129 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_8_137 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_8_158 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_166 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_8_175 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_195 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_200 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_8_204 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_234 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_6 FILLER_0_8_246 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_253 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_ef_sc_hd__decap_12 FILLER_0_8_265 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_4 FILLER_0_8_277 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_3 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_9_29 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_3 FILLER_0_9_37 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_57 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_8 FILLER_0_9_75 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_83 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_85 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_113 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_150 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_162 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_2 FILLER_0_9_174 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_4 FILLER_0_9_191 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_195 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__decap_6 FILLER_0_9_197 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_225 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_237 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_3 FILLER_0_9_249 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_253 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_ef_sc_hd__decap_12 FILLER_0_9_265 (.VPWR(VDD),
    .VGND(VSS),
    .VPB(VDD),
    .VNB(VSS));
 sky130_fd_sc_hd__decap_3 FILLER_0_9_277 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_281 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
 sky130_fd_sc_hd__fill_1 FILLER_0_9_287 (.VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD));
endmodule
