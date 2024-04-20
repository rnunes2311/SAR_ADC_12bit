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
 wire _172_;
 wire _173_;
 wire _174_;
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

 sky130_fd_sc_hd__inv_2 _175_ (.A(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _176_ (.A(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _177_ (.A(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _178_ (.A(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _179_ (.A(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_030_));
 sky130_fd_sc_hd__inv_2 _180_ (.A(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_031_));
 sky130_fd_sc_hd__inv_2 _181_ (.A(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _182_ (.A(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_033_));
 sky130_fd_sc_hd__inv_2 _183_ (.A(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _184_ (.A(\result[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_035_));
 sky130_fd_sc_hd__inv_2 _185_ (.A(\result[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _186_ (.A(\result[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_037_));
 sky130_fd_sc_hd__inv_2 _187_ (.A(\result[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _188_ (.A(\result[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_039_));
 sky130_fd_sc_hd__inv_2 _189_ (.A(\result[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_040_));
 sky130_fd_sc_hd__inv_2 _190_ (.A(\result[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_041_));
 sky130_fd_sc_hd__inv_2 _191_ (.A(\result[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_042_));
 sky130_fd_sc_hd__inv_2 _192_ (.A(\result[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _193_ (.A(\result[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _194_ (.A(vcm_o_i[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _195_ (.A(debug_mux[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _196_ (.A(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _197_ (.A(debug_mux[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_048_));
 sky130_fd_sc_hd__inv_2 _198_ (.A(en_offset_cal),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_049_));
 sky130_fd_sc_hd__inv_2 _199_ (.A(en_vcm_sw_o_i),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_050_));
 sky130_fd_sc_hd__mux2_1 _200_ (.A0(\result[6] ),
    .A1(\result[0] ),
    .S(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_051_));
 sky130_fd_sc_hd__inv_2 _201_ (.A(_051_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(data[0]));
 sky130_fd_sc_hd__mux2_1 _202_ (.A0(\result[7] ),
    .A1(\result[1] ),
    .S(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_052_));
 sky130_fd_sc_hd__inv_2 _203_ (.A(_052_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(data[1]));
 sky130_fd_sc_hd__mux2_1 _204_ (.A0(\result[8] ),
    .A1(\result[2] ),
    .S(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_053_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(_053_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(data[2]));
 sky130_fd_sc_hd__mux2_1 _206_ (.A0(\result[9] ),
    .A1(\result[3] ),
    .S(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_054_));
 sky130_fd_sc_hd__inv_2 _207_ (.A(_054_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(data[3]));
 sky130_fd_sc_hd__mux2_1 _208_ (.A0(\result[10] ),
    .A1(\result[4] ),
    .S(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_055_));
 sky130_fd_sc_hd__inv_2 _209_ (.A(_055_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(data[4]));
 sky130_fd_sc_hd__or2_2 _210_ (.A(single_ended_reg),
    .B(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_056_));
 sky130_fd_sc_hd__a2bb2o_2 _211_ (.A1_N(\result[11] ),
    .A2_N(_056_),
    .B1(\counter[4] ),
    .B2(_044_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(data[5]));
 sky130_fd_sc_hd__and2b_2 _212_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_057_));
 sky130_fd_sc_hd__nand2b_2 _213_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_058_));
 sky130_fd_sc_hd__or3_2 _214_ (.A(vin_n_sw_on),
    .B(vin_p_sw_on),
    .C(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_059_));
 sky130_fd_sc_hd__inv_2 _215_ (.A(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_dummy_o));
 sky130_fd_sc_hd__and2_2 _216_ (.A(single_ended_reg),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_060_));
 sky130_fd_sc_hd__nand2_2 _217_ (.A(single_ended_reg),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_061_));
 sky130_fd_sc_hd__or3b_2 _218_ (.A(single_ended_reg),
    .B(vcm_o_i[0]),
    .C_N(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_062_));
 sky130_fd_sc_hd__o21ai_2 _219_ (.A1(\result[1] ),
    .A2(_062_),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[0]));
 sky130_fd_sc_hd__and3_2 _220_ (.A(_028_),
    .B(\counter[2] ),
    .C(_045_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_063_));
 sky130_fd_sc_hd__a21o_2 _221_ (.A1(_038_),
    .A2(_063_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[1]));
 sky130_fd_sc_hd__nor3_2 _222_ (.A(single_ended_reg),
    .B(_030_),
    .C(vcm_o_i[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_064_));
 sky130_fd_sc_hd__a21o_2 _223_ (.A1(_040_),
    .A2(_064_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[2]));
 sky130_fd_sc_hd__or3_2 _224_ (.A(single_ended_reg),
    .B(_034_),
    .C(vcm_o_i[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_065_));
 sky130_fd_sc_hd__o21ai_2 _225_ (.A1(\result[4] ),
    .A2(_065_),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[3]));
 sky130_fd_sc_hd__o32a_2 _226_ (.A1(single_ended_reg),
    .A2(_029_),
    .A3(vcm_o_i[4]),
    .B1(_061_),
    .B2(_027_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_066_));
 sky130_fd_sc_hd__o21ai_2 _227_ (.A1(\result[5] ),
    .A2(_066_),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[4]));
 sky130_fd_sc_hd__and3b_2 _228_ (.A_N(vcm_o_i[5]),
    .B(\counter[6] ),
    .C(_028_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_067_));
 sky130_fd_sc_hd__a21o_2 _229_ (.A1(_035_),
    .A2(_067_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[5]));
 sky130_fd_sc_hd__and3b_2 _230_ (.A_N(vcm_o_i[6]),
    .B(\counter[7] ),
    .C(_028_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_068_));
 sky130_fd_sc_hd__a21o_2 _231_ (.A1(_037_),
    .A2(_068_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[6]));
 sky130_fd_sc_hd__nor3_2 _232_ (.A(single_ended_reg),
    .B(_033_),
    .C(vcm_o_i[7]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_069_));
 sky130_fd_sc_hd__a21o_2 _233_ (.A1(_039_),
    .A2(_069_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[7]));
 sky130_fd_sc_hd__nand2b_2 _234_ (.A_N(single_ended_reg),
    .B(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_070_));
 sky130_fd_sc_hd__nor2_2 _235_ (.A(vcm_o_i[8]),
    .B(_070_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_071_));
 sky130_fd_sc_hd__a21o_2 _236_ (.A1(_041_),
    .A2(_071_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[8]));
 sky130_fd_sc_hd__nand2b_2 _237_ (.A_N(single_ended_reg),
    .B(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_072_));
 sky130_fd_sc_hd__nor2_2 _238_ (.A(vcm_o_i[9]),
    .B(_072_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_073_));
 sky130_fd_sc_hd__a21o_2 _239_ (.A1(_043_),
    .A2(_073_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vss_n_o[9]));
 sky130_fd_sc_hd__nand2_2 _240_ (.A(_028_),
    .B(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_074_));
 sky130_fd_sc_hd__o31ai_2 _241_ (.A1(\result[11] ),
    .A2(vcm_o_i[10]),
    .A3(_074_),
    .B1(_061_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_n_o[10]));
 sky130_fd_sc_hd__or2_2 _242_ (.A(_036_),
    .B(_062_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[0]));
 sky130_fd_sc_hd__nand2_2 _243_ (.A(single_ended_reg),
    .B(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_075_));
 sky130_fd_sc_hd__o21a_2 _244_ (.A1(_059_),
    .A2(_075_),
    .B1(_062_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_076_));
 sky130_fd_sc_hd__nor2_2 _245_ (.A(\result[0] ),
    .B(_076_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_077_));
 sky130_fd_sc_hd__o21ai_2 _246_ (.A1(_061_),
    .A2(_077_),
    .B1(vref_z_n_o[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[0]));
 sky130_fd_sc_hd__nand2_2 _247_ (.A(\result[2] ),
    .B(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[1]));
 sky130_fd_sc_hd__a21oi_2 _248_ (.A1(\counter[3] ),
    .A2(_060_),
    .B1(_063_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_078_));
 sky130_fd_sc_hd__nor2_2 _249_ (.A(\result[1] ),
    .B(_078_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_079_));
 sky130_fd_sc_hd__o21ai_2 _250_ (.A1(_061_),
    .A2(_079_),
    .B1(vref_z_n_o[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[1]));
 sky130_fd_sc_hd__nand2_2 _251_ (.A(\result[3] ),
    .B(_064_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[2]));
 sky130_fd_sc_hd__a21oi_2 _252_ (.A1(\counter[4] ),
    .A2(_060_),
    .B1(_064_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_080_));
 sky130_fd_sc_hd__nor2_2 _253_ (.A(\result[2] ),
    .B(_080_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_081_));
 sky130_fd_sc_hd__o21ai_2 _254_ (.A1(_061_),
    .A2(_081_),
    .B1(vref_z_n_o[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[2]));
 sky130_fd_sc_hd__or2_2 _255_ (.A(_042_),
    .B(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[3]));
 sky130_fd_sc_hd__nand2_2 _256_ (.A(single_ended_reg),
    .B(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_082_));
 sky130_fd_sc_hd__o21a_2 _257_ (.A1(_059_),
    .A2(_082_),
    .B1(_065_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_083_));
 sky130_fd_sc_hd__nor2_2 _258_ (.A(\result[3] ),
    .B(_083_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_084_));
 sky130_fd_sc_hd__o21ai_2 _259_ (.A1(_061_),
    .A2(_084_),
    .B1(vref_z_n_o[3]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[3]));
 sky130_fd_sc_hd__or4_2 _260_ (.A(single_ended_reg),
    .B(_029_),
    .C(_044_),
    .D(vcm_o_i[4]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[4]));
 sky130_fd_sc_hd__o21ai_2 _261_ (.A1(\result[4] ),
    .A2(_066_),
    .B1(_060_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_085_));
 sky130_fd_sc_hd__nand2_2 _262_ (.A(vref_z_n_o[4]),
    .B(_085_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[4]));
 sky130_fd_sc_hd__nand2_2 _263_ (.A(\result[6] ),
    .B(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[5]));
 sky130_fd_sc_hd__a21oi_2 _264_ (.A1(\counter[7] ),
    .A2(_060_),
    .B1(_067_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_086_));
 sky130_fd_sc_hd__nor2_2 _265_ (.A(\result[5] ),
    .B(_086_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_087_));
 sky130_fd_sc_hd__o21ai_2 _266_ (.A1(_061_),
    .A2(_087_),
    .B1(vref_z_n_o[5]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[5]));
 sky130_fd_sc_hd__nand2_2 _267_ (.A(\result[7] ),
    .B(_068_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[6]));
 sky130_fd_sc_hd__a21oi_2 _268_ (.A1(\counter[8] ),
    .A2(_060_),
    .B1(_068_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_088_));
 sky130_fd_sc_hd__nor2_2 _269_ (.A(\result[6] ),
    .B(_088_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_089_));
 sky130_fd_sc_hd__o21ai_2 _270_ (.A1(_061_),
    .A2(_089_),
    .B1(vref_z_n_o[6]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[6]));
 sky130_fd_sc_hd__nand2_2 _271_ (.A(\result[8] ),
    .B(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[7]));
 sky130_fd_sc_hd__a21oi_2 _272_ (.A1(\counter[9] ),
    .A2(_060_),
    .B1(_069_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_090_));
 sky130_fd_sc_hd__nor2_2 _273_ (.A(\result[7] ),
    .B(_090_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_091_));
 sky130_fd_sc_hd__o21ai_2 _274_ (.A1(_061_),
    .A2(_091_),
    .B1(vref_z_n_o[7]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[7]));
 sky130_fd_sc_hd__nand2_2 _275_ (.A(\result[9] ),
    .B(_071_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[8]));
 sky130_fd_sc_hd__a21oi_2 _276_ (.A1(\counter[10] ),
    .A2(_060_),
    .B1(_071_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_092_));
 sky130_fd_sc_hd__nor2_2 _277_ (.A(\result[8] ),
    .B(_092_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_093_));
 sky130_fd_sc_hd__o21ai_2 _278_ (.A1(_061_),
    .A2(_093_),
    .B1(vref_z_n_o[8]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[8]));
 sky130_fd_sc_hd__nand2_2 _279_ (.A(\result[10] ),
    .B(_073_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_n_o[9]));
 sky130_fd_sc_hd__a21oi_2 _280_ (.A1(\counter[11] ),
    .A2(_060_),
    .B1(_073_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_094_));
 sky130_fd_sc_hd__nor2_2 _281_ (.A(\result[9] ),
    .B(_094_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_095_));
 sky130_fd_sc_hd__o21ai_2 _282_ (.A1(_061_),
    .A2(_095_),
    .B1(vref_z_n_o[9]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[9]));
 sky130_fd_sc_hd__or3b_2 _283_ (.A(vcm_o_i[10]),
    .B(_074_),
    .C_N(\result[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_n_o[10]));
 sky130_fd_sc_hd__o21ai_2 _284_ (.A1(_043_),
    .A2(_061_),
    .B1(vref_z_n_o[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vss_p_o[10]));
 sky130_fd_sc_hd__mux2_1 _285_ (.A0(\result[1] ),
    .A1(\result[0] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_096_));
 sky130_fd_sc_hd__or2_2 _286_ (.A(_076_),
    .B(_096_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[0]));
 sky130_fd_sc_hd__mux2_1 _287_ (.A0(\result[2] ),
    .A1(\result[1] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_097_));
 sky130_fd_sc_hd__or2_2 _288_ (.A(_078_),
    .B(_097_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[1]));
 sky130_fd_sc_hd__mux2_1 _289_ (.A0(\result[3] ),
    .A1(\result[2] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_098_));
 sky130_fd_sc_hd__or2_2 _290_ (.A(_080_),
    .B(_098_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[2]));
 sky130_fd_sc_hd__mux2_1 _291_ (.A0(\result[4] ),
    .A1(\result[3] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_099_));
 sky130_fd_sc_hd__or2_2 _292_ (.A(_083_),
    .B(_099_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[3]));
 sky130_fd_sc_hd__mux2_1 _293_ (.A0(\result[5] ),
    .A1(\result[4] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_100_));
 sky130_fd_sc_hd__or2_2 _294_ (.A(_066_),
    .B(_100_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[4]));
 sky130_fd_sc_hd__mux2_1 _295_ (.A0(\result[6] ),
    .A1(\result[5] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_101_));
 sky130_fd_sc_hd__or2_2 _296_ (.A(_086_),
    .B(_101_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[5]));
 sky130_fd_sc_hd__mux2_1 _297_ (.A0(\result[7] ),
    .A1(\result[6] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_102_));
 sky130_fd_sc_hd__or2_2 _298_ (.A(_088_),
    .B(_102_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[6]));
 sky130_fd_sc_hd__mux2_1 _299_ (.A0(\result[8] ),
    .A1(\result[7] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_103_));
 sky130_fd_sc_hd__or2_2 _300_ (.A(_090_),
    .B(_103_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[7]));
 sky130_fd_sc_hd__mux2_1 _301_ (.A0(\result[9] ),
    .A1(\result[8] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_104_));
 sky130_fd_sc_hd__or2_2 _302_ (.A(_092_),
    .B(_104_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[8]));
 sky130_fd_sc_hd__mux2_1 _303_ (.A0(\result[10] ),
    .A1(\result[9] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_105_));
 sky130_fd_sc_hd__or2_2 _304_ (.A(_094_),
    .B(_105_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(vref_z_p_o[9]));
 sky130_fd_sc_hd__o21ai_2 _305_ (.A1(_028_),
    .A2(_043_),
    .B1(vss_n_o[10]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vref_z_p_o[10]));
 sky130_fd_sc_hd__nand2_2 _306_ (.A(_028_),
    .B(vcm_dummy_o),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_106_));
 sky130_fd_sc_hd__nor2_2 _307_ (.A(\counter[1] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[0]));
 sky130_fd_sc_hd__nor2_2 _308_ (.A(\counter[2] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[1]));
 sky130_fd_sc_hd__nor2_2 _309_ (.A(\counter[3] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[2]));
 sky130_fd_sc_hd__nor2_2 _310_ (.A(_056_),
    .B(_059_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[3]));
 sky130_fd_sc_hd__nor2_2 _311_ (.A(\counter[5] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[4]));
 sky130_fd_sc_hd__nor2_2 _312_ (.A(\counter[6] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[5]));
 sky130_fd_sc_hd__nor2_2 _313_ (.A(\counter[7] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[6]));
 sky130_fd_sc_hd__nor2_2 _314_ (.A(\counter[8] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[7]));
 sky130_fd_sc_hd__nor2_2 _315_ (.A(\counter[9] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[8]));
 sky130_fd_sc_hd__nor2_2 _316_ (.A(\counter[10] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[9]));
 sky130_fd_sc_hd__nor2_2 _317_ (.A(\counter[11] ),
    .B(_106_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(vcm_o[10]));
 sky130_fd_sc_hd__and2b_2 _318_ (.A_N(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_107_));
 sky130_fd_sc_hd__nand2b_2 _319_ (.A_N(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_108_));
 sky130_fd_sc_hd__nor2_2 _320_ (.A(counter_sample),
    .B(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_000_));
 sky130_fd_sc_hd__and3_2 _321_ (.A(\counter[4] ),
    .B(_046_),
    .C(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_109_));
 sky130_fd_sc_hd__and3_2 _322_ (.A(\counter[0] ),
    .B(debug_mux[1]),
    .C(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_110_));
 sky130_fd_sc_hd__and2_2 _323_ (.A(\counter[2] ),
    .B(debug_mux[1]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_111_));
 sky130_fd_sc_hd__nor2_2 _324_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_112_));
 sky130_fd_sc_hd__a22o_2 _325_ (.A1(_047_),
    .A2(_111_),
    .B1(_112_),
    .B2(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_113_));
 sky130_fd_sc_hd__or4b_2 _326_ (.A(_109_),
    .B(_110_),
    .C(_113_),
    .D_N(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_114_));
 sky130_fd_sc_hd__and2_2 _327_ (.A(\counter[10] ),
    .B(_112_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_115_));
 sky130_fd_sc_hd__a31o_2 _328_ (.A1(\counter[9] ),
    .A2(_046_),
    .A3(debug_mux[0]),
    .B1(_115_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_116_));
 sky130_fd_sc_hd__a31o_2 _329_ (.A1(\counter[8] ),
    .A2(debug_mux[1]),
    .A3(_047_),
    .B1(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_117_));
 sky130_fd_sc_hd__a31o_2 _330_ (.A1(\counter[7] ),
    .A2(debug_mux[1]),
    .A3(debug_mux[0]),
    .B1(_117_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_118_));
 sky130_fd_sc_hd__o211a_2 _331_ (.A1(_116_),
    .A2(_118_),
    .B1(debug_mux[3]),
    .C1(_114_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_119_));
 sky130_fd_sc_hd__mux2_1 _332_ (.A0(\counter[0] ),
    .A1(\counter[1] ),
    .S(single_ended_reg),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_120_));
 sky130_fd_sc_hd__a211oi_2 _333_ (.A1(_049_),
    .A2(_120_),
    .B1(_058_),
    .C1(clk),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(en_comp));
 sky130_fd_sc_hd__nor2_2 _334_ (.A(debug_mux[3]),
    .B(debug_mux[2]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_121_));
 sky130_fd_sc_hd__and4_2 _335_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .C(en_comp),
    .D(_121_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_122_));
 sky130_fd_sc_hd__and3_2 _336_ (.A(\counter[11] ),
    .B(debug_mux[1]),
    .C(debug_mux[0]),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_123_));
 sky130_fd_sc_hd__a221o_2 _337_ (.A1(comp_p),
    .A2(_046_),
    .B1(_047_),
    .B2(comp_n),
    .C1(_123_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_124_));
 sky130_fd_sc_hd__nand2_2 _338_ (.A(debug_mux[0]),
    .B(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_125_));
 sky130_fd_sc_hd__o211a_2 _339_ (.A1(_046_),
    .A2(_057_),
    .B1(_121_),
    .C1(_125_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_126_));
 sky130_fd_sc_hd__nand2_2 _340_ (.A(_112_),
    .B(_121_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_127_));
 sky130_fd_sc_hd__a31o_2 _341_ (.A1(_048_),
    .A2(debug_mux[2]),
    .A3(_124_),
    .B1(_126_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_128_));
 sky130_fd_sc_hd__nor2_2 _342_ (.A(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_129_));
 sky130_fd_sc_hd__o32a_2 _343_ (.A1(_119_),
    .A2(_122_),
    .A3(_128_),
    .B1(_129_),
    .B2(_127_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(debug_out));
 sky130_fd_sc_hd__a21o_2 _344_ (.A1(start),
    .A2(_129_),
    .B1(_000_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_173_));
 sky130_fd_sc_hd__and4_2 _345_ (.A(\counter[1] ),
    .B(\counter[3] ),
    .C(\counter[11] ),
    .D(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_130_));
 sky130_fd_sc_hd__and4_2 _346_ (.A(\counter[7] ),
    .B(\counter[6] ),
    .C(\counter[5] ),
    .D(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_131_));
 sky130_fd_sc_hd__and3_2 _347_ (.A(\counter[9] ),
    .B(\counter[8] ),
    .C(\counter[4] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_132_));
 sky130_fd_sc_hd__xor2_2 _348_ (.A(single_ended_reg),
    .B(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_133_));
 sky130_fd_sc_hd__and4_2 _349_ (.A(_130_),
    .B(_131_),
    .C(_132_),
    .D(_133_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_134_));
 sky130_fd_sc_hd__a2bb2o_2 _350_ (.A1_N(_058_),
    .A2_N(_134_),
    .B1(_107_),
    .B2(counter_sample),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_174_));
 sky130_fd_sc_hd__nor2_2 _351_ (.A(_029_),
    .B(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(clk_data));
 sky130_fd_sc_hd__a211oi_2 _352_ (.A1(\state[1] ),
    .A2(_050_),
    .B1(_129_),
    .C1(\counter[11] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(sample_o));
 sky130_fd_sc_hd__and2_2 _353_ (.A(en_offset_cal),
    .B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_offset_cal_o));
 sky130_fd_sc_hd__and2_2 _354_ (.A(en_offset_cal),
    .B(_120_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(offset_cal_cycle));
 sky130_fd_sc_hd__nor2_2 _355_ (.A(_057_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_135_));
 sky130_fd_sc_hd__a21o_2 _356_ (.A1(_057_),
    .A2(_120_),
    .B1(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(en_vcm_sw_o));
 sky130_fd_sc_hd__and2_2 _357_ (.A(comp_p),
    .B(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_136_));
 sky130_fd_sc_hd__nand2_2 _358_ (.A(_057_),
    .B(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_137_));
 sky130_fd_sc_hd__and3_2 _359_ (.A(_057_),
    .B(_074_),
    .C(_136_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_138_));
 sky130_fd_sc_hd__a32o_2 _360_ (.A1(\result[11] ),
    .A2(_108_),
    .A3(_137_),
    .B1(_138_),
    .B2(_028_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_001_));
 sky130_fd_sc_hd__nand2_2 _361_ (.A(single_ended_reg),
    .B(_031_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_139_));
 sky130_fd_sc_hd__or2_2 _362_ (.A(\counter[10] ),
    .B(_074_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_140_));
 sky130_fd_sc_hd__a31o_2 _363_ (.A1(_057_),
    .A2(_139_),
    .A3(_140_),
    .B1(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_141_));
 sky130_fd_sc_hd__mux2_1 _364_ (.A0(_136_),
    .A1(\result[10] ),
    .S(_141_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_002_));
 sky130_fd_sc_hd__or3_2 _365_ (.A(_028_),
    .B(_031_),
    .C(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_142_));
 sky130_fd_sc_hd__o32a_2 _366_ (.A1(\counter[9] ),
    .A2(_058_),
    .A3(_072_),
    .B1(_142_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_143_));
 sky130_fd_sc_hd__nor2_2 _367_ (.A(_041_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_144_));
 sky130_fd_sc_hd__mux2_1 _368_ (.A0(comp_p),
    .A1(_144_),
    .S(_143_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_003_));
 sky130_fd_sc_hd__nand3_2 _369_ (.A(single_ended_reg),
    .B(\counter[10] ),
    .C(_057_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_145_));
 sky130_fd_sc_hd__o32a_2 _370_ (.A1(\counter[8] ),
    .A2(_058_),
    .A3(_070_),
    .B1(_145_),
    .B2(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_146_));
 sky130_fd_sc_hd__nor2_2 _371_ (.A(_039_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_147_));
 sky130_fd_sc_hd__mux2_1 _372_ (.A0(comp_p),
    .A1(_147_),
    .S(_146_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_004_));
 sky130_fd_sc_hd__nand2b_2 _373_ (.A_N(\counter[0] ),
    .B(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_148_));
 sky130_fd_sc_hd__a221o_2 _374_ (.A1(single_ended_reg),
    .A2(\counter[1] ),
    .B1(_075_),
    .B2(_148_),
    .C1(_058_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_149_));
 sky130_fd_sc_hd__and2_2 _375_ (.A(\result[0] ),
    .B(_108_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_150_));
 sky130_fd_sc_hd__mux2_1 _376_ (.A0(_136_),
    .A1(_150_),
    .S(_149_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_005_));
 sky130_fd_sc_hd__and2_2 _377_ (.A(\state[1] ),
    .B(\state[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_151_));
 sky130_fd_sc_hd__a22o_2 _378_ (.A1(\counter[1] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[0] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_006_));
 sky130_fd_sc_hd__a22o_2 _379_ (.A1(\counter[2] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[1] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_007_));
 sky130_fd_sc_hd__a22o_2 _380_ (.A1(\counter[3] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_008_));
 sky130_fd_sc_hd__a22o_2 _381_ (.A1(\counter[4] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[3] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_009_));
 sky130_fd_sc_hd__a21o_2 _382_ (.A1(\counter[4] ),
    .A2(_151_),
    .B1(clk_data),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_010_));
 sky130_fd_sc_hd__a22o_2 _383_ (.A1(\counter[6] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_011_));
 sky130_fd_sc_hd__a22o_2 _384_ (.A1(\counter[7] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[6] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_012_));
 sky130_fd_sc_hd__a22o_2 _385_ (.A1(\counter[8] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_013_));
 sky130_fd_sc_hd__a22o_2 _386_ (.A1(\counter[9] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_014_));
 sky130_fd_sc_hd__a22o_2 _387_ (.A1(\counter[10] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[9] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_015_));
 sky130_fd_sc_hd__a22o_2 _388_ (.A1(\counter[11] ),
    .A2(_057_),
    .B1(_151_),
    .B2(\counter[10] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_016_));
 sky130_fd_sc_hd__a21o_2 _389_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_057_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_017_));
 sky130_fd_sc_hd__and4bb_2 _390_ (.A_N(single_ended_reg),
    .B_N(\counter[2] ),
    .C(\counter[3] ),
    .D(_057_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_152_));
 sky130_fd_sc_hd__a41o_2 _391_ (.A1(single_ended_reg),
    .A2(_030_),
    .A3(\counter[4] ),
    .A4(_057_),
    .B1(_152_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_153_));
 sky130_fd_sc_hd__nor2_2 _392_ (.A(_038_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_154_));
 sky130_fd_sc_hd__mux2_1 _393_ (.A0(_154_),
    .A1(comp_p),
    .S(_153_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_018_));
 sky130_fd_sc_hd__or3_2 _394_ (.A(_028_),
    .B(_032_),
    .C(\counter[8] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_155_));
 sky130_fd_sc_hd__or3_2 _395_ (.A(\counter[7] ),
    .B(single_ended_reg),
    .C(_033_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_156_));
 sky130_fd_sc_hd__a31o_2 _396_ (.A1(_108_),
    .A2(_155_),
    .A3(_156_),
    .B1(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_157_));
 sky130_fd_sc_hd__mux2_1 _397_ (.A0(_136_),
    .A1(\result[7] ),
    .S(_157_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_019_));
 sky130_fd_sc_hd__a21oi_2 _398_ (.A1(\counter[6] ),
    .A2(single_ended_reg),
    .B1(\counter[5] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_158_));
 sky130_fd_sc_hd__a211o_2 _399_ (.A1(\counter[5] ),
    .A2(_056_),
    .B1(_058_),
    .C1(_158_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_159_));
 sky130_fd_sc_hd__nor2_2 _400_ (.A(_042_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_160_));
 sky130_fd_sc_hd__mux2_1 _401_ (.A0(comp_p),
    .A1(_160_),
    .S(_159_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_020_));
 sky130_fd_sc_hd__mux2_1 _402_ (.A0(single_ended_reg),
    .A1(single_ended),
    .S(_129_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_021_));
 sky130_fd_sc_hd__or3_2 _403_ (.A(_028_),
    .B(\counter[2] ),
    .C(_030_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_161_));
 sky130_fd_sc_hd__or3b_2 _404_ (.A(single_ended_reg),
    .B(\counter[1] ),
    .C_N(\counter[2] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_162_));
 sky130_fd_sc_hd__a31o_2 _405_ (.A1(_057_),
    .A2(_161_),
    .A3(_162_),
    .B1(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_163_));
 sky130_fd_sc_hd__mux2_1 _406_ (.A0(_136_),
    .A1(\result[1] ),
    .S(_163_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_022_));
 sky130_fd_sc_hd__and4_2 _407_ (.A(\counter[7] ),
    .B(_027_),
    .C(single_ended_reg),
    .D(_057_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_164_));
 sky130_fd_sc_hd__a41o_2 _408_ (.A1(\counter[6] ),
    .A2(_028_),
    .A3(_029_),
    .A4(_057_),
    .B1(_164_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_165_));
 sky130_fd_sc_hd__nor2_2 _409_ (.A(_044_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_166_));
 sky130_fd_sc_hd__mux2_1 _410_ (.A0(_166_),
    .A1(comp_p),
    .S(_165_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_023_));
 sky130_fd_sc_hd__or2_2 _411_ (.A(\counter[4] ),
    .B(_082_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_167_));
 sky130_fd_sc_hd__or3_2 _412_ (.A(single_ended_reg),
    .B(\counter[3] ),
    .C(_034_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_168_));
 sky130_fd_sc_hd__a31o_2 _413_ (.A1(_057_),
    .A2(_167_),
    .A3(_168_),
    .B1(_135_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_169_));
 sky130_fd_sc_hd__mux2_1 _414_ (.A0(_136_),
    .A1(\result[3] ),
    .S(_169_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_024_));
 sky130_fd_sc_hd__and4bb_2 _415_ (.A_N(\counter[6] ),
    .B_N(single_ended_reg),
    .C(_057_),
    .D(\counter[7] ),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_170_));
 sky130_fd_sc_hd__a41o_2 _416_ (.A1(_026_),
    .A2(single_ended_reg),
    .A3(\counter[8] ),
    .A4(_057_),
    .B1(_170_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_171_));
 sky130_fd_sc_hd__nor2_2 _417_ (.A(_035_),
    .B(_107_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Y(_172_));
 sky130_fd_sc_hd__mux2_1 _418_ (.A0(_172_),
    .A1(comp_p),
    .S(_171_),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .X(_025_));
 sky130_fd_sc_hd__dfrtp_2 _419_ (.CLK(clk),
    .D(_001_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[11] ));
 sky130_fd_sc_hd__dfrtp_2 _420_ (.CLK(clk),
    .D(_002_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[10] ));
 sky130_fd_sc_hd__dfrtp_2 _421_ (.CLK(clk),
    .D(_003_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[9] ));
 sky130_fd_sc_hd__dfrtp_2 _422_ (.CLK(clk),
    .D(_004_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[8] ));
 sky130_fd_sc_hd__dfrtp_2 _423_ (.CLK(clk),
    .D(_005_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[0] ));
 sky130_fd_sc_hd__dfrtp_2 _424_ (.CLK(clk),
    .D(_006_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[0] ));
 sky130_fd_sc_hd__dfrtp_2 _425_ (.CLK(clk),
    .D(_007_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[1] ));
 sky130_fd_sc_hd__dfrtp_2 _426_ (.CLK(clk),
    .D(_008_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[2] ));
 sky130_fd_sc_hd__dfrtp_2 _427_ (.CLK(clk),
    .D(_009_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[3] ));
 sky130_fd_sc_hd__dfrtp_2 _428_ (.CLK(clk),
    .D(_010_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[4] ));
 sky130_fd_sc_hd__dfrtp_2 _429_ (.CLK(clk),
    .D(_011_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[5] ));
 sky130_fd_sc_hd__dfrtp_2 _430_ (.CLK(clk),
    .D(_012_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[6] ));
 sky130_fd_sc_hd__dfrtp_2 _431_ (.CLK(clk),
    .D(_013_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[7] ));
 sky130_fd_sc_hd__dfrtp_2 _432_ (.CLK(clk),
    .D(_014_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[8] ));
 sky130_fd_sc_hd__dfrtp_2 _433_ (.CLK(clk),
    .D(_015_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[9] ));
 sky130_fd_sc_hd__dfrtp_2 _434_ (.CLK(clk),
    .D(_016_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[10] ));
 sky130_fd_sc_hd__dfrtp_2 _435_ (.CLK(clk),
    .D(_017_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\counter[11] ));
 sky130_fd_sc_hd__dfrtp_2 _436_ (.CLK(clk),
    .D(_000_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(counter_sample));
 sky130_fd_sc_hd__dfrtp_2 _437_ (.CLK(clk),
    .D(_173_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _438_ (.CLK(clk),
    .D(_174_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _439_ (.CLK(clk),
    .D(_018_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[2] ));
 sky130_fd_sc_hd__dfrtp_2 _440_ (.CLK(clk),
    .D(_019_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[7] ));
 sky130_fd_sc_hd__dfrtp_2 _441_ (.CLK(clk),
    .D(_020_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[4] ));
 sky130_fd_sc_hd__dfrtp_2 _442_ (.CLK(clk),
    .D(_021_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(single_ended_reg));
 sky130_fd_sc_hd__dfrtp_2 _443_ (.CLK(clk),
    .D(_022_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[1] ));
 sky130_fd_sc_hd__dfrtp_2 _444_ (.CLK(clk),
    .D(_023_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[5] ));
 sky130_fd_sc_hd__dfrtp_2 _445_ (.CLK(clk),
    .D(_024_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[3] ));
 sky130_fd_sc_hd__dfrtp_2 _446_ (.CLK(clk),
    .D(_025_),
    .RESET_B(rst_z),
    .VGND(VSS),
    .VNB(VSS),
    .VPB(VDD),
    .VPWR(VDD),
    .Q(\result[6] ));
endmodule
