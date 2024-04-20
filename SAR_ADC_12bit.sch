v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 900 -260 900 -180 {
lab=C10_P_btm}
N 560 -260 560 -180 {
lab=C9_P_btm}
N 560 -260 560 -180 {
lab=C9_P_btm}
N 220 -260 220 -180 {
lab=C8_P_btm}
N -120 -260 -120 -180 {
lab=C7_P_btm}
N -460 -260 -460 -180 {
lab=C6_P_btm}
N -800 -260 -800 -180 {
lab=C5_P_btm}
N -1140 -260 -1140 -180 {
lab=C4_P_btm}
N -1480 -260 -1480 -180 {
lab=C3_P_btm}
N -1820 -260 -1820 -180 {
lab=C2_P_btm}
N -2160 -260 -2160 -180 {
lab=C1_P_btm}
N -2500 -260 -2500 -180 {
lab=C0_P_btm}
N -2840 -260 -2840 -180 {
lab=C0_dummy_P_btm}
N 1020 -120 1200 -120 {
lab=VDAC_P}
N 900 20 900 100 {
lab=C10_N_btm}
N 560 20 560 100 {
lab=C9_N_btm}
N 560 20 560 100 {
lab=C9_N_btm}
N 220 20 220 100 {
lab=C8_N_btm}
N -120 20 -120 100 {
lab=C7_N_btm}
N -460 20 -460 100 {
lab=C6_N_btm}
N -800 20 -800 100 {
lab=C5_N_btm}
N -1140 20 -1140 100 {
lab=C4_N_btm}
N -1480 20 -1480 100 {
lab=C3_N_btm}
N -1820 20 -1820 100 {
lab=C2_N_btm}
N -2160 20 -2160 100 {
lab=C1_N_btm}
N -2500 20 -2500 100 {
lab=C0_N_btm}
N -2840 20 -2840 100 {
lab=C0_dummy_N_btm}
N 1020 -40 1200 -40 {
lab=VDAC_N}
N 1340 -80 1360 -80 {
lab=RST_Z}
N -3180 630 -3160 630 {
lab=SMPL}
N -3180 660 -3160 660 {
lab=VIN_P}
N -3040 630 -3020 630 {
lab=SMPL_ON_P}
N -3040 660 -3020 660 {
lab=EN_VIN_BSTR_P}
N -3180 820 -3160 820 {
lab=SMPL}
N -3180 850 -3160 850 {
lab=VIN_N}
N -3040 820 -3020 820 {
lab=SMPL_ON_N}
N -3040 850 -3020 850 {
lab=EN_VIN_BSTR_N}
N 1200 -40 1360 -40 {
lab=VDAC_N}
N 1200 -120 1360 -120 {
lab=VDAC_P}
N 1220 -40 1220 100 {
lab=VDAC_N}
N 1220 -260 1220 -120 {
lab=VDAC_P}
N -2760 610 -2740 610 {
lab=RST_Z}
N -2760 630 -2740 630 {
lab=START}
N 1540 -100 1560 -100 {
lab=VDAC_Pi}
N 1560 -100 1580 -120 {
lab=VDAC_Pi}
N 1580 -120 1700 -120 {
lab=VDAC_Pi}
N 1550 -60 1560 -60 {
lab=VDAC_Ni}
N 1540 -60 1550 -60 {
lab=VDAC_Ni}
N 1560 -60 1580 -40 {
lab=VDAC_Ni}
N 1580 -40 1700 -40 {
lab=VDAC_Ni}
N 1880 -60 2020 -60 {
lab=COMP_N}
N 1880 -100 2020 -100 {
lab=COMP_P}
N 1760 -280 1980 -280 {
lab=COMP_P}
N 1440 -330 1440 -180 {
lab=CAL_P}
N 1440 -330 1560 -330 {
lab=CAL_P}
N 1480 -310 1480 -180 {
lab=CAL_N}
N 1480 -310 1560 -310 {
lab=CAL_N}
N 1980 -270 1980 -100 {
lab=COMP_P}
N 1980 -280 1980 -270 {
lab=COMP_P}
N -2440 630 -2420 630 {
lab=CLK_DATA}
N -2440 610 -2420 610 {
lab=DATA[5:0]}
N -2760 910 -2740 910 {
lab=DEBUG_MUX[3:0]}
N -2440 1050 -2420 1050 {
lab=DEBUG_OUT}
N -2760 650 -2740 650 {
lab=EN_OFFSET_CAL}
N -2760 950 -2740 950 {
lab=CLK}
C {devices/ipin.sym} -3340 -520 0 0 {name=p73 lab=VIN_P}
C {devices/lab_wire.sym} 980 -180 0 1 {name=p75 sig_type=std_logic lab=VSS}
C {devices/ipin.sym} -3340 -620 0 0 {name=p77 lab=VDD}
C {devices/ipin.sym} -3340 -580 0 0 {name=p78 lab=VREF}
C {devices/ipin.sym} -3340 -600 0 0 {name=p79 lab=VCM}
C {devices/ipin.sym} -3340 -560 0 0 {name=p80 lab=VSS}
C {devices/lab_wire.sym} 1280 -120 0 1 {name=p81 sig_type=std_logic lab=VDAC_P}
C {devices/ipin.sym} -3340 -500 2 1 {name=p153 lab=VIN_N}
C {devices/lab_wire.sym} 980 20 2 0 {name=p154 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1280 -40 0 1 {name=p160 sig_type=std_logic lab=VDAC_N}
C {devices/lab_wire.sym} 1780 20 2 0 {name=p155 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1780 -180 0 1 {name=p156 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1700 -80 0 0 {name=p157 sig_type=std_logic lab=EN_COMP}
C {devices/lab_pin.sym} -3180 630 0 0 {name=p158 sig_type=std_logic lab=SMPL}
C {devices/lab_pin.sym} -3180 660 0 0 {name=p159 sig_type=std_logic lab=VIN_P}
C {devices/lab_wire.sym} -3100 700 2 0 {name=p161 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -3100 600 0 1 {name=p162 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -3020 630 0 1 {name=p163 sig_type=std_logic lab=SMPL_ON_P}
C {devices/lab_pin.sym} -3020 660 0 1 {name=p164 sig_type=std_logic lab=EN_VIN_BSTR_P}
C {devices/lab_pin.sym} -3180 850 0 0 {name=p166 sig_type=std_logic lab=VIN_N}
C {devices/lab_wire.sym} -3100 890 2 0 {name=p167 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -3100 790 0 1 {name=p168 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -3020 820 0 1 {name=p169 sig_type=std_logic lab=SMPL_ON_N}
C {devices/lab_pin.sym} -3020 850 0 1 {name=p170 sig_type=std_logic lab=EN_VIN_BSTR_N}
C {devices/lab_pin.sym} 2020 -100 0 1 {name=p175 sig_type=std_logic lab=COMP_P}
C {devices/lab_pin.sym} 2020 -60 0 1 {name=p176 sig_type=std_logic lab=COMP_N}
C {devices/lab_pin.sym} -2740 710 0 0 {name=p177 sig_type=std_logic lab=COMP_P}
C {devices/lab_pin.sym} -2740 730 0 0 {name=p178 sig_type=std_logic lab=COMP_N}
C {devices/lab_pin.sym} -2440 730 0 1 {name=p181 sig_type=std_logic lab=EN_VCM[10:0]}
C {devices/lab_pin.sym} -2440 950 0 1 {name=p189 sig_type=std_logic lab=EN_COMP}
C {devices/lab_pin.sym} -2440 690 0 1 {name=p191 sig_type=std_logic lab=SMPL}
C {devices/lab_pin.sym} -2840 60 0 0 {name=p232 sig_type=std_logic lab=C0_dummy_N_btm}
C {devices/lab_pin.sym} -2500 60 0 0 {name=p233 sig_type=std_logic lab=C0_N_btm}
C {devices/lab_pin.sym} -2160 60 0 0 {name=p234 sig_type=std_logic lab=C1_N_btm}
C {devices/lab_pin.sym} -1820 60 0 0 {name=p235 sig_type=std_logic lab=C2_N_btm}
C {devices/lab_pin.sym} -1480 60 0 0 {name=p236 sig_type=std_logic lab=C3_N_btm}
C {devices/lab_pin.sym} -1140 60 0 0 {name=p237 sig_type=std_logic lab=C4_N_btm}
C {devices/lab_pin.sym} -800 60 0 0 {name=p238 sig_type=std_logic lab=C5_N_btm}
C {devices/lab_pin.sym} -460 60 0 0 {name=p239 sig_type=std_logic lab=C6_N_btm}
C {devices/lab_pin.sym} -120 60 0 0 {name=p240 sig_type=std_logic lab=C7_N_btm}
C {devices/lab_pin.sym} 220 60 0 0 {name=p241 sig_type=std_logic lab=C8_N_btm}
C {devices/lab_pin.sym} 560 60 0 0 {name=p242 sig_type=std_logic lab=C9_N_btm}
C {devices/lab_pin.sym} 900 60 0 0 {name=p243 sig_type=std_logic lab=C10_N_btm}
C {devices/lab_pin.sym} -2840 -220 0 0 {name=p244 sig_type=std_logic lab=C0_dummy_P_btm}
C {devices/lab_pin.sym} -2500 -220 0 0 {name=p245 sig_type=std_logic lab=C0_P_btm}
C {devices/lab_pin.sym} -2160 -220 0 0 {name=p246 sig_type=std_logic lab=C1_P_btm}
C {devices/lab_pin.sym} -1820 -220 0 0 {name=p247 sig_type=std_logic lab=C2_P_btm}
C {devices/lab_pin.sym} -1480 -220 0 0 {name=p248 sig_type=std_logic lab=C3_P_btm}
C {devices/lab_pin.sym} -1140 -220 0 0 {name=p249 sig_type=std_logic lab=C4_P_btm}
C {devices/lab_pin.sym} -800 -220 0 0 {name=p250 sig_type=std_logic lab=C5_P_btm}
C {devices/lab_pin.sym} -460 -220 0 0 {name=p251 sig_type=std_logic lab=C6_P_btm}
C {devices/lab_pin.sym} -120 -220 0 0 {name=p252 sig_type=std_logic lab=C7_P_btm}
C {devices/lab_pin.sym} 220 -220 0 0 {name=p253 sig_type=std_logic lab=C8_P_btm}
C {devices/lab_pin.sym} 560 -220 0 0 {name=p254 sig_type=std_logic lab=C9_P_btm}
C {devices/lab_pin.sym} 900 -220 0 0 {name=p255 sig_type=std_logic lab=C10_P_btm}
C {devices/lab_pin.sym} -2740 770 0 0 {name=p231 sig_type=std_logic lab=SMPL_ON_P}
C {devices/lab_pin.sym} -2740 790 0 0 {name=p256 sig_type=std_logic lab=SMPL_ON_N}
C {devices/lab_pin.sym} -3060 -400 0 0 {name=p150 sig_type=std_logic lab=EN_VCM_DUMMY}
C {devices/lab_wire.sym} -2590 1130 2 0 {name=p76 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -2590 580 0 1 {name=p171 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} -2760 610 0 0 {name=p172 lab=RST_Z}
C {devices/ipin.sym} -2760 630 0 0 {name=p173 lab=START}
C {devices/opin.sym} -2420 630 0 0 {name=p174 lab=CLK_DATA}
C {devices/lab_pin.sym} 1340 -80 0 0 {name=p195 sig_type=std_logic lab=RST_Z}
C {devices/lab_wire.sym} 1400 -180 0 1 {name=p196 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 1440 20 2 0 {name=p197 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1680 -120 0 0 {name=p198 sig_type=std_logic lab=VDAC_Pi}
C {devices/lab_wire.sym} 1680 -40 2 1 {name=p199 sig_type=std_logic lab=VDAC_Ni}
C {devices/lab_pin.sym} -3060 -380 0 0 {name=p194 sig_type=std_logic lab=EN_VCM_SW}
C {devices/lab_pin.sym} -2440 990 0 1 {name=p201 sig_type=std_logic lab=OFFSET_CAL_CYCLE}
C {devices/lab_pin.sym} 1760 -320 0 1 {name=p202 sig_type=std_logic lab=OFFSET_CAL_CYCLE}
C {devices/lab_pin.sym} 1760 -300 0 1 {name=p209 sig_type=std_logic lab=EN_COMP}
C {devices/lab_wire.sym} 1660 -380 0 1 {name=p213 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 1660 -240 2 0 {name=p216 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1550 -330 0 0 {name=p217 sig_type=std_logic lab=CAL_P}
C {devices/lab_wire.sym} 1550 -310 0 0 {name=p218 sig_type=std_logic lab=CAL_N}
C {devices/lab_pin.sym} -2440 1010 0 1 {name=p219 sig_type=std_logic lab=EN_VOS_CAL}
C {devices/lab_pin.sym} 1760 -360 0 1 {name=p220 sig_type=std_logic lab=EN_VOS_CAL}
C {devices/opin.sym} -2420 610 0 0 {name=p4 lab=DATA[5:0]}
C {devices/lab_pin.sym} -3180 820 0 0 {name=p21 sig_type=std_logic lab=SMPL}
C {devices/lab_pin.sym} -3060 -320 2 1 {name=p47 lab=EN_VCM[10:0]}
C {devices/lab_pin.sym} -3060 -360 2 1 {name=p50 lab=EN_VSS_P[10:0]}
C {devices/lab_pin.sym} -3060 -340 2 1 {name=p51 lab=EN_REF_Z_P[10:0]}
C {devices/lab_pin.sym} -3060 -300 2 1 {name=p57 lab=EN_VIN_BSTR_P}
C {devices/lab_pin.sym} -2440 770 0 1 {name=p132 sig_type=std_logic lab=EN_VCM_SW}
C {devices/lab_pin.sym} -2440 750 0 1 {name=p131 sig_type=std_logic lab=EN_VCM_DUMMY}
C {devices/lab_pin.sym} -2440 870 0 1 {name=p134 lab=EN_VSS_N[10:0]}
C {devices/lab_pin.sym} -2440 850 0 1 {name=p135 lab=EN_REF_Z_N[10:0]}
C {devices/lab_pin.sym} -2440 830 0 1 {name=p136 lab=EN_VSS_P[10:0]}
C {devices/lab_pin.sym} -2440 810 0 1 {name=p137 lab=EN_REF_Z_P[10:0]}
C {devices/lab_wire.sym} -3020 -260 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -3060 240 2 1 {name=p2 sig_type=std_logic lab=EN_VCM_DUMMY}
C {devices/lab_pin.sym} -3060 220 2 1 {name=p3 sig_type=std_logic lab=EN_VCM_SW}
C {devices/lab_pin.sym} -3060 160 0 0 {name=p5 lab=EN_VCM[10:0]}
C {devices/lab_pin.sym} -3060 200 0 0 {name=p6 lab=EN_VSS_N[10:0]}
C {devices/lab_pin.sym} -3060 180 0 0 {name=p7 lab=EN_REF_Z_N[10:0]}
C {devices/lab_pin.sym} -3060 140 0 0 {name=p8 lab=EN_VIN_BSTR_N}
C {devices/lab_wire.sym} -3020 100 0 1 {name=p12 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} -3000 320 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -2960 320 2 0 {name=p14 sig_type=std_logic lab=VREF}
C {devices/lab_wire.sym} -2920 320 2 0 {name=p16 sig_type=std_logic lab=VIN_N}
C {devices/lab_wire.sym} -2880 320 2 0 {name=p17 sig_type=std_logic lab=VCM}
C {devices/lab_wire.sym} -3000 -480 0 1 {name=p18 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} -2960 -480 0 1 {name=p19 sig_type=std_logic lab=VREF}
C {devices/lab_wire.sym} -2920 -480 0 1 {name=p20 sig_type=std_logic lab=VIN_P}
C {devices/lab_wire.sym} -2880 -480 0 1 {name=p22 sig_type=std_logic lab=VCM}
C {CDAC/CDAC_12bit.sym} 300 90 0 0 {name=x1}
C {CDAC/CDAC_12bit.sym} 300 -250 2 1 {name=x2}
C {switches/switches.sym} -3100 -540 2 1 {name=x3}
C {switches/switches.sym} -3100 380 0 0 {name=x4}
C {preamplifier/preamplifier.sym} 1440 -80 0 0 {name=x5}
C {latched_comparator/latched_comparator.sym} 1780 -80 0 0 {name=x6}
C {offset_calibration/offset_calibration.sym} 1660 -320 0 1 {name=x7}
C {state_machine/state_machine.sym} -2590 670 0 0 {name=x8}
C {bootstrap/bootstrap.sym} -3100 660 0 0 {name=x11}
C {bootstrap/bootstrap.sym} -3100 850 0 0 {name=x12}
C {devices/ipin.sym} -2760 910 0 0 {name=p9 lab=DEBUG_MUX[3:0]}
C {devices/opin.sym} -2420 1050 0 0 {name=p10 lab=DEBUG_OUT}
C {devices/ipin.sym} -2760 650 0 0 {name=p11 lab=EN_OFFSET_CAL}
C {devices/ipin.sym} -2760 950 0 0 {name=p15 lab=CLK}
C {devices/lab_pin.sym} -2740 1010 0 0 {name=p23 sig_type=std_logic lab=EN_VCM_SW}
C {devices/lab_pin.sym} -2740 1030 0 0 {name=p24 sig_type=std_logic lab=EN_VCM[10:0]}
C {devices/lab_pin.sym} -2740 670 0 0 {name=p25 sig_type=std_logic lab=VDD}
