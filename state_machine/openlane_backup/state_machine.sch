v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
P 4 5 80 -1100 80 20 980 20 980 -1100 80 -1100 {}
P 4 5 1020 -1100 1020 -700 1920 -700 1920 -1100 1020 -1100 {}
P 4 5 1020 -620 1020 -460 1500 -460 1500 -620 1020 -620 {}
P 4 5 1020 -380 1020 60 1500 60 1500 -380 1020 -380 {}
P 4 5 2640 -1100 2640 -840 3420 -840 3420 -1100 2640 -1100 {}
P 4 5 1540 -620 1540 -140 2300 -140 2300 -620 1540 -620 {}
P 4 5 2340 -620 2340 -100 3160 -100 3160 -620 2340 -620 {}
P 4 5 1540 -60 1540 100 2560 100 2560 -60 1540 -60 {}
T {State Machine} 80 -1140 0 0 0.6 0.6 {}
T {Clock Pulse Generation} 1020 -1140 0 0 0.6 0.6 {}
T {Ring Counter} 1020 -660 0 0 0.6 0.6 {}
T {Result Register and Done Signal} 1020 -420 0 0 0.6 0.6 {}
T {Internal Result Register} 2640 -1140 0 0 0.6 0.6 {}
T {Control of VCM switches} 1540 -660 0 0 0.6 0.6 {}
T {Comparator Enable and Sample switches} 1540 -100 0 0 0.6 0.6 {}
T {Control of VREF switches} 2340 -660 0 0 0.6 0.6 {}
N 560 -800 620 -800 {
lab=S_IDLE_Z}
N 580 -760 620 -760 {
lab=#net1}
N 580 -760 580 -740 {
lab=#net1}
N 580 -740 760 -700 {
lab=#net1}
N 760 -700 760 -660 {
lab=#net1}
N 740 -660 760 -660 {
lab=#net1}
N 580 -680 620 -680 {
lab=IDLE}
N 580 -700 580 -680 {
lab=IDLE}
N 580 -700 760 -740 {
lab=IDLE}
N 760 -780 760 -740 {
lab=IDLE}
N 740 -780 760 -780 {
lab=IDLE}
N 520 -800 560 -800 {
lab=S_IDLE_Z}
N 560 -640 620 -640 {
lab=R_IDLE_Z}
N 520 -640 560 -640 {
lab=R_IDLE_Z}
N 760 -780 800 -780 {
lab=IDLE}
N 190 -980 210 -980 {
lab=RST_Z}
N 290 -980 350 -980 {
lab=RSTi}
N 340 -820 400 -820 {
lab=#net2}
N 560 -500 620 -500 {
lab=S_SAMPLE_Z}
N 580 -460 620 -460 {
lab=#net3}
N 580 -460 580 -440 {
lab=#net3}
N 580 -440 760 -400 {
lab=#net3}
N 760 -400 760 -360 {
lab=#net3}
N 740 -360 760 -360 {
lab=#net3}
N 580 -380 620 -380 {
lab=#net4}
N 580 -400 580 -380 {
lab=#net4}
N 580 -400 760 -440 {
lab=#net4}
N 760 -480 760 -440 {
lab=#net4}
N 740 -480 760 -480 {
lab=#net4}
N 520 -500 560 -500 {
lab=S_SAMPLE_Z}
N 560 -340 620 -340 {
lab=R_SAMPLE_Z}
N 520 -340 560 -340 {
lab=R_SAMPLE_Z}
N 380 -520 400 -520 {
lab=START}
N 760 -360 780 -360 {
lab=#net3}
N 340 -360 400 -360 {
lab=#net5}
N 560 -200 620 -200 {
lab=S_CONVERT_Z}
N 580 -160 620 -160 {
lab=#net6}
N 580 -160 580 -140 {
lab=#net6}
N 580 -140 760 -100 {
lab=#net6}
N 760 -100 760 -60 {
lab=#net6}
N 740 -60 760 -60 {
lab=#net6}
N 580 -80 620 -80 {
lab=#net7}
N 580 -100 580 -80 {
lab=#net7}
N 580 -100 760 -140 {
lab=#net7}
N 760 -180 760 -140 {
lab=#net7}
N 740 -180 760 -180 {
lab=#net7}
N 520 -200 560 -200 {
lab=S_CONVERT_Z}
N 560 -40 620 -40 {
lab=R_CONVERT_Z}
N 520 -40 560 -40 {
lab=R_CONVERT_Z}
N 760 -60 780 -60 {
lab=#net6}
N 1520 -1040 1580 -1040 {
lab=S_CLK_PULSE_Z}
N 1540 -1000 1580 -1000 {
lab=#net8}
N 1540 -1000 1540 -980 {
lab=#net8}
N 1540 -980 1720 -940 {
lab=#net8}
N 1720 -940 1720 -900 {
lab=#net8}
N 1700 -900 1720 -900 {
lab=#net8}
N 1540 -920 1580 -920 {
lab=#net9}
N 1540 -940 1540 -920 {
lab=#net9}
N 1540 -940 1720 -980 {
lab=#net9}
N 1720 -1020 1720 -980 {
lab=#net9}
N 1700 -1020 1720 -1020 {
lab=#net9}
N 1480 -1040 1520 -1040 {
lab=S_CLK_PULSE_Z}
N 1520 -880 1580 -880 {
lab=R_CLK_PULSE_Z}
N 1480 -880 1520 -880 {
lab=R_CLK_PULSE_Z}
N 1720 -900 1740 -900 {
lab=#net8}
N 1450 -1040 1480 -1040 {
lab=S_CLK_PULSE_Z}
N 1450 -880 1480 -880 {
lab=R_CLK_PULSE_Z}
N 1270 -900 1330 -900 {
lab=CLK_CMP}
N 1130 -790 1150 -790 {
lab=COMP_P}
N 1130 -750 1150 -750 {
lab=COMP_N}
N 1810 0 1830 0 {
lab=SAMPLE_O}
N 2860 -460 2880 -460 {
lab=VREF_Z_P_O[10:0]}
N 2860 -360 2880 -360 {
lab=VSS_P_O[10:0]}
N 2860 -260 2880 -260 {
lab=VREF_Z_N_O[10:0]}
N 2860 -160 2880 -160 {
lab=VSS_N_O[10:0]}
N 2400 20 2420 20 {
lab=EN_COMP}
N 2220 20 2290 20 {
lab=CLK_COUNTER_Z}
N 2290 20 2320 20 {
lab=CLK_COUNTER_Z}
N 2120 -290 2140 -290 {
lab=VCM_DUMMY_O}
N 2960 -1040 3100 -1040 {
lab=#net10}
N 1800 -370 1840 -370 {
lab=#net11}
N 1800 -370 1800 -270 {
lab=#net11}
N 1780 -270 1840 -270 {
lab=#net11}
N 2120 -460 2140 -460 {
lab=VCM_Z_O[10:0]}
N 1240 -70 1250 -70 {
lab=#net12}
N 1210 -70 1240 -70 {
lab=#net12}
N 1260 -200 1300 -200 {
lab=LOAD}
N 1920 220 1960 220 {
lab=#net13}
N 1960 0 1960 220 {
lab=#net13}
N 1960 0 2100 -0 {
lab=#net13}
N 770 -920 780 -920 {
lab=#net14}
N 770 -950 770 -920 {
lab=#net14}
N 760 -950 770 -950 {
lab=#net14}
N 760 -990 780 -990 {
lab=#net15}
N 860 -990 880 -990 {
lab=LO}
N 860 -920 880 -920 {
lab=HI}
N 1700 -780 1720 -780 {
lab=DAC_SETTLE}
N 1360 -1040 1370 -1040 {
lab=DAC_SETTLE_D}
N 200 -340 220 -340 {
lab=SAMPLE_D}
N 3400 -500 3420 -500 {
lab=#net16}
N 3420 -580 3420 -500 {
lab=#net16}
N 3420 -580 3440 -580 {
lab=#net16}
N 4220 -860 4260 -860 {
lab=#net17}
N 4220 -600 4260 -600 {
lab=#net18}
N 4560 -460 4580 -460 {
lab=#net19}
N 4210 -340 4250 -340 {
lab=#net20}
N 4210 -80 4250 -80 {
lab=#net21}
N 4260 -860 4320 -860 {
lab=#net17}
N 4320 -860 4320 -520 {
lab=#net17}
N 4320 -520 4480 -520 {
lab=#net17}
N 4260 -600 4280 -600 {
lab=#net18}
N 4280 -600 4280 -480 {
lab=#net18}
N 4280 -480 4480 -480 {
lab=#net18}
N 4250 -340 4280 -340 {
lab=#net20}
N 4280 -440 4280 -340 {
lab=#net20}
N 4280 -440 4480 -440 {
lab=#net20}
N 4250 -80 4320 -80 {
lab=#net21}
N 4320 -400 4320 -80 {
lab=#net21}
N 4320 -400 4480 -400 {
lab=#net21}
N 1580 0 1610 0 {
lab=#net22}
N 1580 0 1580 20 {
lab=#net22}
N 1560 20 1580 20 {
lab=#net22}
N 1600 160 1610 160 {
lab=#net23}
N 1610 40 1610 160 {
lab=#net23}
N 2140 -390 2190 -390 {
lab=VCM_O[10:0]}
N 2040 -390 2060 -390 {
lab=#net24}
N 4660 -460 4680 -460 {
lab=#net25}
N 4760 -460 4780 -460 {
lab=DEBUG_OUT}
N 3840 -640 3860 -640 {
lab=DATA[5:0]}
N 3840 -440 3860 -440 {
lab=CLK_DATA}
C {sky130_stdcells/nand2_1.sym} 680 -780 0 0 {name=x1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 600 -800 0 0 {name=p2 sig_type=std_logic lab=S_IDLE_Z}
C {devices/lab_wire.sym} 600 -640 0 0 {name=p3 sig_type=std_logic lab=R_IDLE_Z}
C {devices/lab_pin.sym} 800 -780 0 1 {name=p4 sig_type=std_logic lab=IDLE}
C {sky130_stdcells/nor2_1.sym} 460 -800 0 0 {name=x3 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 680 -660 0 0 {name=x2 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 480 -640 0 0 {name=x4 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 440 -640 0 0 {name=p5 sig_type=std_logic lab=SAMPLE}
C {devices/lab_pin.sym} 400 -780 0 0 {name=p6 sig_type=std_logic lab=RSTi}
C {sky130_stdcells/inv_4.sym} 250 -980 0 0 {name=x5 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 190 -980 0 0 {name=p7 lab=RST_Z}
C {sky130_stdcells/inv_4.sym} 390 -980 0 0 {name=x6 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 340 -980 0 0 {name=p8 sig_type=std_logic lab=RSTi}
C {devices/lab_pin.sym} 430 -980 0 1 {name=p9 sig_type=std_logic lab=RST_Zi}
C {sky130_stdcells/and2_0.sym} 280 -820 0 0 {name=x7 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 220 -840 0 0 {name=p1 sig_type=std_logic lab=CONVERT}
C {devices/lab_pin.sym} 220 -800 0 0 {name=p10 sig_type=std_logic lab=DONE}
C {sky130_stdcells/nand2_1.sym} 680 -480 0 0 {name=x8 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 600 -500 0 0 {name=p11 sig_type=std_logic lab=S_SAMPLE_Z}
C {devices/lab_wire.sym} 600 -340 0 0 {name=p12 sig_type=std_logic lab=R_SAMPLE_Z}
C {sky130_stdcells/nand2_1.sym} 680 -360 0 0 {name=x9 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 460 -500 0 0 {name=x10 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 380 -520 0 0 {name=p14 lab=START}
C {devices/lab_pin.sym} 400 -480 0 0 {name=p15 sig_type=std_logic lab=IDLE}
C {sky130_stdcells/inv_2.sym} 820 -360 0 0 {name=x11 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_1.sym} 460 -340 0 0 {name=x12 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/and2_0.sym} 280 -360 0 0 {name=x13 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 220 -380 0 0 {name=p16 sig_type=std_logic lab=CONVERT}
C {devices/lab_pin.sym} 400 -320 0 0 {name=p18 sig_type=std_logic lab=RSTi}
C {sky130_stdcells/nand2_1.sym} 680 -180 0 0 {name=x14 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 600 -200 0 0 {name=p19 sig_type=std_logic lab=S_CONVERT_Z}
C {devices/lab_wire.sym} 600 -40 0 0 {name=p20 sig_type=std_logic lab=R_CONVERT_Z}
C {devices/lab_pin.sym} 860 -60 0 1 {name=p21 sig_type=std_logic lab=CONVERT}
C {sky130_stdcells/nand2_1.sym} 680 -60 0 0 {name=x15 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 820 -60 0 0 {name=x16 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 440 -40 0 0 {name=p22 sig_type=std_logic lab=IDLE}
C {sky130_stdcells/inv_1.sym} 480 -40 0 0 {name=x17 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 400 -180 0 0 {name=p23 sig_type=std_logic lab=SAMPLE_D}
C {devices/lab_pin.sym} 400 -220 0 0 {name=p24 sig_type=std_logic lab=SAMPLE}
C {sky130_stdcells/conb_1.sym} 700 -970 0 0 {name=x20 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1580 -760 0 0 {name=p41 sig_type=std_logic lab=CONVERT}
C {devices/lab_pin.sym} 1580 -800 0 0 {name=p42 sig_type=std_logic lab=CLK_PULSE}
C {sky130_stdcells/and2b_1.sym} 1640 -780 0 0 {name=x23 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_1.sym} 1640 -1020 0 0 {name=x24 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 1560 -1040 0 0 {name=p48 sig_type=std_logic lab=S_CLK_PULSE_Z}
C {devices/lab_wire.sym} 1560 -880 0 0 {name=p49 sig_type=std_logic lab=R_CLK_PULSE_Z}
C {sky130_stdcells/nand2_1.sym} 1640 -900 0 0 {name=x25 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1820 -900 0 1 {name=p50 sig_type=std_logic lab=CLK_PULSE}
C {sky130_stdcells/inv_1.sym} 1780 -900 0 0 {name=x26 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 1410 -1040 0 0 {name=x27 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2b_1.sym} 1390 -880 0 0 {name=x28 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1330 -860 0 0 {name=p52 sig_type=std_logic lab=CONVERT}
C {sky130_stdcells/and3b_1.sym} 1210 -900 0 0 {name=x29 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1150 -860 0 0 {name=p53 sig_type=std_logic lab=COMP_DECIDED}
C {devices/lab_pin.sym} 1150 -900 0 0 {name=p54 sig_type=std_logic lab=CLK_PULSE}
C {devices/lab_pin.sym} 1270 -770 0 1 {name=p55 sig_type=std_logic lab=COMP_DECIDED}
C {devices/ipin.sym} 1130 -790 0 0 {name=p56 lab=COMP_P}
C {sky130_stdcells/nand2_1.sym} 1210 -770 0 0 {name=x30 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 1130 -750 0 0 {name=p57 lab=COMP_N}
C {sky130_stdcells/inv_4.sym} 1770 0 0 0 {name=x39 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand3b_2.sym} 1670 0 0 0 {name=x40 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1440 0 0 0 {name=p78 sig_type=std_logic lab=SAMPLE}
C {devices/opin.sym} 1830 0 0 0 {name=p79 lab=SAMPLE_O}
C {sky130_stdcells/dfrtp_1.sym} 1270 -550 0 0 {name=x1[11:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1180 -570 0 0 {name=p83 sig_type=std_logic lab=CLK_COUNTER_Z}
C {devices/lab_pin.sym} 1180 -550 0 0 {name=p84 sig_type=std_logic lab=HI,COUNTER[11:1]}
C {devices/lab_pin.sym} 1360 -570 0 1 {name=p86 sig_type=std_logic lab=COUNTER[11:0]}
C {sky130_stdcells/inv_4.sym} 2100 -390 0 0 {name=x21[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 2000 -390 0 0 {name=x38[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1840 -410 0 0 {name=p27 sig_type=std_logic lab=COUNTER[11:1]}
C {devices/opin.sym} 2190 -390 0 0 {name=p28 lab=VCM_O[10:0]}
C {devices/lab_pin.sym} 2880 -880 0 0 {name=p29 sig_type=std_logic lab=HI,COUNTER[11:1]}
C {devices/lab_pin.sym} 2880 -920 0 0 {name=p30 sig_type=std_logic lab=COUNTER[11:0]}
C {sky130_stdcells/and2b_1.sym} 2940 -900 0 0 {name=x41[11:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 3000 -900 0 1 {name=p31 sig_type=std_logic lab=EN_DAC_OUT[11:0]}
C {sky130_stdcells/nor2b_2.sym} 2720 -460 0 0 {name=x2[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2660 -480 0 0 {name=p37 sig_type=std_logic lab=RESULTi[11:1]}
C {sky130_stdcells/inv_4.sym} 2820 -460 0 0 {name=x8[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_2.sym} 2720 -360 0 0 {name=x42[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2660 -380 0 0 {name=p39 sig_type=std_logic lab=RESULTi[11:1]}
C {sky130_stdcells/inv_4.sym} 2820 -360 0 0 {name=x7[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2b_2.sym} 2720 -260 0 0 {name=x3[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 3140 -960 0 0 {name=p82 sig_type=std_logic lab=RESULTi[11:0]}
C {sky130_stdcells/inv_4.sym} 2820 -260 0 0 {name=x43[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nand2_2.sym} 2720 -160 0 0 {name=x4[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 2820 -160 0 0 {name=x44[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 3180 -960 0 0 {name=x45[11:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dfrtp_1.sym} 3190 -1040 0 0 {name=x5[11:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 3100 -1060 0 0 {name=p63 sig_type=std_logic lab=CLK_COUNTER_Z}
C {devices/lab_pin.sym} 3280 -1060 0 1 {name=p67 sig_type=std_logic lab=RESULTi[11:0]}
C {sky130_stdcells/mux2_1.sym} 2920 -1040 0 0 {name=x46[11:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2880 -1020 0 0 {name=p65 sig_type=std_logic lab=COMP_P}
C {devices/lab_pin.sym} 2880 -1060 0 0 {name=p71 sig_type=std_logic lab=RESULTi[11:0]}
C {devices/lab_pin.sym} 2880 -980 0 0 {name=p88 sig_type=std_logic lab=EN_DAC_OUT[11:0]}
C {sky130_stdcells/inv_4.sym} 2360 20 0 0 {name=x47 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 2420 20 0 0 {name=p96 lab=EN_COMP}
C {sky130_stdcells/nand2_4.sym} 2160 20 0 0 {name=x22 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2100 40 0 0 {name=p35 sig_type=std_logic lab=CLK_PULSE}
C {devices/ipin.sym} 190 -1060 0 0 {name=p58 lab=VDD}
C {devices/ipin.sym} 190 -1040 0 0 {name=p59 lab=VSS}
C {devices/lab_wire.sym} 2310 20 0 0 {name=p60 sig_type=std_logic lab=CLK_COUNTER_Z}
C {sky130_stdcells/and3_1.sym} 1200 -200 0 0 {name=x31 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1140 -160 0 0 {name=p62 sig_type=std_logic lab=CLK_PULSE}
C {sky130_stdcells/nor2b_1.sym} 1900 -390 0 0 {name=x9[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1660 -290 0 0 {name=p76 sig_type=std_logic lab=CONVERT}
C {sky130_stdcells/nand2_1.sym} 460 -200 0 0 {name=x18 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_1.sym} 1760 -540 0 0 {name=x21 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 1700 -560 0 0 {name=p87 lab=VIN_P_SW_ON}
C {devices/ipin.sym} 1700 -520 0 0 {name=p101 lab=VIN_N_SW_ON}
C {devices/lab_pin.sym} 1820 -540 0 1 {name=p102 sig_type=std_logic lab=ALLOW_VCM_SW}
C {sky130_stdcells/and2_1.sym} 1720 -270 0 0 {name=x36 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1660 -250 0 0 {name=p103 sig_type=std_logic lab=ALLOW_VCM_SW}
C {sky130_stdcells/inv_4.sym} 2080 -290 0 0 {name=x37 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 2000 -290 0 0 {name=x38 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1840 -310 0 0 {name=p106 sig_type=std_logic lab=LO}
C {sky130_stdcells/nor2b_1.sym} 1900 -290 0 0 {name=x41 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 2140 -290 0 0 {name=p107 lab=VCM_DUMMY_O}
C {devices/opin.sym} 880 -920 0 0 {name=p25 lab=HI}
C {devices/opin.sym} 880 -990 0 0 {name=p26 lab=LO}
C {sky130_stdcells/dfrtp_1.sym} 1340 -90 0 0 {name=x44 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1250 -110 0 0 {name=p104 sig_type=std_logic lab=LOAD_D}
C {devices/lab_pin.sym} 1250 -90 0 0 {name=p105 sig_type=std_logic lab=HI}
C {devices/lab_pin.sym} 1430 -110 0 1 {name=p110 sig_type=std_logic lab=DONE}
C {sky130_stdcells/inv_1.sym} 2080 -460 0 0 {name=x10[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2040 -460 0 0 {name=p68 sig_type=std_logic lab=VCM_O[10:0]}
C {sky130_stdcells/nand2_1.sym} 2720 -550 0 0 {name=x11[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2660 -570 0 0 {name=p98 sig_type=std_logic lab=VCM_Z_O[10:0]}
C {devices/lab_pin.sym} 2860 -550 0 1 {name=p38 sig_type=std_logic lab=ALLOW_VREF_SW[10:0]}
C {devices/lab_pin.sym} 2660 -440 0 0 {name=p111 sig_type=std_logic lab=ALLOW_VREF_SW[10:0]}
C {devices/lab_pin.sym} 2660 -340 0 0 {name=p32 sig_type=std_logic lab=ALLOW_VREF_SW[10:0]}
C {devices/lab_pin.sym} 2660 -240 0 0 {name=p40 sig_type=std_logic lab=ALLOW_VREF_SW[10:0]}
C {devices/lab_pin.sym} 2660 -140 0 0 {name=p77 sig_type=std_logic lab=ALLOW_VREF_SW[10:0]}
C {devices/lab_pin.sym} 3220 -960 0 1 {name=p112 sig_type=std_logic lab=RESULT_Z[11:0]}
C {devices/lab_pin.sym} 2660 -280 0 0 {name=p113 sig_type=std_logic lab=RESULT_Z[11:1]}
C {devices/lab_pin.sym} 2660 -180 0 0 {name=p114 sig_type=std_logic lab=RESULT_Z[11:1]}
C {sky130_stdcells/nor2_1.sym} 1150 -70 0 0 {name=x45 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1090 -90 0 0 {name=p108 sig_type=std_logic lab=SAMPLE}
C {devices/lab_pin.sym} 1090 -50 0 0 {name=p109 sig_type=std_logic lab=RSTi}
C {sky130_stdcells/inv_1.sym} 2820 -550 0 0 {name=x12[10:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/dlymetal6s6s_1.sym} 1340 -200 0 0 {name=x48 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 1300 -200 0 0 {name=p64 sig_type=std_logic lab=LOAD}
C {devices/lab_pin.sym} 1460 -200 0 1 {name=p100 sig_type=std_logic lab=LOAD_D}
C {devices/lab_pin.sym} 2660 -530 0 0 {name=p115 sig_type=std_logic lab=COUNTER[11:1]}
C {sky130_stdcells/dlymetal6s6s_1.sym} 1420 -200 0 0 {name=x32 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1120 140 0 0 {name=p116 sig_type=std_logic lab=COUNTER[0]}
C {sky130_stdcells/inv_4.sym} 1280 160 0 0 {name=x46 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 1320 160 0 0 {name=p117 lab=EN_VCM_SW_O}
C {devices/lab_pin.sym} 1120 180 0 0 {name=p118 sig_type=std_logic lab=SAMPLE}
C {sky130_stdcells/nor2_2.sym} 1180 160 0 0 {name=x49 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} 1240 390 0 0 {name=p121 lab=EN_OFFSET_CAL}
C {devices/lab_wire.sym} 1320 -900 0 0 {name=p123 sig_type=std_logic lab=CLK_CMP}
C {devices/lab_pin.sym} 1240 350 0 0 {name=p125 sig_type=std_logic lab=COMP_DECIDED}
C {devices/lab_pin.sym} 1140 -200 0 0 {name=p126 sig_type=std_logic lab=COUNTER[0]}
C {sky130_stdcells/nand2b_1.sym} 1300 370 0 0 {name=x52 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1360 370 0 1 {name=p127 sig_type=std_logic lab=FINISH}
C {devices/lab_pin.sym} 1140 -240 0 0 {name=p128 sig_type=std_logic lab=FINISH}
C {devices/lab_pin.sym} 1800 200 0 0 {name=p95 sig_type=std_logic lab=EN_OFFSET_CAL}
C {sky130_stdcells/nand2b_1.sym} 1860 220 0 0 {name=x51 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1800 240 0 0 {name=p61 sig_type=std_logic lab=COUNTER[0]}
C {devices/lab_pin.sym} 1150 -940 0 0 {name=p122 sig_type=std_logic lab=COUNTER[0]}
C {devices/lab_pin.sym} 1680 370 0 0 {name=p124 sig_type=std_logic lab=COUNTER[0]}
C {sky130_stdcells/nand2_2.sym} 1740 390 0 0 {name=x53 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 1840 390 0 0 {name=x54 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1680 410 0 0 {name=p129 sig_type=std_logic lab=EN_OFFSET_CAL}
C {devices/opin.sym} 1880 390 0 0 {name=p130 lab=OFFSET_CAL_CYCLE}
C {sky130_stdcells/nand2_1.sym} 1740 530 0 0 {name=x55 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 1840 530 0 0 {name=x56 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1680 550 0 0 {name=p132 sig_type=std_logic lab=EN_OFFSET_CAL}
C {devices/opin.sym} 1880 530 0 0 {name=p133 lab=EN_OFFSET_CAL_O}
C {devices/lab_pin.sym} 1680 510 0 0 {name=p131 sig_type=std_logic lab=RST_Zi}
C {sky130_stdcells/inv_4.sym} 820 -990 0 0 {name=x57 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 820 -920 0 0 {name=x58 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 1720 -780 0 0 {name=p43 lab=DAC_SETTLE}
C {devices/lab_pin.sym} 860 -360 0 1 {name=p13 sig_type=std_logic lab=SAMPLE}
C {devices/ipin.sym} 1360 -1040 0 0 {name=p44 lab=DAC_SETTLE_D}
C {devices/ipin.sym} 200 -340 0 0 {name=p17 lab=SAMPLE_D}
C {sky130_stdcells/mux2_1.sym} 3480 -640 0 0 {name=x13[5:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 3860 -440 0 0 {name=p51 lab=CLK_DATA}
C {sky130_stdcells/inv_4.sym} 3640 -440 0 0 {name=x19 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 3560 -440 0 0 {name=x35 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 3520 -440 0 0 {name=p72 sig_type=std_logic lab=COUNTER[5]}
C {sky130_stdcells/or2_1.sym} 3340 -500 0 0 {name=x59 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 3280 -520 0 0 {name=p47 sig_type=std_logic lab=COUNTER[4]}
C {devices/lab_pin.sym} 3280 -480 0 0 {name=p73 sig_type=std_logic lab=DONE}
C {devices/opin.sym} 3860 -640 0 0 {name=p74 lab=DATA[5:0]}
C {sky130_stdcells/inv_4.sym} 3640 -640 0 0 {name=x60[5:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_2.sym} 3560 -640 0 0 {name=x61[5:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/nor2_2.sym} 2400 -1160 0 0 {name=x62 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 2340 -1140 0 0 {name=p134 sig_type=std_logic lab=SAMPLE}
C {devices/lab_pin.sym} 2340 -1180 0 0 {name=p75 sig_type=std_logic lab=RSTi}
C {devices/lab_pin.sym} 2460 -1160 0 1 {name=p66 sig_type=std_logic lab=RST_RES_REG_Z}
C {devices/lab_pin.sym} 3100 -1020 0 0 {name=p135 sig_type=std_logic lab=RST_RES_REG_Z}
C {devices/lab_pin.sym} 3440 -660 0 0 {name=p136 sig_type=std_logic lab=RESULT_Z[11:6]}
C {devices/lab_pin.sym} 3440 -620 0 0 {name=p45 sig_type=std_logic lab=RESULT_Z[5:0]}
C {devices/lab_pin.sym} 2140 -460 0 1 {name=p46 sig_type=std_logic lab=VCM_Z_O[10:0]}
C {sky130_stdcells/mux4_1.sym} 4180 -860 0 0 {name=x33 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux4_1.sym} 4180 -600 0 0 {name=x34 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux4_4.sym} 4520 -460 0 0 {name=x42 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 4140 -500 0 0 {name=p89 sig_type=std_logic lab=DEBUG_MUX[0]}
C {devices/lab_pin.sym} 4140 -470 0 0 {name=p90 sig_type=std_logic lab=DEBUG_MUX[1]}
C {devices/opin.sym} 4780 -460 0 0 {name=p91 lab=DEBUG_OUT}
C {devices/lab_pin.sym} 4140 -880 0 0 {name=p92 sig_type=std_logic lab=IDLE}
C {devices/lab_pin.sym} 4140 -840 0 0 {name=p93 sig_type=std_logic lab=CONVERT}
C {devices/lab_pin.sym} 4140 -920 0 0 {name=p99 sig_type=std_logic lab=SAMPLE}
C {devices/lab_pin.sym} 4140 -660 0 0 {name=p119 sig_type=std_logic lab=CLK_COUNTER_Z}
C {devices/lab_pin.sym} 4140 -800 0 0 {name=p120 sig_type=std_logic lab=CLK_PULSE}
C {sky130_stdcells/mux4_1.sym} 4170 -340 0 0 {name=x50 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/mux4_1.sym} 4170 -80 0 0 {name=x60 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 4130 20 0 0 {name=p143 sig_type=std_logic lab=DEBUG_MUX[0]}
C {devices/lab_pin.sym} 4130 50 0 0 {name=p144 sig_type=std_logic lab=DEBUG_MUX[1]}
C {devices/lab_pin.sym} 4140 -620 0 0 {name=p145 sig_type=std_logic lab=EN_COMP}
C {devices/lab_pin.sym} 4140 -580 0 0 {name=p146 sig_type=std_logic lab=SAMPLE_D}
C {devices/lab_pin.sym} 4140 -540 0 0 {name=p147 sig_type=std_logic lab=DAC_SETTLE}
C {devices/lab_pin.sym} 4130 -400 0 0 {name=p148 sig_type=std_logic lab=DAC_SETTLE_D}
C {devices/lab_pin.sym} 4130 -360 0 0 {name=p149 sig_type=std_logic lab=COMP_DECIDED}
C {devices/lab_pin.sym} 4130 -320 0 0 {name=p150 sig_type=std_logic lab=COMP_P}
C {devices/lab_pin.sym} 4130 -280 0 0 {name=p151 sig_type=std_logic lab=COMP_N}
C {devices/lab_pin.sym} 4130 -140 0 0 {name=p137 sig_type=std_logic lab=DONE}
C {devices/lab_pin.sym} 4130 -60 0 0 {name=p138 sig_type=std_logic lab=COUNTER[5]}
C {devices/lab_pin.sym} 4130 -100 0 0 {name=p139 sig_type=std_logic lab=COUNTER[11]}
C {devices/lab_pin.sym} 4130 -20 0 0 {name=p152 sig_type=std_logic lab=COUNTER[0]}
C {devices/ipin.sym} 3880 -720 0 0 {name=p153 lab=DEBUG_MUX[3:0]}
C {devices/lab_pin.sym} 4130 -240 0 0 {name=p69 sig_type=std_logic lab=DEBUG_MUX[0]}
C {devices/lab_pin.sym} 4130 -210 0 0 {name=p70 sig_type=std_logic lab=DEBUG_MUX[1]}
C {devices/lab_pin.sym} 4140 -760 0 0 {name=p141 sig_type=std_logic lab=DEBUG_MUX[0]}
C {devices/lab_pin.sym} 4140 -730 0 0 {name=p142 sig_type=std_logic lab=DEBUG_MUX[1]}
C {devices/lab_pin.sym} 4480 -360 0 0 {name=p36 sig_type=std_logic lab=DEBUG_MUX[2]}
C {devices/lab_pin.sym} 4480 -330 0 0 {name=p140 sig_type=std_logic lab=DEBUG_MUX[3]}
C {devices/lab_pin.sym} 1440 40 0 0 {name=p94 sig_type=std_logic lab=EN_VCM_SW_O}
C {devices/lab_pin.sym} 1610 -40 0 0 {name=p97 sig_type=std_logic lab=COUNTER[11]}
C {sky130_stdcells/or2_1.sym} 1500 20 0 0 {name=x43 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1180 -530 0 0 {name=p154 sig_type=std_logic lab=CONVERT}
C {devices/lab_pin.sym} 1520 160 0 0 {name=p85 sig_type=std_logic lab=IDLE}
C {sky130_stdcells/inv_1.sym} 1560 160 0 0 {name=x61 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 2880 -460 0 0 {name=p80 lab=VREF_Z_P_O[10:0]}
C {devices/opin.sym} 2880 -360 0 0 {name=p81 lab=VSS_P_O[10:0]}
C {devices/opin.sym} 2880 -260 0 0 {name=p33 lab=VREF_Z_N_O[10:0]}
C {devices/opin.sym} 2880 -160 0 0 {name=p34 lab=VSS_N_O[10:0]}
C {sky130_stdcells/inv_8.sym} 4620 -460 0 0 {name=x63 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 4720 -460 0 0 {name=x64 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_8.sym} 3720 -640 0 0 {name=x6[5:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 3800 -640 0 0 {name=x14[5:0] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 3800 -440 0 0 {name=x65 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_4.sym} 3720 -440 0 0 {name=x66 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
