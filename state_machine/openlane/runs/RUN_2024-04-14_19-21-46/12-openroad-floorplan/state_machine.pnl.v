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

 sky130_fd_sc_hd__inv_2 _172_ (.A(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _173_ (.A(single_ended_reg),
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
 sky130_fd_sc_hd__inv_2 _177_ (.A(\counter[9] ),
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
 sky130_fd_sc_hd__inv_2 _188_ (.A(vcm_o_i[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_042_));
 sky130_fd_sc_hd__inv_2 _189_ (.A(vcm_o_i[4]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _190_ (.A(debug_mux[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _191_ (.A(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _192_ (.A(debug_mux[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _193_ (.A(en_offset_cal),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _194_ (.A(en_vcm_sw_o_i),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_048_));
 sky130_fd_sc_hd__and2b_2 _195_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_049_));
 sky130_fd_sc_hd__nand2b_2 _196_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_050_));
 sky130_fd_sc_hd__nand2_2 _197_ (.A(\counter[4] ),
    .B(_049_),
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
    .Y(data[0]));
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
    .Y(data[1]));
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
    .Y(data[2]));
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
    .Y(data[3]));
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
    .Y(data[4]));
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
    .Y(data[5]));
 sky130_fd_sc_hd__nor3_2 _210_ (.A(vin_n_sw_on),
    .B(vin_p_sw_on),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_dummy_o));
 sky130_fd_sc_hd__and2_2 _211_ (.A(single_ended_reg),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_058_));
 sky130_fd_sc_hd__nand2_2 _212_ (.A(single_ended_reg),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_059_));
 sky130_fd_sc_hd__or3b_2 _213_ (.A(single_ended_reg),
    .B(vcm_o_i[0]),
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
    .Y(vss_n_o[0]));
 sky130_fd_sc_hd__and3_2 _215_ (.A(_027_),
    .B(\counter[2] ),
    .C(_042_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_061_));
 sky130_fd_sc_hd__a21o_2 _216_ (.A1(_037_),
    .A2(_061_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[1]));
 sky130_fd_sc_hd__nand2_2 _217_ (.A(_027_),
    .B(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_062_));
 sky130_fd_sc_hd__nor2_2 _218_ (.A(vcm_o_i[2]),
    .B(_062_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_063_));
 sky130_fd_sc_hd__a21o_2 _219_ (.A1(_039_),
    .A2(_063_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[2]));
 sky130_fd_sc_hd__or3_2 _220_ (.A(single_ended_reg),
    .B(_034_),
    .C(vcm_o_i[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_064_));
 sky130_fd_sc_hd__o21ai_2 _221_ (.A1(\result[4] ),
    .A2(_064_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[3]));
 sky130_fd_sc_hd__and3_2 _222_ (.A(_027_),
    .B(\counter[5] ),
    .C(_043_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_065_));
 sky130_fd_sc_hd__nor2_2 _223_ (.A(_058_),
    .B(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_066_));
 sky130_fd_sc_hd__a21oi_2 _224_ (.A1(\result[5] ),
    .A2(_059_),
    .B1(_066_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[4]));
 sky130_fd_sc_hd__and3b_2 _225_ (.A_N(vcm_o_i[5]),
    .B(\counter[6] ),
    .C(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_067_));
 sky130_fd_sc_hd__a21oi_2 _226_ (.A1(\counter[7] ),
    .A2(_058_),
    .B1(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_068_));
 sky130_fd_sc_hd__o21ai_2 _227_ (.A1(\result[6] ),
    .A2(_068_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[5]));
 sky130_fd_sc_hd__and3b_2 _228_ (.A_N(vcm_o_i[6]),
    .B(\counter[7] ),
    .C(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_069_));
 sky130_fd_sc_hd__a21o_2 _229_ (.A1(_036_),
    .A2(_069_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[6]));
 sky130_fd_sc_hd__nor3_2 _230_ (.A(single_ended_reg),
    .B(_032_),
    .C(vcm_o_i[7]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_070_));
 sky130_fd_sc_hd__a21o_2 _231_ (.A1(_038_),
    .A2(_070_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[7]));
 sky130_fd_sc_hd__nand2_2 _232_ (.A(_027_),
    .B(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_071_));
 sky130_fd_sc_hd__nor2_2 _233_ (.A(vcm_o_i[8]),
    .B(_071_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_072_));
 sky130_fd_sc_hd__a21o_2 _234_ (.A1(_040_),
    .A2(_072_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[8]));
 sky130_fd_sc_hd__nand2_2 _235_ (.A(_027_),
    .B(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_073_));
 sky130_fd_sc_hd__nor2_2 _236_ (.A(vcm_o_i[9]),
    .B(_073_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_074_));
 sky130_fd_sc_hd__a21o_2 _237_ (.A1(_041_),
    .A2(_074_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[9]));
 sky130_fd_sc_hd__nand2_2 _238_ (.A(_027_),
    .B(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_075_));
 sky130_fd_sc_hd__o31ai_2 _239_ (.A1(\result[11] ),
    .A2(vcm_o_i[10]),
    .A3(_075_),
    .B1(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[10]));
 sky130_fd_sc_hd__or2_2 _240_ (.A(_035_),
    .B(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[0]));
 sky130_fd_sc_hd__nor2_2 _241_ (.A(_027_),
    .B(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_076_));
 sky130_fd_sc_hd__o21ai_2 _242_ (.A1(\result[0] ),
    .A2(_076_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_077_));
 sky130_fd_sc_hd__nand2_2 _243_ (.A(vref_z_n_o[0]),
    .B(_077_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[0]));
 sky130_fd_sc_hd__nand2_2 _244_ (.A(\result[2] ),
    .B(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[1]));
 sky130_fd_sc_hd__a21oi_2 _245_ (.A1(\counter[3] ),
    .A2(_058_),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_078_));
 sky130_fd_sc_hd__o211ai_2 _246_ (.A1(_028_),
    .A2(\result[1] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_079_));
 sky130_fd_sc_hd__nand2_2 _247_ (.A(vref_z_n_o[1]),
    .B(_079_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[1]));
 sky130_fd_sc_hd__nand2_2 _248_ (.A(\result[3] ),
    .B(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[2]));
 sky130_fd_sc_hd__a21o_2 _249_ (.A1(\counter[4] ),
    .A2(_058_),
    .B1(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_080_));
 sky130_fd_sc_hd__o211a_2 _250_ (.A1(_034_),
    .A2(\result[2] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_081_));
 sky130_fd_sc_hd__a21o_2 _251_ (.A1(\result[3] ),
    .A2(_063_),
    .B1(_081_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[2]));
 sky130_fd_sc_hd__or4b_2 _252_ (.A(single_ended_reg),
    .B(_034_),
    .C(vcm_o_i[3]),
    .D_N(\result[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[3]));
 sky130_fd_sc_hd__nor2_2 _253_ (.A(_027_),
    .B(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_082_));
 sky130_fd_sc_hd__o21ai_2 _254_ (.A1(\result[3] ),
    .A2(_082_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_083_));
 sky130_fd_sc_hd__nand2_2 _255_ (.A(vref_z_n_o[3]),
    .B(_083_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[3]));
 sky130_fd_sc_hd__nand2_2 _256_ (.A(\result[5] ),
    .B(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[4]));
 sky130_fd_sc_hd__nor2_2 _257_ (.A(\counter[6] ),
    .B(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_084_));
 sky130_fd_sc_hd__o21ai_2 _258_ (.A1(\result[4] ),
    .A2(_084_),
    .B1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_085_));
 sky130_fd_sc_hd__nand2_2 _259_ (.A(vref_z_n_o[4]),
    .B(_085_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[4]));
 sky130_fd_sc_hd__nand2_2 _260_ (.A(\result[6] ),
    .B(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[5]));
 sky130_fd_sc_hd__o211ai_2 _261_ (.A1(_026_),
    .A2(\result[5] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_2 _262_ (.A(vref_z_n_o[5]),
    .B(_086_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[5]));
 sky130_fd_sc_hd__nand2_2 _263_ (.A(\result[7] ),
    .B(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[6]));
 sky130_fd_sc_hd__a21oi_2 _264_ (.A1(\counter[8] ),
    .A2(_058_),
    .B1(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_087_));
 sky130_fd_sc_hd__o211ai_2 _265_ (.A1(_032_),
    .A2(\result[6] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_088_));
 sky130_fd_sc_hd__nand2_2 _266_ (.A(vref_z_n_o[6]),
    .B(_088_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[6]));
 sky130_fd_sc_hd__nand2_2 _267_ (.A(\result[8] ),
    .B(_070_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[7]));
 sky130_fd_sc_hd__a21o_2 _268_ (.A1(\counter[9] ),
    .A2(_058_),
    .B1(_070_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_089_));
 sky130_fd_sc_hd__o211a_2 _269_ (.A1(_031_),
    .A2(\result[7] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_090_));
 sky130_fd_sc_hd__a21o_2 _270_ (.A1(\result[8] ),
    .A2(_070_),
    .B1(_090_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[7]));
 sky130_fd_sc_hd__nand2_2 _271_ (.A(\result[9] ),
    .B(_072_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[8]));
 sky130_fd_sc_hd__a21o_2 _272_ (.A1(\counter[10] ),
    .A2(_058_),
    .B1(_072_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_091_));
 sky130_fd_sc_hd__o211a_2 _273_ (.A1(_030_),
    .A2(\result[8] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_092_));
 sky130_fd_sc_hd__a21o_2 _274_ (.A1(\result[9] ),
    .A2(_072_),
    .B1(_092_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[8]));
 sky130_fd_sc_hd__nand2_2 _275_ (.A(\result[10] ),
    .B(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[9]));
 sky130_fd_sc_hd__a21o_2 _276_ (.A1(\counter[11] ),
    .A2(_058_),
    .B1(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_093_));
 sky130_fd_sc_hd__o211a_2 _277_ (.A1(_029_),
    .A2(\result[9] ),
    .B1(vcm_dummy_o),
    .C1(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_094_));
 sky130_fd_sc_hd__a21o_2 _278_ (.A1(\result[10] ),
    .A2(_074_),
    .B1(_094_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_p_o[9]));
 sky130_fd_sc_hd__or3b_2 _279_ (.A(vcm_o_i[10]),
    .B(_075_),
    .C_N(\result[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[10]));
 sky130_fd_sc_hd__o21ai_2 _280_ (.A1(_041_),
    .A2(_059_),
    .B1(vref_z_n_o[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[10]));
 sky130_fd_sc_hd__a221o_2 _281_ (.A1(single_ended_reg),
    .A2(\result[0] ),
    .B1(_059_),
    .B2(_060_),
    .C1(_076_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_095_));
 sky130_fd_sc_hd__a21o_2 _282_ (.A1(_027_),
    .A2(\result[1] ),
    .B1(_095_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[0]));
 sky130_fd_sc_hd__mux2_1 _283_ (.A0(\result[2] ),
    .A1(\result[1] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_096_));
 sky130_fd_sc_hd__or2_2 _284_ (.A(_078_),
    .B(_096_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[1]));
 sky130_fd_sc_hd__mux2_1 _285_ (.A0(_037_),
    .A1(_039_),
    .S(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_097_));
 sky130_fd_sc_hd__nand2_2 _286_ (.A(_080_),
    .B(_097_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[2]));
 sky130_fd_sc_hd__a221o_2 _287_ (.A1(single_ended_reg),
    .A2(\result[3] ),
    .B1(_059_),
    .B2(_064_),
    .C1(_082_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_098_));
 sky130_fd_sc_hd__a21o_2 _288_ (.A1(_027_),
    .A2(\result[4] ),
    .B1(_098_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[3]));
 sky130_fd_sc_hd__mux2_1 _289_ (.A0(\result[5] ),
    .A1(\result[4] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_099_));
 sky130_fd_sc_hd__or3_2 _290_ (.A(_066_),
    .B(_084_),
    .C(_099_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[4]));
 sky130_fd_sc_hd__mux2_1 _291_ (.A0(\result[6] ),
    .A1(\result[5] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_100_));
 sky130_fd_sc_hd__or2_2 _292_ (.A(_068_),
    .B(_100_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[5]));
 sky130_fd_sc_hd__mux2_1 _293_ (.A0(\result[7] ),
    .A1(\result[6] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_101_));
 sky130_fd_sc_hd__or2_2 _294_ (.A(_087_),
    .B(_101_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[6]));
 sky130_fd_sc_hd__mux2_1 _295_ (.A0(_036_),
    .A1(_038_),
    .S(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_102_));
 sky130_fd_sc_hd__nand2_2 _296_ (.A(_089_),
    .B(_102_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[7]));
 sky130_fd_sc_hd__mux2_1 _297_ (.A0(_038_),
    .A1(_040_),
    .S(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_103_));
 sky130_fd_sc_hd__nand2_2 _298_ (.A(_091_),
    .B(_103_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[8]));
 sky130_fd_sc_hd__mux2_1 _299_ (.A0(_040_),
    .A1(_041_),
    .S(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_104_));
 sky130_fd_sc_hd__nand2_2 _300_ (.A(_093_),
    .B(_104_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[9]));
 sky130_fd_sc_hd__o21ai_2 _301_ (.A1(_027_),
    .A2(_041_),
    .B1(vss_n_o[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[10]));
 sky130_fd_sc_hd__nand2_2 _302_ (.A(_027_),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_105_));
 sky130_fd_sc_hd__nor2_2 _303_ (.A(\counter[1] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[0]));
 sky130_fd_sc_hd__nor2_2 _304_ (.A(\counter[2] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[1]));
 sky130_fd_sc_hd__nor2_2 _305_ (.A(\counter[3] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[2]));
 sky130_fd_sc_hd__nor2_2 _306_ (.A(\counter[4] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[3]));
 sky130_fd_sc_hd__nor2_2 _307_ (.A(\counter[5] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[4]));
 sky130_fd_sc_hd__nor2_2 _308_ (.A(\counter[6] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[5]));
 sky130_fd_sc_hd__nor2_2 _309_ (.A(\counter[7] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[6]));
 sky130_fd_sc_hd__nor2_2 _310_ (.A(\counter[8] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[7]));
 sky130_fd_sc_hd__nor2_2 _311_ (.A(\counter[9] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[8]));
 sky130_fd_sc_hd__nor2_2 _312_ (.A(\counter[10] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[9]));
 sky130_fd_sc_hd__nor2_2 _313_ (.A(\counter[11] ),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[10]));
 sky130_fd_sc_hd__nand2b_2 _314_ (.A_N(\state[1] ),
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
 sky130_fd_sc_hd__nor2_2 _316_ (.A(counter_sample),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_000_));
 sky130_fd_sc_hd__nor2_2 _317_ (.A(\counter[10] ),
    .B(debug_mux[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_108_));
 sky130_fd_sc_hd__a211o_2 _318_ (.A1(_032_),
    .A2(debug_mux[1]),
    .B1(debug_mux[0]),
    .C1(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_109_));
 sky130_fd_sc_hd__and3_2 _319_ (.A(\counter[9] ),
    .B(_044_),
    .C(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_110_));
 sky130_fd_sc_hd__a31o_2 _320_ (.A1(\counter[7] ),
    .A2(debug_mux[1]),
    .A3(debug_mux[0]),
    .B1(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_111_));
 sky130_fd_sc_hd__or3b_2 _321_ (.A(_111_),
    .B(_110_),
    .C_N(_109_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_112_));
 sky130_fd_sc_hd__mux2_1 _322_ (.A0(\counter[2] ),
    .A1(\counter[0] ),
    .S(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_113_));
 sky130_fd_sc_hd__or3b_2 _323_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .C_N(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_114_));
 sky130_fd_sc_hd__o311a_2 _324_ (.A1(_034_),
    .A2(debug_mux[1]),
    .A3(_045_),
    .B1(debug_mux[2]),
    .C1(_114_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_115_));
 sky130_fd_sc_hd__a21bo_2 _325_ (.A1(debug_mux[1]),
    .A2(_113_),
    .B1_N(_115_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_116_));
 sky130_fd_sc_hd__and3_2 _326_ (.A(debug_mux[3]),
    .B(_112_),
    .C(_116_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_117_));
 sky130_fd_sc_hd__nor2_2 _327_ (.A(single_ended_reg),
    .B(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_118_));
 sky130_fd_sc_hd__o21ba_2 _328_ (.A1(_027_),
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
    .C1(clk),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(en_comp));
 sky130_fd_sc_hd__nor2_2 _330_ (.A(debug_mux[3]),
    .B(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_120_));
 sky130_fd_sc_hd__and4_2 _331_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .C(en_comp),
    .D(_120_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_121_));
 sky130_fd_sc_hd__and3_2 _332_ (.A(\counter[11] ),
    .B(debug_mux[1]),
    .C(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_122_));
 sky130_fd_sc_hd__a221o_2 _333_ (.A1(comp_p),
    .A2(_044_),
    .B1(_045_),
    .B2(comp_n),
    .C1(_122_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_123_));
 sky130_fd_sc_hd__nand2_2 _334_ (.A(debug_mux[0]),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_124_));
 sky130_fd_sc_hd__o211a_2 _335_ (.A1(_044_),
    .A2(_049_),
    .B1(_120_),
    .C1(_124_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_125_));
 sky130_fd_sc_hd__a31o_2 _336_ (.A1(_046_),
    .A2(debug_mux[2]),
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
 sky130_fd_sc_hd__or4b_2 _338_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .C(_127_),
    .D_N(_120_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_128_));
 sky130_fd_sc_hd__o31a_2 _339_ (.A1(_117_),
    .A2(_121_),
    .A3(_126_),
    .B1(_128_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(debug_out));
 sky130_fd_sc_hd__a21o_2 _340_ (.A1(start),
    .A2(_127_),
    .B1(_000_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_170_));
 sky130_fd_sc_hd__and4_2 _341_ (.A(\counter[3] ),
    .B(\counter[11] ),
    .C(\counter[9] ),
    .D(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_129_));
 sky130_fd_sc_hd__o2111a_2 _342_ (.A1(_027_),
    .A2(_033_),
    .B1(_129_),
    .C1(\counter[5] ),
    .D1(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_130_));
 sky130_fd_sc_hd__and4_2 _343_ (.A(\counter[1] ),
    .B(\counter[10] ),
    .C(\counter[8] ),
    .D(_130_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_131_));
 sky130_fd_sc_hd__and4b_2 _344_ (.A_N(_118_),
    .B(_131_),
    .C(\counter[7] ),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_132_));
 sky130_fd_sc_hd__a2bb2o_2 _345_ (.A1_N(_050_),
    .A2_N(_132_),
    .B1(_107_),
    .B2(counter_sample),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_171_));
 sky130_fd_sc_hd__and2_2 _346_ (.A(\counter[5] ),
    .B(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(clk_data));
 sky130_fd_sc_hd__a211oi_2 _347_ (.A1(\state[1] ),
    .A2(_048_),
    .B1(_127_),
    .C1(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(sample_o));
 sky130_fd_sc_hd__and2_2 _348_ (.A(en_offset_cal),
    .B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_offset_cal_o));
 sky130_fd_sc_hd__and2_2 _349_ (.A(en_offset_cal),
    .B(_119_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(offset_cal_cycle));
 sky130_fd_sc_hd__and2_2 _350_ (.A(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_133_));
 sky130_fd_sc_hd__a21o_2 _351_ (.A1(_049_),
    .A2(_119_),
    .B1(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_vcm_sw_o));
 sky130_fd_sc_hd__and4b_2 _352_ (.A_N(\counter[6] ),
    .B(_027_),
    .C(_049_),
    .D(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_134_));
 sky130_fd_sc_hd__a41o_2 _353_ (.A1(_026_),
    .A2(single_ended_reg),
    .A3(\counter[8] ),
    .A4(_049_),
    .B1(_134_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_135_));
 sky130_fd_sc_hd__and2_2 _354_ (.A(\result[6] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_136_));
 sky130_fd_sc_hd__mux2_1 _355_ (.A0(_136_),
    .A1(comp_p),
    .S(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_001_));
 sky130_fd_sc_hd__or2_2 _356_ (.A(\counter[3] ),
    .B(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_137_));
 sky130_fd_sc_hd__o32a_2 _357_ (.A1(\counter[2] ),
    .A2(_050_),
    .A3(_062_),
    .B1(_137_),
    .B2(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_138_));
 sky130_fd_sc_hd__nor2_2 _358_ (.A(_037_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_139_));
 sky130_fd_sc_hd__mux2_1 _359_ (.A0(comp_p),
    .A1(_139_),
    .S(_138_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_002_));
 sky130_fd_sc_hd__and2_2 _360_ (.A(comp_p),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_140_));
 sky130_fd_sc_hd__nand2_2 _361_ (.A(_049_),
    .B(_075_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_141_));
 sky130_fd_sc_hd__and3_2 _362_ (.A(_049_),
    .B(_075_),
    .C(_140_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_142_));
 sky130_fd_sc_hd__a32o_2 _363_ (.A1(\result[11] ),
    .A2(_106_),
    .A3(_141_),
    .B1(_142_),
    .B2(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_003_));
 sky130_fd_sc_hd__nand2_2 _364_ (.A(single_ended_reg),
    .B(_029_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_143_));
 sky130_fd_sc_hd__o211a_2 _365_ (.A1(\counter[10] ),
    .A2(_075_),
    .B1(_143_),
    .C1(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_144_));
 sky130_fd_sc_hd__or3_2 _366_ (.A(_127_),
    .B(_133_),
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
 sky130_fd_sc_hd__or3_2 _368_ (.A(_027_),
    .B(_029_),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_146_));
 sky130_fd_sc_hd__o32a_2 _369_ (.A1(\counter[9] ),
    .A2(_050_),
    .A3(_073_),
    .B1(_146_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_147_));
 sky130_fd_sc_hd__nor2_2 _370_ (.A(_040_),
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
 sky130_fd_sc_hd__or3_2 _372_ (.A(_027_),
    .B(_030_),
    .C(_050_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_149_));
 sky130_fd_sc_hd__o32a_2 _373_ (.A1(\counter[8] ),
    .A2(_050_),
    .A3(_071_),
    .B1(_149_),
    .B2(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_150_));
 sky130_fd_sc_hd__nor2_2 _374_ (.A(_038_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_151_));
 sky130_fd_sc_hd__mux2_1 _375_ (.A0(comp_p),
    .A1(_151_),
    .S(_150_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_006_));
 sky130_fd_sc_hd__and4b_2 _376_ (.A_N(\counter[1] ),
    .B(_049_),
    .C(single_ended_reg),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_152_));
 sky130_fd_sc_hd__a31o_2 _377_ (.A1(\counter[1] ),
    .A2(_049_),
    .A3(_118_),
    .B1(_152_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_153_));
 sky130_fd_sc_hd__and2_2 _378_ (.A(\result[0] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_154_));
 sky130_fd_sc_hd__mux2_1 _379_ (.A0(_154_),
    .A1(comp_p),
    .S(_153_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_007_));
 sky130_fd_sc_hd__a22o_2 _380_ (.A1(\counter[1] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_008_));
 sky130_fd_sc_hd__a22o_2 _381_ (.A1(\counter[2] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_009_));
 sky130_fd_sc_hd__a22o_2 _382_ (.A1(\counter[3] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_010_));
 sky130_fd_sc_hd__a22o_2 _383_ (.A1(\counter[4] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_011_));
 sky130_fd_sc_hd__a21o_2 _384_ (.A1(\counter[4] ),
    .A2(_133_),
    .B1(clk_data),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_012_));
 sky130_fd_sc_hd__a22o_2 _385_ (.A1(\counter[6] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_013_));
 sky130_fd_sc_hd__a22o_2 _386_ (.A1(\counter[7] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_014_));
 sky130_fd_sc_hd__a22o_2 _387_ (.A1(\counter[8] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_015_));
 sky130_fd_sc_hd__a22o_2 _388_ (.A1(\counter[9] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_016_));
 sky130_fd_sc_hd__a22o_2 _389_ (.A1(\counter[10] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_017_));
 sky130_fd_sc_hd__a22o_2 _390_ (.A1(\counter[11] ),
    .A2(_049_),
    .B1(_133_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_018_));
 sky130_fd_sc_hd__a21o_2 _391_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_019_));
 sky130_fd_sc_hd__mux2_1 _392_ (.A0(single_ended_reg),
    .A1(single_ended),
    .S(_127_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_020_));
 sky130_fd_sc_hd__and4_2 _393_ (.A(_026_),
    .B(_027_),
    .C(\counter[8] ),
    .D(_049_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_155_));
 sky130_fd_sc_hd__a41o_2 _394_ (.A1(single_ended_reg),
    .A2(\counter[9] ),
    .A3(_032_),
    .A4(_049_),
    .B1(_155_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_156_));
 sky130_fd_sc_hd__nor2_2 _395_ (.A(_036_),
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
 sky130_fd_sc_hd__or3b_2 _397_ (.A(\counter[4] ),
    .B(_050_),
    .C_N(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_158_));
 sky130_fd_sc_hd__nor2_2 _398_ (.A(single_ended_reg),
    .B(_158_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_159_));
 sky130_fd_sc_hd__a31o_2 _399_ (.A1(\counter[6] ),
    .A2(_049_),
    .A3(_082_),
    .B1(_159_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_160_));
 sky130_fd_sc_hd__and2_2 _400_ (.A(\result[4] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_161_));
 sky130_fd_sc_hd__mux2_1 _401_ (.A0(_161_),
    .A1(comp_p),
    .S(_160_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_022_));
 sky130_fd_sc_hd__and4bb_2 _402_ (.A_N(single_ended_reg),
    .B_N(\counter[1] ),
    .C(_049_),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_162_));
 sky130_fd_sc_hd__a31o_2 _403_ (.A1(\counter[3] ),
    .A2(_049_),
    .A3(_076_),
    .B1(_162_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_163_));
 sky130_fd_sc_hd__and2_2 _404_ (.A(\result[1] ),
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
 sky130_fd_sc_hd__and4bb_2 _406_ (.A_N(single_ended_reg),
    .B_N(\counter[5] ),
    .C(_049_),
    .D(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_165_));
 sky130_fd_sc_hd__a31o_2 _407_ (.A1(\counter[7] ),
    .A2(_049_),
    .A3(_084_),
    .B1(_165_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_166_));
 sky130_fd_sc_hd__mux2_1 _408_ (.A0(\result[5] ),
    .A1(comp_p),
    .S(_166_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_167_));
 sky130_fd_sc_hd__and2_2 _409_ (.A(_106_),
    .B(_167_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_024_));
 sky130_fd_sc_hd__mux2_1 _410_ (.A0(_137_),
    .A1(_158_),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_168_));
 sky130_fd_sc_hd__nor2_2 _411_ (.A(_039_),
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
 sky130_fd_sc_hd__dfrtp_2 _413_ (.CLK(clk),
    .D(_001_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[6] ));
 sky130_fd_sc_hd__dfrtp_2 _414_ (.CLK(clk),
    .D(_002_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[2] ));
 sky130_fd_sc_hd__dfrtp_2 _415_ (.CLK(clk),
    .D(_003_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[11] ));
 sky130_fd_sc_hd__dfrtp_2 _416_ (.CLK(clk),
    .D(_004_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[10] ));
 sky130_fd_sc_hd__dfrtp_2 _417_ (.CLK(clk),
    .D(_005_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[9] ));
 sky130_fd_sc_hd__dfrtp_2 _418_ (.CLK(clk),
    .D(_006_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[8] ));
 sky130_fd_sc_hd__dfrtp_2 _419_ (.CLK(clk),
    .D(_007_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[0] ));
 sky130_fd_sc_hd__dfrtp_2 _420_ (.CLK(clk),
    .D(_008_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[0] ));
 sky130_fd_sc_hd__dfrtp_2 _421_ (.CLK(clk),
    .D(_009_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[1] ));
 sky130_fd_sc_hd__dfrtp_2 _422_ (.CLK(clk),
    .D(_010_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[2] ));
 sky130_fd_sc_hd__dfrtp_2 _423_ (.CLK(clk),
    .D(_011_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[3] ));
 sky130_fd_sc_hd__dfrtp_2 _424_ (.CLK(clk),
    .D(_012_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[4] ));
 sky130_fd_sc_hd__dfrtp_2 _425_ (.CLK(clk),
    .D(_013_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[5] ));
 sky130_fd_sc_hd__dfrtp_2 _426_ (.CLK(clk),
    .D(_014_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[6] ));
 sky130_fd_sc_hd__dfrtp_2 _427_ (.CLK(clk),
    .D(_015_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[7] ));
 sky130_fd_sc_hd__dfrtp_2 _428_ (.CLK(clk),
    .D(_016_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[8] ));
 sky130_fd_sc_hd__dfrtp_2 _429_ (.CLK(clk),
    .D(_017_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[9] ));
 sky130_fd_sc_hd__dfrtp_2 _430_ (.CLK(clk),
    .D(_018_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[10] ));
 sky130_fd_sc_hd__dfrtp_2 _431_ (.CLK(clk),
    .D(_019_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[11] ));
 sky130_fd_sc_hd__dfrtp_2 _432_ (.CLK(clk),
    .D(_000_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(counter_sample));
 sky130_fd_sc_hd__dfrtp_2 _433_ (.CLK(clk),
    .D(_170_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _434_ (.CLK(clk),
    .D(_171_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _435_ (.CLK(clk),
    .D(_020_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(single_ended_reg));
 sky130_fd_sc_hd__dfrtp_2 _436_ (.CLK(clk),
    .D(_021_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[7] ));
 sky130_fd_sc_hd__dfrtp_2 _437_ (.CLK(clk),
    .D(_022_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[4] ));
 sky130_fd_sc_hd__dfrtp_2 _438_ (.CLK(clk),
    .D(_023_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[1] ));
 sky130_fd_sc_hd__dfrtp_2 _439_ (.CLK(clk),
    .D(_024_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[5] ));
 sky130_fd_sc_hd__dfrtp_2 _440_ (.CLK(clk),
    .D(_025_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[3] ));
endmodule
