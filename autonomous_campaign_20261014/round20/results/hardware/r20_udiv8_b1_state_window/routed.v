// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:28:40 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_udiv8_b1_state_window/routed.v
// Design      : r20_udiv8_b1_state_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "23d4e06" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"29.999998\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.240415\",\n      \"Worst Negative Slack (WNS)\": \"11.261927\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"67\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"24\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.475000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.661000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_udiv8_b1_state_window
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
  wire [297:43]v;
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:0]NLW_c101_CO_UNCONNECTED;
  wire [3:0]NLW_c102_CO_UNCONNECTED;
  wire [3:0]NLW_c102_O_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [3:0]NLW_c106_CO_UNCONNECTED;
  wire [3:0]NLW_c81_CO_UNCONNECTED;
  wire [3:0]NLW_c82_CO_UNCONNECTED;
  wire [3:0]NLW_c84_CO_UNCONNECTED;
  wire [3:0]NLW_c85_CO_UNCONNECTED;
  wire [3:0]NLW_c86_CO_UNCONNECTED;
  wire [3:0]NLW_c86_O_UNCONNECTED;
  wire [3:0]NLW_c88_CO_UNCONNECTED;
  wire [3:0]NLW_c89_CO_UNCONNECTED;
  wire [3:0]NLW_c90_CO_UNCONNECTED;
  wire [3:0]NLW_c90_O_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c93_CO_UNCONNECTED;
  wire [3:0]NLW_c94_CO_UNCONNECTED;
  wire [3:0]NLW_c94_O_UNCONNECTED;
  wire [3:0]NLW_c96_CO_UNCONNECTED;
  wire [3:0]NLW_c97_CO_UNCONNECTED;
  wire [3:0]NLW_c98_CO_UNCONNECTED;
  wire [3:0]NLW_c98_O_UNCONNECTED;

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
       (.G(v[188]));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c10
       (.I0(v[44]),
        .I1(v[68]),
        .I2(v[69]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(v[274]),
        .CO({v[128],NLW_c100_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[147],v[156]}),
        .O(v[135]),
        .S({\<const0> ,\<const0> ,v[153],v[155]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v[281]),
        .CO(v[274:271]),
        .CYINIT(\<const0> ),
        .DI({v[158],v[160],v[162],v[164]}),
        .O({v[137],v[139],v[141],v[143]}),
        .S({v[157],v[159],v[161],v[163]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(\<const0> ),
        .CO(v[281:278]),
        .CYINIT(v[147]),
        .DI({v[148],v[150],v[152],\<const0> }),
        .O({v[145],v[129],v[131],NLW_c102_O_UNCONNECTED[0]}),
        .S({v[146],v[149],v[151],\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c103
       (.C(clk),
        .CE(\<const1> ),
        .D(v[147]),
        .Q(\^Y [6]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v[289]),
        .CO(v[147]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[182]}),
        .S({\<const0> ,\<const0> ,\<const0> ,v[183]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c105
       (.CI(v[297]),
        .CO(v[289:286]),
        .CYINIT(\<const0> ),
        .DI({v[184],v[185],v[186],v[187]}),
        .O({v[154],v[156],v[158],v[160]}),
        .S({v[165],v[167],v[168],v[170]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c106
       (.CI(\<const0> ),
        .CO(v[297:294]),
        .CYINIT(v[173]),
        .DI({v[68],v[174],v[175],v[181]}),
        .O({v[162],v[164],v[148],v[150]}),
        .S({v[176],v[178],v[179],v[180]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c107
       (.C(clk),
        .CE(\<const1> ),
        .D(v[173]),
        .Q(\^Y [7]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c108
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[52]),
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
        .D(A[1]),
        .Q(v[76]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c11
       (.I0(v[71]),
        .I1(v[45]),
        .I2(v[72]),
        .O(v[70]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(A[2]),
        .Q(v[95]),
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
        .D(A[3]),
        .Q(v[114]),
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
        .D(A[4]),
        .Q(v[133]),
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
        .D(A[5]),
        .Q(v[152]),
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
        .D(A[6]),
        .Q(v[181]),
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
        .D(A[7]),
        .Q(v[177]),
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
        .D(B[0]),
        .Q(v[51]),
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
        .D(B[1]),
        .Q(v[48]),
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
        .D(B[2]),
        .Q(v[45]),
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
        .D(B[3]),
        .Q(v[68]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c12
       (.I0(v[71]),
        .I1(v[48]),
        .I2(v[74]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[65]),
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
        .D(B[5]),
        .Q(v[62]),
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
        .D(B[6]),
        .Q(v[59]),
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
        .D(B[7]),
        .Q(v[56]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c13
       (.I0(v[71]),
        .I1(v[51]),
        .I2(v[76]),
        .O(v[75]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c14
       (.I0(v[71]),
        .I1(v[78]),
        .O(v[77]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c15
       (.I0(v[71]),
        .I1(v[56]),
        .I2(v[80]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c16
       (.I0(v[71]),
        .I1(v[59]),
        .I2(v[82]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c17
       (.I0(v[71]),
        .I1(v[62]),
        .I2(v[84]),
        .O(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c18
       (.I0(v[71]),
        .I1(v[65]),
        .I2(v[86]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c19
       (.I0(v[71]),
        .I1(v[68]),
        .I2(v[88]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c2
       (.I0(v[44]),
        .I1(v[45]),
        .I2(v[46]),
        .O(v[43]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c20
       (.I0(v[90]),
        .I1(v[45]),
        .I2(v[91]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c21
       (.I0(v[90]),
        .I1(v[48]),
        .I2(v[93]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c22
       (.I0(v[90]),
        .I1(v[51]),
        .I2(v[95]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c23
       (.I0(v[90]),
        .I1(v[97]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c24
       (.I0(v[90]),
        .I1(v[56]),
        .I2(v[99]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c25
       (.I0(v[90]),
        .I1(v[59]),
        .I2(v[101]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c26
       (.I0(v[90]),
        .I1(v[62]),
        .I2(v[103]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c27
       (.I0(v[90]),
        .I1(v[65]),
        .I2(v[105]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c28
       (.I0(v[90]),
        .I1(v[68]),
        .I2(v[107]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c29
       (.I0(v[109]),
        .I1(v[45]),
        .I2(v[110]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c3
       (.I0(v[44]),
        .I1(v[48]),
        .I2(v[49]),
        .O(v[47]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c30
       (.I0(v[109]),
        .I1(v[48]),
        .I2(v[112]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c31
       (.I0(v[109]),
        .I1(v[51]),
        .I2(v[114]),
        .O(v[113]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c32
       (.I0(v[109]),
        .I1(v[116]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c33
       (.I0(v[109]),
        .I1(v[56]),
        .I2(v[118]),
        .O(v[117]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c34
       (.I0(v[109]),
        .I1(v[59]),
        .I2(v[120]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c35
       (.I0(v[109]),
        .I1(v[62]),
        .I2(v[122]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c36
       (.I0(v[109]),
        .I1(v[65]),
        .I2(v[124]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c37
       (.I0(v[109]),
        .I1(v[68]),
        .I2(v[126]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c38
       (.I0(v[128]),
        .I1(v[45]),
        .I2(v[129]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c39
       (.I0(v[128]),
        .I1(v[48]),
        .I2(v[131]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v[44]),
        .I1(v[51]),
        .I2(v[52]),
        .O(v[50]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c40
       (.I0(v[128]),
        .I1(v[51]),
        .I2(v[133]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c41
       (.I0(v[128]),
        .I1(v[135]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c42
       (.I0(v[128]),
        .I1(v[56]),
        .I2(v[137]),
        .O(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c43
       (.I0(v[128]),
        .I1(v[59]),
        .I2(v[139]),
        .O(v[138]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c44
       (.I0(v[128]),
        .I1(v[62]),
        .I2(v[141]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c45
       (.I0(v[128]),
        .I1(v[65]),
        .I2(v[143]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c46
       (.I0(v[128]),
        .I1(v[68]),
        .I2(v[145]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c47
       (.I0(v[147]),
        .I1(v[45]),
        .I2(v[148]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c48
       (.I0(v[147]),
        .I1(v[48]),
        .I2(v[150]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c49
       (.I0(v[147]),
        .I1(v[51]),
        .I2(v[152]),
        .O(v[151]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c5
       (.I0(v[44]),
        .I1(v[54]),
        .O(v[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c50
       (.I0(v[147]),
        .I1(v[154]),
        .O(v[153]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c51
       (.I0(v[147]),
        .I1(v[56]),
        .I2(v[156]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c52
       (.I0(v[147]),
        .I1(v[59]),
        .I2(v[158]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c53
       (.I0(v[147]),
        .I1(v[62]),
        .I2(v[160]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c54
       (.I0(v[147]),
        .I1(v[65]),
        .I2(v[162]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c55
       (.I0(v[147]),
        .I1(v[68]),
        .I2(v[164]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9979)) 
    c56
       (.I0(v[56]),
        .I1(v[59]),
        .I2(v[166]),
        .I3(v[62]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h5BA5)) 
    c57
       (.I0(v[59]),
        .I1(v[56]),
        .I2(v[62]),
        .I3(v[166]),
        .O(v[167]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h3333CCCDCCCC3333)) 
    c59
       (.I0(v[59]),
        .I1(v[65]),
        .I2(v[62]),
        .I3(v[56]),
        .I4(v[68]),
        .I5(v[171]),
        .O(v[170]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c6
       (.I0(v[44]),
        .I1(v[56]),
        .I2(v[57]),
        .O(v[55]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c61
       (.I0(v[45]),
        .I1(v[173]),
        .O(v[174]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c62
       (.I0(v[48]),
        .I1(v[173]),
        .O(v[175]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969696996966996)) 
    c63
       (.I0(v[173]),
        .I1(v[68]),
        .I2(v[45]),
        .I3(v[51]),
        .I4(v[177]),
        .I5(v[48]),
        .O(v[176]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c66
       (.I0(v[173]),
        .I1(v[51]),
        .I2(v[181]),
        .O(v[180]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    c69
       (.I0(v[59]),
        .I1(v[166]),
        .I2(v[62]),
        .I3(v[56]),
        .O(v[182]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c7
       (.I0(v[44]),
        .I1(v[59]),
        .I2(v[60]),
        .O(v[58]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h5575)) 
    c70
       (.I0(v[56]),
        .I1(v[62]),
        .I2(v[166]),
        .I3(v[59]),
        .O(v[183]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c71
       (.I0(v[56]),
        .I1(v[173]),
        .O(v[184]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c72
       (.I0(v[59]),
        .I1(v[173]),
        .O(v[185]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c73
       (.I0(v[62]),
        .I1(v[173]),
        .O(v[186]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c74
       (.I0(v[65]),
        .I1(v[173]),
        .O(v[187]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0000000000001011)) 
    c78
       (.I0(v[68]),
        .I1(v[48]),
        .I2(v[177]),
        .I3(v[51]),
        .I4(v[45]),
        .I5(v[65]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c79
       (.C(clk),
        .CE(\<const1> ),
        .D(v[190]),
        .Q(\^Y [0]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c8
       (.I0(v[44]),
        .I1(v[62]),
        .I2(v[63]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c80
       (.CI(v[191]),
        .CO(v[190]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[44]}),
        .S({\<const0> ,\<const0> ,\<const0> ,v[53]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c81
       (.CI(v[199]),
        .CO({v[191],NLW_c81_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[57],v[60],v[63],v[66]}),
        .S({v[55],v[58],v[61],v[64]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c82
       (.CI(\<const0> ),
        .CO(v[199:196]),
        .CYINIT(v[44]),
        .DI({v[69],v[46],v[49],v[52]}),
        .S({v[67],v[43],v[47],v[50]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c83
       (.C(clk),
        .CE(\<const1> ),
        .D(v[44]),
        .Q(\^Y [1]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c84
       (.CI(v[214]),
        .CO({v[44],NLW_c84_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[71],v[80]}),
        .O(v[54]),
        .S({\<const0> ,\<const0> ,v[77],v[79]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c85
       (.CI(v[221]),
        .CO(v[214:211]),
        .CYINIT(\<const0> ),
        .DI({v[82],v[84],v[86],v[88]}),
        .O({v[57],v[60],v[63],v[66]}),
        .S({v[81],v[83],v[85],v[87]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c86
       (.CI(\<const0> ),
        .CO(v[221:218]),
        .CYINIT(v[71]),
        .DI({v[72],v[74],v[76],\<const0> }),
        .O({v[69],v[46],v[49],NLW_c86_O_UNCONNECTED[0]}),
        .S({v[70],v[73],v[75],\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c87
       (.C(clk),
        .CE(\<const1> ),
        .D(v[71]),
        .Q(\^Y [2]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c88
       (.CI(v[229]),
        .CO({v[71],NLW_c88_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[90],v[99]}),
        .O(v[78]),
        .S({\<const0> ,\<const0> ,v[96],v[98]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c89
       (.CI(v[236]),
        .CO(v[229:226]),
        .CYINIT(\<const0> ),
        .DI({v[101],v[103],v[105],v[107]}),
        .O({v[80],v[82],v[84],v[86]}),
        .S({v[100],v[102],v[104],v[106]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c9
       (.I0(v[44]),
        .I1(v[65]),
        .I2(v[66]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c90
       (.CI(\<const0> ),
        .CO(v[236:233]),
        .CYINIT(v[90]),
        .DI({v[91],v[93],v[95],\<const0> }),
        .O({v[88],v[72],v[74],NLW_c90_O_UNCONNECTED[0]}),
        .S({v[89],v[92],v[94],\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(\<const1> ),
        .D(v[90]),
        .Q(\^Y [3]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c92
       (.CI(v[244]),
        .CO({v[90],NLW_c92_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[109],v[118]}),
        .O(v[97]),
        .S({\<const0> ,\<const0> ,v[115],v[117]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c93
       (.CI(v[251]),
        .CO(v[244:241]),
        .CYINIT(\<const0> ),
        .DI({v[120],v[122],v[124],v[126]}),
        .O({v[99],v[101],v[103],v[105]}),
        .S({v[119],v[121],v[123],v[125]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c94
       (.CI(\<const0> ),
        .CO(v[251:248]),
        .CYINIT(v[109]),
        .DI({v[110],v[112],v[114],\<const0> }),
        .O({v[107],v[91],v[93],NLW_c94_O_UNCONNECTED[0]}),
        .S({v[108],v[111],v[113],\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c95
       (.C(clk),
        .CE(\<const1> ),
        .D(v[109]),
        .Q(\^Y [4]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(v[259]),
        .CO({v[109],NLW_c96_CO_UNCONNECTED[0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[128],v[137]}),
        .O(v[116]),
        .S({\<const0> ,\<const0> ,v[134],v[136]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c97
       (.CI(v[266]),
        .CO(v[259:256]),
        .CYINIT(\<const0> ),
        .DI({v[139],v[141],v[143],v[145]}),
        .O({v[118],v[120],v[122],v[124]}),
        .S({v[138],v[140],v[142],v[144]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c98
       (.CI(\<const0> ),
        .CO(v[266:263]),
        .CYINIT(v[128]),
        .DI({v[129],v[131],v[133],\<const0> }),
        .O({v[126],v[110],v[112],NLW_c98_O_UNCONNECTED[0]}),
        .S({v[127],v[130],v[132],\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDSE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_S_INVERTED(1'b0)) 
    c99
       (.C(clk),
        .CE(\<const1> ),
        .D(v[128]),
        .Q(\^Y [5]),
        .S(v[188]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h0011000111110101)) 
    merge_0
       (.I0(v[45]),
        .I1(v[48]),
        .I2(v[51]),
        .I3(v[68]),
        .I4(v[177]),
        .I5(\<const1> ),
        .O5(v[171]),
        .O6(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    merge_10
       (.I0(v[56]),
        .I1(v[59]),
        .I2(v[62]),
        .I3(v[166]),
        .O(v[173]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h3CC3C33C99666996)) 
    merge_2
       (.I0(v[45]),
        .I1(v[48]),
        .I2(v[51]),
        .I3(v[173]),
        .I4(v[177]),
        .I5(\<const1> ),
        .O5(v[178]),
        .O6(v[179]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h0FF1F00F)) 
    merge_8
       (.I0(v[56]),
        .I1(v[59]),
        .I2(v[62]),
        .I3(v[65]),
        .I4(v[169]),
        .O(v[168]));
endmodule
