// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:29:18 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_quadol_wce/routed.v
// Design      : r20_umul8_b16_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "c38f1f90" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.310914\",\n      \"Worst Negative Slack (WNS)\": \"7.887633\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"32\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.359000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.817000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_umul8_b16_quadol_wce
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
  wire [15:0]\^Y ;
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
  wire v_148;
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
  wire v_166;
  wire v_167;
  wire v_168;
  wire v_169;
  wire v_170;
  wire v_171;
  wire v_172;
  wire v_173;
  wire v_174;
  wire v_175;
  wire v_176;
  wire v_177;
  wire v_178;
  wire v_182;
  wire v_183;
  wire v_184;
  wire v_185;
  wire v_189;
  wire v_193;
  wire v_194;
  wire v_195;
  wire v_196;
  wire v_197;
  wire v_201;
  wire v_207;
  wire v_220;
  wire v_221;
  wire v_222;
  wire v_226;
  wire v_227;
  wire v_228;
  wire v_229;
  wire v_236;
  wire v_238;
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
  wire [3:0]NLW_c102_CO_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [3:0]NLW_c110_CO_UNCONNECTED;
  wire [3:0]NLW_c111_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c93_CO_UNCONNECTED;
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
  assign Y[15:0] = \^Y [15:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8F08)) 
    c10
       (.I0(v_63),
        .I1(v_62),
        .I2(v_51),
        .I3(v_56),
        .O(v_73));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(v_207),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v_197),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v_207),
        .S({\<const0> ,\<const0> ,\<const0> ,v_139}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v_189),
        .CO({v_119,NLW_c102_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_140,v_141}),
        .O({v_117,v_124}),
        .S({\<const0> ,\<const1> ,v_142,v_143}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c103
       (.C(clk),
        .CE(\<const1> ),
        .D(v_220),
        .Q(\^Y [1]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c104
       (.C(clk),
        .CE(\<const1> ),
        .D(v_221),
        .Q(\^Y [2]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c105
       (.CI(\<const0> ),
        .CO({v_222,NLW_c105_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_144,v_145,v_146,\<const0> }),
        .O({v_173,v_221,v_220,v_175}),
        .S({v_238,v_236,v_150,v_151}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c106
       (.C(clk),
        .CE(\<const1> ),
        .D(v_226),
        .Q(\^Y [3]),
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
        .D(v_227),
        .Q(\^Y [4]),
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
        .D(v_228),
        .Q(\^Y [5]),
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
        .D(v_229),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c11
       (.I0(v_75),
        .I1(v_53),
        .I2(v_76),
        .I3(v_59),
        .I4(v_62),
        .I5(v_77),
        .O(v_74));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c110
       (.CI(\<const0> ),
        .CO({v_177,NLW_c110_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_164,v_167,v_170,v_173}),
        .O({v_229,v_228,v_227,v_226}),
        .S({v_165,v_166,v_169,v_172}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c111
       (.CI(v_222),
        .CO({v_201,NLW_c111_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_155,v_158,v_152,v_153}),
        .O({v_72,v_65,v_167,v_170}),
        .S({v_154,v_157,v_160,v_162}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c112
       (.C(clk),
        .CE(\<const1> ),
        .D(v_184),
        .Q(\^Y [7]),
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
        .D(v_183),
        .Q(\^Y [8]),
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
        .D(v_182),
        .Q(\^Y [9]),
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
        .D(A[0]),
        .Q(v_69),
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
        .D(A[1]),
        .Q(v_59),
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
        .D(A[2]),
        .Q(v_53),
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
        .D(A[3]),
        .Q(v_62),
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
        .D(A[4]),
        .Q(v_86),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c12
       (.I0(v_75),
        .I1(v_59),
        .I2(v_76),
        .I3(v_69),
        .O(v_78));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v_87),
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
        .D(A[6]),
        .Q(v_88),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c122
       (.C(clk),
        .CE(\<const1> ),
        .D(A[7]),
        .Q(v_95),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c123
       (.C(clk),
        .CE(\<const1> ),
        .D(B[0]),
        .Q(v_129),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c124
       (.C(clk),
        .CE(\<const1> ),
        .D(B[1]),
        .Q(v_127),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c125
       (.C(clk),
        .CE(\<const1> ),
        .D(B[2]),
        .Q(v_126),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c126
       (.C(clk),
        .CE(\<const1> ),
        .D(B[3]),
        .Q(v_77),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c127
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v_75),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c128
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v_76),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c129
       (.C(clk),
        .CE(\<const1> ),
        .D(B[6]),
        .Q(v_63),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c13
       (.I0(v_77),
        .I1(v_59),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v_52),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h99C369C399339933)) 
    c14
       (.I0(v_53),
        .I1(v_81),
        .I2(v_59),
        .I3(v_75),
        .I4(v_69),
        .I5(v_76),
        .O(v_80));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c15
       (.I0(v_69),
        .I1(v_76),
        .I2(v_59),
        .I3(v_75),
        .I4(v_77),
        .I5(v_53),
        .O(v_82));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c16
       (.I0(v_77),
        .I1(v_59),
        .I2(v_75),
        .I3(v_69),
        .O(v_83));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c17
       (.I0(v_69),
        .I1(v_77),
        .O(v_84));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c18
       (.I0(v_76),
        .I1(v_86),
        .I2(v_75),
        .I3(v_87),
        .I4(v_77),
        .I5(v_88),
        .O(v_85));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c19
       (.I0(v_76),
        .I1(v_62),
        .I2(v_75),
        .I3(v_86),
        .I4(v_77),
        .I5(v_87),
        .O(v_89));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c2
       (.I0(v_52),
        .I1(v_53),
        .I2(v_54),
        .I3(v_55),
        .O(v_51));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c20
       (.I0(v_76),
        .I1(v_53),
        .I2(v_75),
        .I3(v_62),
        .I4(v_77),
        .I5(v_86),
        .O(v_90));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8A08080808080808)) 
    c21
       (.I0(v_63),
        .I1(v_53),
        .I2(v_60),
        .I3(v_59),
        .I4(v_66),
        .I5(v_65),
        .O(v_91));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c22
       (.I0(v_76),
        .I1(v_59),
        .I2(v_75),
        .I3(v_53),
        .I4(v_77),
        .I5(v_62),
        .O(v_92));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c23
       (.I0(v_85),
        .I1(v_75),
        .I2(v_88),
        .I3(v_94),
        .I4(v_95),
        .I5(v_77),
        .O(v_93));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c24
       (.I0(v_89),
        .I1(v_75),
        .I2(v_87),
        .I3(v_97),
        .I4(v_88),
        .I5(v_77),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c25
       (.I0(v_90),
        .I1(v_75),
        .I2(v_86),
        .I3(v_99),
        .I4(v_87),
        .I5(v_77),
        .O(v_98));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c26
       (.I0(v_92),
        .I1(v_75),
        .I2(v_62),
        .I3(v_101),
        .I4(v_86),
        .I5(v_77),
        .O(v_100));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c27
       (.I0(v_62),
        .I1(v_77),
        .O(v_81));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c28
       (.I0(v_87),
        .I1(v_76),
        .O(v_94));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c29
       (.I0(v_86),
        .I1(v_76),
        .O(v_97));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c3
       (.I0(v_57),
        .I1(v_58),
        .I2(v_52),
        .I3(v_59),
        .O(v_56));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c30
       (.I0(v_62),
        .I1(v_76),
        .O(v_99));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c31
       (.I0(v_53),
        .I1(v_76),
        .O(v_101));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h5995959595959595)) 
    c32
       (.I0(v_60),
        .I1(v_63),
        .I2(v_53),
        .I3(v_65),
        .I4(v_66),
        .I5(v_59),
        .O(v_102));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c33
       (.I0(v_72),
        .I1(v_71),
        .I2(v_69),
        .I3(v_52),
        .O(v_103));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c34
       (.I0(v_56),
        .I1(v_51),
        .I2(v_61),
        .I3(v_105),
        .I4(v_106),
        .I5(v_107),
        .O(v_104));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c35
       (.I0(v_64),
        .I1(v_60),
        .I2(v_67),
        .I3(v_51),
        .I4(v_61),
        .I5(v_56),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    c36
       (.I0(v_60),
        .I1(v_67),
        .I2(v_64),
        .I3(v_68),
        .I4(v_72),
        .I5(v_71),
        .O(v_109));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    c37
       (.I0(v_70),
        .I1(v_59),
        .I2(v_63),
        .I3(v_66),
        .I4(v_65),
        .O(v_110));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c38
       (.I0(v_95),
        .I1(v_63),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c39
       (.I0(v_88),
        .I1(v_63),
        .O(v_112));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c4
       (.I0(v_52),
        .I1(v_59),
        .I2(v_57),
        .I3(v_58),
        .O(v_60));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c40
       (.I0(v_114),
        .I1(v_115),
        .I2(v_52),
        .I3(v_62),
        .O(v_113));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c41
       (.I0(v_52),
        .I1(v_62),
        .I2(v_114),
        .I3(v_115),
        .O(v_105));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c42
       (.I0(v_54),
        .I1(v_55),
        .I2(v_52),
        .I3(v_53),
        .O(v_107));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    c43
       (.I0(v_52),
        .I1(v_87),
        .I2(v_117),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h87)) 
    c44
       (.I0(v_52),
        .I1(v_88),
        .I2(v_119),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v_87),
        .I1(v_63),
        .O(v_120));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    c46
       (.I0(v_117),
        .I1(v_87),
        .I2(v_52),
        .I3(v_63),
        .I4(v_88),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v_86),
        .I1(v_63),
        .O(v_106));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7D44144414441444)) 
    c48
       (.I0(v_111),
        .I1(v_119),
        .I2(v_88),
        .I3(v_52),
        .I4(v_117),
        .I5(v_87),
        .O(v_122));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h87)) 
    c49
       (.I0(v_52),
        .I1(v_86),
        .I2(v_124),
        .O(v_123));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v_62),
        .I1(v_63),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c50
       (.I0(v_126),
        .I1(v_88),
        .I2(v_127),
        .I3(v_95),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c51
       (.I0(v_126),
        .I1(v_87),
        .I2(v_127),
        .I3(v_88),
        .I4(v_129),
        .I5(v_95),
        .O(v_128));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c52
       (.I0(v_127),
        .I1(v_88),
        .I2(v_126),
        .I3(v_95),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c53
       (.I0(v_129),
        .I1(v_87),
        .I2(v_88),
        .I3(v_126),
        .I4(v_95),
        .I5(v_127),
        .O(v_131));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7D44144414441444)) 
    c54
       (.I0(v_112),
        .I1(v_117),
        .I2(v_87),
        .I3(v_52),
        .I4(v_124),
        .I5(v_86),
        .O(v_132));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8FF8F8F808808080)) 
    c55
       (.I0(v_63),
        .I1(v_87),
        .I2(v_124),
        .I3(v_86),
        .I4(v_52),
        .I5(v_113),
        .O(v_133));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8F08)) 
    c56
       (.I0(v_63),
        .I1(v_86),
        .I2(v_105),
        .I3(v_107),
        .O(v_134));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h4FD525D52540B040)) 
    c57
       (.I0(v_116),
        .I1(v_63),
        .I2(v_95),
        .I3(v_52),
        .I4(v_88),
        .I5(v_119),
        .O(v_135));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69999666)) 
    c58
       (.I0(v_132),
        .I1(v_118),
        .I2(v_63),
        .I3(v_95),
        .I4(v_116),
        .O(v_136));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD2B4B4B4B42D2D2D)) 
    c59
       (.I0(v_113),
        .I1(v_120),
        .I2(v_121),
        .I3(v_52),
        .I4(v_86),
        .I5(v_124),
        .O(v_137));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c6
       (.I0(v_65),
        .I1(v_66),
        .I2(v_63),
        .I3(v_59),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c60
       (.I0(v_107),
        .I1(v_105),
        .I2(v_106),
        .I3(v_123),
        .I4(v_120),
        .I5(v_113),
        .O(v_138));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c61
       (.I0(v_95),
        .I1(v_119),
        .I2(v_88),
        .I3(v_52),
        .O(v_139));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c62
       (.I0(v_76),
        .I1(v_88),
        .I2(v_75),
        .I3(v_95),
        .O(v_140));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c63
       (.I0(v_76),
        .I1(v_87),
        .I2(v_75),
        .I3(v_88),
        .I4(v_77),
        .I5(v_95),
        .O(v_141));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c64
       (.I0(v_75),
        .I1(v_88),
        .I2(v_76),
        .I3(v_95),
        .O(v_142));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c65
       (.I0(v_77),
        .I1(v_87),
        .I2(v_88),
        .I3(v_76),
        .I4(v_95),
        .I5(v_75),
        .O(v_143));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c66
       (.I0(v_127),
        .I1(v_53),
        .I2(v_126),
        .I3(v_59),
        .I4(v_62),
        .I5(v_129),
        .O(v_144));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c67
       (.I0(v_127),
        .I1(v_59),
        .I2(v_126),
        .I3(v_69),
        .O(v_145));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c68
       (.I0(v_129),
        .I1(v_59),
        .O(v_146));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c69
       (.I0(v_129),
        .I1(v_59),
        .I2(v_127),
        .I3(v_69),
        .O(v_150));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c7
       (.I0(v_53),
        .I1(v_63),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c70
       (.I0(v_69),
        .I1(v_129),
        .O(v_151));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c71
       (.I0(v_62),
        .I1(v_129),
        .O(v_148));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c72
       (.I0(v_126),
        .I1(v_53),
        .I2(v_127),
        .I3(v_62),
        .I4(v_129),
        .I5(v_86),
        .O(v_152));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c73
       (.I0(v_126),
        .I1(v_59),
        .I2(v_127),
        .I3(v_53),
        .I4(v_129),
        .I5(v_62),
        .O(v_153));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c74
       (.I0(v_155),
        .I1(v_127),
        .I2(v_88),
        .I3(v_156),
        .I4(v_95),
        .I5(v_129),
        .O(v_154));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c75
       (.I0(v_158),
        .I1(v_127),
        .I2(v_87),
        .I3(v_159),
        .I4(v_88),
        .I5(v_129),
        .O(v_157));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c76
       (.I0(v_152),
        .I1(v_127),
        .I2(v_86),
        .I3(v_161),
        .I4(v_87),
        .I5(v_129),
        .O(v_160));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c77
       (.I0(v_153),
        .I1(v_127),
        .I2(v_62),
        .I3(v_163),
        .I4(v_86),
        .I5(v_129),
        .O(v_162));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c78
       (.I0(v_87),
        .I1(v_126),
        .O(v_156));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c79
       (.I0(v_86),
        .I1(v_126),
        .O(v_159));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c8
       (.I0(v_69),
        .I1(v_52),
        .O(v_68));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c80
       (.I0(v_62),
        .I1(v_126),
        .O(v_161));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c81
       (.I0(v_53),
        .I1(v_126),
        .O(v_163));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c82
       (.I0(v_65),
        .I1(v_66),
        .O(v_164));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c83
       (.I0(v_66),
        .I1(v_65),
        .I2(v_63),
        .I3(v_69),
        .O(v_165));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c84
       (.I0(v_167),
        .I1(v_168),
        .O(v_166));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c85
       (.I0(v_170),
        .I1(v_171),
        .O(v_169));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c86
       (.I0(v_173),
        .I1(v_174),
        .O(v_172));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c87
       (.I0(v_126),
        .I1(v_86),
        .I2(v_127),
        .I3(v_87),
        .I4(v_129),
        .I5(v_88),
        .O(v_155));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c88
       (.I0(v_126),
        .I1(v_62),
        .I2(v_127),
        .I3(v_86),
        .I4(v_129),
        .I5(v_87),
        .O(v_158));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c89
       (.C(clk),
        .CE(\<const1> ),
        .D(v_175),
        .Q(\^Y [0]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c9
       (.I0(v_52),
        .I1(v_69),
        .I2(v_71),
        .I3(v_72),
        .O(v_70));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(v_176),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(v_177),
        .CO({v_178,NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_73,v_91,v_102,v_103}),
        .O({v_176,v_182,v_183,v_184}),
        .S({v_104,v_108,v_109,v_110}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c92
       (.CI(\<const0> ),
        .CO({v_185,NLW_c92_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_74,v_78,v_79,\<const0> }),
        .O({v_66,v_168,v_171,v_174}),
        .S({v_80,v_82,v_83,v_84}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c93
       (.CI(v_185),
        .CO({v_189,NLW_c93_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_85,v_89,v_90,v_92}),
        .O({v_114,v_54,v_57,v_71}),
        .S({v_93,v_96,v_98,v_100}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c94
       (.C(clk),
        .CE(\<const1> ),
        .D(v_193),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c95
       (.C(clk),
        .CE(\<const1> ),
        .D(v_194),
        .Q(\^Y [12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c96
       (.C(clk),
        .CE(\<const1> ),
        .D(v_195),
        .Q(\^Y [13]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c97
       (.C(clk),
        .CE(\<const1> ),
        .D(v_196),
        .Q(\^Y [14]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c98
       (.CI(v_178),
        .CO({v_197,NLW_c98_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_122,v_132,v_133,v_134}),
        .O({v_196,v_195,v_194,v_193}),
        .S({v_135,v_136,v_137,v_138}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v_201),
        .CO({v_115,NLW_c99_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_125,v_128}),
        .O({v_55,v_58}),
        .S({\<const0> ,\<const1> ,v_130,v_131}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h07F78777F86C78A0)) 
    direct_quadol_18
       (.I0(v_59),
        .I1(v_126),
        .I2(v_127),
        .I3(v_53),
        .I4(v_69),
        .I5(v_148),
        .O5(v_236),
        .O6(v_238));
endmodule
