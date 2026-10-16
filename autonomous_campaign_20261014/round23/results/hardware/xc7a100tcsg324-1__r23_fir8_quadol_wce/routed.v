// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 16:20:15 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/results/hardware/xc7a100tcsg324-1__r23_fir8_quadol_wce/routed.v
// Design      : r23_fir8_quadol_wce
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module r21_mac8_add8_b256_column_mse_quadol_wce
   (p,
    busy_reg,
    a,
    D,
    clk,
    b0,
    index_reg,
    index_reg_4_sp_1,
    Q,
    c87_i_4_0,
    c87_i_4_1,
    c87_i_4_2,
    c87_i_4_3,
    c87_i_4_4,
    c87_i_4_5,
    c87_i_4_6,
    c87_i_2_0,
    c87_i_2_1,
    c87_i_2_2,
    c87_i_2_3,
    c87_i_2_4,
    c87_i_2_5,
    c87_i_2_6,
    c87_i_2_7,
    s2,
    S,
    \Y_reg[11] ,
    \Y_reg[15] );
  output [11:0]p;
  output busy_reg;
  output [0:0]a;
  output [27:0]D;
  input clk;
  input [7:0]b0;
  input [4:0]index_reg;
  input index_reg_4_sp_1;
  input [7:0]Q;
  input [7:0]c87_i_4_0;
  input [7:0]c87_i_4_1;
  input [7:0]c87_i_4_2;
  input [7:0]c87_i_4_3;
  input [7:0]c87_i_4_4;
  input [7:0]c87_i_4_5;
  input [7:0]c87_i_4_6;
  input [7:0]c87_i_2_0;
  input [7:0]c87_i_2_1;
  input [7:0]c87_i_2_2;
  input [7:0]c87_i_2_3;
  input [7:0]c87_i_2_4;
  input [7:0]c87_i_2_5;
  input [7:0]c87_i_2_6;
  input [7:0]c87_i_2_7;
  input s2;
  input [3:0]S;
  input [3:0]\Y_reg[11] ;
  input [3:0]\Y_reg[15] ;

  wire [27:0]D;
  wire [7:0]Q;
  wire [3:0]S;
  wire [3:0]\Y_reg[11] ;
  wire \Y_reg[11]_i_1_n_0 ;
  wire [3:0]\Y_reg[15] ;
  wire \Y_reg[15]_i_1_n_0 ;
  wire \Y_reg[19]_i_1_n_0 ;
  wire \Y_reg[23]_i_1_n_0 ;
  wire \Y_reg[27]_i_1_n_0 ;
  wire \Y_reg[7]_i_1_n_0 ;
  wire [0:0]a;
  wire [0:0]a__0;
  wire [6:1]a__0__0;
  wire [7:0]b0;
  wire [0:0]b__0;
  wire busy_reg;
  wire c104_i_2_n_0;
  wire c106_i_2_n_0;
  wire c86_i_2_n_0;
  wire c86_i_3_n_0;
  wire c86_i_4_n_0;
  wire c86_i_5_n_0;
  wire c86_i_6_n_0;
  wire c87_i_10_n_0;
  wire c87_i_11_n_0;
  wire c87_i_12_n_0;
  wire c87_i_13_n_0;
  wire [7:0]c87_i_2_0;
  wire [7:0]c87_i_2_1;
  wire [7:0]c87_i_2_2;
  wire [7:0]c87_i_2_3;
  wire [7:0]c87_i_2_4;
  wire [7:0]c87_i_2_5;
  wire [7:0]c87_i_2_6;
  wire [7:0]c87_i_2_7;
  wire [7:0]c87_i_4_0;
  wire [7:0]c87_i_4_1;
  wire [7:0]c87_i_4_2;
  wire [7:0]c87_i_4_3;
  wire [7:0]c87_i_4_4;
  wire [7:0]c87_i_4_5;
  wire [7:0]c87_i_4_6;
  wire c87_i_4_n_0;
  wire c87_i_5_n_0;
  wire c87_i_6_n_0;
  wire c87_i_7_n_0;
  wire c87_i_8_n_0;
  wire c87_i_9_n_0;
  wire c88_i_3_n_0;
  wire c88_i_4_n_0;
  wire c88_i_5_n_0;
  wire c88_i_6_n_0;
  wire c88_i_7_n_0;
  wire c89_i_3_n_0;
  wire c89_i_4_n_0;
  wire c89_i_5_n_0;
  wire c89_i_6_n_0;
  wire c89_i_7_n_0;
  wire c90_i_3_n_0;
  wire c90_i_4_n_0;
  wire c90_i_5_n_0;
  wire c90_i_6_n_0;
  wire c90_i_7_n_0;
  wire c91_i_10_n_0;
  wire c91_i_2_n_0;
  wire c91_i_4_n_0;
  wire c91_i_5_n_0;
  wire c91_i_6_n_0;
  wire c91_i_7_n_0;
  wire c91_i_8_n_0;
  wire c91_i_9_n_0;
  wire c92_i_10_n_0;
  wire c92_i_11_n_0;
  wire c92_i_2_n_0;
  wire c92_i_6_n_0;
  wire c92_i_7_n_0;
  wire c92_i_8_n_0;
  wire c92_i_9_n_0;
  wire clk;
  wire [2:0]history;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire [7:1]ma;
  wire [7:1]mb;
  wire [11:0]p;
  wire s2;
  wire v_100;
  wire v_101;
  wire v_102;
  wire v_103;
  wire v_104;
  wire v_105;
  wire v_106;
  wire v_107;
  wire v_108;
  wire v_109;
  wire v_110;
  wire v_111;
  wire v_112;
  wire v_113;
  wire v_114;
  wire v_115;
  wire v_116;
  wire v_117;
  wire v_118;
  wire v_119;
  wire v_120;
  wire v_121;
  wire v_122;
  wire v_123;
  wire v_124;
  wire v_125;
  wire v_126;
  wire v_127;
  wire v_128;
  wire v_129;
  wire v_130;
  wire v_134;
  wire v_136;
  wire v_137;
  wire v_138;
  wire v_141;
  wire v_142;
  wire v_143;
  wire v_144;
  wire v_145;
  wire v_146;
  wire v_148;
  wire v_150;
  wire v_151;
  wire v_152;
  wire v_153;
  wire v_154;
  wire v_158;
  wire v_159;
  wire v_164;
  wire v_165;
  wire v_166;
  wire v_172;
  wire v_173;
  wire v_174;
  wire v_183;
  wire v_193;
  wire v_194;
  wire v_195;
  wire v_203;
  wire v_205;
  wire v_206;
  wire v_208;
  wire v_209;
  wire v_51;
  wire v_52;
  wire v_53;
  wire v_54;
  wire v_55;
  wire v_56;
  wire v_57;
  wire v_58;
  wire v_59;
  wire v_60;
  wire v_61;
  wire v_62;
  wire v_63;
  wire v_64;
  wire v_66;
  wire v_67;
  wire v_68;
  wire v_69;
  wire v_70;
  wire v_71;
  wire v_72;
  wire v_73;
  wire v_74;
  wire v_75;
  wire v_76;
  wire v_77;
  wire v_78;
  wire v_79;
  wire v_80;
  wire v_81;
  wire v_82;
  wire v_83;
  wire v_84;
  wire v_85;
  wire v_86;
  wire v_87;
  wire v_88;
  wire v_89;
  wire v_90;
  wire v_91;
  wire v_92;
  wire v_93;
  wire v_94;
  wire v_95;
  wire v_96;
  wire v_97;
  wire v_98;
  wire v_99;
  wire [2:0]\NLW_Y_reg[11]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[15]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[19]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[23]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[27]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[31]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[7]_i_1_CO_UNCONNECTED ;
  wire [2:0]NLW_c66_CO_UNCONNECTED;
  wire [2:0]NLW_c67_CO_UNCONNECTED;
  wire [0:0]NLW_c67_O_UNCONNECTED;
  wire [3:0]NLW_c71_CO_UNCONNECTED;
  wire [3:3]NLW_c71_O_UNCONNECTED;
  wire [3:0]NLW_c72_CO_UNCONNECTED;
  wire [3:2]NLW_c72_O_UNCONNECTED;
  wire [2:0]NLW_c73_CO_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;
  wire [3:2]NLW_c74_O_UNCONNECTED;
  wire [2:0]NLW_c83_CO_UNCONNECTED;
  wire [0:0]NLW_c83_O_UNCONNECTED;
  wire [2:0]NLW_c84_CO_UNCONNECTED;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[11]_i_1 
       (.CI(\Y_reg[7]_i_1_n_0 ),
        .CO({\Y_reg[11]_i_1_n_0 ,\NLW_Y_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[7:4]),
        .S(\Y_reg[11] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[15]_i_1 
       (.CI(\Y_reg[11]_i_1_n_0 ),
        .CO({\Y_reg[15]_i_1_n_0 ,\NLW_Y_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[11:8]),
        .S(\Y_reg[15] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[19]_i_1 
       (.CI(\Y_reg[15]_i_1_n_0 ),
        .CO({\Y_reg[19]_i_1_n_0 ,\NLW_Y_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[15:12]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[23]_i_1 
       (.CI(\Y_reg[19]_i_1_n_0 ),
        .CO({\Y_reg[23]_i_1_n_0 ,\NLW_Y_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[19:16]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[27]_i_1 
       (.CI(\Y_reg[23]_i_1_n_0 ),
        .CO({\Y_reg[27]_i_1_n_0 ,\NLW_Y_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[23:20]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_1 
       (.CI(\Y_reg[27]_i_1_n_0 ),
        .CO(\NLW_Y_reg[31]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[27:24]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[7]_i_1 
       (.CI(1'b0),
        .CO({\Y_reg[7]_i_1_n_0 ,\NLW_Y_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(s2),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[3:0]),
        .S(S));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c10
       (.I0(v_59),
        .I1(v_60),
        .I2(v_58),
        .O(v_82));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c101
       (.C(clk),
        .CE(1'b1),
        .D(mb[1]),
        .Q(v_85),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h10302000)) 
    c101_i_1
       (.I0(b0[0]),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[7]),
        .I4(b0[1]),
        .O(mb[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c102
       (.C(clk),
        .CE(1'b1),
        .D(mb[2]),
        .Q(v_54),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h01000F000E000000)) 
    c102_i_1
       (.I0(b0[0]),
        .I1(b0[1]),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[7]),
        .I5(b0[2]),
        .O(mb[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c103
       (.C(clk),
        .CE(1'b1),
        .D(mb[3]),
        .Q(v_56),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0100FF00FE000000)) 
    c103_i_1
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(busy_reg),
        .I4(b0[7]),
        .I5(b0[3]),
        .O(mb[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c104
       (.C(clk),
        .CE(1'b1),
        .D(mb[4]),
        .Q(v_123),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h20301000)) 
    c104_i_1
       (.I0(c104_i_2_n_0),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[7]),
        .I4(b0[4]),
        .O(mb[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0001FFFF)) 
    c104_i_2
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(b0[3]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
        .O(c104_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c105
       (.C(clk),
        .CE(1'b1),
        .D(mb[5]),
        .Q(v_90),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c105_i_1
       (.I0(b0[4]),
        .I1(c104_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[7]),
        .I5(b0[5]),
        .O(mb[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c106
       (.C(clk),
        .CE(1'b1),
        .D(mb[6]),
        .Q(v_88),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c106_i_1
       (.I0(b0[5]),
        .I1(c106_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[7]),
        .I5(b0[6]),
        .O(mb[6]));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    c106_i_2
       (.I0(b0[3]),
        .I1(b0[0]),
        .I2(b0[1]),
        .I3(b0[2]),
        .I4(b0[4]),
        .I5(busy_reg),
        .O(c106_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c107
       (.C(clk),
        .CE(1'b1),
        .D(mb[7]),
        .Q(v_92),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    c107_i_1
       (.I0(index_reg[4]),
        .I1(index_reg_4_sn_1),
        .I2(b0[7]),
        .I3(b0[5]),
        .I4(c106_i_2_n_0),
        .I5(b0[6]),
        .O(mb[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c11
       (.I0(v_78),
        .I1(v_84),
        .I2(v_77),
        .I3(v_51),
        .I4(v_74),
        .I5(v_73),
        .O(v_83));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c12
       (.I0(v_53),
        .I1(v_54),
        .I2(v_55),
        .I3(v_56),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c13
       (.I0(v_53),
        .I1(v_85),
        .I2(v_56),
        .I3(v_55),
        .I4(v_54),
        .I5(v_86),
        .O(v_62));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c14
       (.I0(v_55),
        .I1(v_85),
        .I2(v_56),
        .I3(v_70),
        .I4(v_54),
        .I5(v_86),
        .O(v_63));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c15
       (.I0(v_86),
        .I1(v_54),
        .I2(v_56),
        .I3(v_70),
        .I4(v_85),
        .I5(v_55),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c16
       (.I0(v_55),
        .I1(v_54),
        .I2(v_85),
        .I3(v_53),
        .I4(v_56),
        .I5(v_86),
        .O(v_66));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c17
       (.I0(v_88),
        .I1(v_89),
        .I2(v_90),
        .I3(v_69),
        .I4(v_91),
        .I5(v_92),
        .O(v_87));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c18
       (.I0(v_90),
        .I1(v_89),
        .I2(v_92),
        .I3(v_94),
        .O(v_93));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c19
       (.I0(v_94),
        .I1(v_88),
        .O(v_95));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hA666AAAA)) 
    c2
       (.I0(v_52),
        .I1(v_53),
        .I2(v_54),
        .I3(v_55),
        .I4(v_56),
        .O(v_51));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    c20
       (.I0(v_87),
        .I1(v_92),
        .I2(v_89),
        .I3(v_94),
        .I4(v_90),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c21
       (.I0(v_73),
        .I1(v_51),
        .I2(v_74),
        .I3(v_57),
        .O(v_97));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c22
       (.I0(v_94),
        .I1(v_92),
        .I2(v_89),
        .I3(v_90),
        .I4(v_88),
        .I5(v_91),
        .O(v_98));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c23
       (.I0(v_88),
        .I1(v_94),
        .I2(v_90),
        .I3(v_91),
        .O(v_99));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c24
       (.I0(v_85),
        .I1(v_86),
        .O(v_71));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c25
       (.I0(v_53),
        .I1(v_54),
        .I2(v_55),
        .I3(v_56),
        .O(v_75));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c26
       (.I0(v_58),
        .I1(v_60),
        .I2(v_59),
        .I3(v_67),
        .I4(v_101),
        .I5(v_102),
        .O(v_100));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c27
       (.I0(v_67),
        .I1(v_101),
        .I2(v_102),
        .I3(v_68),
        .I4(v_81),
        .I5(v_80),
        .O(v_103));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c28
       (.I0(v_72),
        .I1(v_78),
        .I2(v_77),
        .I3(v_84),
        .I4(v_105),
        .I5(v_106),
        .O(v_104));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c29
       (.I0(v_57),
        .I1(v_76),
        .I2(v_73),
        .I3(v_74),
        .I4(v_51),
        .O(v_107));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c3
       (.I0(v_58),
        .I1(v_59),
        .I2(v_60),
        .O(v_57));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    c30
       (.I0(v_100),
        .I1(v_74),
        .I2(v_51),
        .I3(v_73),
        .I4(v_57),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c31
       (.I0(v_79),
        .I1(v_82),
        .I2(v_102),
        .I3(v_101),
        .I4(v_67),
        .O(v_109));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hC0808080)) 
    c32
       (.I0(v_52),
        .I1(v_56),
        .I2(v_53),
        .I3(v_54),
        .I4(v_55),
        .O(v_84));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c33
       (.I0(v_55),
        .I1(v_90),
        .I2(v_86),
        .I3(v_92),
        .I4(v_70),
        .I5(v_88),
        .O(v_110));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c34
       (.I0(v_90),
        .I1(v_86),
        .I2(v_70),
        .I3(v_88),
        .I4(v_92),
        .I5(v_69),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c35
       (.I0(v_70),
        .I1(v_90),
        .I2(v_92),
        .I3(v_89),
        .I4(v_88),
        .I5(v_69),
        .O(v_112));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c36
       (.I0(v_69),
        .I1(v_90),
        .I2(v_92),
        .I3(v_89),
        .I4(v_88),
        .I5(v_91),
        .O(v_113));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c37
       (.I0(v_110),
        .I1(v_53),
        .I2(v_90),
        .I3(v_115),
        .I4(v_88),
        .I5(v_55),
        .O(v_114));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c38
       (.I0(v_111),
        .I1(v_92),
        .I2(v_70),
        .I3(v_117),
        .I4(v_86),
        .I5(v_88),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    c39
       (.I0(v_112),
        .I1(v_90),
        .I2(v_86),
        .I3(v_69),
        .I4(v_92),
        .I5(v_119),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c4
       (.I0(v_61),
        .I1(v_62),
        .I2(v_63),
        .I3(v_64),
        .I4(v_203),
        .I5(v_66),
        .O(v_60));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c40
       (.I0(v_113),
        .I1(v_90),
        .I2(v_70),
        .I3(v_121),
        .I4(v_88),
        .I5(v_69),
        .O(v_120));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c41
       (.I0(v_53),
        .I1(v_123),
        .O(v_122));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c42
       (.I0(v_55),
        .I1(v_123),
        .O(v_124));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'hFFFFEA80EA800000)) 
    c43
       (.I0(v_63),
        .I1(v_64),
        .I2(v_203),
        .I3(v_66),
        .I4(v_61),
        .I5(v_62),
        .O(v_52));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c44
       (.I0(v_86),
        .I1(v_92),
        .O(v_115));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v_90),
        .I1(v_55),
        .O(v_117));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v_70),
        .I1(v_88),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v_92),
        .I1(v_89),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h11171777EEE8E888)) 
    c48
       (.I0(v_105),
        .I1(v_106),
        .I2(v_78),
        .I3(v_77),
        .I4(v_84),
        .I5(v_126),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c49
       (.I0(v_55),
        .I1(v_92),
        .I2(v_53),
        .I3(v_88),
        .O(v_127));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c5
       (.I0(v_64),
        .I1(v_203),
        .I2(v_66),
        .I3(v_63),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c50
       (.I0(v_53),
        .I1(v_90),
        .I2(v_86),
        .I3(v_92),
        .I4(v_88),
        .I5(v_55),
        .O(v_128));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c51
       (.I0(v_88),
        .I1(v_55),
        .I2(v_92),
        .I3(v_53),
        .O(v_129));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c52
       (.I0(v_86),
        .I1(v_90),
        .I2(v_88),
        .I3(v_53),
        .I4(v_92),
        .I5(v_55),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    c54
       (.I0(v_137),
        .I1(v_123),
        .I2(v_69),
        .I3(v_53),
        .I4(v_134),
        .O(v_136));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c55
       (.I0(v_134),
        .I1(v_55),
        .I2(v_89),
        .I3(v_123),
        .O(v_138));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c56
       (.I0(v_80),
        .I1(v_81),
        .I2(v_68),
        .O(v_141));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    c57
       (.I0(v_68),
        .I1(v_81),
        .I2(v_80),
        .I3(v_67),
        .I4(v_101),
        .I5(v_102),
        .O(v_142));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'h69696996)) 
    c58
       (.I0(v_68),
        .I1(v_81),
        .I2(v_80),
        .I3(v_144),
        .I4(v_205),
        .O(v_143));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c59
       (.I0(v_144),
        .I1(v_205),
        .I2(v_146),
        .O(v_145));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFF135F8000ECA0)) 
    c6
       (.I0(v_54),
        .I1(v_69),
        .I2(v_70),
        .I3(v_56),
        .I4(v_71),
        .I5(v_64),
        .O(v_68));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c60
       (.I0(v_55),
        .I1(v_134),
        .I2(v_89),
        .I3(v_123),
        .O(v_137));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c61
       (.I0(v_86),
        .I1(v_123),
        .O(v_148));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c63
       (.C(clk),
        .CE(1'b1),
        .D(v_150),
        .Q(p[6]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c64
       (.C(clk),
        .CE(1'b1),
        .D(v_151),
        .Q(p[7]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c65
       (.C(clk),
        .CE(1'b1),
        .D(v_152),
        .Q(p[8]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c66
       (.CI(v_153),
        .CO({v_154,NLW_c66_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v_83,v_97,v_100,v_103}),
        .O({v_152,v_151,v_150,v_158}),
        .S({v_104,v_107,v_108,v_109}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c67
       (.CI(1'b0),
        .CO({v_159,NLW_c67_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v_87,v_93,v_95,1'b0}),
        .O({v_101,v_81,v_144,NLW_c67_O_UNCONNECTED[0]}),
        .S({v_96,v_98,v_99,1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c68
       (.C(clk),
        .CE(1'b1),
        .D(v_164),
        .Q(p[9]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c69
       (.C(clk),
        .CE(1'b1),
        .D(v_165),
        .Q(p[10]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE88E8EE88EE88EE8)) 
    c7
       (.I0(v_73),
        .I1(v_74),
        .I2(v_52),
        .I3(v_75),
        .I4(v_56),
        .I5(v_53),
        .O(v_72));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(1'b1),
        .D(v_166),
        .Q(p[11]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c71
       (.CI(v_154),
        .CO(NLW_c71_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,v_126}),
        .O({NLW_c71_O_UNCONNECTED[3],v_166,v_165,v_164}),
        .S({1'b0,v_172,v_173,v_125}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c72
       (.CI(v_174),
        .CO({NLW_c72_CO_UNCONNECTED[3],v_172,NLW_c72_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,v_127,v_128}),
        .O({NLW_c72_O_UNCONNECTED[3:2],v_173,v_126}),
        .S({1'b0,1'b1,v_129,v_130}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c73
       (.CI(v_159),
        .CO({v_174,NLW_c73_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v_110,v_111,v_112,v_113}),
        .O({v_106,v_77,v_74,v_59}),
        .S({v_114,v_116,v_118,v_120}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(v_183),
        .CO({NLW_c74_CO_UNCONNECTED[3],v_105,NLW_c74_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_c74_O_UNCONNECTED[3:2],v_78,v_73}),
        .S({1'b0,1'b1,v_122,v_124}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c78
       (.C(clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(p[0]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hA999955556666AAA)) 
    c8
       (.I0(v_77),
        .I1(v_52),
        .I2(v_56),
        .I3(v_53),
        .I4(v_75),
        .I5(v_78),
        .O(v_76));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c80
       (.C(clk),
        .CE(1'b1),
        .D(v_193),
        .Q(p[2]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c81
       (.C(clk),
        .CE(1'b1),
        .D(v_194),
        .Q(p[3]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c82
       (.C(clk),
        .CE(1'b1),
        .D(v_195),
        .Q(p[4]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c83
       (.CI(1'b0),
        .CO({v_153,NLW_c83_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,v_141,v_146,1'b0}),
        .O({v_195,v_194,v_193,NLW_c83_O_UNCONNECTED[0]}),
        .S({v_142,v_143,v_145,1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c84
       (.CI(1'b0),
        .CO({v_183,NLW_c84_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,v_206,v_137,1'b0}),
        .O({v_58,v_102,v_80,v_146}),
        .S({v_148,v_208,v_136,v_138}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(1'b1),
        .D(v_158),
        .Q(p[5]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c86
       (.C(clk),
        .CE(1'b1),
        .D(a__0),
        .Q(v_94),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c86_i_1
       (.I0(busy_reg),
        .I1(c86_i_2_n_0),
        .I2(index_reg[3]),
        .I3(c86_i_3_n_0),
        .I4(index_reg[2]),
        .I5(c86_i_4_n_0),
        .O(a__0));
  MUXF7 c86_i_2
       (.I0(c86_i_5_n_0),
        .I1(c86_i_6_n_0),
        .O(c86_i_2_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c86_i_3
       (.I0(c87_i_2_0[0]),
        .I1(c87_i_2_1[0]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[0]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[0]),
        .O(c86_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c86_i_4
       (.I0(c87_i_2_4[0]),
        .I1(c87_i_2_5[0]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[0]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[0]),
        .O(c86_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c86_i_5
       (.I0(Q[0]),
        .I1(c87_i_4_0[0]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[0]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[0]),
        .O(c86_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c86_i_6
       (.I0(c87_i_4_3[0]),
        .I1(c87_i_4_4[0]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[0]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[0]),
        .O(c86_i_6_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c87
       (.C(clk),
        .CE(1'b1),
        .D(ma[1]),
        .Q(v_91),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    c87_i_1
       (.I0(a__0),
        .I1(a),
        .I2(a__0__0[1]),
        .O(ma[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_10
       (.I0(Q[7]),
        .I1(c87_i_4_0[7]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[7]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[7]),
        .O(c87_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_11
       (.I0(c87_i_4_3[7]),
        .I1(c87_i_4_4[7]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[7]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[7]),
        .O(c87_i_11_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_12
       (.I0(Q[1]),
        .I1(c87_i_4_0[1]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[1]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[1]),
        .O(c87_i_12_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_13
       (.I0(c87_i_4_3[1]),
        .I1(c87_i_4_4[1]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[1]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[1]),
        .O(c87_i_13_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c87_i_2
       (.I0(busy_reg),
        .I1(c87_i_4_n_0),
        .I2(index_reg[3]),
        .I3(c87_i_5_n_0),
        .I4(index_reg[2]),
        .I5(c87_i_6_n_0),
        .O(a));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c87_i_3
       (.I0(busy_reg),
        .I1(c87_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c87_i_8_n_0),
        .I4(index_reg[2]),
        .I5(c87_i_9_n_0),
        .O(a__0__0[1]));
  MUXF7 c87_i_4
       (.I0(c87_i_10_n_0),
        .I1(c87_i_11_n_0),
        .O(c87_i_4_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_5
       (.I0(c87_i_2_0[7]),
        .I1(c87_i_2_1[7]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[7]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[7]),
        .O(c87_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_6
       (.I0(c87_i_2_4[7]),
        .I1(c87_i_2_5[7]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[7]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[7]),
        .O(c87_i_6_n_0));
  MUXF7 c87_i_7
       (.I0(c87_i_12_n_0),
        .I1(c87_i_13_n_0),
        .O(c87_i_7_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_8
       (.I0(c87_i_2_0[1]),
        .I1(c87_i_2_1[1]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[1]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[1]),
        .O(c87_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c87_i_9
       (.I0(c87_i_2_4[1]),
        .I1(c87_i_2_5[1]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[1]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[1]),
        .O(c87_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c88
       (.C(clk),
        .CE(1'b1),
        .D(ma[2]),
        .Q(v_89),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    c88_i_1
       (.I0(a__0),
        .I1(a__0__0[1]),
        .I2(a),
        .I3(a__0__0[2]),
        .O(ma[2]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c88_i_2
       (.I0(busy_reg),
        .I1(c88_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c88_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c88_i_5_n_0),
        .O(a__0__0[2]));
  MUXF7 c88_i_3
       (.I0(c88_i_6_n_0),
        .I1(c88_i_7_n_0),
        .O(c88_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c88_i_4
       (.I0(c87_i_2_0[2]),
        .I1(c87_i_2_1[2]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[2]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[2]),
        .O(c88_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c88_i_5
       (.I0(c87_i_2_4[2]),
        .I1(c87_i_2_5[2]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[2]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[2]),
        .O(c88_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c88_i_6
       (.I0(Q[2]),
        .I1(c87_i_4_0[2]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[2]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[2]),
        .O(c88_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c88_i_7
       (.I0(c87_i_4_3[2]),
        .I1(c87_i_4_4[2]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[2]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[2]),
        .O(c88_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c89
       (.C(clk),
        .CE(1'b1),
        .D(ma[3]),
        .Q(v_69),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01FFFE00)) 
    c89_i_1
       (.I0(a__0__0[2]),
        .I1(a__0__0[1]),
        .I2(a__0),
        .I3(a),
        .I4(a__0__0[3]),
        .O(ma[3]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c89_i_2
       (.I0(busy_reg),
        .I1(c89_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c89_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c89_i_5_n_0),
        .O(a__0__0[3]));
  MUXF7 c89_i_3
       (.I0(c89_i_6_n_0),
        .I1(c89_i_7_n_0),
        .O(c89_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c89_i_4
       (.I0(c87_i_2_0[3]),
        .I1(c87_i_2_1[3]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[3]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[3]),
        .O(c89_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c89_i_5
       (.I0(c87_i_2_4[3]),
        .I1(c87_i_2_5[3]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[3]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[3]),
        .O(c89_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c89_i_6
       (.I0(Q[3]),
        .I1(c87_i_4_0[3]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[3]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[3]),
        .O(c89_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c89_i_7
       (.I0(c87_i_4_3[3]),
        .I1(c87_i_4_4[3]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[3]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[3]),
        .O(c89_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c9
       (.I0(v_80),
        .I1(v_81),
        .I2(v_68),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(1'b1),
        .D(ma[4]),
        .Q(v_70),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000)) 
    c90_i_1
       (.I0(a__0__0[3]),
        .I1(a__0),
        .I2(a__0__0[1]),
        .I3(a__0__0[2]),
        .I4(a),
        .I5(a__0__0[4]),
        .O(ma[4]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c90_i_2
       (.I0(busy_reg),
        .I1(c90_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c90_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c90_i_5_n_0),
        .O(a__0__0[4]));
  MUXF7 c90_i_3
       (.I0(c90_i_6_n_0),
        .I1(c90_i_7_n_0),
        .O(c90_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c90_i_4
       (.I0(c87_i_2_0[4]),
        .I1(c87_i_2_1[4]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[4]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[4]),
        .O(c90_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c90_i_5
       (.I0(c87_i_2_4[4]),
        .I1(c87_i_2_5[4]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[4]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[4]),
        .O(c90_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c90_i_6
       (.I0(Q[4]),
        .I1(c87_i_4_0[4]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[4]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[4]),
        .O(c90_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c90_i_7
       (.I0(c87_i_4_3[4]),
        .I1(c87_i_4_4[4]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[4]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[4]),
        .O(c90_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(1'b1),
        .D(ma[5]),
        .Q(v_86),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c91_i_1
       (.I0(a__0__0[4]),
        .I1(a__0__0[2]),
        .I2(c91_i_2_n_0),
        .I3(a__0__0[3]),
        .I4(a),
        .I5(a__0__0[5]),
        .O(ma[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c91_i_10
       (.I0(c87_i_4_3[5]),
        .I1(c87_i_4_4[5]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[5]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[5]),
        .O(c91_i_10_n_0));
  LUT6 #(
    .INIT(64'h05000533FFFFFFFF)) 
    c91_i_2
       (.I0(c91_i_4_n_0),
        .I1(c87_i_7_n_0),
        .I2(c91_i_5_n_0),
        .I3(index_reg[3]),
        .I4(c86_i_2_n_0),
        .I5(busy_reg),
        .O(c91_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c91_i_3
       (.I0(busy_reg),
        .I1(c91_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c91_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c91_i_8_n_0),
        .O(a__0__0[5]));
  MUXF7 c91_i_4
       (.I0(c87_i_8_n_0),
        .I1(c87_i_9_n_0),
        .O(c91_i_4_n_0),
        .S(index_reg[2]));
  MUXF7 c91_i_5
       (.I0(c86_i_3_n_0),
        .I1(c86_i_4_n_0),
        .O(c91_i_5_n_0),
        .S(index_reg[2]));
  MUXF7 c91_i_6
       (.I0(c91_i_9_n_0),
        .I1(c91_i_10_n_0),
        .O(c91_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c91_i_7
       (.I0(c87_i_2_0[5]),
        .I1(c87_i_2_1[5]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[5]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[5]),
        .O(c91_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c91_i_8
       (.I0(c87_i_2_4[5]),
        .I1(c87_i_2_5[5]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[5]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[5]),
        .O(c91_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c91_i_9
       (.I0(Q[5]),
        .I1(c87_i_4_0[5]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[5]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[5]),
        .O(c91_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(1'b1),
        .D(ma[6]),
        .Q(v_55),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c92_i_1
       (.I0(a__0__0[5]),
        .I1(a__0__0[3]),
        .I2(c92_i_2_n_0),
        .I3(a__0__0[4]),
        .I4(a),
        .I5(a__0__0[6]),
        .O(ma[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c92_i_10
       (.I0(Q[6]),
        .I1(c87_i_4_0[6]),
        .I2(index_reg[1]),
        .I3(c87_i_4_1[6]),
        .I4(index_reg[0]),
        .I5(c87_i_4_2[6]),
        .O(c92_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c92_i_11
       (.I0(c87_i_4_3[6]),
        .I1(c87_i_4_4[6]),
        .I2(index_reg[1]),
        .I3(c87_i_4_5[6]),
        .I4(index_reg[0]),
        .I5(c87_i_4_6[6]),
        .O(c92_i_11_n_0));
  LUT6 #(
    .INIT(64'h00000151FFFFFFFF)) 
    c92_i_2
       (.I0(history[0]),
        .I1(c87_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c91_i_4_n_0),
        .I4(history[2]),
        .I5(busy_reg),
        .O(c92_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c92_i_3
       (.I0(busy_reg),
        .I1(c92_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c92_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c92_i_8_n_0),
        .O(a__0__0[6]));
  MUXF8 c92_i_4
       (.I0(c86_i_2_n_0),
        .I1(c91_i_5_n_0),
        .O(history[0]),
        .S(index_reg[3]));
  MUXF8 c92_i_5
       (.I0(c88_i_3_n_0),
        .I1(c92_i_9_n_0),
        .O(history[2]),
        .S(index_reg[3]));
  MUXF7 c92_i_6
       (.I0(c92_i_10_n_0),
        .I1(c92_i_11_n_0),
        .O(c92_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c92_i_7
       (.I0(c87_i_2_0[6]),
        .I1(c87_i_2_1[6]),
        .I2(index_reg[1]),
        .I3(c87_i_2_2[6]),
        .I4(index_reg[0]),
        .I5(c87_i_2_3[6]),
        .O(c92_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c92_i_8
       (.I0(c87_i_2_4[6]),
        .I1(c87_i_2_5[6]),
        .I2(index_reg[1]),
        .I3(c87_i_2_6[6]),
        .I4(index_reg[0]),
        .I5(c87_i_2_7[6]),
        .O(c92_i_8_n_0));
  MUXF7 c92_i_9
       (.I0(c88_i_4_n_0),
        .I1(c88_i_5_n_0),
        .O(c92_i_9_n_0),
        .S(index_reg[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c93
       (.C(clk),
        .CE(1'b1),
        .D(ma[7]),
        .Q(v_53),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    c93_i_1
       (.I0(a),
        .I1(a__0__0[5]),
        .I2(a__0__0[3]),
        .I3(c92_i_2_n_0),
        .I4(a__0__0[4]),
        .I5(a__0__0[6]),
        .O(ma[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c94
       (.C(clk),
        .CE(1'b1),
        .D(b__0),
        .Q(v_134),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    c94_i_1
       (.I0(index_reg[4]),
        .I1(index_reg_4_sn_1),
        .I2(b0[0]),
        .O(b__0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h936C5FA0EC80A000)) 
    direct_quadol_10
       (.I0(v_70),
        .I1(v_85),
        .I2(v_54),
        .I3(v_69),
        .I4(v_86),
        .I5(v_209),
        .O5(v_203),
        .O6(v_205));
  LUT1 #(
    .INIT(2'h1)) 
    direct_quadol_10_i_1
       (.I0(v_56),
        .O(v_209));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h42226AAAE888C000)) 
    direct_quadol_21
       (.I0(v_123),
        .I1(1'b0),
        .I2(v_134),
        .I3(v_53),
        .I4(v_69),
        .I5(v_70),
        .O5(v_206),
        .O6(v_208));
  LUT2 #(
    .INIT(4'h2)) 
    \vpipe[0]_i_1 
       (.I0(index_reg_4_sn_1),
        .I1(index_reg[4]),
        .O(busy_reg));
endmodule

(* ECO_CHECKSUM = "9580125e" *) (* LAT = "3" *) (* TAPS = "16" *) 
(* NotValidForBitStream *)
module r23_fir8_quadol_wce
   (clk,
    reset,
    coeff_we,
    coeff_addr,
    coeff_data,
    sample_valid,
    sample_data,
    sample_ready,
    result_valid,
    result);
  input clk;
  input reset;
  input coeff_we;
  input [3:0]coeff_addr;
  input [7:0]coeff_data;
  input sample_valid;
  input [7:0]sample_data;
  output sample_ready;
  output result_valid;
  output [39:0]result;

  wire \<const0> ;
  wire [39:4]acc;
  wire \acc[39]_i_1_n_0 ;
  wire [7:0]b0;
  wire busy0;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire clk;
  wire [3:0]coeff_addr;
  wire [7:0]coeff_data;
  wire coeff_reg_0_15_0_5_i_1_n_0;
  wire coeff_we;
  wire core_n_1;
  wire core_n_38;
  wire core_n_39;
  wire core_n_40;
  wire core_n_41;
  wire core_n_42;
  wire core_n_43;
  wire core_n_44;
  wire core_n_45;
  wire core_n_46;
  wire core_n_47;
  wire core_n_48;
  wire core_n_49;
  wire core_n_50;
  wire core_n_51;
  wire core_n_52;
  wire core_n_53;
  wire core_n_54;
  wire core_n_55;
  wire core_n_56;
  wire core_n_57;
  wire core_n_58;
  wire core_n_59;
  wire core_n_60;
  wire core_n_61;
  wire core_n_62;
  wire core_n_63;
  wire core_n_64;
  wire core_n_65;
  wire core_n_66;
  wire core_n_67;
  wire core_n_68;
  wire core_n_69;
  wire core_n_70;
  wire core_n_71;
  wire core_n_72;
  wire [1:0]firstpipe;
  wire [2:2]firstpipe__0;
  wire [7:0]\history_reg[0] ;
  wire [7:0]\history_reg[10] ;
  wire [7:0]\history_reg[11] ;
  wire [7:0]\history_reg[12] ;
  wire [7:0]\history_reg[13] ;
  wire [7:0]\history_reg[14] ;
  wire [7:0]\history_reg[15] ;
  wire [7:0]\history_reg[1] ;
  wire [7:0]\history_reg[2] ;
  wire [7:0]\history_reg[3] ;
  wire [7:0]\history_reg[4] ;
  wire [7:0]\history_reg[5] ;
  wire [7:0]\history_reg[6] ;
  wire [7:0]\history_reg[7] ;
  wire [7:0]\history_reg[8] ;
  wire [7:0]\history_reg[9] ;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[4]_i_1_n_0 ;
  wire [4:0]index_reg;
  wire issue;
  wire \lastpipe[0]_i_1_n_0 ;
  wire \lastpipe_reg_n_0_[0] ;
  wire \lastpipe_reg_n_0_[1] ;
  wire [39:4]next_acc;
  wire p_0_in;
  wire [4:4]p_0_in__0;
  wire [0:0]p_0_out;
  wire p_1_in;
  wire reset;
  wire [39:4]\^result ;
  wire \result[39]_i_1_n_0 ;
  wire result_valid;
  wire result_valid_i_1_n_0;
  wire [7:0]sample_data;
  wire sample_ready;
  wire sample_valid;
  wire \vpipe_reg_n_0_[0] ;
  wire \vpipe_reg_n_0_[1] ;
  wire [1:0]NLW_coeff_reg_0_15_0_5_DOD_UNCONNECTED;
  wire NLW_coeff_reg_0_15_6_7_SPO_UNCONNECTED;
  wire NLW_coeff_reg_0_15_6_7__0_SPO_UNCONNECTED;

  assign result[39:4] = \^result [39:4];
  assign result[3] = \<const0> ;
  assign result[2] = \<const0> ;
  assign result[1] = \<const0> ;
  assign result[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \acc[39]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(p_0_in),
        .O(\acc[39]_i_1_n_0 ));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_43),
        .Q(acc[10]),
        .R(reset));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_44),
        .Q(acc[11]),
        .R(reset));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_45),
        .Q(acc[12]),
        .R(reset));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_46),
        .Q(acc[13]),
        .R(reset));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_47),
        .Q(acc[14]),
        .R(reset));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_48),
        .Q(acc[15]),
        .R(reset));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_49),
        .Q(acc[16]),
        .R(reset));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_50),
        .Q(acc[17]),
        .R(reset));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_51),
        .Q(acc[18]),
        .R(reset));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_52),
        .Q(acc[19]),
        .R(reset));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_53),
        .Q(acc[20]),
        .R(reset));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_54),
        .Q(acc[21]),
        .R(reset));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_55),
        .Q(acc[22]),
        .R(reset));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_56),
        .Q(acc[23]),
        .R(reset));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_57),
        .Q(acc[24]),
        .R(reset));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_58),
        .Q(acc[25]),
        .R(reset));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_59),
        .Q(acc[26]),
        .R(reset));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_60),
        .Q(acc[27]),
        .R(reset));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_61),
        .Q(acc[28]),
        .R(reset));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_62),
        .Q(acc[29]),
        .R(reset));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_63),
        .Q(acc[30]),
        .R(reset));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_64),
        .Q(acc[31]),
        .R(reset));
  FDRE \acc_reg[32] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_65),
        .Q(acc[32]),
        .R(reset));
  FDRE \acc_reg[33] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_66),
        .Q(acc[33]),
        .R(reset));
  FDRE \acc_reg[34] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_67),
        .Q(acc[34]),
        .R(reset));
  FDRE \acc_reg[35] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_68),
        .Q(acc[35]),
        .R(reset));
  FDRE \acc_reg[36] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_69),
        .Q(acc[36]),
        .R(reset));
  FDRE \acc_reg[37] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_70),
        .Q(acc[37]),
        .R(reset));
  FDRE \acc_reg[38] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_71),
        .Q(acc[38]),
        .R(reset));
  FDRE \acc_reg[39] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_72),
        .Q(acc[39]),
        .R(reset));
  FDRE \acc_reg[4] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_1),
        .Q(acc[4]),
        .R(reset));
  FDRE \acc_reg[5] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_38),
        .Q(acc[5]),
        .R(reset));
  FDRE \acc_reg[6] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_39),
        .Q(acc[6]),
        .R(reset));
  FDRE \acc_reg[7] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_40),
        .Q(acc[7]),
        .R(reset));
  FDRE \acc_reg[8] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_41),
        .Q(acc[8]),
        .R(reset));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_42),
        .Q(acc[9]),
        .R(reset));
  LUT6 #(
    .INIT(64'h000000F200F200F2)) 
    busy_i_1
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(reset),
        .I4(p_0_in),
        .I5(p_1_in),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "r23_fir8_quadol_wce/coeff_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M coeff_reg_0_15_0_5
       (.ADDRA({1'b0,index_reg[3:0]}),
        .ADDRB({1'b0,index_reg[3:0]}),
        .ADDRC({1'b0,index_reg[3:0]}),
        .ADDRD({1'b0,coeff_addr}),
        .DIA(coeff_data[1:0]),
        .DIB(coeff_data[3:2]),
        .DIC(coeff_data[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(b0[1:0]),
        .DOB(b0[3:2]),
        .DOC(b0[5:4]),
        .DOD(NLW_coeff_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    coeff_reg_0_15_0_5_i_1
       (.I0(busy_reg_n_0),
        .I1(coeff_we),
        .I2(reset),
        .O(coeff_reg_0_15_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "r23_fir8_quadol_wce/coeff_reg_0_15_6_7" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM32X1D coeff_reg_0_15_6_7
       (.A0(coeff_addr[0]),
        .A1(coeff_addr[1]),
        .A2(coeff_addr[2]),
        .A3(coeff_addr[3]),
        .A4(1'b0),
        .D(coeff_data[6]),
        .DPO(b0[6]),
        .DPRA0(index_reg[0]),
        .DPRA1(index_reg[1]),
        .DPRA2(index_reg[2]),
        .DPRA3(index_reg[3]),
        .DPRA4(1'b0),
        .SPO(NLW_coeff_reg_0_15_6_7_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "r23_fir8_quadol_wce/coeff_reg_0_15_6_7" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D coeff_reg_0_15_6_7__0
       (.A0(coeff_addr[0]),
        .A1(coeff_addr[1]),
        .A2(coeff_addr[2]),
        .A3(coeff_addr[3]),
        .A4(1'b0),
        .D(coeff_data[7]),
        .DPO(b0[7]),
        .DPRA0(index_reg[0]),
        .DPRA1(index_reg[1]),
        .DPRA2(index_reg[2]),
        .DPRA3(index_reg[3]),
        .DPRA4(1'b0),
        .SPO(NLW_coeff_reg_0_15_6_7__0_SPO_UNCONNECTED),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  r23_fir8_quadol_wce_signed core
       (.D(next_acc),
        .Q(\history_reg[3] ),
        .acc(acc),
        .\acc_reg[4] (p_0_in),
        .b0(b0),
        .c87_i_2(\history_reg[11] ),
        .c87_i_2_0(\history_reg[10] ),
        .c87_i_2_1(\history_reg[9] ),
        .c87_i_2_2(\history_reg[8] ),
        .c87_i_2_3(\history_reg[15] ),
        .c87_i_2_4(\history_reg[14] ),
        .c87_i_2_5(\history_reg[13] ),
        .c87_i_2_6(\history_reg[12] ),
        .c87_i_4(\history_reg[2] ),
        .c87_i_4_0(\history_reg[1] ),
        .c87_i_4_1(\history_reg[0] ),
        .c87_i_4_2(\history_reg[7] ),
        .c87_i_4_3(\history_reg[6] ),
        .c87_i_4_4(\history_reg[5] ),
        .c87_i_4_5(\history_reg[4] ),
        .clk(clk),
        .index_reg(index_reg),
        .index_reg_4_sp_1(busy_reg_n_0),
        .issue(issue),
        .\result_reg[7] (firstpipe__0),
        .\vpipe_reg[2] (core_n_1),
        .\vpipe_reg[2]_0 (core_n_38),
        .\vpipe_reg[2]_1 (core_n_39),
        .\vpipe_reg[2]_10 (core_n_48),
        .\vpipe_reg[2]_11 (core_n_49),
        .\vpipe_reg[2]_12 (core_n_50),
        .\vpipe_reg[2]_13 (core_n_51),
        .\vpipe_reg[2]_14 (core_n_52),
        .\vpipe_reg[2]_15 (core_n_53),
        .\vpipe_reg[2]_16 (core_n_54),
        .\vpipe_reg[2]_17 (core_n_55),
        .\vpipe_reg[2]_18 (core_n_56),
        .\vpipe_reg[2]_19 (core_n_57),
        .\vpipe_reg[2]_2 (core_n_40),
        .\vpipe_reg[2]_20 (core_n_58),
        .\vpipe_reg[2]_21 (core_n_59),
        .\vpipe_reg[2]_22 (core_n_60),
        .\vpipe_reg[2]_23 (core_n_61),
        .\vpipe_reg[2]_24 (core_n_62),
        .\vpipe_reg[2]_25 (core_n_63),
        .\vpipe_reg[2]_26 (core_n_64),
        .\vpipe_reg[2]_27 (core_n_65),
        .\vpipe_reg[2]_28 (core_n_66),
        .\vpipe_reg[2]_29 (core_n_67),
        .\vpipe_reg[2]_3 (core_n_41),
        .\vpipe_reg[2]_30 (core_n_68),
        .\vpipe_reg[2]_31 (core_n_69),
        .\vpipe_reg[2]_32 (core_n_70),
        .\vpipe_reg[2]_33 (core_n_71),
        .\vpipe_reg[2]_34 (core_n_72),
        .\vpipe_reg[2]_4 (core_n_42),
        .\vpipe_reg[2]_5 (core_n_43),
        .\vpipe_reg[2]_6 (core_n_44),
        .\vpipe_reg[2]_7 (core_n_45),
        .\vpipe_reg[2]_8 (core_n_46),
        .\vpipe_reg[2]_9 (core_n_47));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \firstpipe[0]_i_1 
       (.I0(busy_reg_n_0),
        .I1(index_reg[2]),
        .I2(index_reg[4]),
        .I3(index_reg[0]),
        .I4(index_reg[1]),
        .I5(index_reg[3]),
        .O(p_0_out));
  FDRE \firstpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_out),
        .Q(firstpipe[0]),
        .R(reset));
  FDRE \firstpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(firstpipe[0]),
        .Q(firstpipe[1]),
        .R(reset));
  FDRE \firstpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(firstpipe[1]),
        .Q(firstpipe__0),
        .R(reset));
  LUT3 #(
    .INIT(8'h02)) 
    \history[0][7]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .O(busy0));
  FDRE \history_reg[0][0] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[0]),
        .Q(\history_reg[0] [0]),
        .R(reset));
  FDRE \history_reg[0][1] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[1]),
        .Q(\history_reg[0] [1]),
        .R(reset));
  FDRE \history_reg[0][2] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[2]),
        .Q(\history_reg[0] [2]),
        .R(reset));
  FDRE \history_reg[0][3] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[3]),
        .Q(\history_reg[0] [3]),
        .R(reset));
  FDRE \history_reg[0][4] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[4]),
        .Q(\history_reg[0] [4]),
        .R(reset));
  FDRE \history_reg[0][5] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[5]),
        .Q(\history_reg[0] [5]),
        .R(reset));
  FDRE \history_reg[0][6] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[6]),
        .Q(\history_reg[0] [6]),
        .R(reset));
  FDRE \history_reg[0][7] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[7]),
        .Q(\history_reg[0] [7]),
        .R(reset));
  FDRE \history_reg[10][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [0]),
        .Q(\history_reg[10] [0]),
        .R(reset));
  FDRE \history_reg[10][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [1]),
        .Q(\history_reg[10] [1]),
        .R(reset));
  FDRE \history_reg[10][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [2]),
        .Q(\history_reg[10] [2]),
        .R(reset));
  FDRE \history_reg[10][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [3]),
        .Q(\history_reg[10] [3]),
        .R(reset));
  FDRE \history_reg[10][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [4]),
        .Q(\history_reg[10] [4]),
        .R(reset));
  FDRE \history_reg[10][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [5]),
        .Q(\history_reg[10] [5]),
        .R(reset));
  FDRE \history_reg[10][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [6]),
        .Q(\history_reg[10] [6]),
        .R(reset));
  FDRE \history_reg[10][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [7]),
        .Q(\history_reg[10] [7]),
        .R(reset));
  FDRE \history_reg[11][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [0]),
        .Q(\history_reg[11] [0]),
        .R(reset));
  FDRE \history_reg[11][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [1]),
        .Q(\history_reg[11] [1]),
        .R(reset));
  FDRE \history_reg[11][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [2]),
        .Q(\history_reg[11] [2]),
        .R(reset));
  FDRE \history_reg[11][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [3]),
        .Q(\history_reg[11] [3]),
        .R(reset));
  FDRE \history_reg[11][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [4]),
        .Q(\history_reg[11] [4]),
        .R(reset));
  FDRE \history_reg[11][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [5]),
        .Q(\history_reg[11] [5]),
        .R(reset));
  FDRE \history_reg[11][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [6]),
        .Q(\history_reg[11] [6]),
        .R(reset));
  FDRE \history_reg[11][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [7]),
        .Q(\history_reg[11] [7]),
        .R(reset));
  FDRE \history_reg[12][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [0]),
        .Q(\history_reg[12] [0]),
        .R(reset));
  FDRE \history_reg[12][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [1]),
        .Q(\history_reg[12] [1]),
        .R(reset));
  FDRE \history_reg[12][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [2]),
        .Q(\history_reg[12] [2]),
        .R(reset));
  FDRE \history_reg[12][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [3]),
        .Q(\history_reg[12] [3]),
        .R(reset));
  FDRE \history_reg[12][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [4]),
        .Q(\history_reg[12] [4]),
        .R(reset));
  FDRE \history_reg[12][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [5]),
        .Q(\history_reg[12] [5]),
        .R(reset));
  FDRE \history_reg[12][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [6]),
        .Q(\history_reg[12] [6]),
        .R(reset));
  FDRE \history_reg[12][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [7]),
        .Q(\history_reg[12] [7]),
        .R(reset));
  FDRE \history_reg[13][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [0]),
        .Q(\history_reg[13] [0]),
        .R(reset));
  FDRE \history_reg[13][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [1]),
        .Q(\history_reg[13] [1]),
        .R(reset));
  FDRE \history_reg[13][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [2]),
        .Q(\history_reg[13] [2]),
        .R(reset));
  FDRE \history_reg[13][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [3]),
        .Q(\history_reg[13] [3]),
        .R(reset));
  FDRE \history_reg[13][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [4]),
        .Q(\history_reg[13] [4]),
        .R(reset));
  FDRE \history_reg[13][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [5]),
        .Q(\history_reg[13] [5]),
        .R(reset));
  FDRE \history_reg[13][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [6]),
        .Q(\history_reg[13] [6]),
        .R(reset));
  FDRE \history_reg[13][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [7]),
        .Q(\history_reg[13] [7]),
        .R(reset));
  FDRE \history_reg[14][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [0]),
        .Q(\history_reg[14] [0]),
        .R(reset));
  FDRE \history_reg[14][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [1]),
        .Q(\history_reg[14] [1]),
        .R(reset));
  FDRE \history_reg[14][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [2]),
        .Q(\history_reg[14] [2]),
        .R(reset));
  FDRE \history_reg[14][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [3]),
        .Q(\history_reg[14] [3]),
        .R(reset));
  FDRE \history_reg[14][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [4]),
        .Q(\history_reg[14] [4]),
        .R(reset));
  FDRE \history_reg[14][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [5]),
        .Q(\history_reg[14] [5]),
        .R(reset));
  FDRE \history_reg[14][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [6]),
        .Q(\history_reg[14] [6]),
        .R(reset));
  FDRE \history_reg[14][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [7]),
        .Q(\history_reg[14] [7]),
        .R(reset));
  FDRE \history_reg[15][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [0]),
        .Q(\history_reg[15] [0]),
        .R(reset));
  FDRE \history_reg[15][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [1]),
        .Q(\history_reg[15] [1]),
        .R(reset));
  FDRE \history_reg[15][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [2]),
        .Q(\history_reg[15] [2]),
        .R(reset));
  FDRE \history_reg[15][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [3]),
        .Q(\history_reg[15] [3]),
        .R(reset));
  FDRE \history_reg[15][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [4]),
        .Q(\history_reg[15] [4]),
        .R(reset));
  FDRE \history_reg[15][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [5]),
        .Q(\history_reg[15] [5]),
        .R(reset));
  FDRE \history_reg[15][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [6]),
        .Q(\history_reg[15] [6]),
        .R(reset));
  FDRE \history_reg[15][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [7]),
        .Q(\history_reg[15] [7]),
        .R(reset));
  FDRE \history_reg[1][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [0]),
        .Q(\history_reg[1] [0]),
        .R(reset));
  FDRE \history_reg[1][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [1]),
        .Q(\history_reg[1] [1]),
        .R(reset));
  FDRE \history_reg[1][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [2]),
        .Q(\history_reg[1] [2]),
        .R(reset));
  FDRE \history_reg[1][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [3]),
        .Q(\history_reg[1] [3]),
        .R(reset));
  FDRE \history_reg[1][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [4]),
        .Q(\history_reg[1] [4]),
        .R(reset));
  FDRE \history_reg[1][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [5]),
        .Q(\history_reg[1] [5]),
        .R(reset));
  FDRE \history_reg[1][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [6]),
        .Q(\history_reg[1] [6]),
        .R(reset));
  FDRE \history_reg[1][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [7]),
        .Q(\history_reg[1] [7]),
        .R(reset));
  FDRE \history_reg[2][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [0]),
        .Q(\history_reg[2] [0]),
        .R(reset));
  FDRE \history_reg[2][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [1]),
        .Q(\history_reg[2] [1]),
        .R(reset));
  FDRE \history_reg[2][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [2]),
        .Q(\history_reg[2] [2]),
        .R(reset));
  FDRE \history_reg[2][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [3]),
        .Q(\history_reg[2] [3]),
        .R(reset));
  FDRE \history_reg[2][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [4]),
        .Q(\history_reg[2] [4]),
        .R(reset));
  FDRE \history_reg[2][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [5]),
        .Q(\history_reg[2] [5]),
        .R(reset));
  FDRE \history_reg[2][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [6]),
        .Q(\history_reg[2] [6]),
        .R(reset));
  FDRE \history_reg[2][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [7]),
        .Q(\history_reg[2] [7]),
        .R(reset));
  FDRE \history_reg[3][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [0]),
        .Q(\history_reg[3] [0]),
        .R(reset));
  FDRE \history_reg[3][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [1]),
        .Q(\history_reg[3] [1]),
        .R(reset));
  FDRE \history_reg[3][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [2]),
        .Q(\history_reg[3] [2]),
        .R(reset));
  FDRE \history_reg[3][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [3]),
        .Q(\history_reg[3] [3]),
        .R(reset));
  FDRE \history_reg[3][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [4]),
        .Q(\history_reg[3] [4]),
        .R(reset));
  FDRE \history_reg[3][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [5]),
        .Q(\history_reg[3] [5]),
        .R(reset));
  FDRE \history_reg[3][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [6]),
        .Q(\history_reg[3] [6]),
        .R(reset));
  FDRE \history_reg[3][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [7]),
        .Q(\history_reg[3] [7]),
        .R(reset));
  FDRE \history_reg[4][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [0]),
        .Q(\history_reg[4] [0]),
        .R(reset));
  FDRE \history_reg[4][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [1]),
        .Q(\history_reg[4] [1]),
        .R(reset));
  FDRE \history_reg[4][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [2]),
        .Q(\history_reg[4] [2]),
        .R(reset));
  FDRE \history_reg[4][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [3]),
        .Q(\history_reg[4] [3]),
        .R(reset));
  FDRE \history_reg[4][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [4]),
        .Q(\history_reg[4] [4]),
        .R(reset));
  FDRE \history_reg[4][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [5]),
        .Q(\history_reg[4] [5]),
        .R(reset));
  FDRE \history_reg[4][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [6]),
        .Q(\history_reg[4] [6]),
        .R(reset));
  FDRE \history_reg[4][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [7]),
        .Q(\history_reg[4] [7]),
        .R(reset));
  FDRE \history_reg[5][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [0]),
        .Q(\history_reg[5] [0]),
        .R(reset));
  FDRE \history_reg[5][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [1]),
        .Q(\history_reg[5] [1]),
        .R(reset));
  FDRE \history_reg[5][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [2]),
        .Q(\history_reg[5] [2]),
        .R(reset));
  FDRE \history_reg[5][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [3]),
        .Q(\history_reg[5] [3]),
        .R(reset));
  FDRE \history_reg[5][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [4]),
        .Q(\history_reg[5] [4]),
        .R(reset));
  FDRE \history_reg[5][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [5]),
        .Q(\history_reg[5] [5]),
        .R(reset));
  FDRE \history_reg[5][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [6]),
        .Q(\history_reg[5] [6]),
        .R(reset));
  FDRE \history_reg[5][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [7]),
        .Q(\history_reg[5] [7]),
        .R(reset));
  FDRE \history_reg[6][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [0]),
        .Q(\history_reg[6] [0]),
        .R(reset));
  FDRE \history_reg[6][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [1]),
        .Q(\history_reg[6] [1]),
        .R(reset));
  FDRE \history_reg[6][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [2]),
        .Q(\history_reg[6] [2]),
        .R(reset));
  FDRE \history_reg[6][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [3]),
        .Q(\history_reg[6] [3]),
        .R(reset));
  FDRE \history_reg[6][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [4]),
        .Q(\history_reg[6] [4]),
        .R(reset));
  FDRE \history_reg[6][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [5]),
        .Q(\history_reg[6] [5]),
        .R(reset));
  FDRE \history_reg[6][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [6]),
        .Q(\history_reg[6] [6]),
        .R(reset));
  FDRE \history_reg[6][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [7]),
        .Q(\history_reg[6] [7]),
        .R(reset));
  FDRE \history_reg[7][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [0]),
        .Q(\history_reg[7] [0]),
        .R(reset));
  FDRE \history_reg[7][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [1]),
        .Q(\history_reg[7] [1]),
        .R(reset));
  FDRE \history_reg[7][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [2]),
        .Q(\history_reg[7] [2]),
        .R(reset));
  FDRE \history_reg[7][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [3]),
        .Q(\history_reg[7] [3]),
        .R(reset));
  FDRE \history_reg[7][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [4]),
        .Q(\history_reg[7] [4]),
        .R(reset));
  FDRE \history_reg[7][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [5]),
        .Q(\history_reg[7] [5]),
        .R(reset));
  FDRE \history_reg[7][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [6]),
        .Q(\history_reg[7] [6]),
        .R(reset));
  FDRE \history_reg[7][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [7]),
        .Q(\history_reg[7] [7]),
        .R(reset));
  FDRE \history_reg[8][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [0]),
        .Q(\history_reg[8] [0]),
        .R(reset));
  FDRE \history_reg[8][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [1]),
        .Q(\history_reg[8] [1]),
        .R(reset));
  FDRE \history_reg[8][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [2]),
        .Q(\history_reg[8] [2]),
        .R(reset));
  FDRE \history_reg[8][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [3]),
        .Q(\history_reg[8] [3]),
        .R(reset));
  FDRE \history_reg[8][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [4]),
        .Q(\history_reg[8] [4]),
        .R(reset));
  FDRE \history_reg[8][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [5]),
        .Q(\history_reg[8] [5]),
        .R(reset));
  FDRE \history_reg[8][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [6]),
        .Q(\history_reg[8] [6]),
        .R(reset));
  FDRE \history_reg[8][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [7]),
        .Q(\history_reg[8] [7]),
        .R(reset));
  FDRE \history_reg[9][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [0]),
        .Q(\history_reg[9] [0]),
        .R(reset));
  FDRE \history_reg[9][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [1]),
        .Q(\history_reg[9] [1]),
        .R(reset));
  FDRE \history_reg[9][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [2]),
        .Q(\history_reg[9] [2]),
        .R(reset));
  FDRE \history_reg[9][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [3]),
        .Q(\history_reg[9] [3]),
        .R(reset));
  FDRE \history_reg[9][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [4]),
        .Q(\history_reg[9] [4]),
        .R(reset));
  FDRE \history_reg[9][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [5]),
        .Q(\history_reg[9] [5]),
        .R(reset));
  FDRE \history_reg[9][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [6]),
        .Q(\history_reg[9] [6]),
        .R(reset));
  FDRE \history_reg[9][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [7]),
        .Q(\history_reg[9] [7]),
        .R(reset));
  LUT1 #(
    .INIT(2'h1)) 
    \index[0]_i_1 
       (.I0(index_reg[0]),
        .O(\index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \index[1]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .O(\index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \index[2]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .I2(index_reg[2]),
        .O(\index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \index[3]_i_1 
       (.I0(index_reg[1]),
        .I1(index_reg[0]),
        .I2(index_reg[2]),
        .I3(index_reg[3]),
        .O(\index[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \index[4]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(reset),
        .O(\index[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \index[4]_i_2 
       (.I0(index_reg[2]),
        .I1(index_reg[0]),
        .I2(index_reg[1]),
        .I3(index_reg[3]),
        .O(p_0_in__0));
  FDRE \index_reg[0] 
       (.C(clk),
        .CE(issue),
        .D(\index[0]_i_1_n_0 ),
        .Q(index_reg[0]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[1] 
       (.C(clk),
        .CE(issue),
        .D(\index[1]_i_1_n_0 ),
        .Q(index_reg[1]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[2] 
       (.C(clk),
        .CE(issue),
        .D(\index[2]_i_1_n_0 ),
        .Q(index_reg[2]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[3] 
       (.C(clk),
        .CE(issue),
        .D(\index[3]_i_1_n_0 ),
        .Q(index_reg[3]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[4] 
       (.C(clk),
        .CE(issue),
        .D(p_0_in__0),
        .Q(index_reg[4]),
        .R(\index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \lastpipe[0]_i_1 
       (.I0(busy_reg_n_0),
        .I1(index_reg[2]),
        .I2(index_reg[3]),
        .I3(index_reg[0]),
        .I4(index_reg[1]),
        .I5(index_reg[4]),
        .O(\lastpipe[0]_i_1_n_0 ));
  FDRE \lastpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe[0]_i_1_n_0 ),
        .Q(\lastpipe_reg_n_0_[0] ),
        .R(reset));
  FDRE \lastpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe_reg_n_0_[0] ),
        .Q(\lastpipe_reg_n_0_[1] ),
        .R(reset));
  FDRE \lastpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe_reg_n_0_[1] ),
        .Q(p_1_in),
        .R(reset));
  LUT2 #(
    .INIT(4'h8)) 
    \result[39]_i_1 
       (.I0(p_0_in),
        .I1(p_1_in),
        .O(\result[39]_i_1_n_0 ));
  FDRE \result_reg[10] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[10]),
        .Q(\^result [10]),
        .R(reset));
  FDRE \result_reg[11] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[11]),
        .Q(\^result [11]),
        .R(reset));
  FDRE \result_reg[12] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[12]),
        .Q(\^result [12]),
        .R(reset));
  FDRE \result_reg[13] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[13]),
        .Q(\^result [13]),
        .R(reset));
  FDRE \result_reg[14] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[14]),
        .Q(\^result [14]),
        .R(reset));
  FDRE \result_reg[15] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[15]),
        .Q(\^result [15]),
        .R(reset));
  FDRE \result_reg[16] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[16]),
        .Q(\^result [16]),
        .R(reset));
  FDRE \result_reg[17] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[17]),
        .Q(\^result [17]),
        .R(reset));
  FDRE \result_reg[18] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[18]),
        .Q(\^result [18]),
        .R(reset));
  FDRE \result_reg[19] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[19]),
        .Q(\^result [19]),
        .R(reset));
  FDRE \result_reg[20] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[20]),
        .Q(\^result [20]),
        .R(reset));
  FDRE \result_reg[21] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[21]),
        .Q(\^result [21]),
        .R(reset));
  FDRE \result_reg[22] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[22]),
        .Q(\^result [22]),
        .R(reset));
  FDRE \result_reg[23] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[23]),
        .Q(\^result [23]),
        .R(reset));
  FDRE \result_reg[24] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[24]),
        .Q(\^result [24]),
        .R(reset));
  FDRE \result_reg[25] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[25]),
        .Q(\^result [25]),
        .R(reset));
  FDRE \result_reg[26] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[26]),
        .Q(\^result [26]),
        .R(reset));
  FDRE \result_reg[27] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[27]),
        .Q(\^result [27]),
        .R(reset));
  FDRE \result_reg[28] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[28]),
        .Q(\^result [28]),
        .R(reset));
  FDRE \result_reg[29] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[29]),
        .Q(\^result [29]),
        .R(reset));
  FDRE \result_reg[30] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[30]),
        .Q(\^result [30]),
        .R(reset));
  FDRE \result_reg[31] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[31]),
        .Q(\^result [31]),
        .R(reset));
  FDRE \result_reg[32] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[32]),
        .Q(\^result [32]),
        .R(reset));
  FDRE \result_reg[33] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[33]),
        .Q(\^result [33]),
        .R(reset));
  FDRE \result_reg[34] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[34]),
        .Q(\^result [34]),
        .R(reset));
  FDRE \result_reg[35] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[35]),
        .Q(\^result [35]),
        .R(reset));
  FDRE \result_reg[36] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[36]),
        .Q(\^result [36]),
        .R(reset));
  FDRE \result_reg[37] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[37]),
        .Q(\^result [37]),
        .R(reset));
  FDRE \result_reg[38] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[38]),
        .Q(\^result [38]),
        .R(reset));
  FDRE \result_reg[39] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[39]),
        .Q(\^result [39]),
        .R(reset));
  FDRE \result_reg[4] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[4]),
        .Q(\^result [4]),
        .R(reset));
  FDRE \result_reg[5] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[5]),
        .Q(\^result [5]),
        .R(reset));
  FDRE \result_reg[6] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[6]),
        .Q(\^result [6]),
        .R(reset));
  FDRE \result_reg[7] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[7]),
        .Q(\^result [7]),
        .R(reset));
  FDRE \result_reg[8] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[8]),
        .Q(\^result [8]),
        .R(reset));
  FDRE \result_reg[9] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[9]),
        .Q(\^result [9]),
        .R(reset));
  LUT3 #(
    .INIT(8'h08)) 
    result_valid_i_1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(reset),
        .O(result_valid_i_1_n_0));
  FDRE result_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(result_valid_i_1_n_0),
        .Q(result_valid),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    sample_ready_INST_0
       (.I0(busy_reg_n_0),
        .I1(coeff_we),
        .O(sample_ready));
  FDRE \vpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(issue),
        .Q(\vpipe_reg_n_0_[0] ),
        .R(reset));
  FDRE \vpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vpipe_reg_n_0_[0] ),
        .Q(\vpipe_reg_n_0_[1] ),
        .R(reset));
  FDRE \vpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vpipe_reg_n_0_[1] ),
        .Q(p_0_in),
        .R(reset));
