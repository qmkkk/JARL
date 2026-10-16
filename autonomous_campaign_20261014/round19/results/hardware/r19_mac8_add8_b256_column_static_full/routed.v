// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 11:49:23 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/hardware/r19_mac8_add8_b256_column_static_full/routed.v
// Design      : r19_mac8_add8_b256_column_static_full
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "fd00bc56" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"10.000000\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.169481\",\n      \"Worst Negative Slack (WNS)\": \"1.752246\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"53\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"53\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"40\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.417000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.558000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_mac8_add8_b256_column_static_full
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
  wire [201:51]v;
  wire [3:0]NLW_c73_CO_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;
  wire [3:0]NLW_c75_CO_UNCONNECTED;
  wire [3:0]NLW_c76_CO_UNCONNECTED;
  wire [3:0]NLW_c76_O_UNCONNECTED;
  wire [3:0]NLW_c80_CO_UNCONNECTED;
  wire [3:0]NLW_c81_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;

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
  LUT2 #(
    .INIT(4'h8)) 
    c10
       (.I0(v[55]),
        .I1(v[75]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(B[0]),
        .Q(v[84]),
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
        .D(B[10]),
        .Q(v[195]),
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
        .D(B[11]),
        .Q(v[196]),
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
        .D(B[12]),
        .Q(v[197]),
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
        .D(B[13]),
        .Q(v[135]),
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
        .D(B[14]),
        .Q(v[87]),
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
        .D(B[15]),
        .Q(v[83]),
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
        .D(B[1]),
        .Q(v[94]),
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
        .D(B[2]),
        .Q(v[56]),
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
        .D(B[3]),
        .Q(v[54]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    c11
       (.I0(v[72]),
        .I1(v[73]),
        .I2(v[65]),
        .I3(v[64]),
        .I4(v[70]),
        .I5(v[71]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[75]),
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
        .D(B[5]),
        .Q(v[101]),
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
        .D(B[6]),
        .Q(v[98]),
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
        .D(B[7]),
        .Q(v[100]),
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
        .D(B[8]),
        .Q(v[151]),
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
        .D(B[9]),
        .Q(v[194]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hF8808080)) 
    c12
       (.I0(v[75]),
        .I1(v[82]),
        .I2(v[83]),
        .I3(v[84]),
        .I4(v[53]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c14
       (.I0(v[89]),
        .I1(v[75]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h077F8080F8808080)) 
    c15
       (.I0(v[53]),
        .I1(v[84]),
        .I2(v[83]),
        .I3(v[82]),
        .I4(v[75]),
        .I5(v[91]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT6 #(
    .INIT(64'h6999966696669666)) 
    c16
       (.I0(v[87]),
        .I1(v[83]),
        .I2(v[75]),
        .I3(v[82]),
        .I4(v[53]),
        .I5(v[84]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8778787800000000)) 
    c18
       (.I0(v[94]),
        .I1(v[55]),
        .I2(v[95]),
        .I3(v[89]),
        .I4(v[56]),
        .I5(v[73]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c19
       (.I0(v[56]),
        .I1(v[55]),
        .I2(v[89]),
        .I3(v[54]),
        .I4(v[53]),
        .I5(v[94]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c21
       (.I0(v[54]),
        .I1(v[91]),
        .I2(v[94]),
        .I3(v[55]),
        .I4(v[56]),
        .I5(v[89]),
        .O(v[65]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c22
       (.I0(v[98]),
        .I1(v[86]),
        .I2(v[99]),
        .I3(v[100]),
        .I4(v[82]),
        .I5(v[101]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c24
       (.I0(v[103]),
        .I1(v[98]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c26
       (.I0(v[103]),
        .I1(v[100]),
        .I2(v[86]),
        .I3(v[101]),
        .I4(v[98]),
        .I5(v[99]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c27
       (.I0(v[98]),
        .I1(v[103]),
        .I2(v[101]),
        .I3(v[99]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c28
       (.I0(v[54]),
        .I1(v[55]),
        .I2(v[56]),
        .I3(v[53]),
        .O(v[69]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c29
       (.I0(v[56]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[70]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c3
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c30
       (.I0(v[54]),
        .I1(v[89]),
        .I2(v[94]),
        .I3(v[53]),
        .I4(v[56]),
        .I5(v[55]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c32
       (.I0(v[54]),
        .I1(v[82]),
        .I2(v[94]),
        .I3(v[89]),
        .I4(v[56]),
        .I5(v[91]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c33
       (.I0(v[91]),
        .I1(v[54]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    c34
       (.I0(v[68]),
        .I1(v[77]),
        .I2(v[67]),
        .I3(v[112]),
        .I4(v[113]),
        .I5(v[114]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    c35
       (.I0(v[76]),
        .I1(v[112]),
        .I2(v[113]),
        .I3(v[68]),
        .I4(v[77]),
        .I5(v[67]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    c36
       (.I0(v[96]),
        .I1(v[66]),
        .I2(v[79]),
        .I3(v[51]),
        .I4(v[78]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c39
       (.I0(v[100]),
        .I1(v[86]),
        .I2(v[101]),
        .I3(v[91]),
        .I4(v[98]),
        .I5(v[82]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v[60]),
        .I1(v[58]),
        .I2(v[59]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c40
       (.I0(v[100]),
        .I1(v[99]),
        .I2(v[101]),
        .I3(v[82]),
        .I4(v[98]),
        .I5(v[86]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c41
       (.I0(v[121]),
        .I1(v[101]),
        .I2(v[53]),
        .I3(v[122]),
        .I4(v[55]),
        .I5(v[98]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c42
       (.I0(v[124]),
        .I1(v[101]),
        .I2(v[55]),
        .I3(v[125]),
        .I4(v[89]),
        .I5(v[98]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c43
       (.I0(v[118]),
        .I1(v[101]),
        .I2(v[89]),
        .I3(v[127]),
        .I4(v[91]),
        .I5(v[98]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c44
       (.I0(v[119]),
        .I1(v[101]),
        .I2(v[91]),
        .I3(v[129]),
        .I4(v[82]),
        .I5(v[98]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c45
       (.I0(v[89]),
        .I1(v[100]),
        .O(v[122]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c46
       (.I0(v[91]),
        .I1(v[100]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c47
       (.I0(v[82]),
        .I1(v[100]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c48
       (.I0(v[86]),
        .I1(v[100]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c49
       (.I0(v[100]),
        .I1(v[55]),
        .I2(v[98]),
        .I3(v[53]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c5
       (.I0(v[63]),
        .I1(v[64]),
        .I2(v[65]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c50
       (.I0(v[100]),
        .I1(v[89]),
        .I2(v[101]),
        .I3(v[53]),
        .I4(v[98]),
        .I5(v[55]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c51
       (.I0(v[98]),
        .I1(v[55]),
        .I2(v[100]),
        .I3(v[53]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c52
       (.I0(v[101]),
        .I1(v[89]),
        .I2(v[55]),
        .I3(v[100]),
        .I4(v[53]),
        .I5(v[98]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c53
       (.I0(v[100]),
        .I1(v[91]),
        .I2(v[101]),
        .I3(v[55]),
        .I4(v[98]),
        .I5(v[89]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c54
       (.I0(v[100]),
        .I1(v[82]),
        .I2(v[101]),
        .I3(v[89]),
        .I4(v[98]),
        .I5(v[91]),
        .O(v[124]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT1 #(
    .INIT(2'h1)) 
    c55
       (.I0(v[135]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h077F7F7FF8808080)) 
    c56
       (.I0(v[91]),
        .I1(v[56]),
        .I2(v[137]),
        .I3(v[82]),
        .I4(v[54]),
        .I5(v[72]),
        .O(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c57
       (.I0(v[56]),
        .I1(v[91]),
        .I2(v[82]),
        .I3(v[54]),
        .I4(v[89]),
        .I5(v[94]),
        .O(v[138]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c58
       (.I0(v[89]),
        .I1(v[94]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c59
       (.I0(v[56]),
        .I1(v[89]),
        .I2(v[91]),
        .I3(v[54]),
        .I4(v[55]),
        .I5(v[94]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9999966696666666)) 
    c6
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[54]),
        .I3(v[53]),
        .I4(v[69]),
        .I5(v[52]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c60
       (.I0(v[62]),
        .I1(v[110]),
        .I2(v[109]),
        .I3(v[140]),
        .I4(v[136]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c62
       (.I0(v[140]),
        .I1(v[136]),
        .I2(v[142]),
        .O(v[143]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c63
       (.I0(v[145]),
        .I1(v[146]),
        .I2(v[138]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696966996696969)) 
    c66
       (.I0(v[142]),
        .I1(v[136]),
        .I2(v[140]),
        .I3(v[145]),
        .I4(v[138]),
        .I5(v[146]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c67
       (.I0(v[145]),
        .I1(v[146]),
        .I2(v[138]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c68
       (.C(clk),
        .CE(\<const1> ),
        .D(v[151]),
        .Q(\^Y [0]),
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
        .D(v[152]),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    c7
       (.I0(v[70]),
        .I1(v[71]),
        .I2(v[72]),
        .I3(v[73]),
        .I4(v[65]),
        .I5(v[64]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(v[153]),
        .Q(\^Y [11]),
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
        .D(v[154]),
        .Q(\^Y [12]),
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
        .D(v[155]),
        .Q(\^Y [13]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c73
       (.CI(v[156]),
        .CO({v[157],NLW_c73_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[114],v[76],v[96],v[108]}),
        .O(v[155:152]),
        .S({v[111],v[115],v[116],v[117]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(v[161]),
        .CO({v[112],NLW_c74_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[67],v[78]}),
        .S({\<const0> ,\<const1> ,v[74],v[80]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c75
       (.CI(\<const0> ),
        .CO(v[161:158]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[81],v[87],\<const0> }),
        .O({v[60],v[109],v[142],v[145]}),
        .S({v[88],v[90],v[92],v[93]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c76
       (.CI(\<const0> ),
        .CO(v[170:167]),
        .CYINIT(\<const0> ),
        .DI({v[97],v[102],v[104],\<const0> }),
        .O({v[110],v[140],v[146],NLW_c76_O_UNCONNECTED[0]}),
        .S({v[105],v[106],v[107],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c77
       (.C(clk),
        .CE(\<const1> ),
        .D(v[175]),
        .Q(\^Y [14]),
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
        .D(v[176]),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c79
       (.CI(v[157]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v[176:175]),
        .S({\<const0> ,\<const0> ,v[183],v[184]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c8
       (.I0(v[53]),
        .I1(v[75]),
        .O(v[74]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c80
       (.CI(v[185]),
        .CO(v[183:181]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[130],v[131]}),
        .O({v[184],v[114]}),
        .S({\<const0> ,\<const1> ,v[132],v[133]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c81
       (.CI(v[170]),
        .CO({v[185],NLW_c81_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[121],v[124],v[118],v[119]}),
        .O({v[113],v[68],v[79],v[58]}),
        .S({v[120],v[123],v[126],v[128]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c82
       (.C(clk),
        .CE(\<const1> ),
        .D(v[194]),
        .Q(\^Y [1]),
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
        .D(v[195]),
        .Q(\^Y [2]),
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
        .D(v[196]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(\<const1> ),
        .D(v[197]),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c86
       (.C(clk),
        .CE(\<const1> ),
        .D(v[134]),
        .Q(\^Y [5]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c87
       (.C(clk),
        .CE(\<const1> ),
        .D(v[198]),
        .Q(\^Y [6]),
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
        .D(v[199]),
        .Q(\^Y [7]),
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
        .D(v[200]),
        .Q(\^Y [8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c9
       (.I0(v[77]),
        .I1(v[68]),
        .I2(v[67]),
        .I3(v[78]),
        .I4(v[51]),
        .I5(v[79]),
        .O(v[76]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(v[201]),
        .Q(\^Y [9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(\<const0> ),
        .CO({v[156],NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(v[135]),
        .DI({v[139],v[141],v[143],v[144]}),
        .O(v[201:198]),
        .S({v[147],v[148],v[149],v[150]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[103]),
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
        .D(A[1]),
        .Q(v[99]),
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
        .D(A[2]),
        .Q(v[86]),
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
        .D(A[3]),
        .Q(v[82]),
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
        .D(A[4]),
        .Q(v[91]),
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
        .D(A[5]),
        .Q(v[89]),
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
        .D(A[6]),
        .Q(v[55]),
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
        .D(A[7]),
        .Q(v[53]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT1 #(
    .INIT(2'h1)) 
    merge_0
       (.I0(v[87]),
        .O(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hAA6A6A6AC0808080)) 
    merge_1
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .I4(v[56]),
        .I5(\<const1> ),
        .O5(v[77]),
        .O6(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h5AF0AA006CCCCCCC)) 
    merge_2
       (.I0(v[86]),
        .I1(v[97]),
        .I2(v[100]),
        .I3(v[101]),
        .I4(v[103]),
        .I5(\<const1> ),
        .O5(v[105]),
        .O6(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9669696969696996)) 
    merge_25
       (.I0(v[62]),
        .I1(v[109]),
        .I2(v[110]),
        .I3(v[136]),
        .I4(v[140]),
        .I5(v[142]),
        .O5(v[141]),
        .O6(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hA880A880A995566A)) 
    merge_5
       (.I0(v[61]),
        .I1(v[62]),
        .I2(v[109]),
        .I3(v[110]),
        .I4(v[139]),
        .I5(\<const1> ),
        .O5(v[147]),
        .O6(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8448844896696996)) 
    merge_6
       (.I0(v[51]),
        .I1(v[57]),
        .I2(v[78]),
        .I3(v[79]),
        .I4(v[108]),
        .I5(\<const1> ),
        .O5(v[117]),
        .O6(v[96]));
endmodule
