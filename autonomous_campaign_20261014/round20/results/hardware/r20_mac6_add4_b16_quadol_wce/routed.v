// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:25:23 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_quadol_wce/routed.v
// Design      : r20_mac6_add4_b16_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "9ab2ed84" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.155104\",\n      \"Worst Negative Slack (WNS)\": \"6.639797\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"35\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"35\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"28\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.422000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"20.029000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_mac6_add4_b16_quadol_wce
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
  wire [11:0]\^Y ;
  wire c53_n_7;
  wire c55_n_7;
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
  wire v_131;
  wire v_132;
  wire v_133;
  wire v_135;
  wire v_136;
  wire v_137;
  wire v_145;
  wire v_152;
  wire v_156;
  wire v_160;
  wire v_162;
  wire v_163;
  wire v_164;
  wire v_165;
  wire v_172;
  wire v_173;
  wire v_174;
  wire v_175;
  wire v_176;
  wire v_180;
  wire v_181;
  wire v_185;
  wire v_187;
  wire v_188;
  wire v_190;
  wire v_191;
  wire v_192;
  wire v_193;
  wire v_195;
  wire v_196;
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
  wire v_59;
  wire v_60;
  wire v_61;
  wire v_62;
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
  wire v_86;
  wire v_87;
  wire v_88;
  wire v_89;
  wire v_90;
  wire v_91;
  wire v_93;
  wire v_95;
  wire v_96;
  wire v_98;
  wire [3:0]NLW_c54_CO_UNCONNECTED;
  wire [3:0]NLW_c55_CO_UNCONNECTED;
  wire [3:0]NLW_c59_CO_UNCONNECTED;
  wire [3:0]NLW_c60_CO_UNCONNECTED;
  wire [3:0]NLW_c65_CO_UNCONNECTED;
  wire [3:0]NLW_c66_CO_UNCONNECTED;

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
  assign Y[11:0] = \^Y [11:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c10
       (.I0(v_54),
        .I1(v_73),
        .I2(v_76),
        .I3(v_75),
        .I4(v_56),
        .O(v_48));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    c11
       (.I0(v_77),
        .I1(v_54),
        .I2(v_78),
        .I3(v_49),
        .I4(v_73),
        .O(v_51));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c12
       (.I0(v_57),
        .I1(v_49),
        .O(v_62));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c13
       (.I0(v_55),
        .I1(v_49),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c14
       (.I0(v_50),
        .I1(v_49),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c15
       (.I0(v_75),
        .I1(v_54),
        .O(v_69));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c16
       (.I0(v_77),
        .I1(v_56),
        .O(v_71));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c17
       (.I0(v_80),
        .I1(v_57),
        .I2(v_81),
        .I3(v_55),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c18
       (.I0(v_80),
        .I1(v_50),
        .I2(v_81),
        .I3(v_57),
        .I4(v_83),
        .I5(v_55),
        .O(v_82));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c19
       (.I0(v_80),
        .I1(v_73),
        .I2(v_81),
        .I3(v_50),
        .I4(v_83),
        .I5(v_57),
        .O(v_84));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h956A)) 
    c2
       (.I0(v_48),
        .I1(v_49),
        .I2(v_50),
        .I3(v_51),
        .O(v_47));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c20
       (.I0(v_81),
        .I1(v_57),
        .I2(v_80),
        .I3(v_55),
        .O(v_86));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c21
       (.I0(v_83),
        .I1(v_50),
        .I2(v_57),
        .I3(v_80),
        .I4(v_55),
        .I5(v_81),
        .O(v_87));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c22
       (.I0(v_84),
        .I1(v_81),
        .I2(v_57),
        .I3(v_89),
        .I4(v_55),
        .I5(v_83),
        .O(v_88));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c23
       (.I0(v_185),
        .I1(v_81),
        .I2(v_50),
        .I3(v_91),
        .I4(v_57),
        .I5(v_83),
        .O(v_90));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c24
       (.I0(v_50),
        .I1(v_80),
        .O(v_89));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c25
       (.I0(v_73),
        .I1(v_80),
        .O(v_91));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c26
       (.I0(v_55),
        .I1(v_54),
        .I2(v_57),
        .I3(v_56),
        .O(v_93));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c27
       (.I0(v_49),
        .I1(v_55),
        .I2(v_191),
        .I3(v_65),
        .O(v_53));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c28
       (.I0(v_49),
        .I1(v_57),
        .I2(v_61),
        .I3(v_60),
        .O(v_95));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c29
       (.I0(v_49),
        .I1(v_50),
        .I2(v_48),
        .I3(v_51),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h6A959595956A6A6A)) 
    c3
       (.I0(v_53),
        .I1(v_54),
        .I2(v_55),
        .I3(v_56),
        .I4(v_57),
        .I5(v_193),
        .O(v_52));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c30
       (.I0(v_83),
        .I1(v_75),
        .I2(v_81),
        .I3(v_77),
        .O(v_100));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c31
       (.I0(v_77),
        .I1(v_83),
        .O(v_101));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c32
       (.I0(v_50),
        .I1(v_83),
        .O(v_98));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c33
       (.I0(v_103),
        .I1(v_104),
        .O(v_102));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c34
       (.I0(v_106),
        .I1(v_107),
        .O(v_105));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c35
       (.I0(v_109),
        .I1(v_110),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c36
       (.I0(v_112),
        .I1(v_113),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c37
       (.I0(v_81),
        .I1(v_75),
        .I2(v_80),
        .I3(v_77),
        .O(v_115));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c38
       (.I0(v_83),
        .I1(v_75),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c39
       (.I0(v_54),
        .I1(v_75),
        .I2(v_70),
        .I3(v_77),
        .I4(v_56),
        .O(v_117));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    c4
       (.I0(v_60),
        .I1(v_61),
        .I2(v_62),
        .I3(v_191),
        .I4(v_64),
        .I5(v_65),
        .O(v_59));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    c40
       (.I0(v_78),
        .I1(v_77),
        .I2(v_54),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A6A6A6A)) 
    c41
       (.I0(v_117),
        .I1(v_73),
        .I2(v_49),
        .I3(v_78),
        .I4(v_54),
        .I5(v_77),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    c42
       (.I0(v_78),
        .I1(v_77),
        .I2(v_54),
        .I3(v_49),
        .I4(v_75),
        .O(v_120));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    c43
       (.I0(v_122),
        .I1(v_49),
        .I2(v_77),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c44
       (.C(clk),
        .CE(\<const1> ),
        .D(B[9]),
        .Q(v_104),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c45
       (.C(clk),
        .CE(\<const1> ),
        .D(B[8]),
        .Q(v_107),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c46
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v_110),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c47
       (.C(clk),
        .CE(\<const1> ),
        .D(B[6]),
        .Q(v_113),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c48
       (.C(clk),
        .CE(\<const1> ),
        .D(v_123),
        .Q(\^Y [0]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c49
       (.C(clk),
        .CE(\<const1> ),
        .D(v_124),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    c5
       (.I0(v_51),
        .I1(v_48),
        .I2(v_67),
        .I3(v_61),
        .I4(v_62),
        .I5(v_60),
        .O(v_66));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c50
       (.C(clk),
        .CE(\<const1> ),
        .D(v_125),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c51
       (.CI(v_126),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_125,v_124,v_131,v_132}),
        .S({v_133,c53_n_7,v_135,v_136}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c52
       (.CI(v_137),
        .CO(v_72),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,\<const0> ,\<const0> ,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c53
       (.CI(v_145),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v_192}),
        .O({v_133,c53_n_7}),
        .S({\<const0> ,\<const0> ,v_93,v_195}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c54
       (.CI(v_152),
        .CO({v_137,NLW_c54_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_79,v_82,v_84,v_185}),
        .O({v_74,v_76,v_70,v_78}),
        .S({v_86,v_87,v_88,v_90}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c55
       (.CI(v_156),
        .CO({v_145,NLW_c55_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_53,v_95,v_96,v_47}),
        .O({v_135,v_136,v_160,c55_n_7}),
        .S({v_52,v_59,v_66,v_68}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c56
       (.C(clk),
        .CE(\<const1> ),
        .D(v_162),
        .Q(\^Y [1]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c57
       (.C(clk),
        .CE(\<const1> ),
        .D(v_163),
        .Q(\^Y [2]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c58
       (.C(clk),
        .CE(\<const1> ),
        .D(v_164),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c59
       (.CI(\<const0> ),
        .CO({v_165,NLW_c59_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_103,v_106,v_109,v_112}),
        .O({v_164,v_163,v_162,v_123}),
        .S({v_102,v_105,v_108,v_111}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6996696996966996)) 
    c6
       (.I0(v_48),
        .I1(v_67),
        .I2(v_51),
        .I3(v_69),
        .I4(v_70),
        .I5(v_71),
        .O(v_68));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c60
       (.CI(\<const0> ),
        .CO({v_152,NLW_c60_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_187,v_115,v_116,\<const0> }),
        .O({v_122,v_172,v_109,v_112}),
        .S({v_190,v_188,v_100,v_101}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c61
       (.C(clk),
        .CE(\<const1> ),
        .D(v_173),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c62
       (.C(clk),
        .CE(\<const1> ),
        .D(v_174),
        .Q(\^Y [5]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c63
       (.C(clk),
        .CE(\<const1> ),
        .D(v_175),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c64
       (.C(clk),
        .CE(\<const1> ),
        .D(v_176),
        .Q(\^Y [7]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c65
       (.CI(v_165),
        .CO({v_126,NLW_c65_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_176,v_175,v_174,v_173}),
        .S({v_160,c55_n_7,v_180,v_181}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c66
       (.CI(\<const0> ),
        .CO({v_156,NLW_c66_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_117,v_118,v_122,\<const0> }),
        .O({v_180,v_181,v_103,v_106}),
        .S({v_119,v_120,v_121,v_172}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c67
       (.C(clk),
        .CE(\<const1> ),
        .D(v_132),
        .Q(\^Y [8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c68
       (.C(clk),
        .CE(\<const1> ),
        .D(v_131),
        .Q(\^Y [9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c69
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v_77),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hF8808080)) 
    c7
       (.I0(v_56),
        .I1(v_73),
        .I2(v_74),
        .I3(v_54),
        .I4(v_50),
        .O(v_65));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(A[1]),
        .Q(v_75),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c71
       (.C(clk),
        .CE(\<const1> ),
        .D(A[2]),
        .Q(v_73),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c72
       (.C(clk),
        .CE(\<const1> ),
        .D(A[3]),
        .Q(v_50),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c73
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v_57),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c74
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v_55),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c75
       (.C(clk),
        .CE(\<const1> ),
        .D(B[0]),
        .Q(v_83),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c76
       (.C(clk),
        .CE(\<const1> ),
        .D(B[1]),
        .Q(v_81),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c77
       (.C(clk),
        .CE(\<const1> ),
        .D(B[2]),
        .Q(v_80),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c78
       (.C(clk),
        .CE(\<const1> ),
        .D(B[3]),
        .Q(v_49),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c79
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v_54),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c8
       (.I0(v_54),
        .I1(v_50),
        .I2(v_74),
        .I3(v_73),
        .I4(v_56),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c80
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v_56),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hF8808080)) 
    c9
       (.I0(v_56),
        .I1(v_75),
        .I2(v_76),
        .I3(v_54),
        .I4(v_73),
        .O(v_60));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h936C5FA04800A000)) 
    direct_quadol_10
       (.I0(v_57),
        .I1(v_50),
        .I2(v_54),
        .I3(v_72),
        .I4(v_56),
        .I5(\<const1> ),
        .O5(v_192),
        .O6(v_191));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h175FA000EC80A000)) 
    direct_quadol_13
       (.I0(v_57),
        .I1(v_50),
        .I2(v_54),
        .I3(v_72),
        .I4(v_56),
        .I5(v_55),
        .O5(v_193),
        .O6(v_195));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h96663CCCE888C000)) 
    direct_quadol_6
       (.I0(v_80),
        .I1(v_50),
        .I2(v_81),
        .I3(v_73),
        .I4(v_75),
        .I5(v_196),
        .O5(v_185),
        .O6(v_187));
  LUT1 #(
    .INIT(2'h1)) 
    direct_quadol_6_i_1
       (.I0(v_83),
        .O(v_196));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h43B30FFFBC78F088)) 
    direct_quadol_8
       (.I0(v_77),
        .I1(v_80),
        .I2(v_81),
        .I3(v_73),
        .I4(v_75),
        .I5(v_98),
        .O5(v_188),
        .O6(v_190));
endmodule
