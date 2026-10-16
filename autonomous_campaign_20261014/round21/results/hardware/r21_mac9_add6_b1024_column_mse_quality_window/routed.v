// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 15:02:22 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round21/results/hardware/r21_mac9_add6_b1024_column_mse_quality_window/routed.v
// Design      : r21_mac9_add6_b1024_column_mse_quality_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "9b0c87b5" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"12.500000\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.048521\",\n      \"Worst Negative Slack (WNS)\": \"4.801539\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"66\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"66\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"41\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.320000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.327000 seconds\"\n      }\n    }\n  }\n}" *) 
module r21_mac9_add6_b1024_column_mse_quality_window
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
  wire [17:0]\^Y ;
  wire ZERO;
  wire clk;
  wire [238:52]v;
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:0]NLW_c101_CO_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [3:0]NLW_c109_CO_UNCONNECTED;
  wire [3:0]NLW_c88_CO_UNCONNECTED;
  wire [3:0]NLW_c89_CO_UNCONNECTED;
  wire [3:0]NLW_c89_O_UNCONNECTED;
  wire [3:0]NLW_c90_CO_UNCONNECTED;
  wire [3:0]NLW_c95_CO_UNCONNECTED;
  wire [3:0]NLW_c96_CO_UNCONNECTED;

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
  assign Y[17:8] = \^Y [17:8];
  assign Y[7] = \<const0> ;
  assign Y[6:0] = \^Y [6:0];
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(v[197]),
        .CO({v[167],NLW_c100_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[166],v[138]}),
        .S({\<const0> ,\<const1> ,v[169],v[170]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c101
       (.CI(v[185]),
        .CO({v[137],NLW_c101_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[156],ZERO,v[158]}),
        .O({v[133],v[118],v[113]}),
        .S({\<const1> ,v[159],v[160],v[161]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c102
       (.C(clk),
        .CE(\<const1> ),
        .D(v[218]),
        .Q(\^Y [1]),
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
        .D(v[219]),
        .Q(\^Y [2]),
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
        .D(v[220]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c105
       (.CI(\<const0> ),
        .CO({v[221],NLW_c105_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({v[225],v[226],v[227],v[228]}),
        .O({v[220:218],v[171]}),
        .S({v[225],v[226],v[227],v[228]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c106
       (.C(clk),
        .CE(\<const1> ),
        .D(v[229]),
        .Q(\^Y [4]),
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
        .D(v[230]),
        .Q(\^Y [5]),
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
        .D(v[231]),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c109
       (.CI(v[221]),
        .CO({v[231],NLW_c109_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[237],v[238]}),
        .O(v[230:229]),
        .S({\<const0> ,\<const1> ,v[237],v[238]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c11
       (.I0(v[82]),
        .I1(v[83]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(v[179]),
        .Q(\^Y [8]),
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
        .D(v[178]),
        .Q(\^Y [9]),
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
        .D(A[0]),
        .Q(v[86]),
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
        .D(A[1]),
        .Q(v[68]),
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
        .D(A[2]),
        .Q(v[82]),
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
        .D(A[3]),
        .Q(v[93]),
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
        .D(A[4]),
        .Q(v[71]),
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
        .D(A[5]),
        .Q(v[89]),
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
        .D(A[6]),
        .Q(v[65]),
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
        .D(A[7]),
        .Q(v[74]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c12
       (.I0(v[68]),
        .I1(v[83]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(A[8]),
        .Q(v[76]),
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
        .D(B[0]),
        .Q(v[77]),
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
        .D(B[10]),
        .Q(v[227]),
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
        .D(B[11]),
        .Q(v[226]),
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
        .D(B[12]),
        .Q(v[225]),
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
        .D(B[13]),
        .Q(v[238]),
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
        .D(B[14]),
        .Q(v[237]),
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
        .D(B[1]),
        .Q(v[73]),
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
        .D(B[2]),
        .Q(v[64]),
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
        .D(B[3]),
        .Q(v[91]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c13
       (.I0(v[77]),
        .I1(v[76]),
        .I2(v[83]),
        .I3(v[86]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[72]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c131
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v[90]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c132
       (.C(clk),
        .CE(\<const1> ),
        .D(B[6]),
        .Q(v[88]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c133
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v[67]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c134
       (.C(clk),
        .CE(\<const1> ),
        .D(B[8]),
        .Q(v[83]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c135
       (.C(clk),
        .CE(\<const1> ),
        .D(B[9]),
        .Q(v[228]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c14
       (.I0(v[71]),
        .I1(v[88]),
        .I2(v[89]),
        .I3(v[90]),
        .I4(v[74]),
        .I5(v[91]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c15
       (.I0(v[88]),
        .I1(v[93]),
        .I2(v[65]),
        .I3(v[90]),
        .I4(v[71]),
        .I5(v[91]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c16
       (.I0(v[82]),
        .I1(v[88]),
        .I2(v[89]),
        .I3(v[90]),
        .I4(v[91]),
        .I5(v[93]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c17
       (.I0(v[87]),
        .I1(v[90]),
        .I2(v[65]),
        .I3(v[96]),
        .I4(v[91]),
        .I5(v[76]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c18
       (.I0(v[92]),
        .I1(v[88]),
        .I2(v[71]),
        .I3(v[98]),
        .I4(v[74]),
        .I5(v[91]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c19
       (.I0(v[94]),
        .I1(v[90]),
        .I2(v[71]),
        .I3(v[100]),
        .I4(v[65]),
        .I5(v[91]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c20
       (.I0(v[91]),
        .I1(v[89]),
        .I2(v[82]),
        .I3(v[88]),
        .I4(v[93]),
        .I5(v[90]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c22
       (.I0(v[89]),
        .I1(v[88]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c23
       (.I0(v[89]),
        .I1(v[90]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c24
       (.I0(v[93]),
        .I1(v[88]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h659A956A956A956A)) 
    c25
       (.I0(v[62]),
        .I1(v[82]),
        .I2(v[67]),
        .I3(v[104]),
        .I4(v[68]),
        .I5(v[69]),
        .O(v[103]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c27
       (.I0(v[80]),
        .I1(v[79]),
        .I2(v[55]),
        .I3(v[93]),
        .I4(v[67]),
        .I5(v[52]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAA95555696)) 
    c28
       (.I0(v[102]),
        .I1(v[62]),
        .I2(v[82]),
        .I3(v[67]),
        .I4(v[104]),
        .I5(v[66]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h56)) 
    c29
       (.I0(v[103]),
        .I1(v[106]),
        .I2(v[70]),
        .O(v[109]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8778788778878778)) 
    c3
       (.I0(v[56]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[59]),
        .I4(v[60]),
        .I5(v[61]),
        .O(v[55]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696969)) 
    c30
       (.I0(v[106]),
        .I1(v[70]),
        .I2(v[69]),
        .I3(v[68]),
        .I4(v[67]),
        .O(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFE8E8E8E8000000)) 
    c31
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[67]),
        .I4(v[65]),
        .I5(v[115]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c32
       (.I0(v[117]),
        .I1(v[118]),
        .I2(v[119]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c34
       (.I0(v[67]),
        .I1(v[89]),
        .O(v[122]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c35
       (.I0(v[124]),
        .I1(v[125]),
        .I2(v[126]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c36
       (.I0(v[67]),
        .I1(v[65]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h95556AAA)) 
    c37
       (.I0(v[118]),
        .I1(v[121]),
        .I2(v[76]),
        .I3(v[72]),
        .I4(v[117]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c4
       (.I0(v[54]),
        .I1(v[53]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEABFBFEA802A2A80)) 
    c40
       (.I0(v[111]),
        .I1(v[74]),
        .I2(v[67]),
        .I3(v[133]),
        .I4(v[134]),
        .I5(v[116]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6996966996699669)) 
    c41
       (.I0(v[123]),
        .I1(v[113]),
        .I2(v[112]),
        .I3(v[114]),
        .I4(v[67]),
        .I5(v[89]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    c42
       (.I0(v[62]),
        .I1(v[104]),
        .I2(v[69]),
        .I3(v[68]),
        .I4(v[67]),
        .I5(v[82]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA8080EA80EAEA80)) 
    c45
       (.I0(v[123]),
        .I1(v[67]),
        .I2(v[89]),
        .I3(v[113]),
        .I4(v[112]),
        .I5(v[114]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c46
       (.I0(v[74]),
        .I1(v[67]),
        .I2(v[133]),
        .I3(v[134]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h17E8E817E817E817)) 
    c47
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[115]),
        .I4(v[67]),
        .I5(v[65]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFFF877887780000)) 
    c48
       (.I0(v[56]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[59]),
        .I4(v[61]),
        .I5(v[60]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c49
       (.I0(v[125]),
        .I1(v[126]),
        .I2(v[124]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[64]),
        .I1(v[65]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c50
       (.I0(v[64]),
        .I1(v[65]),
        .I2(v[76]),
        .I3(v[74]),
        .I4(v[72]),
        .I5(v[142]),
        .O(v[112]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h00B2B200B20000B2)) 
    c51
       (.I0(v[120]),
        .I1(v[122]),
        .I2(v[123]),
        .I3(v[127]),
        .I4(v[115]),
        .I5(v[128]),
        .O(v[143]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c52
       (.I0(v[65]),
        .I1(v[83]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c53
       (.I0(v[89]),
        .I1(v[83]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c54
       (.I0(v[71]),
        .I1(v[83]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c55
       (.I0(v[93]),
        .I1(v[83]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c56
       (.I0(v[64]),
        .I1(v[65]),
        .I2(v[74]),
        .I3(v[142]),
        .I4(v[76]),
        .I5(v[72]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA80FFFF0000EA80)) 
    c57
       (.I0(v[59]),
        .I1(v[56]),
        .I2(v[57]),
        .I3(v[58]),
        .I4(v[148]),
        .I5(v[149]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAAA9999555)) 
    c58
       (.I0(v[149]),
        .I1(v[58]),
        .I2(v[57]),
        .I3(v[56]),
        .I4(v[59]),
        .I5(v[148]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c59
       (.I0(v[89]),
        .I1(v[72]),
        .I2(v[73]),
        .I3(v[76]),
        .I4(v[64]),
        .I5(v[74]),
        .O(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    c6
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[69]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c61
       (.I0(v[65]),
        .I1(v[72]),
        .I2(v[76]),
        .I3(v[64]),
        .O(v[58]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c63
       (.I0(v[64]),
        .I1(v[74]),
        .I2(v[73]),
        .I3(v[76]),
        .I4(v[72]),
        .I5(v[89]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c64
       (.I0(v[58]),
        .I1(v[57]),
        .I2(v[56]),
        .I3(v[59]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c65
       (.I0(v[72]),
        .I1(v[74]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c66
       (.I0(v[76]),
        .I1(v[72]),
        .I2(v[65]),
        .I3(v[64]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c67
       (.I0(v[79]),
        .I1(v[80]),
        .O(v[151]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c68
       (.I0(v[132]),
        .I1(v[136]),
        .I2(v[133]),
        .I3(v[67]),
        .I4(v[74]),
        .I5(v[134]),
        .O(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE78E18711871E78E)) 
    c69
       (.I0(v[139]),
        .I1(v[128]),
        .I2(v[127]),
        .I3(v[115]),
        .I4(v[116]),
        .I5(v[140]),
        .O(v[153]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EEEE88881111777)) 
    c70
       (.I0(v[129]),
        .I1(v[123]),
        .I2(v[67]),
        .I3(v[89]),
        .I4(v[120]),
        .I5(v[141]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EEEE88881111777)) 
    c71
       (.I0(v[79]),
        .I1(v[130]),
        .I2(v[67]),
        .I3(v[71]),
        .I4(v[131]),
        .I5(v[135]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c74
       (.I0(v[88]),
        .I1(v[89]),
        .I2(v[65]),
        .I3(v[90]),
        .I4(v[91]),
        .I5(v[76]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDBAF2450B400B400)) 
    c77
       (.I0(v[162]),
        .I1(v[89]),
        .I2(v[65]),
        .I3(v[88]),
        .I4(v[74]),
        .I5(v[90]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c78
       (.I0(v[91]),
        .I1(v[76]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h57777FFFA8888000)) 
    c80
       (.I0(v[166]),
        .I1(v[137]),
        .I2(v[67]),
        .I3(v[76]),
        .I4(v[138]),
        .I5(v[167]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h93363636366C6C6C)) 
    c81
       (.I0(v[164]),
        .I1(v[166]),
        .I2(v[137]),
        .I3(v[67]),
        .I4(v[76]),
        .I5(v[138]),
        .O(v[168]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c82
       (.I0(v[133]),
        .I1(v[67]),
        .I2(v[74]),
        .I3(v[134]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c83
       (.I0(v[76]),
        .I1(v[83]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c84
       (.I0(v[74]),
        .I1(v[83]),
        .O(v[170]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(\<const1> ),
        .D(v[171]),
        .Q(\^Y [0]),
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
        .D(v[172]),
        .Q(\^Y [10]),
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
        .D(v[173]),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c88
       (.CI(\<const0> ),
        .CO({v[174],NLW_c88_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[78],v[102],v[103],v[105]}),
        .O({v[173:172],v[178],v[179]}),
        .S({v[107],v[108],v[109],v[110]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c89
       (.CI(\<const0> ),
        .CO({v[180],NLW_c89_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[75],\<const0> }),
        .O({v[61],v[104],v[69],NLW_c89_O_UNCONNECTED[0]}),
        .S({v[81],v[84],v[85],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c9
       (.I0(v[76]),
        .I1(v[77]),
        .O(v[75]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c90
       (.CI(\<const0> ),
        .CO(v[185:182]),
        .CYINIT(\<const0> ),
        .DI({v[87],v[92],v[94],\<const0> }),
        .O({v[125],v[60],v[54],v[106]}),
        .S({v[95],v[97],v[99],v[101]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(\<const1> ),
        .D(v[189]),
        .Q(\^Y [12]),
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
        .D(v[190]),
        .Q(\^Y [13]),
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
        .D(v[191]),
        .Q(\^Y [14]),
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
        .D(v[192]),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(v[174]),
        .CO({v[193],NLW_c95_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[132],v[143],v[150],v[151]}),
        .O(v[192:189]),
        .S({v[152],v[153],v[154],v[155]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(v[180]),
        .CO(v[197:194]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[134],v[117],v[114],v[124]}),
        .S({v[144],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c97
       (.C(clk),
        .CE(\<const1> ),
        .D(v[201]),
        .Q(\^Y [16]),
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
        .D(v[202]),
        .Q(\^Y [17]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v[193]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[163]}),
        .O(v[202:201]),
        .S({\<const0> ,\<const0> ,v[165],v[168]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h78878778F770F880)) 
    merge_0
       (.I0(v[72]),
        .I1(v[76]),
        .I2(v[113]),
        .I3(v[114]),
        .I4(v[121]),
        .I5(\<const1> ),
        .O5(v[128]),
        .O6(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hB4F0CC00F000F000)) 
    merge_1
       (.I0(v[65]),
        .I1(v[74]),
        .I2(v[76]),
        .I3(v[88]),
        .I4(v[90]),
        .I5(\<const1> ),
        .O5(v[156]),
        .O6(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hF300300059B292A2)) 
    merge_21
       (.I0(v[56]),
        .I1(v[63]),
        .I2(v[71]),
        .I3(v[73]),
        .I4(v[74]),
        .I5(\<const1> ),
        .O5(v[53]),
        .O6(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8888777788888888)) 
    merge_22
       (.I0(v[71]),
        .I1(v[72]),
        .I2(v[73]),
        .I3(v[74]),
        .I4(v[106]),
        .I5(\<const1> ),
        .O5(v[70]),
        .O6(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h0000F880F880F880)) 
    merge_23
       (.I0(v[67]),
        .I1(v[71]),
        .I2(v[130]),
        .I3(v[131]),
        .I4(v[135]),
        .I5(\<const1> ),
        .O5(v[129]),
        .O6(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h7887877888777788)) 
    merge_24
       (.I0(v[67]),
        .I1(v[71]),
        .I2(v[79]),
        .I3(v[130]),
        .I4(v[131]),
        .I5(\<const1> ),
        .O5(v[80]),
        .O6(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hE11E1E1EEEEEEEEE)) 
    merge_26
       (.I0(v[53]),
        .I1(v[54]),
        .I2(v[55]),
        .I3(v[67]),
        .I4(v[93]),
        .I5(\<const1> ),
        .O5(v[52]),
        .O6(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8778000087788778)) 
    merge_4
       (.I0(v[67]),
        .I1(v[76]),
        .I2(v[137]),
        .I3(v[138]),
        .I4(v[164]),
        .I5(\<const1> ),
        .O5(v[136]),
        .O6(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h3800F000)) 
    merge_6
       (.I0(v[65]),
        .I1(v[74]),
        .I2(v[76]),
        .I3(v[88]),
        .I4(v[90]),
        .O(v[159]));
endmodule
