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

 sky130_fd_sc_hd__inv_2 _087_ (.A(\counter[5] ),
    .Y(_025_));
 sky130_fd_sc_hd__inv_2 _088_ (.A(\counter[4] ),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _089_ (.A(counter_sample),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _090_ (.A(debug_mux[1]),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _091_ (.A(debug_mux[0]),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _092_ (.A(en_vcm_sw_o_i),
    .Y(_030_));
 sky130_fd_sc_hd__nand2b_2 _093_ (.A_N(\state[1] ),
    .B(\state[0] ),
    .Y(_031_));
 sky130_fd_sc_hd__nor2_2 _094_ (.A(counter_sample),
    .B(_031_),
    .Y(_000_));
 sky130_fd_sc_hd__or4_2 _095_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .C(debug_mux[3]),
    .D(debug_mux[2]),
    .X(_032_));
 sky130_fd_sc_hd__nor2_2 _096_ (.A(\state[0] ),
    .B(\state[1] ),
    .Y(_033_));
 sky130_fd_sc_hd__nand2_2 _097_ (.A(debug_mux[1]),
    .B(debug_mux[0]),
    .Y(_034_));
 sky130_fd_sc_hd__mux4_2 _098_ (.A0(\counter[10] ),
    .A1(\counter[9] ),
    .A2(\counter[8] ),
    .A3(\counter[7] ),
    .S0(debug_mux[0]),
    .S1(debug_mux[1]),
    .X(_035_));
 sky130_fd_sc_hd__mux4_2 _099_ (.A0(\counter[6] ),
    .A1(\counter[2] ),
    .A2(\counter[4] ),
    .A3(\counter[0] ),
    .S0(debug_mux[1]),
    .S1(debug_mux[0]),
    .X(_036_));
 sky130_fd_sc_hd__and3b_2 _100_ (.A_N(debug_mux[2]),
    .B(_035_),
    .C(debug_mux[3]),
    .X(_037_));
 sky130_fd_sc_hd__a31o_2 _101_ (.A1(debug_mux[3]),
    .A2(debug_mux[2]),
    .A3(_036_),
    .B1(_037_),
    .X(_038_));
 sky130_fd_sc_hd__and2b_2 _102_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .X(_039_));
 sky130_fd_sc_hd__nand2b_2 _103_ (.A_N(\state[0] ),
    .B(\state[1] ),
    .Y(_040_));
 sky130_fd_sc_hd__or4bb_2 _104_ (.A(\state[0] ),
    .B(debug_mux[0]),
    .C_N(debug_mux[1]),
    .D_N(\state[1] ),
    .X(_041_));
 sky130_fd_sc_hd__o31a_2 _105_ (.A1(debug_mux[1]),
    .A2(_029_),
    .A3(_031_),
    .B1(_041_),
    .X(_042_));
 sky130_fd_sc_hd__and2b_2 _106_ (.A_N(en_offset_cal),
    .B(\counter[0] ),
    .X(_043_));
 sky130_fd_sc_hd__nor3_2 _107_ (.A(clk),
    .B(_040_),
    .C(_043_),
    .Y(en_comp));
 sky130_fd_sc_hd__or4_2 _108_ (.A(clk),
    .B(_034_),
    .C(_040_),
    .D(_043_),
    .X(_044_));
 sky130_fd_sc_hd__a211oi_2 _109_ (.A1(_042_),
    .A2(_044_),
    .B1(debug_mux[3]),
    .C1(debug_mux[2]),
    .Y(_045_));
 sky130_fd_sc_hd__and3_2 _110_ (.A(\counter[11] ),
    .B(debug_mux[1]),
    .C(debug_mux[0]),
    .X(_046_));
 sky130_fd_sc_hd__a221o_2 _111_ (.A1(_029_),
    .A2(comp_n),
    .B1(comp_p),
    .B2(_028_),
    .C1(_046_),
    .X(_047_));
 sky130_fd_sc_hd__and2b_2 _112_ (.A_N(debug_mux[3]),
    .B(debug_mux[2]),
    .X(_048_));
 sky130_fd_sc_hd__a21bo_2 _113_ (.A1(_047_),
    .A2(_048_),
    .B1_N(_032_),
    .X(_049_));
 sky130_fd_sc_hd__o32a_2 _114_ (.A1(_038_),
    .A2(_045_),
    .A3(_049_),
    .B1(_033_),
    .B2(_032_),
    .X(debug_out));
 sky130_fd_sc_hd__a21o_2 _115_ (.A1(start),
    .A2(_033_),
    .B1(_000_),
    .X(_085_));
 sky130_fd_sc_hd__and4_2 _116_ (.A(\counter[10] ),
    .B(\counter[9] ),
    .C(\counter[8] ),
    .D(\counter[7] ),
    .X(_050_));
 sky130_fd_sc_hd__and4_2 _117_ (.A(\counter[4] ),
    .B(\counter[1] ),
    .C(\counter[0] ),
    .D(\counter[11] ),
    .X(_051_));
 sky130_fd_sc_hd__and4_2 _118_ (.A(\counter[6] ),
    .B(\counter[5] ),
    .C(\counter[3] ),
    .D(\counter[2] ),
    .X(_052_));
 sky130_fd_sc_hd__a31o_2 _119_ (.A1(_050_),
    .A2(_051_),
    .A3(_052_),
    .B1(_040_),
    .X(_053_));
 sky130_fd_sc_hd__o21ai_2 _120_ (.A1(_027_),
    .A2(_031_),
    .B1(_053_),
    .Y(_086_));
 sky130_fd_sc_hd__nand2_2 _121_ (.A(\counter[4] ),
    .B(_039_),
    .Y(_054_));
 sky130_fd_sc_hd__mux2_1 _122_ (.A0(\result[0] ),
    .A1(\result[6] ),
    .S(_054_),
    .X(_055_));
 sky130_fd_sc_hd__inv_2 _123_ (.A(_055_),
    .Y(data[0]));
 sky130_fd_sc_hd__mux2_1 _124_ (.A0(\result[1] ),
    .A1(\result[7] ),
    .S(_054_),
    .X(_056_));
 sky130_fd_sc_hd__inv_2 _125_ (.A(_056_),
    .Y(data[1]));
 sky130_fd_sc_hd__mux2_1 _126_ (.A0(\result[2] ),
    .A1(\result[8] ),
    .S(_054_),
    .X(_057_));
 sky130_fd_sc_hd__inv_2 _127_ (.A(_057_),
    .Y(data[2]));
 sky130_fd_sc_hd__mux2_1 _128_ (.A0(\result[3] ),
    .A1(\result[9] ),
    .S(_054_),
    .X(_058_));
 sky130_fd_sc_hd__inv_2 _129_ (.A(_058_),
    .Y(data[3]));
 sky130_fd_sc_hd__mux2_1 _130_ (.A0(\result[4] ),
    .A1(\result[10] ),
    .S(_054_),
    .X(_059_));
 sky130_fd_sc_hd__inv_2 _131_ (.A(_059_),
    .Y(data[4]));
 sky130_fd_sc_hd__mux2_1 _132_ (.A0(\result[5] ),
    .A1(\result[11] ),
    .S(_054_),
    .X(_060_));
 sky130_fd_sc_hd__inv_2 _133_ (.A(_060_),
    .Y(data[5]));
 sky130_fd_sc_hd__or3_2 _134_ (.A(vin_n_sw_on),
    .B(vin_p_sw_on),
    .C(_040_),
    .X(_061_));
 sky130_fd_sc_hd__inv_2 _135_ (.A(_061_),
    .Y(vcm_dummy_o));
 sky130_fd_sc_hd__nor2_2 _136_ (.A(\counter[1] ),
    .B(_061_),
    .Y(vcm_o[0]));
 sky130_fd_sc_hd__nor2_2 _137_ (.A(\counter[2] ),
    .B(_061_),
    .Y(vcm_o[1]));
 sky130_fd_sc_hd__nor2_2 _138_ (.A(\counter[3] ),
    .B(_061_),
    .Y(vcm_o[2]));
 sky130_fd_sc_hd__nor2_2 _139_ (.A(\counter[4] ),
    .B(_061_),
    .Y(vcm_o[3]));
 sky130_fd_sc_hd__nor2_2 _140_ (.A(\counter[5] ),
    .B(_061_),
    .Y(vcm_o[4]));
 sky130_fd_sc_hd__nor2_2 _141_ (.A(\counter[6] ),
    .B(_061_),
    .Y(vcm_o[5]));
 sky130_fd_sc_hd__nor2_2 _142_ (.A(\counter[7] ),
    .B(_061_),
    .Y(vcm_o[6]));
 sky130_fd_sc_hd__nor2_2 _143_ (.A(\counter[8] ),
    .B(_061_),
    .Y(vcm_o[7]));
 sky130_fd_sc_hd__nor2_2 _144_ (.A(\counter[9] ),
    .B(_061_),
    .Y(vcm_o[8]));
 sky130_fd_sc_hd__nor2_2 _145_ (.A(\counter[10] ),
    .B(_061_),
    .Y(vcm_o[9]));
 sky130_fd_sc_hd__nor2_2 _146_ (.A(\counter[11] ),
    .B(_061_),
    .Y(vcm_o[10]));
 sky130_fd_sc_hd__and2_2 _147_ (.A(\counter[0] ),
    .B(en_offset_cal),
    .X(offset_cal_cycle));
 sky130_fd_sc_hd__and2_2 _148_ (.A(en_offset_cal),
    .B(rst_z),
    .X(en_offset_cal_o));
 sky130_fd_sc_hd__or3b_2 _149_ (.A(\result[1] ),
    .B(vcm_o_i[0]),
    .C_N(\counter[1] ),
    .X(vref_z_p_o[0]));
 sky130_fd_sc_hd__inv_2 _150_ (.A(vref_z_p_o[0]),
    .Y(vss_n_o[0]));
 sky130_fd_sc_hd__or3b_2 _151_ (.A(\result[2] ),
    .B(vcm_o_i[1]),
    .C_N(\counter[2] ),
    .X(vref_z_p_o[1]));
 sky130_fd_sc_hd__inv_2 _152_ (.A(vref_z_p_o[1]),
    .Y(vss_n_o[1]));
 sky130_fd_sc_hd__or3b_2 _153_ (.A(\result[3] ),
    .B(vcm_o_i[2]),
    .C_N(\counter[3] ),
    .X(vref_z_p_o[2]));
 sky130_fd_sc_hd__inv_2 _154_ (.A(vref_z_p_o[2]),
    .Y(vss_n_o[2]));
 sky130_fd_sc_hd__or3_2 _155_ (.A(_026_),
    .B(\result[4] ),
    .C(vcm_o_i[3]),
    .X(vref_z_p_o[3]));
 sky130_fd_sc_hd__inv_2 _156_ (.A(vref_z_p_o[3]),
    .Y(vss_n_o[3]));
 sky130_fd_sc_hd__or3_2 _157_ (.A(_025_),
    .B(\result[5] ),
    .C(vcm_o_i[4]),
    .X(vref_z_p_o[4]));
 sky130_fd_sc_hd__inv_2 _158_ (.A(vref_z_p_o[4]),
    .Y(vss_n_o[4]));
 sky130_fd_sc_hd__or3b_2 _159_ (.A(\result[6] ),
    .B(vcm_o_i[5]),
    .C_N(\counter[6] ),
    .X(vref_z_p_o[5]));
 sky130_fd_sc_hd__inv_2 _160_ (.A(vref_z_p_o[5]),
    .Y(vss_n_o[5]));
 sky130_fd_sc_hd__or3b_2 _161_ (.A(\result[7] ),
    .B(vcm_o_i[6]),
    .C_N(\counter[7] ),
    .X(vref_z_p_o[6]));
 sky130_fd_sc_hd__inv_2 _162_ (.A(vref_z_p_o[6]),
    .Y(vss_n_o[6]));
 sky130_fd_sc_hd__or3b_2 _163_ (.A(\result[8] ),
    .B(vcm_o_i[7]),
    .C_N(\counter[8] ),
    .X(vref_z_p_o[7]));
 sky130_fd_sc_hd__inv_2 _164_ (.A(vref_z_p_o[7]),
    .Y(vss_n_o[7]));
 sky130_fd_sc_hd__or3b_2 _165_ (.A(\result[9] ),
    .B(vcm_o_i[8]),
    .C_N(\counter[9] ),
    .X(vref_z_p_o[8]));
 sky130_fd_sc_hd__inv_2 _166_ (.A(vref_z_p_o[8]),
    .Y(vss_n_o[8]));
 sky130_fd_sc_hd__or3b_2 _167_ (.A(\result[10] ),
    .B(vcm_o_i[9]),
    .C_N(\counter[10] ),
    .X(vref_z_p_o[9]));
 sky130_fd_sc_hd__inv_2 _168_ (.A(vref_z_p_o[9]),
    .Y(vss_n_o[9]));
 sky130_fd_sc_hd__or3b_2 _169_ (.A(\result[11] ),
    .B(vcm_o_i[10]),
    .C_N(\counter[11] ),
    .X(vref_z_p_o[10]));
 sky130_fd_sc_hd__inv_2 _170_ (.A(vref_z_p_o[10]),
    .Y(vss_n_o[10]));
 sky130_fd_sc_hd__nand3b_2 _171_ (.A_N(vcm_o_i[0]),
    .B(\result[1] ),
    .C(\counter[1] ),
    .Y(vref_z_n_o[0]));
 sky130_fd_sc_hd__inv_2 _172_ (.A(vref_z_n_o[0]),
    .Y(vss_p_o[0]));
 sky130_fd_sc_hd__nand3b_2 _173_ (.A_N(vcm_o_i[1]),
    .B(\result[2] ),
    .C(\counter[2] ),
    .Y(vref_z_n_o[1]));
 sky130_fd_sc_hd__inv_2 _174_ (.A(vref_z_n_o[1]),
    .Y(vss_p_o[1]));
 sky130_fd_sc_hd__nand3b_2 _175_ (.A_N(vcm_o_i[2]),
    .B(\result[3] ),
    .C(\counter[3] ),
    .Y(vref_z_n_o[2]));
 sky130_fd_sc_hd__inv_2 _176_ (.A(vref_z_n_o[2]),
    .Y(vss_p_o[2]));
 sky130_fd_sc_hd__or3b_2 _177_ (.A(_026_),
    .B(vcm_o_i[3]),
    .C_N(\result[4] ),
    .X(vref_z_n_o[3]));
 sky130_fd_sc_hd__inv_2 _178_ (.A(vref_z_n_o[3]),
    .Y(vss_p_o[3]));
 sky130_fd_sc_hd__or3b_2 _179_ (.A(_025_),
    .B(vcm_o_i[4]),
    .C_N(\result[5] ),
    .X(vref_z_n_o[4]));
 sky130_fd_sc_hd__inv_2 _180_ (.A(vref_z_n_o[4]),
    .Y(vss_p_o[4]));
 sky130_fd_sc_hd__nand3b_2 _181_ (.A_N(vcm_o_i[5]),
    .B(\result[6] ),
    .C(\counter[6] ),
    .Y(vref_z_n_o[5]));
 sky130_fd_sc_hd__inv_2 _182_ (.A(vref_z_n_o[5]),
    .Y(vss_p_o[5]));
 sky130_fd_sc_hd__nand3b_2 _183_ (.A_N(vcm_o_i[6]),
    .B(\result[7] ),
    .C(\counter[7] ),
    .Y(vref_z_n_o[6]));
 sky130_fd_sc_hd__inv_2 _184_ (.A(vref_z_n_o[6]),
    .Y(vss_p_o[6]));
 sky130_fd_sc_hd__nand3b_2 _185_ (.A_N(vcm_o_i[7]),
    .B(\result[8] ),
    .C(\counter[8] ),
    .Y(vref_z_n_o[7]));
 sky130_fd_sc_hd__inv_2 _186_ (.A(vref_z_n_o[7]),
    .Y(vss_p_o[7]));
 sky130_fd_sc_hd__nand3b_2 _187_ (.A_N(vcm_o_i[8]),
    .B(\result[9] ),
    .C(\counter[9] ),
    .Y(vref_z_n_o[8]));
 sky130_fd_sc_hd__inv_2 _188_ (.A(vref_z_n_o[8]),
    .Y(vss_p_o[8]));
 sky130_fd_sc_hd__nand3b_2 _189_ (.A_N(vcm_o_i[9]),
    .B(\result[10] ),
    .C(\counter[10] ),
    .Y(vref_z_n_o[9]));
 sky130_fd_sc_hd__inv_2 _190_ (.A(vref_z_n_o[9]),
    .Y(vss_p_o[9]));
 sky130_fd_sc_hd__nand3b_2 _191_ (.A_N(vcm_o_i[10]),
    .B(\result[11] ),
    .C(\counter[11] ),
    .Y(vref_z_n_o[10]));
 sky130_fd_sc_hd__inv_2 _192_ (.A(vref_z_n_o[10]),
    .Y(vss_p_o[10]));
 sky130_fd_sc_hd__and2_2 _193_ (.A(\state[0] ),
    .B(\state[1] ),
    .X(_062_));
 sky130_fd_sc_hd__a21bo_2 _194_ (.A1(\counter[0] ),
    .A2(_039_),
    .B1_N(_031_),
    .X(en_vcm_sw_o));
 sky130_fd_sc_hd__a211oi_2 _195_ (.A1(\state[1] ),
    .A2(_030_),
    .B1(_033_),
    .C1(\counter[11] ),
    .Y(sample_o));
 sky130_fd_sc_hd__nor2_2 _196_ (.A(_025_),
    .B(_040_),
    .Y(clk_data));
 sky130_fd_sc_hd__and2_2 _197_ (.A(comp_p),
    .B(_031_),
    .X(_063_));
 sky130_fd_sc_hd__or3b_2 _198_ (.A(_040_),
    .B(\counter[6] ),
    .C_N(\counter[7] ),
    .X(_064_));
 sky130_fd_sc_hd__and2_2 _199_ (.A(\result[6] ),
    .B(_031_),
    .X(_065_));
 sky130_fd_sc_hd__mux2_1 _200_ (.A0(_063_),
    .A1(_065_),
    .S(_064_),
    .X(_001_));
 sky130_fd_sc_hd__or3b_2 _201_ (.A(\counter[2] ),
    .B(_040_),
    .C_N(\counter[3] ),
    .X(_066_));
 sky130_fd_sc_hd__and2_2 _202_ (.A(\result[2] ),
    .B(_031_),
    .X(_067_));
 sky130_fd_sc_hd__mux2_1 _203_ (.A0(_063_),
    .A1(_067_),
    .S(_066_),
    .X(_002_));
 sky130_fd_sc_hd__or3b_2 _204_ (.A(\counter[0] ),
    .B(_040_),
    .C_N(\counter[1] ),
    .X(_068_));
 sky130_fd_sc_hd__and2_2 _205_ (.A(\result[0] ),
    .B(_031_),
    .X(_069_));
 sky130_fd_sc_hd__mux2_1 _206_ (.A0(_063_),
    .A1(_069_),
    .S(_068_),
    .X(_003_));
 sky130_fd_sc_hd__or3b_2 _207_ (.A(\counter[5] ),
    .B(_040_),
    .C_N(\counter[6] ),
    .X(_070_));
 sky130_fd_sc_hd__and2_2 _208_ (.A(\result[5] ),
    .B(_031_),
    .X(_071_));
 sky130_fd_sc_hd__mux2_1 _209_ (.A0(_063_),
    .A1(_071_),
    .S(_070_),
    .X(_004_));
 sky130_fd_sc_hd__a22o_2 _210_ (.A1(\counter[1] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[0] ),
    .X(_005_));
 sky130_fd_sc_hd__a22o_2 _211_ (.A1(\counter[2] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[1] ),
    .X(_006_));
 sky130_fd_sc_hd__a22o_2 _212_ (.A1(\counter[3] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[2] ),
    .X(_007_));
 sky130_fd_sc_hd__a22o_2 _213_ (.A1(\counter[4] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[3] ),
    .X(_008_));
 sky130_fd_sc_hd__a21o_2 _214_ (.A1(\counter[4] ),
    .A2(_062_),
    .B1(clk_data),
    .X(_009_));
 sky130_fd_sc_hd__a22o_2 _215_ (.A1(\counter[6] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[5] ),
    .X(_010_));
 sky130_fd_sc_hd__a22o_2 _216_ (.A1(\counter[7] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[6] ),
    .X(_011_));
 sky130_fd_sc_hd__a22o_2 _217_ (.A1(\counter[8] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[7] ),
    .X(_012_));
 sky130_fd_sc_hd__a22o_2 _218_ (.A1(\counter[9] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[8] ),
    .X(_013_));
 sky130_fd_sc_hd__a22o_2 _219_ (.A1(\counter[10] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[9] ),
    .X(_014_));
 sky130_fd_sc_hd__a22o_2 _220_ (.A1(\counter[11] ),
    .A2(_039_),
    .B1(_062_),
    .B2(\counter[10] ),
    .X(_015_));
 sky130_fd_sc_hd__a21o_2 _221_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_039_),
    .X(_016_));
 sky130_fd_sc_hd__a2bb2o_2 _222_ (.A1_N(\counter[3] ),
    .A2_N(_054_),
    .B1(_031_),
    .B2(\result[3] ),
    .X(_072_));
 sky130_fd_sc_hd__o31a_2 _223_ (.A1(\counter[3] ),
    .A2(_054_),
    .A3(_063_),
    .B1(_072_),
    .X(_017_));
 sky130_fd_sc_hd__o311a_2 _224_ (.A1(_025_),
    .A2(\counter[4] ),
    .A3(_040_),
    .B1(_031_),
    .C1(\result[4] ),
    .X(_073_));
 sky130_fd_sc_hd__a31o_2 _225_ (.A1(_026_),
    .A2(clk_data),
    .A3(_063_),
    .B1(_073_),
    .X(_018_));
 sky130_fd_sc_hd__or3b_2 _226_ (.A(\counter[1] ),
    .B(_040_),
    .C_N(\counter[2] ),
    .X(_074_));
 sky130_fd_sc_hd__and2_2 _227_ (.A(\result[1] ),
    .B(_031_),
    .X(_075_));
 sky130_fd_sc_hd__mux2_1 _228_ (.A0(_063_),
    .A1(_075_),
    .S(_074_),
    .X(_019_));
 sky130_fd_sc_hd__a211o_2 _229_ (.A1(\state[1] ),
    .A2(\counter[11] ),
    .B1(_033_),
    .C1(_062_),
    .X(_076_));
 sky130_fd_sc_hd__mux2_1 _230_ (.A0(_063_),
    .A1(\result[11] ),
    .S(_076_),
    .X(_020_));
 sky130_fd_sc_hd__or3b_2 _231_ (.A(\counter[10] ),
    .B(_040_),
    .C_N(\counter[11] ),
    .X(_077_));
 sky130_fd_sc_hd__and2_2 _232_ (.A(\result[10] ),
    .B(_031_),
    .X(_078_));
 sky130_fd_sc_hd__mux2_1 _233_ (.A0(comp_p),
    .A1(_078_),
    .S(_077_),
    .X(_021_));
 sky130_fd_sc_hd__or3b_2 _234_ (.A(\counter[9] ),
    .B(_040_),
    .C_N(\counter[10] ),
    .X(_079_));
 sky130_fd_sc_hd__and2_2 _235_ (.A(\result[9] ),
    .B(_031_),
    .X(_080_));
 sky130_fd_sc_hd__mux2_1 _236_ (.A0(_063_),
    .A1(_080_),
    .S(_079_),
    .X(_022_));
 sky130_fd_sc_hd__or3b_2 _237_ (.A(\counter[8] ),
    .B(_040_),
    .C_N(\counter[9] ),
    .X(_081_));
 sky130_fd_sc_hd__and2_2 _238_ (.A(\result[8] ),
    .B(_031_),
    .X(_082_));
 sky130_fd_sc_hd__mux2_1 _239_ (.A0(_063_),
    .A1(_082_),
    .S(_081_),
    .X(_023_));
 sky130_fd_sc_hd__or3b_2 _240_ (.A(\counter[7] ),
    .B(_040_),
    .C_N(\counter[8] ),
    .X(_083_));
 sky130_fd_sc_hd__and2_2 _241_ (.A(\result[7] ),
    .B(_031_),
    .X(_084_));
 sky130_fd_sc_hd__mux2_1 _242_ (.A0(_063_),
    .A1(_084_),
    .S(_083_),
    .X(_024_));
 sky130_fd_sc_hd__dfrtp_2 _243_ (.CLK(clk),
    .D(_001_),
    .RESET_B(rst_z),
    .Q(\result[6] ));
 sky130_fd_sc_hd__dfrtp_2 _244_ (.CLK(clk),
    .D(_002_),
    .RESET_B(rst_z),
    .Q(\result[2] ));
 sky130_fd_sc_hd__dfrtp_2 _245_ (.CLK(clk),
    .D(_003_),
    .RESET_B(rst_z),
    .Q(\result[0] ));
 sky130_fd_sc_hd__dfrtp_2 _246_ (.CLK(clk),
    .D(_000_),
    .RESET_B(rst_z),
    .Q(counter_sample));
 sky130_fd_sc_hd__dfrtp_2 _247_ (.CLK(clk),
    .D(_085_),
    .RESET_B(rst_z),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _248_ (.CLK(clk),
    .D(_086_),
    .RESET_B(rst_z),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _249_ (.CLK(clk),
    .D(_004_),
    .RESET_B(rst_z),
    .Q(\result[5] ));
 sky130_fd_sc_hd__dfrtp_2 _250_ (.CLK(clk),
    .D(_005_),
    .RESET_B(rst_z),
    .Q(\counter[0] ));
 sky130_fd_sc_hd__dfrtp_2 _251_ (.CLK(clk),
    .D(_006_),
    .RESET_B(rst_z),
    .Q(\counter[1] ));
 sky130_fd_sc_hd__dfrtp_2 _252_ (.CLK(clk),
    .D(_007_),
    .RESET_B(rst_z),
    .Q(\counter[2] ));
 sky130_fd_sc_hd__dfrtp_2 _253_ (.CLK(clk),
    .D(_008_),
    .RESET_B(rst_z),
    .Q(\counter[3] ));
 sky130_fd_sc_hd__dfrtp_2 _254_ (.CLK(clk),
    .D(_009_),
    .RESET_B(rst_z),
    .Q(\counter[4] ));
 sky130_fd_sc_hd__dfrtp_2 _255_ (.CLK(clk),
    .D(_010_),
    .RESET_B(rst_z),
    .Q(\counter[5] ));
 sky130_fd_sc_hd__dfrtp_2 _256_ (.CLK(clk),
    .D(_011_),
    .RESET_B(rst_z),
    .Q(\counter[6] ));
 sky130_fd_sc_hd__dfrtp_2 _257_ (.CLK(clk),
    .D(_012_),
    .RESET_B(rst_z),
    .Q(\counter[7] ));
 sky130_fd_sc_hd__dfrtp_2 _258_ (.CLK(clk),
    .D(_013_),
    .RESET_B(rst_z),
    .Q(\counter[8] ));
 sky130_fd_sc_hd__dfrtp_2 _259_ (.CLK(clk),
    .D(_014_),
    .RESET_B(rst_z),
    .Q(\counter[9] ));
 sky130_fd_sc_hd__dfrtp_2 _260_ (.CLK(clk),
    .D(_015_),
    .RESET_B(rst_z),
    .Q(\counter[10] ));
 sky130_fd_sc_hd__dfrtp_2 _261_ (.CLK(clk),
    .D(_016_),
    .RESET_B(rst_z),
    .Q(\counter[11] ));
 sky130_fd_sc_hd__dfrtp_2 _262_ (.CLK(clk),
    .D(_017_),
    .RESET_B(rst_z),
    .Q(\result[3] ));
 sky130_fd_sc_hd__dfrtp_2 _263_ (.CLK(clk),
    .D(_018_),
    .RESET_B(rst_z),
    .Q(\result[4] ));
 sky130_fd_sc_hd__dfrtp_2 _264_ (.CLK(clk),
    .D(_019_),
    .RESET_B(rst_z),
    .Q(\result[1] ));
 sky130_fd_sc_hd__dfrtp_2 _265_ (.CLK(clk),
    .D(_020_),
    .RESET_B(rst_z),
    .Q(\result[11] ));
 sky130_fd_sc_hd__dfrtp_2 _266_ (.CLK(clk),
    .D(_021_),
    .RESET_B(rst_z),
    .Q(\result[10] ));
 sky130_fd_sc_hd__dfrtp_2 _267_ (.CLK(clk),
    .D(_022_),
    .RESET_B(rst_z),
    .Q(\result[9] ));
 sky130_fd_sc_hd__dfrtp_2 _268_ (.CLK(clk),
    .D(_023_),
    .RESET_B(rst_z),
    .Q(\result[8] ));
 sky130_fd_sc_hd__dfrtp_2 _269_ (.CLK(clk),
    .D(_024_),
    .RESET_B(rst_z),
    .Q(\result[7] ));
endmodule
