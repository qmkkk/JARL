// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 15:00:30 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round21/results/hardware/r21_mac8_add8_b256_column_mse_serial_then_quadol/routed.v
// Design      : r21_mac8_add8_b256_column_mse_serial_then_quadol
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "8055366c" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"10.000000\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.163005\",\n      \"Worst Negative Slack (WNS)\": \"3.674525\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"51\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"51\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"40\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.388000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.401000 seconds\"\n      }\n    }\n  }\n}" *) 
module r21_mac8_add8_b256_column_mse_serial_then_quadol
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
  wire v_149;
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
  wire v_189;
  wire v_190;
  wire v_191;
  wire v_192;
  wire v_193;
  wire v_194;
  wire v_195;
  wire v_199;
  wire v_203;
  wire v_205;
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
  wire v_69;
  wire v_70;
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
  wire [3:0]NLW_c68_CO_UNCONNECTED;
  wire [3:0]NLW_c69_CO_UNCONNECTED;
  wire [3:0]NLW_c69_O_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;
  wire [3:0]NLW_c75_CO_UNCONNECTED;
  wire [3:0]NLW_c76_CO_UNCONNECTED;
  wire [3:0]NLW_c85_CO_UNCONNECTED;
  wire [3:0]NLW_c86_CO_UNCONNECTED;

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
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(B[13]),
        .Q(v_199),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c101
       (.C(clk),
        .CE(\<const1> ),
        .D(B[14]),
        .Q(v_139),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c102
       (.C(clk),
        .CE(\<const1> ),
        .D(B[15]),
        .Q(v_135),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c103
       (.C(clk),
        .CE(\<const1> ),
        .D(B[1]),
        .Q(v_85),
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
        .D(B[2]),
        .Q(v_54),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c105
       (.C(clk),
        .CE(\<const1> ),
        .D(B[3]),
        .Q(v_56),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c106
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v_123),
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
        .D(B[5]),
        .Q(v_90),
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
        .D(B[6]),
        .Q(v_88),
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
        .D(B[7]),
        .Q(v_92),
        .R(\<const0> ));
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
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(B[8]),
        .Q(v_149),
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
        .D(B[9]),
        .Q(v_189),
        .R(\<const0> ));
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
    .INIT(64'hF880880080800000)) 
    c16
       (.I0(v_86),
        .I1(v_85),
        .I2(v_56),
        .I3(v_70),
        .I4(v_69),
        .I5(v_54),
        .O(v_65));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c17
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
    c18
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
    c19
       (.I0(v_90),
        .I1(v_89),
        .I2(v_92),
        .I3(v_94),
        .O(v_93));
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
  LUT2 #(
    .INIT(4'h8)) 
    c20
       (.I0(v_94),
        .I1(v_88),
        .O(v_95));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    c21
       (.I0(v_87),
        .I1(v_92),
        .I2(v_89),
        .I3(v_94),
        .I4(v_90),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c22
       (.I0(v_73),
        .I1(v_51),
        .I2(v_74),
        .I3(v_57),
        .O(v_97));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c23
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
    c24
       (.I0(v_88),
        .I1(v_94),
        .I2(v_90),
        .I3(v_91),
        .O(v_99));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c26
       (.I0(v_53),
        .I1(v_54),
        .I2(v_55),
        .I3(v_56),
        .O(v_75));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c27
       (.I0(v_58),
        .I1(v_60),
        .I2(v_59),
        .I3(v_67),
        .I4(v_101),
        .I5(v_102),
        .O(v_100));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c28
       (.I0(v_67),
        .I1(v_101),
        .I2(v_102),
        .I3(v_81),
        .I4(v_80),
        .O(v_103));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c29
       (.I0(v_72),
        .I1(v_78),
        .I2(v_77),
        .I3(v_84),
        .I4(v_105),
        .I5(v_106),
        .O(v_104));
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
    .INIT(32'h9336366C)) 
    c30
       (.I0(v_57),
        .I1(v_76),
        .I2(v_73),
        .I3(v_74),
        .I4(v_51),
        .O(v_107));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    c31
       (.I0(v_100),
        .I1(v_74),
        .I2(v_51),
        .I3(v_73),
        .I4(v_57),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c32
       (.I0(v_79),
        .I1(v_82),
        .I2(v_102),
        .I3(v_101),
        .I4(v_67),
        .O(v_109));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hC0808080)) 
    c33
       (.I0(v_52),
        .I1(v_56),
        .I2(v_53),
        .I3(v_54),
        .I4(v_55),
        .O(v_84));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c34
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
    c35
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
    c36
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
    c37
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
    c38
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
    c39
       (.I0(v_111),
        .I1(v_92),
        .I2(v_70),
        .I3(v_117),
        .I4(v_86),
        .I5(v_88),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c4
       (.I0(v_61),
        .I1(v_62),
        .I2(v_63),
        .I3(v_64),
        .I4(v_65),
        .I5(v_66),
        .O(v_60));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    c40
       (.I0(v_112),
        .I1(v_90),
        .I2(v_86),
        .I3(v_69),
        .I4(v_92),
        .I5(v_119),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c41
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
    c42
       (.I0(v_53),
        .I1(v_123),
        .O(v_122));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c43
       (.I0(v_55),
        .I1(v_123),
        .O(v_124));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFFFEA80EA800000)) 
    c44
       (.I0(v_63),
        .I1(v_64),
        .I2(v_65),
        .I3(v_66),
        .I4(v_61),
        .I5(v_62),
        .O(v_52));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v_86),
        .I1(v_92),
        .O(v_115));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v_90),
        .I1(v_55),
        .O(v_117));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v_70),
        .I1(v_88),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c48
       (.I0(v_92),
        .I1(v_89),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h11171777EEE8E888)) 
    c49
       (.I0(v_105),
        .I1(v_106),
        .I2(v_78),
        .I3(v_77),
        .I4(v_84),
        .I5(v_126),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c5
       (.I0(v_64),
        .I1(v_65),
        .I2(v_66),
        .I3(v_63),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c50
       (.I0(v_55),
        .I1(v_92),
        .I2(v_53),
        .I3(v_88),
        .O(v_127));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c51
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
    c52
       (.I0(v_88),
        .I1(v_55),
        .I2(v_92),
        .I3(v_53),
        .O(v_129));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c53
       (.I0(v_86),
        .I1(v_90),
        .I2(v_88),
        .I3(v_53),
        .I4(v_92),
        .I5(v_55),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT1 #(
    .INIT(2'h1)) 
    c54
       (.I0(v_132),
        .O(v_131));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c55
       (.I0(v_137),
        .I1(v_123),
        .I2(v_69),
        .I3(v_135),
        .I4(v_53),
        .I5(v_134),
        .O(v_136));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87282800)) 
    c56
       (.I0(v_134),
        .I1(v_55),
        .I2(v_139),
        .I3(v_89),
        .I4(v_123),
        .O(v_138));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c57
       (.I0(v_70),
        .I1(v_54),
        .I2(v_85),
        .I3(v_86),
        .I4(v_56),
        .I5(v_69),
        .O(v_140));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c58
       (.I0(v_80),
        .I1(v_81),
        .O(v_141));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h1EE1E11E)) 
    c59
       (.I0(v_81),
        .I1(v_80),
        .I2(v_67),
        .I3(v_101),
        .I4(v_102),
        .O(v_142));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT4 #(
    .INIT(16'h6669)) 
    c60
       (.I0(v_81),
        .I1(v_80),
        .I2(v_144),
        .I3(v_140),
        .O(v_143));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c61
       (.I0(v_144),
        .I1(v_140),
        .I2(v_146),
        .O(v_145));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hF8888000)) 
    c62
       (.I0(v_55),
        .I1(v_134),
        .I2(v_89),
        .I3(v_123),
        .I4(v_139),
        .O(v_137));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c63
       (.I0(v_86),
        .I1(v_123),
        .O(v_148));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c64
       (.C(clk),
        .CE(\<const1> ),
        .D(v_149),
        .Q(\^Y [0]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c65
       (.C(clk),
        .CE(\<const1> ),
        .D(v_150),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c66
       (.C(clk),
        .CE(\<const1> ),
        .D(v_151),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c67
       (.C(clk),
        .CE(\<const1> ),
        .D(v_152),
        .Q(\^Y [12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c68
       (.CI(v_153),
        .CO({v_154,NLW_c68_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_83,v_97,v_100,v_103}),
        .O({v_152,v_151,v_150,v_158}),
        .S({v_104,v_107,v_108,v_109}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c69
       (.CI(\<const0> ),
        .CO({v_159,NLW_c69_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_87,v_93,v_95,\<const0> }),
        .O({v_101,v_81,v_144,NLW_c69_O_UNCONNECTED[0]}),
        .S({v_96,v_98,v_99,\<const0> }));
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
        .CE(\<const1> ),
        .D(v_164),
        .Q(\^Y [13]),
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
        .D(v_165),
        .Q(\^Y [14]),
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
        .D(v_166),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c73
       (.CI(v_154),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v_126}),
        .O({v_166,v_165,v_164}),
        .S({\<const0> ,v_172,v_173,v_125}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(v_174),
        .CO({v_172,NLW_c74_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_127,v_128}),
        .O({v_173,v_126}),
        .S({\<const0> ,\<const1> ,v_129,v_130}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c75
       (.CI(v_159),
        .CO({v_174,NLW_c75_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_110,v_111,v_112,v_113}),
        .O({v_106,v_77,v_74,v_59}),
        .S({v_114,v_116,v_118,v_120}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c76
       (.CI(v_183),
        .CO({v_105,NLW_c76_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_78,v_73}),
        .S({\<const0> ,\<const1> ,v_122,v_124}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c77
       (.C(clk),
        .CE(\<const1> ),
        .D(v_189),
        .Q(\^Y [1]),
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
        .D(v_190),
        .Q(\^Y [2]),
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
        .D(v_191),
        .Q(\^Y [3]),
        .R(\<const0> ));
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
        .CE(\<const1> ),
        .D(v_131),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c81
       (.C(clk),
        .CE(\<const1> ),
        .D(v_192),
        .Q(\^Y [5]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c82
       (.C(clk),
        .CE(\<const1> ),
        .D(v_193),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c83
       (.C(clk),
        .CE(\<const1> ),
        .D(v_194),
        .Q(\^Y [7]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c84
       (.C(clk),
        .CE(\<const1> ),
        .D(v_195),
        .Q(\^Y [8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c85
       (.CI(\<const0> ),
        .CO({v_153,NLW_c85_CO_UNCONNECTED[2:0]}),
        .CYINIT(v_132),
        .DI({\<const0> ,v_141,v_146,\<const0> }),
        .O({v_195,v_194,v_193,v_192}),
        .S({v_142,v_143,v_145,v_199}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c86
       (.CI(\<const0> ),
        .CO({v_183,NLW_c86_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v_203,v_137,\<const0> }),
        .O({v_58,v_102,v_80,v_146}),
        .S({v_148,v_205,v_136,v_138}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c87
       (.C(clk),
        .CE(\<const1> ),
        .D(v_158),
        .Q(\^Y [9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c88
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v_94),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c89
       (.C(clk),
        .CE(\<const1> ),
        .D(A[1]),
        .Q(v_91),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'hE)) 
    c9
       (.I0(v_80),
        .I1(v_81),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(A[2]),
        .Q(v_89),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(\<const1> ),
        .D(A[3]),
        .Q(v_69),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v_70),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c93
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v_86),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c94
       (.C(clk),
        .CE(\<const1> ),
        .D(A[6]),
        .Q(v_55),
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
        .D(A[7]),
        .Q(v_53),
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
        .D(B[0]),
        .Q(v_134),
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
        .D(B[10]),
        .Q(v_190),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c98
       (.C(clk),
        .CE(\<const1> ),
        .D(B[11]),
        .Q(v_191),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c99
       (.C(clk),
        .CE(\<const1> ),
        .D(B[12]),
        .Q(v_132),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h42226AAAE888C000)) 
    direct_quadol_21
       (.I0(v_123),
        .I1(v_135),
        .I2(v_134),
        .I3(v_53),
        .I4(v_69),
        .I5(v_70),
        .O5(v_203),
        .O6(v_205));
endmodule
