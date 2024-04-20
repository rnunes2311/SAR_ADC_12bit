module state_machine (clk,
    clk_data,
    comp_n,
    comp_p,
    debug_out,
    en_comp,
    en_offset_cal,
    en_offset_cal_o,
    en_vcm_sw_o,
    en_vcm_sw_o_i,
    offset_cal_cycle,
    rst_z,
    sample_o,
    single_ended,
    start,
    vcm_dummy_o,
    vin_n_sw_on,
    vin_p_sw_on,
    VDD,
    VSS,
    data,
    debug_mux,
    vcm_o,
    vcm_o_i,
    vref_z_n_o,
    vref_z_p_o,
    vss_n_o,
    vss_p_o);
 input clk;
 output clk_data;
 input comp_n;
 input comp_p;
 output debug_out;
 output en_comp;
 input en_offset_cal;
 output en_offset_cal_o;
 output en_vcm_sw_o;
 input en_vcm_sw_o_i;
 output offset_cal_cycle;
 input rst_z;
 output sample_o;
 input single_ended;
 input start;
 output vcm_dummy_o;
 input vin_n_sw_on;
 input vin_p_sw_on;
 input VDD;
 input VSS;
 output [5:0] data;
 input [3:0] debug_mux;
 output [10:0] vcm_o;
 input [10:0] vcm_o_i;
 output [10:0] vref_z_n_o;
 output [10:0] vref_z_p_o;
 output [10:0] vss_n_o;
 output [10:0] vss_p_o;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire \counter[0] ;
 wire \counter[10] ;
 wire \counter[11] ;
 wire \counter[1] ;
 wire \counter[2] ;
 wire \counter[3] ;
 wire \counter[4] ;
 wire \counter[5] ;
 wire \counter[6] ;
 wire \counter[7] ;
 wire \counter[8] ;
 wire \counter[9] ;
 wire counter_sample;
 wire \result[0] ;
 wire \result[10] ;
 wire \result[11] ;
 wire \result[1] ;
 wire \result[2] ;
 wire \result[3] ;
 wire \result[4] ;
 wire \result[5] ;
 wire \result[6] ;
 wire \result[7] ;
 wire \result[8] ;
 wire \result[9] ;
 wire single_ended_reg;
 wire \state[0] ;
 wire \state[1] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;

 sky130_fd_sc_hd__inv_2 _172_ (.A(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _173_ (.A(net108),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _174_ (.A(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _175_ (.A(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _176_ (.A(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_030_));
 sky130_fd_sc_hd__inv_2 _177_ (.A(net110),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_031_));
 sky130_fd_sc_hd__inv_2 _178_ (.A(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _179_ (.A(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_033_));
 sky130_fd_sc_hd__inv_2 _180_ (.A(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _181_ (.A(\result[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_035_));
 sky130_fd_sc_hd__inv_2 _182_ (.A(\result[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _183_ (.A(\result[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_037_));
 sky130_fd_sc_hd__inv_2 _184_ (.A(\result[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _185_ (.A(\result[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_039_));
 sky130_fd_sc_hd__inv_2 _186_ (.A(\result[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_040_));
 sky130_fd_sc_hd__inv_2 _187_ (.A(\result[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_041_));
 sky130_fd_sc_hd__inv_2 _188_ (.A(net15),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_042_));
 sky130_fd_sc_hd__inv_2 _189_ (.A(net18),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _190_ (.A(net5),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _191_ (.A(net4),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _192_ (.A(net7),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _193_ (.A(net8),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _194_ (.A(net9),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_048_));
 sky130_fd_sc_hd__and2b_1 _195_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_049_));
 sky130_fd_sc_hd__nand2b_4 _196_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_050_));
 sky130_fd_sc_hd__nand2_2 _197_ (.A(\counter[4] ),
    .B(net100),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_051_));
 sky130_fd_sc_hd__mux2_1 _198_ (.A0(\result[0] ),
    .A1(\result[6] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_052_));
 sky130_fd_sc_hd__inv_2 _199_ (.A(_052_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net27));
 sky130_fd_sc_hd__mux2_1 _200_ (.A0(\result[1] ),
    .A1(\result[7] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_053_));
 sky130_fd_sc_hd__inv_2 _201_ (.A(_053_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net28));
 sky130_fd_sc_hd__mux2_1 _202_ (.A0(\result[2] ),
    .A1(\result[8] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_054_));
 sky130_fd_sc_hd__inv_2 _203_ (.A(_054_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net29));
 sky130_fd_sc_hd__mux2_1 _204_ (.A0(\result[3] ),
    .A1(\result[9] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_055_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(_055_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net30));
 sky130_fd_sc_hd__mux2_1 _206_ (.A0(\result[4] ),
    .A1(\result[10] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_056_));
 sky130_fd_sc_hd__inv_2 _207_ (.A(_056_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net31));
 sky130_fd_sc_hd__mux2_1 _208_ (.A0(\result[5] ),
    .A1(\result[11] ),
    .S(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_057_));
 sky130_fd_sc_hd__inv_2 _209_ (.A(_057_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net32));
 sky130_fd_sc_hd__nor3_1 _210_ (.A(net24),
    .B(net25),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net39));
 sky130_fd_sc_hd__and2_1 _211_ (.A(net106),
    .B(net98),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_058_));
 sky130_fd_sc_hd__nand2_4 _212_ (.A(net108),
    .B(net98),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_059_));
 sky130_fd_sc_hd__or3b_1 _213_ (.A(net106),
    .B(net13),
    .C_N(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_060_));
 sky130_fd_sc_hd__o21ai_2 _214_ (.A1(\result[1] ),
    .A2(_060_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net73));
 sky130_fd_sc_hd__and3_1 _215_ (.A(net103),
    .B(\counter[2] ),
    .C(_042_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_061_));
 sky130_fd_sc_hd__a21o_1 _216_ (.A1(_037_),
    .A2(_061_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net75));
 sky130_fd_sc_hd__nand2_1 _217_ (.A(net103),
    .B(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_062_));
 sky130_fd_sc_hd__nor2_1 _218_ (.A(net16),
    .B(_062_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_063_));
 sky130_fd_sc_hd__a21o_1 _219_ (.A1(_039_),
    .A2(_063_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net76));
 sky130_fd_sc_hd__or3_1 _220_ (.A(net107),
    .B(_034_),
    .C(net17),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_064_));
 sky130_fd_sc_hd__o21ai_1 _221_ (.A1(\result[4] ),
    .A2(_064_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net77));
 sky130_fd_sc_hd__and3_1 _222_ (.A(net105),
    .B(\counter[5] ),
    .C(_043_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_065_));
 sky130_fd_sc_hd__nor2_1 _223_ (.A(net95),
    .B(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_066_));
 sky130_fd_sc_hd__a21oi_1 _224_ (.A1(\result[5] ),
    .A2(_059_),
    .B1(_066_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net78));
 sky130_fd_sc_hd__and3b_1 _225_ (.A_N(net19),
    .B(\counter[6] ),
    .C(net104),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_067_));
 sky130_fd_sc_hd__a21oi_1 _226_ (.A1(\counter[7] ),
    .A2(net96),
    .B1(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_068_));
 sky130_fd_sc_hd__o21ai_1 _227_ (.A1(\result[6] ),
    .A2(_068_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net79));
 sky130_fd_sc_hd__and3b_1 _228_ (.A_N(net20),
    .B(\counter[7] ),
    .C(net104),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_069_));
 sky130_fd_sc_hd__a21o_1 _229_ (.A1(_036_),
    .A2(_069_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net80));
 sky130_fd_sc_hd__nor3_1 _230_ (.A(net108),
    .B(_032_),
    .C(net21),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_070_));
 sky130_fd_sc_hd__a21o_1 _231_ (.A1(_038_),
    .A2(_070_),
    .B1(net96),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net81));
 sky130_fd_sc_hd__nand2_1 _232_ (.A(net104),
    .B(net110),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_071_));
 sky130_fd_sc_hd__nor2_1 _233_ (.A(net22),
    .B(_071_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_072_));
 sky130_fd_sc_hd__a21o_1 _234_ (.A1(_040_),
    .A2(_072_),
    .B1(net96),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net82));
 sky130_fd_sc_hd__nand2_1 _235_ (.A(net104),
    .B(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_073_));
 sky130_fd_sc_hd__nor2_1 _236_ (.A(net23),
    .B(_073_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_074_));
 sky130_fd_sc_hd__a21o_1 _237_ (.A1(_041_),
    .A2(_074_),
    .B1(net96),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net83));
 sky130_fd_sc_hd__nand2_1 _238_ (.A(net105),
    .B(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_075_));
 sky130_fd_sc_hd__o31ai_1 _239_ (.A1(\result[11] ),
    .A2(net14),
    .A3(_075_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net74));
 sky130_fd_sc_hd__or2_1 _240_ (.A(_035_),
    .B(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net51));
 sky130_fd_sc_hd__nor2_1 _241_ (.A(net103),
    .B(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_076_));
 sky130_fd_sc_hd__o21ai_1 _242_ (.A1(\result[0] ),
    .A2(_076_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_077_));
 sky130_fd_sc_hd__nand2_1 _243_ (.A(net51),
    .B(_077_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net84));
 sky130_fd_sc_hd__nand2_1 _244_ (.A(\result[2] ),
    .B(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net53));
 sky130_fd_sc_hd__a21oi_1 _245_ (.A1(\counter[3] ),
    .A2(net95),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_078_));
 sky130_fd_sc_hd__o211ai_1 _246_ (.A1(_028_),
    .A2(\result[1] ),
    .B1(net98),
    .C1(net106),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_079_));
 sky130_fd_sc_hd__nand2_1 _247_ (.A(net53),
    .B(_079_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net86));
 sky130_fd_sc_hd__nand2_1 _248_ (.A(\result[3] ),
    .B(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net54));
 sky130_fd_sc_hd__a21o_1 _249_ (.A1(\counter[4] ),
    .A2(net95),
    .B1(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_080_));
 sky130_fd_sc_hd__o211a_1 _250_ (.A1(_034_),
    .A2(\result[2] ),
    .B1(net98),
    .C1(net106),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_081_));
 sky130_fd_sc_hd__a21o_1 _251_ (.A1(\result[3] ),
    .A2(_063_),
    .B1(_081_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net87));
 sky130_fd_sc_hd__or4b_2 _252_ (.A(net107),
    .B(_034_),
    .C(net17),
    .D_N(\result[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net55));
 sky130_fd_sc_hd__nor2_1 _253_ (.A(net103),
    .B(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_082_));
 sky130_fd_sc_hd__o21ai_1 _254_ (.A1(\result[3] ),
    .A2(_082_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_083_));
 sky130_fd_sc_hd__nand2_1 _255_ (.A(net55),
    .B(_083_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net88));
 sky130_fd_sc_hd__nand2_1 _256_ (.A(\result[5] ),
    .B(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net56));
 sky130_fd_sc_hd__nor2_1 _257_ (.A(\counter[6] ),
    .B(net105),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_084_));
 sky130_fd_sc_hd__o21ai_1 _258_ (.A1(\result[4] ),
    .A2(_084_),
    .B1(net95),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_085_));
 sky130_fd_sc_hd__nand2_1 _259_ (.A(net56),
    .B(_085_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net89));
 sky130_fd_sc_hd__nand2_1 _260_ (.A(\result[6] ),
    .B(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net57));
 sky130_fd_sc_hd__o211ai_1 _261_ (.A1(_026_),
    .A2(\result[5] ),
    .B1(net98),
    .C1(net107),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_1 _262_ (.A(net57),
    .B(_086_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net90));
 sky130_fd_sc_hd__nand2_1 _263_ (.A(\result[7] ),
    .B(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net58));
 sky130_fd_sc_hd__a21oi_1 _264_ (.A1(\counter[8] ),
    .A2(net95),
    .B1(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_087_));
 sky130_fd_sc_hd__o211ai_1 _265_ (.A1(_032_),
    .A2(\result[6] ),
    .B1(net98),
    .C1(net108),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_088_));
 sky130_fd_sc_hd__nand2_1 _266_ (.A(net58),
    .B(_088_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net91));
 sky130_fd_sc_hd__nand2_1 _267_ (.A(\result[8] ),
    .B(_070_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net59));
 sky130_fd_sc_hd__a21o_1 _268_ (.A1(net110),
    .A2(net96),
    .B1(net97),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_089_));
 sky130_fd_sc_hd__o211a_1 _269_ (.A1(_031_),
    .A2(\result[7] ),
    .B1(net98),
    .C1(net108),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_090_));
 sky130_fd_sc_hd__a21o_1 _270_ (.A1(\result[8] ),
    .A2(net97),
    .B1(_090_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net92));
 sky130_fd_sc_hd__nand2_1 _271_ (.A(\result[9] ),
    .B(_072_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net60));
 sky130_fd_sc_hd__a21o_1 _272_ (.A1(\counter[10] ),
    .A2(net96),
    .B1(_072_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_091_));
 sky130_fd_sc_hd__o211a_1 _273_ (.A1(_030_),
    .A2(\result[8] ),
    .B1(net98),
    .C1(net108),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_092_));
 sky130_fd_sc_hd__a21o_1 _274_ (.A1(\result[9] ),
    .A2(_072_),
    .B1(_092_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net93));
 sky130_fd_sc_hd__nand2_1 _275_ (.A(\result[10] ),
    .B(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net61));
 sky130_fd_sc_hd__a21o_1 _276_ (.A1(\counter[11] ),
    .A2(net96),
    .B1(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_093_));
 sky130_fd_sc_hd__o211a_1 _277_ (.A1(_029_),
    .A2(\result[9] ),
    .B1(net98),
    .C1(net109),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_094_));
 sky130_fd_sc_hd__a21o_1 _278_ (.A1(\result[10] ),
    .A2(_074_),
    .B1(_094_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net94));
 sky130_fd_sc_hd__or3b_1 _279_ (.A(net14),
    .B(_075_),
    .C_N(\result[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net52));
 sky130_fd_sc_hd__o21ai_1 _280_ (.A1(_041_),
    .A2(_059_),
    .B1(net52),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net85));
 sky130_fd_sc_hd__a221o_1 _281_ (.A1(net106),
    .A2(\result[0] ),
    .B1(_059_),
    .B2(_060_),
    .C1(_076_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_095_));
 sky130_fd_sc_hd__a21o_1 _282_ (.A1(net103),
    .A2(\result[1] ),
    .B1(_095_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net62));
 sky130_fd_sc_hd__mux2_1 _283_ (.A0(\result[2] ),
    .A1(\result[1] ),
    .S(net106),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_096_));
 sky130_fd_sc_hd__or2_1 _284_ (.A(_078_),
    .B(_096_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net64));
 sky130_fd_sc_hd__mux2_1 _285_ (.A0(_037_),
    .A1(_039_),
    .S(net103),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_097_));
 sky130_fd_sc_hd__nand2_1 _286_ (.A(_080_),
    .B(_097_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net65));
 sky130_fd_sc_hd__a221o_1 _287_ (.A1(net106),
    .A2(\result[3] ),
    .B1(_059_),
    .B2(_064_),
    .C1(_082_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_098_));
 sky130_fd_sc_hd__a21o_1 _288_ (.A1(net103),
    .A2(\result[4] ),
    .B1(_098_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net66));
 sky130_fd_sc_hd__mux2_1 _289_ (.A0(\result[5] ),
    .A1(\result[4] ),
    .S(net107),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_099_));
 sky130_fd_sc_hd__or3_1 _290_ (.A(_066_),
    .B(_084_),
    .C(_099_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net67));
 sky130_fd_sc_hd__mux2_1 _291_ (.A0(\result[6] ),
    .A1(\result[5] ),
    .S(net107),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_100_));
 sky130_fd_sc_hd__or2_1 _292_ (.A(_068_),
    .B(_100_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net68));
 sky130_fd_sc_hd__mux2_1 _293_ (.A0(\result[7] ),
    .A1(\result[6] ),
    .S(net108),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_101_));
 sky130_fd_sc_hd__or2_1 _294_ (.A(_087_),
    .B(_101_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net69));
 sky130_fd_sc_hd__mux2_1 _295_ (.A0(_036_),
    .A1(_038_),
    .S(net104),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_102_));
 sky130_fd_sc_hd__nand2_1 _296_ (.A(_089_),
    .B(_102_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net70));
 sky130_fd_sc_hd__mux2_1 _297_ (.A0(_038_),
    .A1(_040_),
    .S(net104),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_103_));
 sky130_fd_sc_hd__nand2_1 _298_ (.A(_091_),
    .B(_103_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net71));
 sky130_fd_sc_hd__mux2_1 _299_ (.A0(_040_),
    .A1(_041_),
    .S(net104),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_104_));
 sky130_fd_sc_hd__nand2_1 _300_ (.A(_093_),
    .B(_104_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net72));
 sky130_fd_sc_hd__o21ai_1 _301_ (.A1(net104),
    .A2(_041_),
    .B1(net74),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net63));
 sky130_fd_sc_hd__nand2_4 _302_ (.A(net104),
    .B(net98),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_105_));
 sky130_fd_sc_hd__nor2_1 _303_ (.A(\counter[1] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net40));
 sky130_fd_sc_hd__nor2_1 _304_ (.A(\counter[2] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net42));
 sky130_fd_sc_hd__nor2_1 _305_ (.A(\counter[3] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net43));
 sky130_fd_sc_hd__nor2_1 _306_ (.A(\counter[4] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net44));
 sky130_fd_sc_hd__nor2_1 _307_ (.A(\counter[5] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net45));
 sky130_fd_sc_hd__nor2_1 _308_ (.A(\counter[6] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net46));
 sky130_fd_sc_hd__nor2_1 _309_ (.A(\counter[7] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net47));
 sky130_fd_sc_hd__nor2_1 _310_ (.A(\counter[8] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net48));
 sky130_fd_sc_hd__nor2_1 _311_ (.A(net110),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net49));
 sky130_fd_sc_hd__nor2_1 _312_ (.A(\counter[10] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net50));
 sky130_fd_sc_hd__nor2_1 _313_ (.A(\counter[11] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net41));
 sky130_fd_sc_hd__nand2b_4 _314_ (.A_N(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_106_));
 sky130_fd_sc_hd__inv_2 _315_ (.A(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_107_));
 sky130_fd_sc_hd__nor2_1 _316_ (.A(counter_sample),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_000_));
 sky130_fd_sc_hd__nor2_1 _317_ (.A(\counter[10] ),
    .B(net5),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_108_));
 sky130_fd_sc_hd__a211o_1 _318_ (.A1(_032_),
    .A2(net5),
    .B1(net4),
    .C1(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_109_));
 sky130_fd_sc_hd__and3_1 _319_ (.A(net110),
    .B(_044_),
    .C(net4),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_110_));
 sky130_fd_sc_hd__a31o_1 _320_ (.A1(\counter[7] ),
    .A2(net5),
    .A3(net4),
    .B1(net6),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_111_));
 sky130_fd_sc_hd__or3b_1 _321_ (.A(_111_),
    .B(_110_),
    .C_N(_109_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_112_));
 sky130_fd_sc_hd__mux2_1 _322_ (.A0(\counter[2] ),
    .A1(\counter[0] ),
    .S(net4),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_113_));
 sky130_fd_sc_hd__or3b_1 _323_ (.A(net5),
    .B(net4),
    .C_N(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_114_));
 sky130_fd_sc_hd__o311a_1 _324_ (.A1(_034_),
    .A2(net5),
    .A3(_045_),
    .B1(net6),
    .C1(_114_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_115_));
 sky130_fd_sc_hd__a21bo_1 _325_ (.A1(net5),
    .A2(_113_),
    .B1_N(_115_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_116_));
 sky130_fd_sc_hd__and3_1 _326_ (.A(net7),
    .B(_112_),
    .C(_116_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_117_));
 sky130_fd_sc_hd__nor2_1 _327_ (.A(net107),
    .B(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_118_));
 sky130_fd_sc_hd__o21ba_1 _328_ (.A1(net105),
    .A2(\counter[1] ),
    .B1_N(_118_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_119_));
 sky130_fd_sc_hd__a211oi_2 _329_ (.A1(_047_),
    .A2(_119_),
    .B1(_050_),
    .C1(net116),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net34));
 sky130_fd_sc_hd__nor2_1 _330_ (.A(net7),
    .B(net6),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_120_));
 sky130_fd_sc_hd__and4_1 _331_ (.A(net5),
    .B(net4),
    .C(net34),
    .D(_120_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_121_));
 sky130_fd_sc_hd__and3_1 _332_ (.A(\counter[11] ),
    .B(net5),
    .C(net4),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_122_));
 sky130_fd_sc_hd__a221o_1 _333_ (.A1(net3),
    .A2(_044_),
    .B1(_045_),
    .B2(net2),
    .C1(_122_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_123_));
 sky130_fd_sc_hd__nand2_1 _334_ (.A(net4),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_124_));
 sky130_fd_sc_hd__o211a_1 _335_ (.A1(_044_),
    .A2(net102),
    .B1(_120_),
    .C1(_124_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_125_));
 sky130_fd_sc_hd__a31o_1 _336_ (.A1(_046_),
    .A2(net6),
    .A3(_123_),
    .B1(_125_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_126_));
 sky130_fd_sc_hd__nor2_2 _337_ (.A(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_127_));
 sky130_fd_sc_hd__or4b_1 _338_ (.A(net5),
    .B(net4),
    .C(_127_),
    .D_N(_120_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_128_));
 sky130_fd_sc_hd__o31a_1 _339_ (.A1(_117_),
    .A2(_121_),
    .A3(_126_),
    .B1(_128_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net33));
 sky130_fd_sc_hd__a21o_1 _340_ (.A1(net12),
    .A2(_127_),
    .B1(_000_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_170_));
 sky130_fd_sc_hd__and4_1 _341_ (.A(\counter[3] ),
    .B(\counter[11] ),
    .C(net110),
    .D(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_129_));
 sky130_fd_sc_hd__o2111a_1 _342_ (.A1(net103),
    .A2(_033_),
    .B1(_129_),
    .C1(\counter[5] ),
    .D1(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_130_));
 sky130_fd_sc_hd__and4_1 _343_ (.A(\counter[1] ),
    .B(\counter[10] ),
    .C(\counter[8] ),
    .D(_130_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_131_));
 sky130_fd_sc_hd__and4b_1 _344_ (.A_N(_118_),
    .B(_131_),
    .C(\counter[7] ),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_132_));
 sky130_fd_sc_hd__a2bb2o_1 _345_ (.A1_N(_050_),
    .A2_N(_132_),
    .B1(_107_),
    .B2(counter_sample),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_171_));
 sky130_fd_sc_hd__and2_1 _346_ (.A(\counter[5] ),
    .B(net100),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net26));
 sky130_fd_sc_hd__a211oi_2 _347_ (.A1(\state[1] ),
    .A2(_048_),
    .B1(_127_),
    .C1(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(net38));
 sky130_fd_sc_hd__and2_1 _348_ (.A(net8),
    .B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net35));
 sky130_fd_sc_hd__and2_1 _349_ (.A(net8),
    .B(_119_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net37));
 sky130_fd_sc_hd__and2_1 _350_ (.A(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_133_));
 sky130_fd_sc_hd__a21o_1 _351_ (.A1(net102),
    .A2(_119_),
    .B1(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net36));
 sky130_fd_sc_hd__and4b_1 _352_ (.A_N(\counter[6] ),
    .B(net105),
    .C(net101),
    .D(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_134_));
 sky130_fd_sc_hd__a41o_1 _353_ (.A1(_026_),
    .A2(net108),
    .A3(\counter[8] ),
    .A4(net101),
    .B1(_134_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_135_));
 sky130_fd_sc_hd__and2_1 _354_ (.A(\result[6] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_136_));
 sky130_fd_sc_hd__mux2_1 _355_ (.A0(_136_),
    .A1(net3),
    .S(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_001_));
 sky130_fd_sc_hd__or2_1 _356_ (.A(\counter[3] ),
    .B(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_137_));
 sky130_fd_sc_hd__o32a_1 _357_ (.A1(\counter[2] ),
    .A2(_050_),
    .A3(_062_),
    .B1(_137_),
    .B2(net103),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_138_));
 sky130_fd_sc_hd__nor2_1 _358_ (.A(_037_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_139_));
 sky130_fd_sc_hd__mux2_1 _359_ (.A0(net3),
    .A1(_139_),
    .S(_138_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_002_));
 sky130_fd_sc_hd__and2_1 _360_ (.A(net3),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_140_));
 sky130_fd_sc_hd__nand2_1 _361_ (.A(net102),
    .B(_075_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_141_));
 sky130_fd_sc_hd__and3_1 _362_ (.A(net102),
    .B(_075_),
    .C(_140_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_142_));
 sky130_fd_sc_hd__a32o_1 _363_ (.A1(\result[11] ),
    .A2(_106_),
    .A3(_141_),
    .B1(_142_),
    .B2(net105),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_003_));
 sky130_fd_sc_hd__nand2_1 _364_ (.A(net108),
    .B(_029_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_143_));
 sky130_fd_sc_hd__o211a_1 _365_ (.A1(\counter[10] ),
    .A2(_075_),
    .B1(_143_),
    .C1(net102),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_144_));
 sky130_fd_sc_hd__or3_1 _366_ (.A(_127_),
    .B(net99),
    .C(_144_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_145_));
 sky130_fd_sc_hd__mux2_1 _367_ (.A0(_140_),
    .A1(\result[10] ),
    .S(_145_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_004_));
 sky130_fd_sc_hd__or3_1 _368_ (.A(net104),
    .B(_029_),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_146_));
 sky130_fd_sc_hd__o32a_1 _369_ (.A1(net110),
    .A2(_050_),
    .A3(_073_),
    .B1(_146_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_147_));
 sky130_fd_sc_hd__nor2_1 _370_ (.A(_040_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_148_));
 sky130_fd_sc_hd__mux2_1 _371_ (.A0(_140_),
    .A1(_148_),
    .S(_147_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_005_));
 sky130_fd_sc_hd__or3_1 _372_ (.A(net105),
    .B(_030_),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_149_));
 sky130_fd_sc_hd__o32a_1 _373_ (.A1(\counter[8] ),
    .A2(_050_),
    .A3(_071_),
    .B1(_149_),
    .B2(net110),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_150_));
 sky130_fd_sc_hd__nor2_1 _374_ (.A(_038_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_151_));
 sky130_fd_sc_hd__mux2_1 _375_ (.A0(net3),
    .A1(_151_),
    .S(_150_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_006_));
 sky130_fd_sc_hd__and4b_1 _376_ (.A_N(\counter[1] ),
    .B(net100),
    .C(net106),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_152_));
 sky130_fd_sc_hd__a31o_1 _377_ (.A1(\counter[1] ),
    .A2(net100),
    .A3(_118_),
    .B1(_152_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_153_));
 sky130_fd_sc_hd__and2_1 _378_ (.A(\result[0] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_154_));
 sky130_fd_sc_hd__mux2_1 _379_ (.A0(_154_),
    .A1(net3),
    .S(_153_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_007_));
 sky130_fd_sc_hd__a22o_1 _380_ (.A1(\counter[1] ),
    .A2(net101),
    .B1(net99),
    .B2(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_008_));
 sky130_fd_sc_hd__a22o_1 _381_ (.A1(\counter[2] ),
    .A2(net100),
    .B1(net99),
    .B2(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_009_));
 sky130_fd_sc_hd__a22o_1 _382_ (.A1(\counter[3] ),
    .A2(net100),
    .B1(net99),
    .B2(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_010_));
 sky130_fd_sc_hd__a22o_1 _383_ (.A1(\counter[4] ),
    .A2(net100),
    .B1(net99),
    .B2(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_011_));
 sky130_fd_sc_hd__a21o_1 _384_ (.A1(\counter[4] ),
    .A2(net99),
    .B1(net26),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_012_));
 sky130_fd_sc_hd__a22o_1 _385_ (.A1(\counter[6] ),
    .A2(net100),
    .B1(net99),
    .B2(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_013_));
 sky130_fd_sc_hd__a22o_1 _386_ (.A1(\counter[7] ),
    .A2(net101),
    .B1(net99),
    .B2(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_014_));
 sky130_fd_sc_hd__a22o_1 _387_ (.A1(\counter[8] ),
    .A2(net102),
    .B1(net99),
    .B2(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_015_));
 sky130_fd_sc_hd__a22o_1 _388_ (.A1(net110),
    .A2(net102),
    .B1(net99),
    .B2(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_016_));
 sky130_fd_sc_hd__a22o_1 _389_ (.A1(\counter[10] ),
    .A2(net102),
    .B1(_133_),
    .B2(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_017_));
 sky130_fd_sc_hd__a22o_1 _390_ (.A1(\counter[11] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_018_));
 sky130_fd_sc_hd__a21o_1 _391_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(net102),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_019_));
 sky130_fd_sc_hd__mux2_1 _392_ (.A0(net109),
    .A1(net11),
    .S(_127_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_020_));
 sky130_fd_sc_hd__and4_1 _393_ (.A(_026_),
    .B(net103),
    .C(\counter[8] ),
    .D(net101),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_155_));
 sky130_fd_sc_hd__a41o_1 _394_ (.A1(net108),
    .A2(net110),
    .A3(_032_),
    .A4(net102),
    .B1(_155_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_156_));
 sky130_fd_sc_hd__nor2_1 _395_ (.A(_036_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_157_));
 sky130_fd_sc_hd__mux2_1 _396_ (.A0(_157_),
    .A1(_140_),
    .S(_156_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_021_));
 sky130_fd_sc_hd__or3b_1 _397_ (.A(\counter[4] ),
    .B(_050_),
    .C_N(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_158_));
 sky130_fd_sc_hd__nor2_1 _398_ (.A(net106),
    .B(_158_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_159_));
 sky130_fd_sc_hd__a31o_1 _399_ (.A1(\counter[6] ),
    .A2(net101),
    .A3(_082_),
    .B1(_159_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_160_));
 sky130_fd_sc_hd__and2_1 _400_ (.A(\result[4] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_161_));
 sky130_fd_sc_hd__mux2_1 _401_ (.A0(_161_),
    .A1(net3),
    .S(_160_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_022_));
 sky130_fd_sc_hd__and4bb_1 _402_ (.A_N(net106),
    .B_N(\counter[1] ),
    .C(net100),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_162_));
 sky130_fd_sc_hd__a31o_1 _403_ (.A1(\counter[3] ),
    .A2(net100),
    .A3(_076_),
    .B1(_162_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_163_));
 sky130_fd_sc_hd__and2_1 _404_ (.A(\result[1] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_164_));
 sky130_fd_sc_hd__mux2_1 _405_ (.A0(_164_),
    .A1(_140_),
    .S(_163_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_023_));
 sky130_fd_sc_hd__and4bb_1 _406_ (.A_N(net107),
    .B_N(\counter[5] ),
    .C(net101),
    .D(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_165_));
 sky130_fd_sc_hd__a31o_1 _407_ (.A1(\counter[7] ),
    .A2(net101),
    .A3(_084_),
    .B1(_165_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_166_));
 sky130_fd_sc_hd__mux2_1 _408_ (.A0(\result[5] ),
    .A1(net3),
    .S(_166_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_167_));
 sky130_fd_sc_hd__and2_1 _409_ (.A(_106_),
    .B(_167_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_024_));
 sky130_fd_sc_hd__mux2_1 _410_ (.A0(_137_),
    .A1(_158_),
    .S(net107),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_168_));
 sky130_fd_sc_hd__nor2_1 _411_ (.A(_039_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_169_));
 sky130_fd_sc_hd__mux2_1 _412_ (.A0(_140_),
    .A1(_169_),
    .S(_168_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_025_));
 sky130_fd_sc_hd__dfrtp_2 _413_ (.CLK(net115),
    .D(_001_),
    .RESET_B(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[6] ));
 sky130_fd_sc_hd__dfrtp_1 _414_ (.CLK(net115),
    .D(_002_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[2] ));
 sky130_fd_sc_hd__dfrtp_1 _415_ (.CLK(net116),
    .D(_003_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[11] ));
 sky130_fd_sc_hd__dfrtp_2 _416_ (.CLK(net116),
    .D(_004_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[10] ));
 sky130_fd_sc_hd__dfrtp_2 _417_ (.CLK(net116),
    .D(_005_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[9] ));
 sky130_fd_sc_hd__dfrtp_2 _418_ (.CLK(net116),
    .D(_006_),
    .RESET_B(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[8] ));
 sky130_fd_sc_hd__dfrtp_1 _419_ (.CLK(net115),
    .D(_007_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[0] ));
 sky130_fd_sc_hd__dfrtp_1 _420_ (.CLK(net116),
    .D(_008_),
    .RESET_B(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[0] ));
 sky130_fd_sc_hd__dfrtp_4 _421_ (.CLK(net115),
    .D(_009_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[1] ));
 sky130_fd_sc_hd__dfrtp_4 _422_ (.CLK(net115),
    .D(_010_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[2] ));
 sky130_fd_sc_hd__dfrtp_4 _423_ (.CLK(net115),
    .D(_011_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[3] ));
 sky130_fd_sc_hd__dfrtp_4 _424_ (.CLK(net115),
    .D(_012_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[4] ));
 sky130_fd_sc_hd__dfrtp_2 _425_ (.CLK(net115),
    .D(_013_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[5] ));
 sky130_fd_sc_hd__dfrtp_4 _426_ (.CLK(net118),
    .D(_014_),
    .RESET_B(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[6] ));
 sky130_fd_sc_hd__dfrtp_4 _427_ (.CLK(net116),
    .D(_015_),
    .RESET_B(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[7] ));
 sky130_fd_sc_hd__dfrtp_4 _428_ (.CLK(net116),
    .D(_016_),
    .RESET_B(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[8] ));
 sky130_fd_sc_hd__dfrtp_1 _429_ (.CLK(net116),
    .D(_017_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[9] ));
 sky130_fd_sc_hd__dfrtp_4 _430_ (.CLK(net117),
    .D(_018_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[10] ));
 sky130_fd_sc_hd__dfrtp_4 _431_ (.CLK(net117),
    .D(_019_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[11] ));
 sky130_fd_sc_hd__dfrtp_1 _432_ (.CLK(net117),
    .D(_000_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(counter_sample));
 sky130_fd_sc_hd__dfrtp_2 _433_ (.CLK(net117),
    .D(_170_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_4 _434_ (.CLK(net117),
    .D(_171_),
    .RESET_B(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _435_ (.CLK(net117),
    .D(_020_),
    .RESET_B(net112),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(single_ended_reg));
 sky130_fd_sc_hd__dfrtp_2 _436_ (.CLK(net116),
    .D(_021_),
    .RESET_B(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[7] ));
 sky130_fd_sc_hd__dfrtp_2 _437_ (.CLK(net115),
    .D(_022_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[4] ));
 sky130_fd_sc_hd__dfrtp_4 _438_ (.CLK(net115),
    .D(_023_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[1] ));
 sky130_fd_sc_hd__dfrtp_2 _439_ (.CLK(net118),
    .D(_024_),
    .RESET_B(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[5] ));
 sky130_fd_sc_hd__dfrtp_2 _440_ (.CLK(net118),
    .D(_025_),
    .RESET_B(net111),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[3] ));
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
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(clk),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input2 (.A(comp_n),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net2));
 sky130_fd_sc_hd__buf_2 input3 (.A(comp_p),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net3));
 sky130_fd_sc_hd__buf_2 input4 (.A(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net4));
 sky130_fd_sc_hd__buf_2 input5 (.A(debug_mux[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net6));
 sky130_fd_sc_hd__buf_1 input7 (.A(debug_mux[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(en_offset_cal),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net8));
 sky130_fd_sc_hd__clkbuf_1 input9 (.A(en_vcm_sw_o_i),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(single_ended),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_1 input12 (.A(start),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_1 input13 (.A(vcm_o_i[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_1 input14 (.A(vcm_o_i[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net14));
 sky130_fd_sc_hd__clkbuf_1 input15 (.A(vcm_o_i[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_1 input16 (.A(vcm_o_i[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net16));
 sky130_fd_sc_hd__clkbuf_1 input17 (.A(vcm_o_i[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net17));
 sky130_fd_sc_hd__clkbuf_1 input18 (.A(vcm_o_i[4]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_1 input19 (.A(vcm_o_i[5]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_1 input20 (.A(vcm_o_i[6]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_1 input21 (.A(vcm_o_i[7]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_1 input22 (.A(vcm_o_i[8]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net22));
 sky130_fd_sc_hd__clkbuf_1 input23 (.A(vcm_o_i[9]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_1 input24 (.A(vin_n_sw_on),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net24));
 sky130_fd_sc_hd__buf_1 input25 (.A(vin_p_sw_on),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net25));
 sky130_fd_sc_hd__clkbuf_4 output26 (.A(net26),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(clk_data));
 sky130_fd_sc_hd__clkbuf_4 output27 (.A(net27),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[0]));
 sky130_fd_sc_hd__clkbuf_4 output28 (.A(net28),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[1]));
 sky130_fd_sc_hd__clkbuf_4 output29 (.A(net29),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[2]));
 sky130_fd_sc_hd__clkbuf_4 output30 (.A(net30),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[3]));
 sky130_fd_sc_hd__clkbuf_4 output31 (.A(net31),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[4]));
 sky130_fd_sc_hd__clkbuf_4 output32 (.A(net32),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[5]));
 sky130_fd_sc_hd__clkbuf_4 output33 (.A(net33),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(debug_out));
 sky130_fd_sc_hd__buf_2 output34 (.A(net34),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_comp));
 sky130_fd_sc_hd__clkbuf_4 output35 (.A(net35),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_offset_cal_o));
 sky130_fd_sc_hd__buf_2 output36 (.A(net36),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_vcm_sw_o));
 sky130_fd_sc_hd__buf_2 output37 (.A(net37),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(offset_cal_cycle));
 sky130_fd_sc_hd__clkbuf_4 output38 (.A(net38),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(sample_o));
 sky130_fd_sc_hd__buf_2 output39 (.A(net39),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_dummy_o));
 sky130_fd_sc_hd__buf_2 output40 (.A(net40),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[0]));
 sky130_fd_sc_hd__buf_2 output41 (.A(net41),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[10]));
 sky130_fd_sc_hd__buf_2 output42 (.A(net42),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[1]));
 sky130_fd_sc_hd__buf_2 output43 (.A(net43),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[2]));
 sky130_fd_sc_hd__buf_2 output44 (.A(net44),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[3]));
 sky130_fd_sc_hd__buf_2 output45 (.A(net45),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[4]));
 sky130_fd_sc_hd__buf_2 output46 (.A(net46),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[5]));
 sky130_fd_sc_hd__buf_2 output47 (.A(net47),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[6]));
 sky130_fd_sc_hd__buf_2 output48 (.A(net48),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[7]));
 sky130_fd_sc_hd__buf_2 output49 (.A(net49),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[8]));
 sky130_fd_sc_hd__buf_2 output50 (.A(net50),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vcm_o[9]));
 sky130_fd_sc_hd__buf_2 output51 (.A(net51),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[0]));
 sky130_fd_sc_hd__buf_2 output52 (.A(net52),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[10]));
 sky130_fd_sc_hd__buf_2 output53 (.A(net53),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[1]));
 sky130_fd_sc_hd__buf_2 output54 (.A(net54),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[2]));
 sky130_fd_sc_hd__buf_2 output55 (.A(net55),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[3]));
 sky130_fd_sc_hd__buf_2 output56 (.A(net56),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[4]));
 sky130_fd_sc_hd__buf_2 output57 (.A(net57),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[5]));
 sky130_fd_sc_hd__buf_2 output58 (.A(net58),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[6]));
 sky130_fd_sc_hd__buf_2 output59 (.A(net59),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[7]));
 sky130_fd_sc_hd__buf_2 output60 (.A(net60),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[8]));
 sky130_fd_sc_hd__buf_2 output61 (.A(net61),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[9]));
 sky130_fd_sc_hd__buf_2 output62 (.A(net62),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[0]));
 sky130_fd_sc_hd__buf_2 output63 (.A(net63),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[10]));
 sky130_fd_sc_hd__buf_2 output64 (.A(net64),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[1]));
 sky130_fd_sc_hd__buf_2 output65 (.A(net65),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[2]));
 sky130_fd_sc_hd__buf_2 output66 (.A(net66),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[3]));
 sky130_fd_sc_hd__buf_2 output67 (.A(net67),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[4]));
 sky130_fd_sc_hd__buf_2 output68 (.A(net68),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[5]));
 sky130_fd_sc_hd__buf_2 output69 (.A(net69),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[6]));
 sky130_fd_sc_hd__buf_2 output70 (.A(net70),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[7]));
 sky130_fd_sc_hd__buf_2 output71 (.A(net71),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[8]));
 sky130_fd_sc_hd__buf_2 output72 (.A(net72),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[9]));
 sky130_fd_sc_hd__buf_2 output73 (.A(net73),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[0]));
 sky130_fd_sc_hd__buf_2 output74 (.A(net74),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[10]));
 sky130_fd_sc_hd__buf_2 output75 (.A(net75),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[1]));
 sky130_fd_sc_hd__buf_2 output76 (.A(net76),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[2]));
 sky130_fd_sc_hd__buf_2 output77 (.A(net77),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[3]));
 sky130_fd_sc_hd__buf_2 output78 (.A(net78),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[4]));
 sky130_fd_sc_hd__buf_2 output79 (.A(net79),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[5]));
 sky130_fd_sc_hd__buf_2 output80 (.A(net80),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[6]));
 sky130_fd_sc_hd__buf_2 output81 (.A(net81),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[7]));
 sky130_fd_sc_hd__buf_2 output82 (.A(net82),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[8]));
 sky130_fd_sc_hd__buf_2 output83 (.A(net83),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[9]));
 sky130_fd_sc_hd__buf_2 output84 (.A(net84),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[0]));
 sky130_fd_sc_hd__buf_2 output85 (.A(net85),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[10]));
 sky130_fd_sc_hd__buf_2 output86 (.A(net86),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[1]));
 sky130_fd_sc_hd__buf_2 output87 (.A(net87),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[2]));
 sky130_fd_sc_hd__buf_2 output88 (.A(net88),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[3]));
 sky130_fd_sc_hd__buf_2 output89 (.A(net89),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[4]));
 sky130_fd_sc_hd__buf_2 output90 (.A(net90),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[5]));
 sky130_fd_sc_hd__buf_2 output91 (.A(net91),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[6]));
 sky130_fd_sc_hd__buf_2 output92 (.A(net92),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[7]));
 sky130_fd_sc_hd__buf_2 output93 (.A(net93),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[8]));
 sky130_fd_sc_hd__buf_2 output94 (.A(net94),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[9]));
 sky130_fd_sc_hd__buf_2 fanout95 (.A(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net95));
 sky130_fd_sc_hd__clkbuf_2 fanout96 (.A(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net96));
 sky130_fd_sc_hd__clkbuf_1 max_cap97 (.A(_070_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net97));
 sky130_fd_sc_hd__clkbuf_4 fanout98 (.A(net39),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net98));
 sky130_fd_sc_hd__clkbuf_4 fanout99 (.A(_133_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net99));
 sky130_fd_sc_hd__buf_2 fanout100 (.A(net101),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net100));
 sky130_fd_sc_hd__clkbuf_2 fanout101 (.A(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net101));
 sky130_fd_sc_hd__buf_2 fanout102 (.A(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net102));
 sky130_fd_sc_hd__buf_2 fanout103 (.A(net105),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net103));
 sky130_fd_sc_hd__clkbuf_4 fanout104 (.A(net105),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net104));
 sky130_fd_sc_hd__buf_2 fanout105 (.A(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net105));
 sky130_fd_sc_hd__clkbuf_2 fanout106 (.A(net109),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net106));
 sky130_fd_sc_hd__clkbuf_2 fanout107 (.A(net109),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net107));
 sky130_fd_sc_hd__clkbuf_4 fanout108 (.A(net109),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net108));
 sky130_fd_sc_hd__clkbuf_2 fanout109 (.A(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net109));
 sky130_fd_sc_hd__buf_2 fanout110 (.A(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net110));
 sky130_fd_sc_hd__clkbuf_4 fanout111 (.A(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net111));
 sky130_fd_sc_hd__clkbuf_4 fanout112 (.A(net113),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net112));
 sky130_fd_sc_hd__buf_2 fanout113 (.A(net114),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net113));
 sky130_fd_sc_hd__clkbuf_2 fanout114 (.A(net10),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net114));
 sky130_fd_sc_hd__buf_2 fanout115 (.A(net118),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net115));
 sky130_fd_sc_hd__buf_2 fanout116 (.A(net118),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net116));
 sky130_fd_sc_hd__dlymetal6s2s_1 fanout117 (.A(net118),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net117));
 sky130_fd_sc_hd__clkbuf_2 fanout118 (.A(net1),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(net118));
endmodule
