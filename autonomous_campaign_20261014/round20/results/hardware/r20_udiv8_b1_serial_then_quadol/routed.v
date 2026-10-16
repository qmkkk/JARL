// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:27:59 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_serial_then_quadol/routed.v
// Design      : r20_udiv8_b1_serial_then_quadol
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "df6a381e" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"29.999998\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.082489\",\n      \"Worst Negative Slack (WNS)\": \"12.167142\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"24\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.465000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"20.591000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_udiv8_b1_serial_then_quadol
   (clk,
    A,
    B,
    Y);
  input clk;
  input [15:0]A;
  input [15:0]B;
  output [31:0]Y;

  wire \<const0> ;
  wire \<const1> ;
  wire [15:0]A;
  wire [15:0]B;
  wire [7:0]\^Y ;
  wire clk;
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
  wire v_131;
  wire v_132;
  wire v_133;
  wire v_134;
  wire v_135;
  wire v_136;
  wire v_137;
  wire v_138;
  wire v_139;
  wire v_140;
  wire v_141;
  wire v_142;
  wire v_143;
  wire v_144;
  wire v_145;
  wire v_146;
  wire v_147;
  wire v_148;
  wire v_149;
  wire v_150;
  wire v_151;
  wire v_152;
  wire v_153;
  wire v_154;
  wire v_155;
  wire v_156;
  wire v_157;
  wire v_158;
  wire v_159;
  wire v_160;
  wire v_161;
  wire v_162;
  wire v_163;
  wire v_164;
  wire v_165;
  wire v_167;
  wire v_168;
  wire v_170;
  wire v_171;
  wire v_173;
  wire v_174;
  wire v_175;
  wire v_176;
  wire v_177;
  wire v_178;
  wire v_179;
  wire v_180;
  wire v_181;
  wire v_182;
  wire v_183;
  wire v_184;
  wire v_185;
  wire v_186;
  wire v_187;
  wire v_188;
  wire v_190;
  wire v_191;
  wire v_199;
  wire v_214;
  wire v_221;
  wire v_229;
  wire v_236;
  wire v_244;
  wire v_251;
  wire v_259;
  wire v_266;
  wire v_274;
  wire v_281;
  wire v_289;
  wire v_297;
  wire v_304;
  wire v_306;
  wire v_43;
  wire v_44;
  wire v_45;
  wire v_46;
  wire v_47;
  wire v_48;
  wire v_49;
  wire v_50;
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
  wire v_65;
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
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:0]NLW_c100_O_UNCONNECTED;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c79_CO_UNCONNECTED;
  wire [3:0]NLW_c80_CO_UNCONNECTED;
  wire [3:0]NLW_c82_CO_UNCONNECTED;
  wire [3:0]NLW_c83_CO_UNCONNECTED;
  wire [3:0]NLW_c84_CO_UNCONNECTED;
  wire [3:0]NLW_c84_O_UNCONNECTED;
  wire [3:0]NLW_c86_CO_UNCONNECTED;
  wire [3:0]NLW_c87_CO_UNCONNECTED;
  wire [3:0]NLW_c88_CO_UNCONNECTED;
  wire [3:0]NLW_c88_O_UNCONNECTED;
  wire [3:0]NLW_c90_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c92_O_UNCONNECTED;
  wire [3:0]NLW_c94_CO_UNCONNECTED;
  wire [3:0]NLW_c95_CO_UNCONNECTED;
  wire [3:0]NLW_c96_CO_UNCONNECTED;
  wire [3:0]NLW_c96_O_UNCONNECTED;
  wire [3:0]NLW_c98_CO_UNCONNECTED;
  wire [3:0]NLW_c99_CO_UNCONNECTED;

  assign Y[31] = \<const0> ;
  assign Y[30] = \<const0> ;
  assign Y[29] = \<const0> ;
  assign Y[28] = \<const0> ;
  assign Y[27] = \<const0> ;
  assign Y[26] = \<const0> ;
  assign Y[25] = \<const0> ;
  assign Y[24] = \<const0> ;
  assign Y[23] = \<const0> ;
  assign Y[22] = \<const0> ;
  assign Y[21] = \<const0> ;
  assign Y[20] = \<const0> ;
  assign Y[19] = \<const0> ;
  assign Y[18] = \<const0> ;
  assign Y[17] = \<const0> ;
  assign Y[16] = \<const0> ;
  assign Y[15] = \<const0> ;
  assign Y[14] = \<const0> ;
  assign Y[13] = \<const0> ;
  assign Y[12] = \<const0> ;
  assign Y[11] = \<const0> ;
  assign Y[10] = \<const0> ;
  assign Y[9] = \<const0> ;
  assign Y[8] = \<const0> ;
  assign Y[7:0] = \^Y [7:0];
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(v_188));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c10
       (.I0(v_44),
        .I1(v_68),
        .I2(v_69),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(\<const0> ),
        .CO({v_281,NLW_c100_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_147),
        .DI({v_148,v_150,v_152,\<const0> }),
        .O({v_145,v_129,v_131,NLW_c100_O_UNCONNECTED[0]}),
        .S({v_146,v_149,v_151,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c101
       (.C(clk),
        .CE(\<const1> ),
        .D(v_147),
        .Q(\^Y [6]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v_289),
        .CO(v_147),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v_182}),
        .S({\<const0> ,\<const0> ,\<const0> ,v_183}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v_297),
        .CO({v_289,NLW_c103_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_184,v_185,v_186,v_187}),
        .O({v_154,v_156,v_158,v_160}),
        .S({v_165,v_167,v_168,v_170}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c104
       (.CI(\<const0> ),
        .CO({v_297,NLW_c104_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_173),
        .DI({v_68,v_174,v_175,v_181}),
        .O({v_162,v_164,v_148,v_150}),
        .S({v_176,v_178,v_179,v_180}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c105
       (.C(clk),
        .CE(\<const1> ),
        .D(v_173),
        .Q(\^Y [7]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c106
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v_52),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c107
       (.C(clk),
        .CE(\<const1> ),
        .D(A[1]),
        .Q(v_76),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c108
       (.C(clk),
        .CE(\<const1> ),
        .D(A[2]),
        .Q(v_95),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c109
       (.C(clk),
        .CE(\<const1> ),
        .D(A[3]),
        .Q(v_114),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c11
       (.I0(v_71),
        .I1(v_45),
        .I2(v_72),
        .O(v_70));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v_133),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c111
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v_152),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c112
       (.C(clk),
        .CE(\<const1> ),
        .D(A[6]),
        .Q(v_181),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c113
       (.C(clk),
        .CE(\<const1> ),
        .D(A[7]),
        .Q(v_177),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c114
       (.C(clk),
        .CE(\<const1> ),
        .D(B[0]),
        .Q(v_51),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c115
       (.C(clk),
        .CE(\<const1> ),
        .D(B[1]),
        .Q(v_48),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c116
       (.C(clk),
        .CE(\<const1> ),
        .D(B[2]),
        .Q(v_45),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c117
       (.C(clk),
        .CE(\<const1> ),
        .D(B[3]),
        .Q(v_68),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c118
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v_65),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c119
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v_62),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c12
       (.I0(v_71),
        .I1(v_48),
        .I2(v_74),
        .O(v_73));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(B[6]),
        .Q(v_59),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c121
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v_56),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c13
       (.I0(v_71),
        .I1(v_51),
        .I2(v_76),
        .O(v_75));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c14
       (.I0(v_71),
        .I1(v_78),
        .O(v_77));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c15
       (.I0(v_71),
        .I1(v_56),
        .I2(v_80),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c16
       (.I0(v_71),
        .I1(v_59),
        .I2(v_82),
        .O(v_81));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c17
       (.I0(v_71),
        .I1(v_62),
        .I2(v_84),
        .O(v_83));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c18
       (.I0(v_71),
        .I1(v_65),
        .I2(v_86),
        .O(v_85));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c19
       (.I0(v_71),
        .I1(v_68),
        .I2(v_88),
        .O(v_87));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c2
       (.I0(v_44),
        .I1(v_45),
        .I2(v_46),
        .O(v_43));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c20
       (.I0(v_90),
        .I1(v_45),
        .I2(v_91),
        .O(v_89));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c21
       (.I0(v_90),
        .I1(v_48),
        .I2(v_93),
        .O(v_92));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c22
       (.I0(v_90),
        .I1(v_51),
        .I2(v_95),
        .O(v_94));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c23
       (.I0(v_90),
        .I1(v_97),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c24
       (.I0(v_90),
        .I1(v_56),
        .I2(v_99),
        .O(v_98));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c25
       (.I0(v_90),
        .I1(v_59),
        .I2(v_101),
        .O(v_100));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c26
       (.I0(v_90),
        .I1(v_62),
        .I2(v_103),
        .O(v_102));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c27
       (.I0(v_90),
        .I1(v_65),
        .I2(v_105),
        .O(v_104));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c28
       (.I0(v_90),
        .I1(v_68),
        .I2(v_107),
        .O(v_106));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c29
       (.I0(v_109),
        .I1(v_45),
        .I2(v_110),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c3
       (.I0(v_44),
        .I1(v_48),
        .I2(v_49),
        .O(v_47));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c30
       (.I0(v_109),
        .I1(v_48),
        .I2(v_112),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c31
       (.I0(v_109),
        .I1(v_51),
        .I2(v_114),
        .O(v_113));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c32
       (.I0(v_109),
        .I1(v_116),
        .O(v_115));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c33
       (.I0(v_109),
        .I1(v_56),
        .I2(v_118),
        .O(v_117));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c34
       (.I0(v_109),
        .I1(v_59),
        .I2(v_120),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c35
       (.I0(v_109),
        .I1(v_62),
        .I2(v_122),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c36
       (.I0(v_109),
        .I1(v_65),
        .I2(v_124),
        .O(v_123));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c37
       (.I0(v_109),
        .I1(v_68),
        .I2(v_126),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c38
       (.I0(v_128),
        .I1(v_45),
        .I2(v_129),
        .O(v_127));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c39
       (.I0(v_128),
        .I1(v_48),
        .I2(v_131),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v_44),
        .I1(v_51),
        .I2(v_52),
        .O(v_50));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c40
       (.I0(v_128),
        .I1(v_51),
        .I2(v_133),
        .O(v_132));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c41
       (.I0(v_128),
        .I1(v_135),
        .O(v_134));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c42
       (.I0(v_128),
        .I1(v_56),
        .I2(v_137),
        .O(v_136));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c43
       (.I0(v_128),
        .I1(v_59),
        .I2(v_139),
        .O(v_138));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c44
       (.I0(v_128),
        .I1(v_62),
        .I2(v_141),
        .O(v_140));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c45
       (.I0(v_128),
        .I1(v_65),
        .I2(v_143),
        .O(v_142));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c46
       (.I0(v_128),
        .I1(v_68),
        .I2(v_145),
        .O(v_144));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c47
       (.I0(v_147),
        .I1(v_45),
        .I2(v_148),
        .O(v_146));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c48
       (.I0(v_147),
        .I1(v_48),
        .I2(v_150),
        .O(v_149));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c49
       (.I0(v_147),
        .I1(v_51),
        .I2(v_152),
        .O(v_151));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c5
       (.I0(v_44),
        .I1(v_54),
        .O(v_53));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c50
       (.I0(v_147),
        .I1(v_154),
        .O(v_153));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c51
       (.I0(v_147),
        .I1(v_56),
        .I2(v_156),
        .O(v_155));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c52
       (.I0(v_147),
        .I1(v_59),
        .I2(v_158),
        .O(v_157));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c53
       (.I0(v_147),
        .I1(v_62),
        .I2(v_160),
        .O(v_159));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c54
       (.I0(v_147),
        .I1(v_65),
        .I2(v_162),
        .O(v_161));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c55
       (.I0(v_147),
        .I1(v_68),
        .I2(v_164),
        .O(v_163));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h9979)) 
    c56
       (.I0(v_56),
        .I1(v_59),
        .I2(v_306),
        .I3(v_62),
        .O(v_165));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h5BA5)) 
    c57
       (.I0(v_59),
        .I1(v_56),
        .I2(v_62),
        .I3(v_306),
        .O(v_167));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'h33CDCC33)) 
    c58
       (.I0(v_59),
        .I1(v_62),
        .I2(v_56),
        .I3(v_65),
        .I4(v_304),
        .O(v_168));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h3333CCCDCCCC3333)) 
    c59
       (.I0(v_59),
        .I1(v_65),
        .I2(v_62),
        .I3(v_56),
        .I4(v_68),
        .I5(v_171),
        .O(v_170));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c6
       (.I0(v_44),
        .I1(v_56),
        .I2(v_57),
        .O(v_55));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c61
       (.I0(v_45),
        .I1(v_173),
        .O(v_174));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c62
       (.I0(v_48),
        .I1(v_173),
        .O(v_175));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969696996966996)) 
    c63
       (.I0(v_173),
        .I1(v_68),
        .I2(v_45),
        .I3(v_51),
        .I4(v_177),
        .I5(v_48),
        .O(v_176));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96699696)) 
    c64
       (.I0(v_173),
        .I1(v_45),
        .I2(v_48),
        .I3(v_177),
        .I4(v_51),
        .O(v_178));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    c65
       (.I0(v_173),
        .I1(v_48),
        .I2(v_177),
        .I3(v_51),
        .O(v_179));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c66
       (.I0(v_173),
        .I1(v_51),
        .I2(v_181),
        .O(v_180));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h0045)) 
    c67
       (.I0(v_48),
        .I1(v_177),
        .I2(v_51),
        .I3(v_45),
        .O(v_171));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    c68
       (.I0(v_59),
        .I1(v_306),
        .I2(v_62),
        .I3(v_56),
        .O(v_182));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h5575)) 
    c69
       (.I0(v_56),
        .I1(v_62),
        .I2(v_306),
        .I3(v_59),
        .O(v_183));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c7
       (.I0(v_44),
        .I1(v_59),
        .I2(v_60),
        .O(v_58));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c70
       (.I0(v_56),
        .I1(v_173),
        .O(v_184));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c71
       (.I0(v_59),
        .I1(v_173),
        .O(v_185));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c72
       (.I0(v_62),
        .I1(v_173),
        .O(v_186));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c73
       (.I0(v_65),
        .I1(v_173),
        .O(v_187));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    c75
       (.I0(v_59),
        .I1(v_306),
        .I2(v_62),
        .I3(v_56),
        .O(v_173));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c77
       (.C(clk),
        .CE(\<const1> ),
        .D(v_190),
        .Q(\^Y [0]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c78
       (.CI(v_191),
        .CO(v_190),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v_44}),
        .S({\<const0> ,\<const0> ,\<const0> ,v_53}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c79
       (.CI(v_199),
        .CO({v_191,NLW_c79_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_57,v_60,v_63,v_66}),
        .S({v_55,v_58,v_61,v_64}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c8
       (.I0(v_44),
        .I1(v_62),
        .I2(v_63),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c80
       (.CI(\<const0> ),
        .CO({v_199,NLW_c80_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_44),
        .DI({v_69,v_46,v_49,v_52}),
        .S({v_67,v_43,v_47,v_50}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c81
       (.C(clk),
        .CE(\<const1> ),
        .D(v_44),
        .Q(\^Y [1]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c82
       (.CI(v_214),
        .CO({v_44,NLW_c82_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_71,v_80}),
        .O(v_54),
        .S({\<const0> ,\<const0> ,v_77,v_79}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c83
       (.CI(v_221),
        .CO({v_214,NLW_c83_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_82,v_84,v_86,v_88}),
        .O({v_57,v_60,v_63,v_66}),
        .S({v_81,v_83,v_85,v_87}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c84
       (.CI(\<const0> ),
        .CO({v_221,NLW_c84_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_71),
        .DI({v_72,v_74,v_76,\<const0> }),
        .O({v_69,v_46,v_49,NLW_c84_O_UNCONNECTED[0]}),
        .S({v_70,v_73,v_75,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(\<const1> ),
        .D(v_71),
        .Q(\^Y [2]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c86
       (.CI(v_229),
        .CO({v_71,NLW_c86_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_90,v_99}),
        .O(v_78),
        .S({\<const0> ,\<const0> ,v_96,v_98}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c87
       (.CI(v_236),
        .CO({v_229,NLW_c87_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_101,v_103,v_105,v_107}),
        .O({v_80,v_82,v_84,v_86}),
        .S({v_100,v_102,v_104,v_106}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c88
       (.CI(\<const0> ),
        .CO({v_236,NLW_c88_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_90),
        .DI({v_91,v_93,v_95,\<const0> }),
        .O({v_88,v_72,v_74,NLW_c88_O_UNCONNECTED[0]}),
        .S({v_89,v_92,v_94,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c89
       (.C(clk),
        .CE(\<const1> ),
        .D(v_90),
        .Q(\^Y [3]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c9
       (.I0(v_44),
        .I1(v_65),
        .I2(v_66),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c90
       (.CI(v_244),
        .CO({v_90,NLW_c90_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_109,v_118}),
        .O(v_97),
        .S({\<const0> ,\<const0> ,v_115,v_117}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(v_251),
        .CO({v_244,NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_120,v_122,v_124,v_126}),
        .O({v_99,v_101,v_103,v_105}),
        .S({v_119,v_121,v_123,v_125}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c92
       (.CI(\<const0> ),
        .CO({v_251,NLW_c92_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_109),
        .DI({v_110,v_112,v_114,\<const0> }),
        .O({v_107,v_91,v_93,NLW_c92_O_UNCONNECTED[0]}),
        .S({v_108,v_111,v_113,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c93
       (.C(clk),
        .CE(\<const1> ),
        .D(v_109),
        .Q(\^Y [4]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c94
       (.CI(v_259),
        .CO({v_109,NLW_c94_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_128,v_137}),
        .O(v_116),
        .S({\<const0> ,\<const0> ,v_134,v_136}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(v_266),
        .CO({v_259,NLW_c95_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_139,v_141,v_143,v_145}),
        .O({v_118,v_120,v_122,v_124}),
        .S({v_138,v_140,v_142,v_144}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(\<const0> ),
        .CO({v_266,NLW_c96_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_128),
        .DI({v_129,v_131,v_133,\<const0> }),
        .O({v_126,v_110,v_112,NLW_c96_O_UNCONNECTED[0]}),
        .S({v_127,v_130,v_132,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c97
       (.C(clk),
        .CE(\<const1> ),
        .D(v_128),
        .Q(\^Y [5]),
        .S(v_188));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c98
       (.CI(v_274),
        .CO({v_128,NLW_c98_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_147,v_156}),
        .O(v_135),
        .S({\<const0> ,\<const0> ,v_153,v_155}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v_281),
        .CO({v_274,NLW_c99_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_158,v_160,v_162,v_164}),
        .O({v_137,v_139,v_141,v_143}),
        .S({v_157,v_159,v_161,v_163}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h0000000000000031)) 
    direct_quadol_0
       (.I0(v_51),
        .I1(v_45),
        .I2(v_177),
        .I3(v_68),
        .I4(v_48),
        .I5(v_65),
        .O5(v_304),
        .O6(v_306));
endmodule
