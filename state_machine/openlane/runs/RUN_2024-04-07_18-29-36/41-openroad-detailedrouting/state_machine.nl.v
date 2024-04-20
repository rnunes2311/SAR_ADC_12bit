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
    start,
    vcm_dummy_o,
    vin_n_sw_on,
    vin_p_sw_on,
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
 input start;
 output vcm_dummy_o;
 input vin_n_sw_on;
 input vin_p_sw_on;
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

 sky130_fd_sc_hd__inv_2 _087_ (.A(\counter[5] ),
    .Y(_025_));
 sky130_fd_sc_hd__inv_2 _088_ (.A(\counter[4] ),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _089_ (.A(counter_sample),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _090_ (.A(net5),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _091_ (.A(net4),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _092_ (.A(net9),
    .Y(_030_));
 sky130_fd_sc_hd__nand2b_1 _093_ (.A_N(\state[1] ),
    .B(\state[0] ),
    .Y(_031_));
 sky130_fd_sc_hd__nor2_1 _094_ (.A(counter_sample),
    .B(net100),
    .Y(_000_));
 sky130_fd_sc_hd__or4_1 _095_ (.A(net5),
    .B(net4),
    .C(net7),
    .D(net6),
    .X(_032_));
 sky130_fd_sc_hd__nor2_1 _096_ (.A(\state[0] ),
    .B(\state[1] ),
    .Y(_033_));
 sky130_fd_sc_hd__nand2_1 _097_ (.A(net5),
    .B(net4),
    .Y(_034_));
 sky130_fd_sc_hd__mux4_1 _098_ (.A0(\counter[10] ),
    .A1(\counter[9] ),
    .A2(\counter[8] ),
    .A3(\counter[7] ),
    .S0(net4),
    .S1(net5),
    .X(_035_));
 sky130_fd_sc_hd__mux4_1 _099_ (.A0(\counter[6] ),
    .A1(\counter[2] ),
    .A2(\counter[4] ),
    .A3(\counter[0] ),
    .S0(net5),
    .S1(net4),
    .X(_036_));
 sky130_fd_sc_hd__and3b_1 _100_ (.A_N(net6),
    .B(_035_),
    .C(net7),
    .X(_037_));
 sky130_fd_sc_hd__a31o_1 _101_ (.A1(net7),
    .A2(net6),
    .A3(_036_),
    .B1(_037_),
    .X(_038_));
 sky130_fd_sc_hd__and2b_1 _102_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .X(_039_));
 sky130_fd_sc_hd__nand2b_1 _103_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .Y(_040_));
 sky130_fd_sc_hd__or4bb_1 _104_ (.A(\state[0] ),
    .B(net4),
    .C_N(net5),
    .D_N(\state[1] ),
    .X(_041_));
 sky130_fd_sc_hd__o31a_1 _105_ (.A1(net5),
    .A2(_029_),
    .A3(net100),
    .B1(_041_),
    .X(_042_));
 sky130_fd_sc_hd__and2b_1 _106_ (.A_N(net8),
    .B(\counter[0] ),
    .X(_043_));
 sky130_fd_sc_hd__nor3_1 _107_ (.A(net106),
    .B(net96),
    .C(_043_),
    .Y(net33));
 sky130_fd_sc_hd__or4_1 _108_ (.A(net106),
    .B(_034_),
    .C(net96),
    .D(_043_),
    .X(_044_));
 sky130_fd_sc_hd__a211oi_1 _109_ (.A1(_042_),
    .A2(_044_),
    .B1(net7),
    .C1(net6),
    .Y(_045_));
 sky130_fd_sc_hd__and3_1 _110_ (.A(\counter[11] ),
    .B(net5),
    .C(net4),
    .X(_046_));
 sky130_fd_sc_hd__a221o_1 _111_ (.A1(_029_),
    .A2(net2),
    .B1(net3),
    .B2(_028_),
    .C1(_046_),
    .X(_047_));
 sky130_fd_sc_hd__and2b_1 _112_ (.A_N(net7),
    .B(net6),
    .X(_048_));
 sky130_fd_sc_hd__a21bo_1 _113_ (.A1(_047_),
    .A2(_048_),
    .B1_N(_032_),
    .X(_049_));
 sky130_fd_sc_hd__o32a_1 _114_ (.A1(_038_),
    .A2(_045_),
    .A3(_049_),
    .B1(_033_),
    .B2(_032_),
    .X(net32));
 sky130_fd_sc_hd__a21o_1 _115_ (.A1(net11),
    .A2(_033_),
    .B1(_000_),
    .X(_085_));
 sky130_fd_sc_hd__and4_1 _116_ (.A(\counter[10] ),
    .B(\counter[9] ),
    .C(\counter[8] ),
    .D(\counter[7] ),
    .X(_050_));
 sky130_fd_sc_hd__and4_1 _117_ (.A(\counter[4] ),
    .B(\counter[1] ),
    .C(\counter[0] ),
    .D(\counter[11] ),
    .X(_051_));
 sky130_fd_sc_hd__and4_1 _118_ (.A(\counter[6] ),
    .B(\counter[5] ),
    .C(\counter[3] ),
    .D(\counter[2] ),
    .X(_052_));
 sky130_fd_sc_hd__a31o_1 _119_ (.A1(_050_),
    .A2(_051_),
    .A3(_052_),
    .B1(net97),
    .X(_053_));
 sky130_fd_sc_hd__o21ai_1 _120_ (.A1(_027_),
    .A2(net100),
    .B1(_053_),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_4 _121_ (.A(\counter[4] ),
    .B(net98),
    .Y(_054_));
 sky130_fd_sc_hd__mux2_1 _122_ (.A0(\result[0] ),
    .A1(\result[6] ),
    .S(_054_),
    .X(_055_));
 sky130_fd_sc_hd__inv_2 _123_ (.A(_055_),
    .Y(net26));
 sky130_fd_sc_hd__mux2_1 _124_ (.A0(\result[1] ),
    .A1(\result[7] ),
    .S(_054_),
    .X(_056_));
 sky130_fd_sc_hd__inv_2 _125_ (.A(_056_),
    .Y(net27));
 sky130_fd_sc_hd__mux2_1 _126_ (.A0(\result[2] ),
    .A1(\result[8] ),
    .S(_054_),
    .X(_057_));
 sky130_fd_sc_hd__inv_2 _127_ (.A(_057_),
    .Y(net28));
 sky130_fd_sc_hd__mux2_1 _128_ (.A0(\result[3] ),
    .A1(\result[9] ),
    .S(_054_),
    .X(_058_));
 sky130_fd_sc_hd__inv_2 _129_ (.A(_058_),
    .Y(net29));
 sky130_fd_sc_hd__mux2_1 _130_ (.A0(\result[4] ),
    .A1(\result[10] ),
    .S(_054_),
    .X(_059_));
 sky130_fd_sc_hd__inv_2 _131_ (.A(_059_),
    .Y(net30));
 sky130_fd_sc_hd__mux2_1 _132_ (.A0(\result[5] ),
    .A1(\result[11] ),
    .S(_054_),
    .X(_060_));
 sky130_fd_sc_hd__inv_2 _133_ (.A(_060_),
    .Y(net31));
 sky130_fd_sc_hd__or3_4 _134_ (.A(net23),
    .B(net24),
    .C(net96),
    .X(_061_));
 sky130_fd_sc_hd__inv_2 _135_ (.A(_061_),
    .Y(net38));
 sky130_fd_sc_hd__nor2_1 _136_ (.A(\counter[1] ),
    .B(_061_),
    .Y(net39));
 sky130_fd_sc_hd__nor2_1 _137_ (.A(\counter[2] ),
    .B(_061_),
    .Y(net41));
 sky130_fd_sc_hd__nor2_1 _138_ (.A(\counter[3] ),
    .B(_061_),
    .Y(net42));
 sky130_fd_sc_hd__nor2_1 _139_ (.A(\counter[4] ),
    .B(_061_),
    .Y(net43));
 sky130_fd_sc_hd__nor2_1 _140_ (.A(\counter[5] ),
    .B(_061_),
    .Y(net44));
 sky130_fd_sc_hd__nor2_1 _141_ (.A(\counter[6] ),
    .B(_061_),
    .Y(net45));
 sky130_fd_sc_hd__nor2_1 _142_ (.A(\counter[7] ),
    .B(_061_),
    .Y(net46));
 sky130_fd_sc_hd__nor2_1 _143_ (.A(\counter[8] ),
    .B(_061_),
    .Y(net47));
 sky130_fd_sc_hd__nor2_1 _144_ (.A(\counter[9] ),
    .B(_061_),
    .Y(net48));
 sky130_fd_sc_hd__nor2_1 _145_ (.A(\counter[10] ),
    .B(_061_),
    .Y(net49));
 sky130_fd_sc_hd__nor2_1 _146_ (.A(\counter[11] ),
    .B(_061_),
    .Y(net40));
 sky130_fd_sc_hd__and2_1 _147_ (.A(\counter[0] ),
    .B(net8),
    .X(net36));
 sky130_fd_sc_hd__and2_1 _148_ (.A(net8),
    .B(net103),
    .X(net34));
 sky130_fd_sc_hd__or3b_2 _149_ (.A(\result[1] ),
    .B(net12),
    .C_N(\counter[1] ),
    .X(net61));
 sky130_fd_sc_hd__inv_2 _150_ (.A(net61),
    .Y(net72));
 sky130_fd_sc_hd__or3b_2 _151_ (.A(\result[2] ),
    .B(net14),
    .C_N(\counter[2] ),
    .X(net63));
 sky130_fd_sc_hd__inv_2 _152_ (.A(net63),
    .Y(net74));
 sky130_fd_sc_hd__or3b_2 _153_ (.A(\result[3] ),
    .B(net15),
    .C_N(\counter[3] ),
    .X(net64));
 sky130_fd_sc_hd__inv_2 _154_ (.A(net64),
    .Y(net75));
 sky130_fd_sc_hd__or3_2 _155_ (.A(_026_),
    .B(\result[4] ),
    .C(net16),
    .X(net65));
 sky130_fd_sc_hd__inv_2 _156_ (.A(net65),
    .Y(net76));
 sky130_fd_sc_hd__or3_2 _157_ (.A(_025_),
    .B(\result[5] ),
    .C(net17),
    .X(net66));
 sky130_fd_sc_hd__inv_2 _158_ (.A(net66),
    .Y(net77));
 sky130_fd_sc_hd__or3b_2 _159_ (.A(\result[6] ),
    .B(net18),
    .C_N(\counter[6] ),
    .X(net67));
 sky130_fd_sc_hd__inv_2 _160_ (.A(net67),
    .Y(net78));
 sky130_fd_sc_hd__or3b_2 _161_ (.A(\result[7] ),
    .B(net19),
    .C_N(\counter[7] ),
    .X(net68));
 sky130_fd_sc_hd__inv_2 _162_ (.A(net68),
    .Y(net79));
 sky130_fd_sc_hd__or3b_2 _163_ (.A(\result[8] ),
    .B(net20),
    .C_N(\counter[8] ),
    .X(net69));
 sky130_fd_sc_hd__inv_2 _164_ (.A(net69),
    .Y(net80));
 sky130_fd_sc_hd__or3b_2 _165_ (.A(\result[9] ),
    .B(net21),
    .C_N(\counter[9] ),
    .X(net70));
 sky130_fd_sc_hd__inv_2 _166_ (.A(net70),
    .Y(net81));
 sky130_fd_sc_hd__or3b_2 _167_ (.A(\result[10] ),
    .B(net22),
    .C_N(\counter[10] ),
    .X(net71));
 sky130_fd_sc_hd__inv_2 _168_ (.A(net71),
    .Y(net82));
 sky130_fd_sc_hd__or3b_2 _169_ (.A(\result[11] ),
    .B(net13),
    .C_N(\counter[11] ),
    .X(net62));
 sky130_fd_sc_hd__inv_2 _170_ (.A(net62),
    .Y(net73));
 sky130_fd_sc_hd__nand3b_2 _171_ (.A_N(net12),
    .B(\result[1] ),
    .C(\counter[1] ),
    .Y(net50));
 sky130_fd_sc_hd__inv_2 _172_ (.A(net50),
    .Y(net83));
 sky130_fd_sc_hd__nand3b_2 _173_ (.A_N(net14),
    .B(\result[2] ),
    .C(\counter[2] ),
    .Y(net52));
 sky130_fd_sc_hd__inv_2 _174_ (.A(net52),
    .Y(net85));
 sky130_fd_sc_hd__nand3b_2 _175_ (.A_N(net15),
    .B(\result[3] ),
    .C(\counter[3] ),
    .Y(net53));
 sky130_fd_sc_hd__inv_2 _176_ (.A(net53),
    .Y(net86));
 sky130_fd_sc_hd__or3b_2 _177_ (.A(_026_),
    .B(net16),
    .C_N(\result[4] ),
    .X(net54));
 sky130_fd_sc_hd__inv_2 _178_ (.A(net54),
    .Y(net87));
 sky130_fd_sc_hd__or3b_2 _179_ (.A(_025_),
    .B(net17),
    .C_N(\result[5] ),
    .X(net55));
 sky130_fd_sc_hd__inv_2 _180_ (.A(net55),
    .Y(net88));
 sky130_fd_sc_hd__nand3b_2 _181_ (.A_N(net18),
    .B(\result[6] ),
    .C(\counter[6] ),
    .Y(net56));
 sky130_fd_sc_hd__inv_2 _182_ (.A(net56),
    .Y(net89));
 sky130_fd_sc_hd__nand3b_2 _183_ (.A_N(net19),
    .B(\result[7] ),
    .C(\counter[7] ),
    .Y(net57));
 sky130_fd_sc_hd__inv_2 _184_ (.A(net57),
    .Y(net90));
 sky130_fd_sc_hd__nand3b_2 _185_ (.A_N(net20),
    .B(\result[8] ),
    .C(\counter[8] ),
    .Y(net58));
 sky130_fd_sc_hd__inv_2 _186_ (.A(net58),
    .Y(net91));
 sky130_fd_sc_hd__nand3b_2 _187_ (.A_N(net21),
    .B(\result[9] ),
    .C(\counter[9] ),
    .Y(net59));
 sky130_fd_sc_hd__inv_2 _188_ (.A(net59),
    .Y(net92));
 sky130_fd_sc_hd__nand3b_2 _189_ (.A_N(net22),
    .B(\result[10] ),
    .C(\counter[10] ),
    .Y(net60));
 sky130_fd_sc_hd__inv_2 _190_ (.A(net60),
    .Y(net93));
 sky130_fd_sc_hd__nand3b_2 _191_ (.A_N(net13),
    .B(\result[11] ),
    .C(\counter[11] ),
    .Y(net51));
 sky130_fd_sc_hd__inv_2 _192_ (.A(net51),
    .Y(net84));
 sky130_fd_sc_hd__and2_1 _193_ (.A(\state[0] ),
    .B(\state[1] ),
    .X(_062_));
 sky130_fd_sc_hd__a21bo_1 _194_ (.A1(\counter[0] ),
    .A2(net98),
    .B1_N(net100),
    .X(net35));
 sky130_fd_sc_hd__a211oi_2 _195_ (.A1(\state[1] ),
    .A2(_030_),
    .B1(_033_),
    .C1(\counter[11] ),
    .Y(net37));
 sky130_fd_sc_hd__nor2_1 _196_ (.A(_025_),
    .B(net96),
    .Y(net25));
 sky130_fd_sc_hd__and2_1 _197_ (.A(net3),
    .B(net99),
    .X(_063_));
 sky130_fd_sc_hd__or3b_1 _198_ (.A(net96),
    .B(\counter[6] ),
    .C_N(\counter[7] ),
    .X(_064_));
 sky130_fd_sc_hd__and2_1 _199_ (.A(\result[6] ),
    .B(net99),
    .X(_065_));
 sky130_fd_sc_hd__mux2_1 _200_ (.A0(net94),
    .A1(_065_),
    .S(_064_),
    .X(_001_));
 sky130_fd_sc_hd__or3b_1 _201_ (.A(\counter[2] ),
    .B(net96),
    .C_N(\counter[3] ),
    .X(_066_));
 sky130_fd_sc_hd__and2_1 _202_ (.A(\result[2] ),
    .B(net99),
    .X(_067_));
 sky130_fd_sc_hd__mux2_1 _203_ (.A0(net94),
    .A1(_067_),
    .S(_066_),
    .X(_002_));
 sky130_fd_sc_hd__or3b_1 _204_ (.A(\counter[0] ),
    .B(net96),
    .C_N(\counter[1] ),
    .X(_068_));
 sky130_fd_sc_hd__and2_1 _205_ (.A(\result[0] ),
    .B(net99),
    .X(_069_));
 sky130_fd_sc_hd__mux2_1 _206_ (.A0(net94),
    .A1(_069_),
    .S(_068_),
    .X(_003_));
 sky130_fd_sc_hd__or3b_1 _207_ (.A(\counter[5] ),
    .B(net96),
    .C_N(\counter[6] ),
    .X(_070_));
 sky130_fd_sc_hd__and2_1 _208_ (.A(\result[5] ),
    .B(net99),
    .X(_071_));
 sky130_fd_sc_hd__mux2_1 _209_ (.A0(_063_),
    .A1(_071_),
    .S(_070_),
    .X(_004_));
 sky130_fd_sc_hd__a22o_1 _210_ (.A1(\counter[1] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[0] ),
    .X(_005_));
 sky130_fd_sc_hd__a22o_1 _211_ (.A1(\counter[2] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[1] ),
    .X(_006_));
 sky130_fd_sc_hd__a22o_1 _212_ (.A1(\counter[3] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[2] ),
    .X(_007_));
 sky130_fd_sc_hd__a22o_1 _213_ (.A1(\counter[4] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[3] ),
    .X(_008_));
 sky130_fd_sc_hd__a21o_1 _214_ (.A1(\counter[4] ),
    .A2(net95),
    .B1(net25),
    .X(_009_));
 sky130_fd_sc_hd__a22o_1 _215_ (.A1(\counter[6] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[5] ),
    .X(_010_));
 sky130_fd_sc_hd__a22o_1 _216_ (.A1(\counter[7] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[6] ),
    .X(_011_));
 sky130_fd_sc_hd__a22o_1 _217_ (.A1(\counter[8] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[7] ),
    .X(_012_));
 sky130_fd_sc_hd__a22o_1 _218_ (.A1(\counter[9] ),
    .A2(net98),
    .B1(net95),
    .B2(\counter[8] ),
    .X(_013_));
 sky130_fd_sc_hd__a22o_1 _219_ (.A1(\counter[10] ),
    .A2(_039_),
    .B1(net95),
    .B2(\counter[9] ),
    .X(_014_));
 sky130_fd_sc_hd__a22o_1 _220_ (.A1(\counter[11] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[10] ),
    .X(_015_));
 sky130_fd_sc_hd__a21o_1 _221_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_039_),
    .X(_016_));
 sky130_fd_sc_hd__a2bb2o_1 _222_ (.A1_N(\counter[3] ),
    .A2_N(_054_),
    .B1(net99),
    .B2(\result[3] ),
    .X(_072_));
 sky130_fd_sc_hd__o31a_1 _223_ (.A1(\counter[3] ),
    .A2(_054_),
    .A3(net94),
    .B1(_072_),
    .X(_017_));
 sky130_fd_sc_hd__o311a_1 _224_ (.A1(_025_),
    .A2(\counter[4] ),
    .A3(net96),
    .B1(net99),
    .C1(\result[4] ),
    .X(_073_));
 sky130_fd_sc_hd__a31o_1 _225_ (.A1(_026_),
    .A2(net25),
    .A3(net94),
    .B1(_073_),
    .X(_018_));
 sky130_fd_sc_hd__or3b_1 _226_ (.A(\counter[1] ),
    .B(net96),
    .C_N(\counter[2] ),
    .X(_074_));
 sky130_fd_sc_hd__and2_1 _227_ (.A(\result[1] ),
    .B(net99),
    .X(_075_));
 sky130_fd_sc_hd__mux2_1 _228_ (.A0(net94),
    .A1(_075_),
    .S(_074_),
    .X(_019_));
 sky130_fd_sc_hd__a211o_1 _229_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_033_),
    .C1(_062_),
    .X(_076_));
 sky130_fd_sc_hd__mux2_1 _230_ (.A0(net94),
    .A1(\result[11] ),
    .S(_076_),
    .X(_020_));
 sky130_fd_sc_hd__or3b_1 _231_ (.A(\counter[10] ),
    .B(net97),
    .C_N(\counter[11] ),
    .X(_077_));
 sky130_fd_sc_hd__and2_1 _232_ (.A(\result[10] ),
    .B(net100),
    .X(_078_));
 sky130_fd_sc_hd__mux2_1 _233_ (.A0(net3),
    .A1(_078_),
    .S(_077_),
    .X(_021_));
 sky130_fd_sc_hd__or3b_1 _234_ (.A(\counter[9] ),
    .B(net97),
    .C_N(\counter[10] ),
    .X(_079_));
 sky130_fd_sc_hd__and2_1 _235_ (.A(\result[9] ),
    .B(net100),
    .X(_080_));
 sky130_fd_sc_hd__mux2_1 _236_ (.A0(net94),
    .A1(_080_),
    .S(_079_),
    .X(_022_));
 sky130_fd_sc_hd__or3b_1 _237_ (.A(\counter[8] ),
    .B(net97),
    .C_N(\counter[9] ),
    .X(_081_));
 sky130_fd_sc_hd__and2_1 _238_ (.A(\result[8] ),
    .B(net99),
    .X(_082_));
 sky130_fd_sc_hd__mux2_1 _239_ (.A0(net94),
    .A1(_082_),
    .S(_081_),
    .X(_023_));
 sky130_fd_sc_hd__or3b_1 _240_ (.A(\counter[7] ),
    .B(net97),
    .C_N(\counter[8] ),
    .X(_083_));
 sky130_fd_sc_hd__and2_1 _241_ (.A(\result[7] ),
    .B(net99),
    .X(_084_));
 sky130_fd_sc_hd__mux2_1 _242_ (.A0(net94),
    .A1(_084_),
    .S(_083_),
    .X(_024_));
 sky130_fd_sc_hd__dfrtp_1 _243_ (.CLK(net105),
    .D(_001_),
    .RESET_B(net101),
    .Q(\result[6] ));
 sky130_fd_sc_hd__dfrtp_1 _244_ (.CLK(net105),
    .D(_002_),
    .RESET_B(net101),
    .Q(\result[2] ));
 sky130_fd_sc_hd__dfrtp_1 _245_ (.CLK(net105),
    .D(_003_),
    .RESET_B(net101),
    .Q(\result[0] ));
 sky130_fd_sc_hd__dfrtp_1 _246_ (.CLK(net106),
    .D(_000_),
    .RESET_B(net103),
    .Q(counter_sample));
 sky130_fd_sc_hd__dfrtp_1 _247_ (.CLK(net107),
    .D(_085_),
    .RESET_B(net103),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_4 _248_ (.CLK(net107),
    .D(_086_),
    .RESET_B(net103),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _249_ (.CLK(net108),
    .D(_004_),
    .RESET_B(net102),
    .Q(\result[5] ));
 sky130_fd_sc_hd__dfrtp_4 _250_ (.CLK(net105),
    .D(_005_),
    .RESET_B(net101),
    .Q(\counter[0] ));
 sky130_fd_sc_hd__dfrtp_4 _251_ (.CLK(net105),
    .D(_006_),
    .RESET_B(net101),
    .Q(\counter[1] ));
 sky130_fd_sc_hd__dfrtp_4 _252_ (.CLK(net105),
    .D(_007_),
    .RESET_B(net101),
    .Q(\counter[2] ));
 sky130_fd_sc_hd__dfrtp_4 _253_ (.CLK(net108),
    .D(_008_),
    .RESET_B(net102),
    .Q(\counter[3] ));
 sky130_fd_sc_hd__dfrtp_4 _254_ (.CLK(net105),
    .D(_009_),
    .RESET_B(net101),
    .Q(\counter[4] ));
 sky130_fd_sc_hd__dfrtp_1 _255_ (.CLK(net108),
    .D(_010_),
    .RESET_B(net102),
    .Q(\counter[5] ));
 sky130_fd_sc_hd__dfrtp_4 _256_ (.CLK(net108),
    .D(_011_),
    .RESET_B(net102),
    .Q(\counter[6] ));
 sky130_fd_sc_hd__dfrtp_4 _257_ (.CLK(net106),
    .D(_012_),
    .RESET_B(net103),
    .Q(\counter[7] ));
 sky130_fd_sc_hd__dfrtp_4 _258_ (.CLK(net106),
    .D(_013_),
    .RESET_B(net103),
    .Q(\counter[8] ));
 sky130_fd_sc_hd__dfrtp_4 _259_ (.CLK(net106),
    .D(_014_),
    .RESET_B(net103),
    .Q(\counter[9] ));
 sky130_fd_sc_hd__dfrtp_4 _260_ (.CLK(net107),
    .D(_015_),
    .RESET_B(net104),
    .Q(\counter[10] ));
 sky130_fd_sc_hd__dfrtp_4 _261_ (.CLK(net107),
    .D(_016_),
    .RESET_B(net104),
    .Q(\counter[11] ));
 sky130_fd_sc_hd__dfrtp_1 _262_ (.CLK(net105),
    .D(_017_),
    .RESET_B(net101),
    .Q(\result[3] ));
 sky130_fd_sc_hd__dfrtp_1 _263_ (.CLK(net105),
    .D(_018_),
    .RESET_B(net101),
    .Q(\result[4] ));
 sky130_fd_sc_hd__dfrtp_1 _264_ (.CLK(net105),
    .D(_019_),
    .RESET_B(net101),
    .Q(\result[1] ));
 sky130_fd_sc_hd__dfrtp_1 _265_ (.CLK(net106),
    .D(_020_),
    .RESET_B(net103),
    .Q(\result[11] ));
 sky130_fd_sc_hd__dfrtp_1 _266_ (.CLK(net107),
    .D(_021_),
    .RESET_B(net104),
    .Q(\result[10] ));
 sky130_fd_sc_hd__dfrtp_1 _267_ (.CLK(net106),
    .D(_022_),
    .RESET_B(net103),
    .Q(\result[9] ));
 sky130_fd_sc_hd__dfrtp_1 _268_ (.CLK(net106),
    .D(_023_),
    .RESET_B(net103),
    .Q(\result[8] ));
 sky130_fd_sc_hd__dfrtp_1 _269_ (.CLK(net106),
    .D(_024_),
    .RESET_B(net102),
    .Q(\result[7] ));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_19 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_20 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_21 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_22 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_23 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_79 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(clk),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input2 (.A(comp_n),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(comp_p),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_2 input4 (.A(debug_mux[0]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_2 input5 (.A(debug_mux[1]),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(debug_mux[2]),
    .X(net6));
 sky130_fd_sc_hd__buf_1 input7 (.A(debug_mux[3]),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(en_offset_cal),
    .X(net8));
 sky130_fd_sc_hd__clkbuf_1 input9 (.A(en_vcm_sw_o_i),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(rst_z),
    .X(net10));
 sky130_fd_sc_hd__clkbuf_1 input11 (.A(start),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_1 input12 (.A(vcm_o_i[0]),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_1 input13 (.A(vcm_o_i[10]),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_1 input14 (.A(vcm_o_i[1]),
    .X(net14));
 sky130_fd_sc_hd__clkbuf_1 input15 (.A(vcm_o_i[2]),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_1 input16 (.A(vcm_o_i[3]),
    .X(net16));
 sky130_fd_sc_hd__clkbuf_1 input17 (.A(vcm_o_i[4]),
    .X(net17));
 sky130_fd_sc_hd__clkbuf_1 input18 (.A(vcm_o_i[5]),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_1 input19 (.A(vcm_o_i[6]),
    .X(net19));
 sky130_fd_sc_hd__clkbuf_1 input20 (.A(vcm_o_i[7]),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_1 input21 (.A(vcm_o_i[8]),
    .X(net21));
 sky130_fd_sc_hd__clkbuf_1 input22 (.A(vcm_o_i[9]),
    .X(net22));
 sky130_fd_sc_hd__buf_1 input23 (.A(vin_n_sw_on),
    .X(net23));
 sky130_fd_sc_hd__clkbuf_1 input24 (.A(vin_p_sw_on),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_4 output25 (.A(net25),
    .X(clk_data));
 sky130_fd_sc_hd__clkbuf_4 output26 (.A(net26),
    .X(data[0]));
 sky130_fd_sc_hd__clkbuf_4 output27 (.A(net27),
    .X(data[1]));
 sky130_fd_sc_hd__clkbuf_4 output28 (.A(net28),
    .X(data[2]));
 sky130_fd_sc_hd__clkbuf_4 output29 (.A(net29),
    .X(data[3]));
 sky130_fd_sc_hd__clkbuf_4 output30 (.A(net30),
    .X(data[4]));
 sky130_fd_sc_hd__clkbuf_4 output31 (.A(net31),
    .X(data[5]));
 sky130_fd_sc_hd__clkbuf_4 output32 (.A(net32),
    .X(debug_out));
 sky130_fd_sc_hd__buf_2 output33 (.A(net33),
    .X(en_comp));
 sky130_fd_sc_hd__clkbuf_4 output34 (.A(net34),
    .X(en_offset_cal_o));
 sky130_fd_sc_hd__buf_2 output35 (.A(net35),
    .X(en_vcm_sw_o));
 sky130_fd_sc_hd__buf_2 output36 (.A(net36),
    .X(offset_cal_cycle));
 sky130_fd_sc_hd__clkbuf_4 output37 (.A(net37),
    .X(sample_o));
 sky130_fd_sc_hd__buf_2 output38 (.A(net38),
    .X(vcm_dummy_o));
 sky130_fd_sc_hd__buf_2 output39 (.A(net39),
    .X(vcm_o[0]));
 sky130_fd_sc_hd__buf_2 output40 (.A(net40),
    .X(vcm_o[10]));
 sky130_fd_sc_hd__buf_2 output41 (.A(net41),
    .X(vcm_o[1]));
 sky130_fd_sc_hd__buf_2 output42 (.A(net42),
    .X(vcm_o[2]));
 sky130_fd_sc_hd__buf_2 output43 (.A(net43),
    .X(vcm_o[3]));
 sky130_fd_sc_hd__buf_2 output44 (.A(net44),
    .X(vcm_o[4]));
 sky130_fd_sc_hd__buf_2 output45 (.A(net45),
    .X(vcm_o[5]));
 sky130_fd_sc_hd__buf_2 output46 (.A(net46),
    .X(vcm_o[6]));
 sky130_fd_sc_hd__buf_2 output47 (.A(net47),
    .X(vcm_o[7]));
 sky130_fd_sc_hd__buf_2 output48 (.A(net48),
    .X(vcm_o[8]));
 sky130_fd_sc_hd__buf_2 output49 (.A(net49),
    .X(vcm_o[9]));
 sky130_fd_sc_hd__buf_2 output50 (.A(net50),
    .X(vref_z_n_o[0]));
 sky130_fd_sc_hd__buf_2 output51 (.A(net51),
    .X(vref_z_n_o[10]));
 sky130_fd_sc_hd__buf_2 output52 (.A(net52),
    .X(vref_z_n_o[1]));
 sky130_fd_sc_hd__buf_2 output53 (.A(net53),
    .X(vref_z_n_o[2]));
 sky130_fd_sc_hd__buf_2 output54 (.A(net54),
    .X(vref_z_n_o[3]));
 sky130_fd_sc_hd__buf_2 output55 (.A(net55),
    .X(vref_z_n_o[4]));
 sky130_fd_sc_hd__buf_2 output56 (.A(net56),
    .X(vref_z_n_o[5]));
 sky130_fd_sc_hd__buf_2 output57 (.A(net57),
    .X(vref_z_n_o[6]));
 sky130_fd_sc_hd__buf_2 output58 (.A(net58),
    .X(vref_z_n_o[7]));
 sky130_fd_sc_hd__buf_2 output59 (.A(net59),
    .X(vref_z_n_o[8]));
 sky130_fd_sc_hd__buf_2 output60 (.A(net60),
    .X(vref_z_n_o[9]));
 sky130_fd_sc_hd__buf_2 output61 (.A(net61),
    .X(vref_z_p_o[0]));
 sky130_fd_sc_hd__buf_2 output62 (.A(net62),
    .X(vref_z_p_o[10]));
 sky130_fd_sc_hd__buf_2 output63 (.A(net63),
    .X(vref_z_p_o[1]));
 sky130_fd_sc_hd__buf_2 output64 (.A(net64),
    .X(vref_z_p_o[2]));
 sky130_fd_sc_hd__buf_2 output65 (.A(net65),
    .X(vref_z_p_o[3]));
 sky130_fd_sc_hd__buf_2 output66 (.A(net66),
    .X(vref_z_p_o[4]));
 sky130_fd_sc_hd__buf_2 output67 (.A(net67),
    .X(vref_z_p_o[5]));
 sky130_fd_sc_hd__buf_2 output68 (.A(net68),
    .X(vref_z_p_o[6]));
 sky130_fd_sc_hd__buf_2 output69 (.A(net69),
    .X(vref_z_p_o[7]));
 sky130_fd_sc_hd__buf_2 output70 (.A(net70),
    .X(vref_z_p_o[8]));
 sky130_fd_sc_hd__buf_2 output71 (.A(net71),
    .X(vref_z_p_o[9]));
 sky130_fd_sc_hd__buf_2 output72 (.A(net72),
    .X(vss_n_o[0]));
 sky130_fd_sc_hd__buf_2 output73 (.A(net73),
    .X(vss_n_o[10]));
 sky130_fd_sc_hd__buf_2 output74 (.A(net74),
    .X(vss_n_o[1]));
 sky130_fd_sc_hd__buf_2 output75 (.A(net75),
    .X(vss_n_o[2]));
 sky130_fd_sc_hd__buf_2 output76 (.A(net76),
    .X(vss_n_o[3]));
 sky130_fd_sc_hd__buf_2 output77 (.A(net77),
    .X(vss_n_o[4]));
 sky130_fd_sc_hd__buf_2 output78 (.A(net78),
    .X(vss_n_o[5]));
 sky130_fd_sc_hd__buf_2 output79 (.A(net79),
    .X(vss_n_o[6]));
 sky130_fd_sc_hd__buf_2 output80 (.A(net80),
    .X(vss_n_o[7]));
 sky130_fd_sc_hd__buf_2 output81 (.A(net81),
    .X(vss_n_o[8]));
 sky130_fd_sc_hd__buf_2 output82 (.A(net82),
    .X(vss_n_o[9]));
 sky130_fd_sc_hd__buf_2 output83 (.A(net83),
    .X(vss_p_o[0]));
 sky130_fd_sc_hd__buf_2 output84 (.A(net84),
    .X(vss_p_o[10]));
 sky130_fd_sc_hd__buf_2 output85 (.A(net85),
    .X(vss_p_o[1]));
 sky130_fd_sc_hd__buf_2 output86 (.A(net86),
    .X(vss_p_o[2]));
 sky130_fd_sc_hd__buf_2 output87 (.A(net87),
    .X(vss_p_o[3]));
 sky130_fd_sc_hd__buf_2 output88 (.A(net88),
    .X(vss_p_o[4]));
 sky130_fd_sc_hd__buf_2 output89 (.A(net89),
    .X(vss_p_o[5]));
 sky130_fd_sc_hd__buf_2 output90 (.A(net90),
    .X(vss_p_o[6]));
 sky130_fd_sc_hd__buf_2 output91 (.A(net91),
    .X(vss_p_o[7]));
 sky130_fd_sc_hd__buf_2 output92 (.A(net92),
    .X(vss_p_o[8]));
 sky130_fd_sc_hd__buf_2 output93 (.A(net93),
    .X(vss_p_o[9]));
 sky130_fd_sc_hd__clkbuf_2 fanout94 (.A(_063_),
    .X(net94));
 sky130_fd_sc_hd__buf_2 fanout95 (.A(_062_),
    .X(net95));
 sky130_fd_sc_hd__buf_2 fanout96 (.A(_040_),
    .X(net96));
 sky130_fd_sc_hd__buf_1 fanout97 (.A(_040_),
    .X(net97));
 sky130_fd_sc_hd__clkbuf_4 fanout98 (.A(_039_),
    .X(net98));
 sky130_fd_sc_hd__clkbuf_2 fanout99 (.A(_031_),
    .X(net99));
 sky130_fd_sc_hd__clkbuf_2 fanout100 (.A(_031_),
    .X(net100));
 sky130_fd_sc_hd__clkbuf_4 fanout101 (.A(net104),
    .X(net101));
 sky130_fd_sc_hd__clkbuf_2 fanout102 (.A(net104),
    .X(net102));
 sky130_fd_sc_hd__clkbuf_4 fanout103 (.A(net104),
    .X(net103));
 sky130_fd_sc_hd__clkbuf_2 fanout104 (.A(net10),
    .X(net104));
 sky130_fd_sc_hd__clkbuf_2 fanout105 (.A(net108),
    .X(net105));
 sky130_fd_sc_hd__clkbuf_2 fanout106 (.A(net108),
    .X(net106));
 sky130_fd_sc_hd__buf_1 fanout107 (.A(net108),
    .X(net107));
 sky130_fd_sc_hd__clkbuf_2 fanout108 (.A(net1),
    .X(net108));
 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(net108));
endmodule