endmodule

module r23_fir8_quadol_wce_signed
   (issue,
    \vpipe_reg[2] ,
    D,
    \vpipe_reg[2]_0 ,
    \vpipe_reg[2]_1 ,
    \vpipe_reg[2]_2 ,
    \vpipe_reg[2]_3 ,
    \vpipe_reg[2]_4 ,
    \vpipe_reg[2]_5 ,
    \vpipe_reg[2]_6 ,
    \vpipe_reg[2]_7 ,
    \vpipe_reg[2]_8 ,
    \vpipe_reg[2]_9 ,
    \vpipe_reg[2]_10 ,
    \vpipe_reg[2]_11 ,
    \vpipe_reg[2]_12 ,
    \vpipe_reg[2]_13 ,
    \vpipe_reg[2]_14 ,
    \vpipe_reg[2]_15 ,
    \vpipe_reg[2]_16 ,
    \vpipe_reg[2]_17 ,
    \vpipe_reg[2]_18 ,
    \vpipe_reg[2]_19 ,
    \vpipe_reg[2]_20 ,
    \vpipe_reg[2]_21 ,
    \vpipe_reg[2]_22 ,
    \vpipe_reg[2]_23 ,
    \vpipe_reg[2]_24 ,
    \vpipe_reg[2]_25 ,
    \vpipe_reg[2]_26 ,
    \vpipe_reg[2]_27 ,
    \vpipe_reg[2]_28 ,
    \vpipe_reg[2]_29 ,
    \vpipe_reg[2]_30 ,
    \vpipe_reg[2]_31 ,
    \vpipe_reg[2]_32 ,
    \vpipe_reg[2]_33 ,
    \vpipe_reg[2]_34 ,
    clk,
    b0,
    index_reg_4_sp_1,
    index_reg,
    Q,
    c87_i_4,
    c87_i_4_0,
    c87_i_4_1,
    c87_i_4_2,
    c87_i_4_3,
    c87_i_4_4,
    c87_i_4_5,
    c87_i_2,
    c87_i_2_0,
    c87_i_2_1,
    c87_i_2_2,
    c87_i_2_3,
    c87_i_2_4,
    c87_i_2_5,
    c87_i_2_6,
    \acc_reg[4] ,
    acc,
    \result_reg[7] );
  output issue;
  output \vpipe_reg[2] ;
  output [35:0]D;
  output \vpipe_reg[2]_0 ;
  output \vpipe_reg[2]_1 ;
  output \vpipe_reg[2]_2 ;
  output \vpipe_reg[2]_3 ;
  output \vpipe_reg[2]_4 ;
  output \vpipe_reg[2]_5 ;
  output \vpipe_reg[2]_6 ;
  output \vpipe_reg[2]_7 ;
  output \vpipe_reg[2]_8 ;
  output \vpipe_reg[2]_9 ;
  output \vpipe_reg[2]_10 ;
  output \vpipe_reg[2]_11 ;
  output \vpipe_reg[2]_12 ;
  output \vpipe_reg[2]_13 ;
  output \vpipe_reg[2]_14 ;
  output \vpipe_reg[2]_15 ;
  output \vpipe_reg[2]_16 ;
  output \vpipe_reg[2]_17 ;
  output \vpipe_reg[2]_18 ;
  output \vpipe_reg[2]_19 ;
  output \vpipe_reg[2]_20 ;
  output \vpipe_reg[2]_21 ;
  output \vpipe_reg[2]_22 ;
  output \vpipe_reg[2]_23 ;
  output \vpipe_reg[2]_24 ;
  output \vpipe_reg[2]_25 ;
  output \vpipe_reg[2]_26 ;
  output \vpipe_reg[2]_27 ;
  output \vpipe_reg[2]_28 ;
  output \vpipe_reg[2]_29 ;
  output \vpipe_reg[2]_30 ;
  output \vpipe_reg[2]_31 ;
  output \vpipe_reg[2]_32 ;
  output \vpipe_reg[2]_33 ;
  output \vpipe_reg[2]_34 ;
  input clk;
  input [7:0]b0;
  input index_reg_4_sp_1;
  input [4:0]index_reg;
  input [7:0]Q;
  input [7:0]c87_i_4;
  input [7:0]c87_i_4_0;
  input [7:0]c87_i_4_1;
  input [7:0]c87_i_4_2;
  input [7:0]c87_i_4_3;
  input [7:0]c87_i_4_4;
  input [7:0]c87_i_4_5;
  input [7:0]c87_i_2;
  input [7:0]c87_i_2_0;
  input [7:0]c87_i_2_1;
  input [7:0]c87_i_2_2;
  input [7:0]c87_i_2_3;
  input [7:0]c87_i_2_4;
  input [7:0]c87_i_2_5;
  input [7:0]c87_i_2_6;
  input [0:0]\acc_reg[4] ;
  input [35:0]acc;
  input [0:0]\result_reg[7] ;

  wire [35:0]D;
  wire [7:0]Q;
  wire [31:4]Y;
  wire \Y[11]_i_2_n_0 ;
  wire \Y[11]_i_3_n_0 ;
  wire \Y[11]_i_4_n_0 ;
  wire \Y[11]_i_5_n_0 ;
  wire \Y[15]_i_2_n_0 ;
  wire \Y[15]_i_3_n_0 ;
  wire \Y[15]_i_4_n_0 ;
  wire \Y[15]_i_5_n_0 ;
  wire \Y[7]_i_2_n_0 ;
  wire \Y[7]_i_3_n_0 ;
  wire \Y[7]_i_5_n_0 ;
  wire [15:15]a;
  wire [35:0]acc;
  wire [0:0]\acc_reg[4] ;
  wire [7:0]b0;
  wire [7:0]c87_i_2;
  wire [7:0]c87_i_2_0;
  wire [7:0]c87_i_2_1;
  wire [7:0]c87_i_2_2;
  wire [7:0]c87_i_2_3;
  wire [7:0]c87_i_2_4;
  wire [7:0]c87_i_2_5;
  wire [7:0]c87_i_2_6;
  wire [7:0]c87_i_4;
  wire [7:0]c87_i_4_0;
  wire [7:0]c87_i_4_1;
  wire [7:0]c87_i_4_2;
  wire [7:0]c87_i_4_3;
  wire [7:0]c87_i_4_4;
  wire [7:0]c87_i_4_5;
  wire clk;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire issue;
  wire [15:4]p;
  wire \result[11]_i_2_n_0 ;
  wire \result[11]_i_3_n_0 ;
  wire \result[11]_i_4_n_0 ;
  wire \result[11]_i_5_n_0 ;
  wire \result[15]_i_2_n_0 ;
  wire \result[15]_i_3_n_0 ;
  wire \result[15]_i_4_n_0 ;
  wire \result[15]_i_5_n_0 ;
  wire \result[19]_i_2_n_0 ;
  wire \result[19]_i_3_n_0 ;
  wire \result[19]_i_4_n_0 ;
  wire \result[19]_i_5_n_0 ;
  wire \result[23]_i_2_n_0 ;
  wire \result[23]_i_3_n_0 ;
  wire \result[23]_i_4_n_0 ;
  wire \result[23]_i_5_n_0 ;
  wire \result[27]_i_2_n_0 ;
  wire \result[27]_i_3_n_0 ;
  wire \result[27]_i_4_n_0 ;
  wire \result[27]_i_5_n_0 ;
  wire \result[31]_i_2_n_0 ;
  wire \result[31]_i_3_n_0 ;
  wire \result[31]_i_4_n_0 ;
  wire \result[31]_i_5_n_0 ;
  wire \result[35]_i_2_n_0 ;
  wire \result[35]_i_3_n_0 ;
  wire \result[35]_i_4_n_0 ;
  wire \result[35]_i_5_n_0 ;
  wire \result[35]_i_6_n_0 ;
  wire \result[35]_i_7_n_0 ;
  wire \result[35]_i_8_n_0 ;
  wire \result[35]_i_9_n_0 ;
  wire \result[39]_i_3_n_0 ;
  wire \result[39]_i_4_n_0 ;
  wire \result[39]_i_5_n_0 ;
  wire \result[39]_i_6_n_0 ;
  wire \result[39]_i_7_n_0 ;
  wire \result[39]_i_8_n_0 ;
  wire \result[39]_i_9_n_0 ;
  wire \result[7]_i_2_n_0 ;
  wire \result[7]_i_3_n_0 ;
  wire \result[7]_i_4_n_0 ;
  wire \result[7]_i_5_n_0 ;
  wire \result_reg[11]_i_1_n_0 ;
  wire \result_reg[15]_i_1_n_0 ;
  wire \result_reg[19]_i_1_n_0 ;
  wire \result_reg[23]_i_1_n_0 ;
  wire \result_reg[27]_i_1_n_0 ;
  wire \result_reg[31]_i_1_n_0 ;
  wire \result_reg[35]_i_1_n_0 ;
  wire [0:0]\result_reg[7] ;
  wire \result_reg[7]_i_1_n_0 ;
  wire s1;
  wire s1_i_1_n_0;
  wire s2;
  wire u_n_14;
  wire u_n_15;
  wire u_n_16;
  wire u_n_17;
  wire u_n_18;
  wire u_n_19;
  wire u_n_20;
  wire u_n_21;
  wire u_n_22;
  wire u_n_23;
  wire u_n_24;
  wire u_n_25;
  wire u_n_26;
  wire u_n_27;
  wire u_n_28;
  wire u_n_29;
  wire u_n_30;
  wire u_n_31;
  wire u_n_32;
  wire u_n_33;
  wire u_n_34;
  wire u_n_35;
  wire u_n_36;
  wire u_n_37;
  wire u_n_38;
  wire u_n_39;
  wire u_n_40;
  wire u_n_41;
  wire \vpipe_reg[2] ;
  wire \vpipe_reg[2]_0 ;
  wire \vpipe_reg[2]_1 ;
  wire \vpipe_reg[2]_10 ;
  wire \vpipe_reg[2]_11 ;
  wire \vpipe_reg[2]_12 ;
  wire \vpipe_reg[2]_13 ;
  wire \vpipe_reg[2]_14 ;
  wire \vpipe_reg[2]_15 ;
  wire \vpipe_reg[2]_16 ;
  wire \vpipe_reg[2]_17 ;
  wire \vpipe_reg[2]_18 ;
  wire \vpipe_reg[2]_19 ;
  wire \vpipe_reg[2]_2 ;
  wire \vpipe_reg[2]_20 ;
  wire \vpipe_reg[2]_21 ;
  wire \vpipe_reg[2]_22 ;
  wire \vpipe_reg[2]_23 ;
  wire \vpipe_reg[2]_24 ;
  wire \vpipe_reg[2]_25 ;
  wire \vpipe_reg[2]_26 ;
  wire \vpipe_reg[2]_27 ;
  wire \vpipe_reg[2]_28 ;
  wire \vpipe_reg[2]_29 ;
  wire \vpipe_reg[2]_3 ;
  wire \vpipe_reg[2]_30 ;
  wire \vpipe_reg[2]_31 ;
  wire \vpipe_reg[2]_32 ;
  wire \vpipe_reg[2]_33 ;
  wire \vpipe_reg[2]_34 ;
  wire \vpipe_reg[2]_4 ;
  wire \vpipe_reg[2]_5 ;
  wire \vpipe_reg[2]_6 ;
  wire \vpipe_reg[2]_7 ;
  wire \vpipe_reg[2]_8 ;
  wire \vpipe_reg[2]_9 ;
  wire [2:0]\NLW_result_reg[11]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[15]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[19]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[23]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[27]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[31]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[35]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[39]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_1_CO_UNCONNECTED ;
  wire [1:1]NLW_u_p_UNCONNECTED;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_2 
       (.I0(s2),
        .I1(p[11]),
        .O(\Y[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_3 
       (.I0(s2),
        .I1(p[10]),
        .O(\Y[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_4 
       (.I0(s2),
        .I1(p[9]),
        .O(\Y[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_5 
       (.I0(s2),
        .I1(p[8]),
        .O(\Y[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_2 
       (.I0(s2),
        .I1(p[15]),
        .O(\Y[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_3 
       (.I0(s2),
        .I1(p[14]),
        .O(\Y[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_4 
       (.I0(s2),
        .I1(p[13]),
        .O(\Y[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_5 
       (.I0(s2),
        .I1(p[12]),
        .O(\Y[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_i_2 
       (.I0(s2),
        .I1(p[7]),
        .O(\Y[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_i_3 
       (.I0(s2),
        .I1(p[6]),
        .O(\Y[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_i_5 
       (.I0(s2),
        .I1(p[4]),
        .O(\Y[7]_i_5_n_0 ));
  FDRE \Y_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_35),
        .Q(Y[10]),
        .R(1'b0));
  FDRE \Y_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_34),
        .Q(Y[11]),
        .R(1'b0));
  FDRE \Y_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_33),
        .Q(Y[12]),
        .R(1'b0));
  FDRE \Y_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_32),
        .Q(Y[13]),
        .R(1'b0));
  FDRE \Y_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_31),
        .Q(Y[14]),
        .R(1'b0));
  FDRE \Y_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_30),
        .Q(Y[15]),
        .R(1'b0));
  FDRE \Y_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_29),
        .Q(Y[16]),
        .R(1'b0));
  FDRE \Y_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_28),
        .Q(Y[17]),
        .R(1'b0));
  FDRE \Y_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_27),
        .Q(Y[18]),
        .R(1'b0));
  FDRE \Y_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_26),
        .Q(Y[19]),
        .R(1'b0));
  FDRE \Y_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_25),
        .Q(Y[20]),
        .R(1'b0));
  FDRE \Y_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_24),
        .Q(Y[21]),
        .R(1'b0));
  FDRE \Y_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_23),
        .Q(Y[22]),
        .R(1'b0));
  FDRE \Y_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_22),
        .Q(Y[23]),
        .R(1'b0));
  FDRE \Y_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_21),
        .Q(Y[24]),
        .R(1'b0));
  FDRE \Y_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_20),
        .Q(Y[25]),
        .R(1'b0));
  FDRE \Y_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_19),
        .Q(Y[26]),
        .R(1'b0));
  FDRE \Y_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_18),
        .Q(Y[27]),
        .R(1'b0));
  FDRE \Y_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_17),
        .Q(Y[28]),
        .R(1'b0));
  FDRE \Y_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_16),
        .Q(Y[29]),
        .R(1'b0));
  FDRE \Y_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_15),
        .Q(Y[30]),
        .R(1'b0));
  FDRE \Y_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_14),
        .Q(Y[31]),
        .R(1'b0));
  FDRE \Y_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_41),
        .Q(Y[4]),
        .R(1'b0));
  FDRE \Y_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_40),
        .Q(Y[5]),
        .R(1'b0));
  FDRE \Y_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_39),
        .Q(Y[6]),
        .R(1'b0));
  FDRE \Y_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_38),
        .Q(Y[7]),
        .R(1'b0));
  FDRE \Y_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_37),
        .Q(Y[8]),
        .R(1'b0));
  FDRE \Y_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_36),
        .Q(Y[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[10]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[6]),
        .O(\vpipe_reg[2]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[11]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[7]),
        .O(\vpipe_reg[2]_6 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[12]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[8]),
        .O(\vpipe_reg[2]_7 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[13]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[9]),
        .O(\vpipe_reg[2]_8 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[14]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[10]),
        .O(\vpipe_reg[2]_9 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[15]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[11]),
        .O(\vpipe_reg[2]_10 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[16]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[12]),
        .O(\vpipe_reg[2]_11 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[17]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[13]),
        .O(\vpipe_reg[2]_12 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[18]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[14]),
        .O(\vpipe_reg[2]_13 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[19]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[15]),
        .O(\vpipe_reg[2]_14 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[20]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[16]),
        .O(\vpipe_reg[2]_15 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[21]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[17]),
        .O(\vpipe_reg[2]_16 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[22]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[18]),
        .O(\vpipe_reg[2]_17 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[23]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[19]),
        .O(\vpipe_reg[2]_18 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[24]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[20]),
        .O(\vpipe_reg[2]_19 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[25]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[21]),
        .O(\vpipe_reg[2]_20 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[26]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[22]),
        .O(\vpipe_reg[2]_21 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[27]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[23]),
        .O(\vpipe_reg[2]_22 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[28]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[24]),
        .O(\vpipe_reg[2]_23 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[29]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[25]),
        .O(\vpipe_reg[2]_24 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[30]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[26]),
        .O(\vpipe_reg[2]_25 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[31]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[27]),
        .O(\vpipe_reg[2]_26 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[32]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[28]),
        .O(\vpipe_reg[2]_27 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[33]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[29]),
        .O(\vpipe_reg[2]_28 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[34]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[30]),
        .O(\vpipe_reg[2]_29 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[35]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[31]),
        .O(\vpipe_reg[2]_30 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[36]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[32]),
        .O(\vpipe_reg[2]_31 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[37]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[33]),
        .O(\vpipe_reg[2]_32 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[38]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[34]),
        .O(\vpipe_reg[2]_33 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[39]_i_2 
       (.I0(\acc_reg[4] ),
        .I1(D[35]),
        .O(\vpipe_reg[2]_34 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[4]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[0]),
        .O(\vpipe_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[5]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[1]),
        .O(\vpipe_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[6]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[2]),
        .O(\vpipe_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[7]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[3]),
        .O(\vpipe_reg[2]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[8]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[4]),
        .O(\vpipe_reg[2]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[9]_i_1 
       (.I0(\acc_reg[4] ),
        .I1(D[5]),
        .O(\vpipe_reg[2]_4 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[7]),
        .I2(Y[11]),
        .O(\result[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[6]),
        .I2(Y[10]),
        .O(\result[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[5]),
        .I2(Y[9]),
        .O(\result[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[4]),
        .I2(Y[8]),
        .O(\result[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[11]),
        .I2(Y[15]),
        .O(\result[15]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[10]),
        .I2(Y[14]),
        .O(\result[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[9]),
        .I2(Y[13]),
        .O(\result[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[8]),
        .I2(Y[12]),
        .O(\result[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[15]),
        .I2(Y[19]),
        .O(\result[19]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[14]),
        .I2(Y[18]),
        .O(\result[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[13]),
        .I2(Y[17]),
        .O(\result[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[12]),
        .I2(Y[16]),
        .O(\result[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[19]),
        .I2(Y[23]),
        .O(\result[23]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[18]),
        .I2(Y[22]),
        .O(\result[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[17]),
        .I2(Y[21]),
        .O(\result[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[16]),
        .I2(Y[20]),
        .O(\result[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[23]),
        .I2(Y[27]),
        .O(\result[27]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[22]),
        .I2(Y[26]),
        .O(\result[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[21]),
        .I2(Y[25]),
        .O(\result[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[20]),
        .I2(Y[24]),
        .O(\result[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[31]_i_2 
       (.I0(Y[31]),
        .I1(\result_reg[7] ),
        .I2(acc[27]),
        .O(\result[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[26]),
        .I2(Y[30]),
        .O(\result[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[25]),
        .I2(Y[29]),
        .O(\result[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[24]),
        .I2(Y[28]),
        .O(\result[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_2 
       (.I0(acc[30]),
        .I1(\result_reg[7] ),
        .O(\result[35]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_3 
       (.I0(acc[29]),
        .I1(\result_reg[7] ),
        .O(\result[35]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_4 
       (.I0(acc[28]),
        .I1(\result_reg[7] ),
        .O(\result[35]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[35]_i_5 
       (.I0(Y[31]),
        .O(\result[35]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_6 
       (.I0(acc[30]),
        .I1(\result_reg[7] ),
        .I2(acc[31]),
        .O(\result[35]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_7 
       (.I0(acc[29]),
        .I1(\result_reg[7] ),
        .I2(acc[30]),
        .O(\result[35]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_8 
       (.I0(acc[28]),
        .I1(\result_reg[7] ),
        .I2(acc[29]),
        .O(\result[35]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[35]_i_9 
       (.I0(Y[31]),
        .I1(\result_reg[7] ),
        .I2(acc[28]),
        .O(\result[35]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_3 
       (.I0(acc[33]),
        .I1(\result_reg[7] ),
        .O(\result[39]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_4 
       (.I0(acc[32]),
        .I1(\result_reg[7] ),
        .O(\result[39]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_5 
       (.I0(acc[31]),
        .I1(\result_reg[7] ),
        .O(\result[39]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_6 
       (.I0(acc[34]),
        .I1(\result_reg[7] ),
        .I2(acc[35]),
        .O(\result[39]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_7 
       (.I0(acc[33]),
        .I1(\result_reg[7] ),
        .I2(acc[34]),
        .O(\result[39]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_8 
       (.I0(acc[32]),
        .I1(\result_reg[7] ),
        .I2(acc[33]),
        .O(\result[39]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_9 
       (.I0(acc[31]),
        .I1(\result_reg[7] ),
        .I2(acc[32]),
        .O(\result[39]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_2 
       (.I0(\result_reg[7] ),
        .I1(acc[3]),
        .I2(Y[7]),
        .O(\result[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_3 
       (.I0(\result_reg[7] ),
        .I1(acc[2]),
        .I2(Y[6]),
        .O(\result[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_4 
       (.I0(\result_reg[7] ),
        .I1(acc[1]),
        .I2(Y[5]),
        .O(\result[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_5 
       (.I0(\result_reg[7] ),
        .I1(acc[0]),
        .I2(Y[4]),
        .O(\result[7]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[11]_i_1 
       (.CI(\result_reg[7]_i_1_n_0 ),
        .CO({\result_reg[11]_i_1_n_0 ,\NLW_result_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[11:8]),
        .O(D[7:4]),
        .S({\result[11]_i_2_n_0 ,\result[11]_i_3_n_0 ,\result[11]_i_4_n_0 ,\result[11]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[15]_i_1 
       (.CI(\result_reg[11]_i_1_n_0 ),
        .CO({\result_reg[15]_i_1_n_0 ,\NLW_result_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[15:12]),
        .O(D[11:8]),
        .S({\result[15]_i_2_n_0 ,\result[15]_i_3_n_0 ,\result[15]_i_4_n_0 ,\result[15]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[19]_i_1 
       (.CI(\result_reg[15]_i_1_n_0 ),
        .CO({\result_reg[19]_i_1_n_0 ,\NLW_result_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[19:16]),
        .O(D[15:12]),
        .S({\result[19]_i_2_n_0 ,\result[19]_i_3_n_0 ,\result[19]_i_4_n_0 ,\result[19]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[23]_i_1 
       (.CI(\result_reg[19]_i_1_n_0 ),
        .CO({\result_reg[23]_i_1_n_0 ,\NLW_result_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[23:20]),
        .O(D[19:16]),
        .S({\result[23]_i_2_n_0 ,\result[23]_i_3_n_0 ,\result[23]_i_4_n_0 ,\result[23]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[27]_i_1 
       (.CI(\result_reg[23]_i_1_n_0 ),
        .CO({\result_reg[27]_i_1_n_0 ,\NLW_result_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[27:24]),
        .O(D[23:20]),
        .S({\result[27]_i_2_n_0 ,\result[27]_i_3_n_0 ,\result[27]_i_4_n_0 ,\result[27]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[31]_i_1 
       (.CI(\result_reg[27]_i_1_n_0 ),
        .CO({\result_reg[31]_i_1_n_0 ,\NLW_result_reg[31]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[31:28]),
        .O(D[27:24]),
        .S({\result[31]_i_2_n_0 ,\result[31]_i_3_n_0 ,\result[31]_i_4_n_0 ,\result[31]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[35]_i_1 
       (.CI(\result_reg[31]_i_1_n_0 ),
        .CO({\result_reg[35]_i_1_n_0 ,\NLW_result_reg[35]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[35]_i_2_n_0 ,\result[35]_i_3_n_0 ,\result[35]_i_4_n_0 ,\result[35]_i_5_n_0 }),
        .O(D[31:28]),
        .S({\result[35]_i_6_n_0 ,\result[35]_i_7_n_0 ,\result[35]_i_8_n_0 ,\result[35]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[39]_i_2 
       (.CI(\result_reg[35]_i_1_n_0 ),
        .CO(\NLW_result_reg[39]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\result[39]_i_3_n_0 ,\result[39]_i_4_n_0 ,\result[39]_i_5_n_0 }),
        .O(D[35:32]),
        .S({\result[39]_i_6_n_0 ,\result[39]_i_7_n_0 ,\result[39]_i_8_n_0 ,\result[39]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_1 
       (.CI(1'b0),
        .CO({\result_reg[7]_i_1_n_0 ,\NLW_result_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI(Y[7:4]),
        .O(D[3:0]),
        .S({\result[7]_i_2_n_0 ,\result[7]_i_3_n_0 ,\result[7]_i_4_n_0 ,\result[7]_i_5_n_0 }));
  LUT4 #(
    .INIT(16'hF708)) 
    s1_i_1
       (.I0(b0[7]),
        .I1(index_reg_4_sn_1),
        .I2(index_reg[4]),
        .I3(a),
        .O(s1_i_1_n_0));
  FDRE s1_reg
       (.C(clk),
        .CE(1'b1),
        .D(s1_i_1_n_0),
        .Q(s1),
        .R(1'b0));
  FDRE s2_reg
       (.C(clk),
        .CE(1'b1),
        .D(s1),
        .Q(s2),
        .R(1'b0));
  r21_mac8_add8_b256_column_mse_quadol_wce u
       (.D({u_n_14,u_n_15,u_n_16,u_n_17,u_n_18,u_n_19,u_n_20,u_n_21,u_n_22,u_n_23,u_n_24,u_n_25,u_n_26,u_n_27,u_n_28,u_n_29,u_n_30,u_n_31,u_n_32,u_n_33,u_n_34,u_n_35,u_n_36,u_n_37,u_n_38,u_n_39,u_n_40,u_n_41}),
        .Q(Q),
        .S({\Y[7]_i_2_n_0 ,\Y[7]_i_3_n_0 ,s2,\Y[7]_i_5_n_0 }),
        .\Y_reg[11] ({\Y[11]_i_2_n_0 ,\Y[11]_i_3_n_0 ,\Y[11]_i_4_n_0 ,\Y[11]_i_5_n_0 }),
        .\Y_reg[15] ({\Y[15]_i_2_n_0 ,\Y[15]_i_3_n_0 ,\Y[15]_i_4_n_0 ,\Y[15]_i_5_n_0 }),
        .a(a),
        .b0(b0),
        .busy_reg(issue),
        .c87_i_2_0(c87_i_2),
        .c87_i_2_1(c87_i_2_0),
        .c87_i_2_2(c87_i_2_1),
        .c87_i_2_3(c87_i_2_2),
        .c87_i_2_4(c87_i_2_3),
        .c87_i_2_5(c87_i_2_4),
        .c87_i_2_6(c87_i_2_5),
        .c87_i_2_7(c87_i_2_6),
        .c87_i_4_0(c87_i_4),
        .c87_i_4_1(c87_i_4_0),
        .c87_i_4_2(c87_i_4_1),
        .c87_i_4_3(c87_i_4_2),
        .c87_i_4_4(c87_i_4_3),
        .c87_i_4_5(c87_i_4_4),
        .c87_i_4_6(c87_i_4_5),
        .clk(clk),
        .index_reg(index_reg),
        .index_reg_4_sp_1(index_reg_4_sn_1),
        .p({p[15:6],NLW_u_p_UNCONNECTED[1],p[4]}),
        .s2(s2));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
