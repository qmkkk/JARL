// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:19:22 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/serial_claim_check/results/hardware/s19_mac10_add4_b4096_column_quadol_wce/routed.v
// Design      : s19_mac10_add4_b4096_column_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "b844220b" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.176992\",\n      \"Worst Negative Slack (WNS)\": \"7.550503\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"64\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"64\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"39\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.405000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.756000 seconds\"\n      }\n    }\n  }\n}" *) 
module s19_mac10_add4_b4096_column_quadol_wce
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
  wire [19:0]\^Y ;
  wire clk;
  wire [248:50]v;
  wire [3:0]NLW_c102_CO_UNCONNECTED;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [3:0]NLW_c106_CO_UNCONNECTED;
  wire [3:0]NLW_c89_CO_UNCONNECTED;
  wire [3:0]NLW_c94_CO_UNCONNECTED;
  wire [3:0]NLW_c95_CO_UNCONNECTED;
  wire [3:0]NLW_c96_CO_UNCONNECTED;
  wire [3:0]NLW_c97_CO_UNCONNECTED;
  wire [3:0]NLW_c97_O_UNCONNECTED;

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
  assign Y[19:9] = \^Y [19:9];
  assign Y[8] = \<const0> ;
  assign Y[7] = \<const0> ;
  assign Y[6] = \<const0> ;
  assign Y[5] = \<const0> ;
  assign Y[4] = \<const0> ;
  assign Y[3:0] = \^Y [3:0];
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(v[50]));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c10
       (.I0(v[72]),
        .I1(v[73]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(v[214]),
        .Q(\^Y [19]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v[195]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[170]}),
        .O(v[214:212]),
        .S({\<const0> ,v[220],v[221],v[169]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v[203]),
        .CO({v[144],NLW_c102_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[160],v[161],v[162]}),
        .O({v[100],v[92],v[95]}),
        .S({\<const1> ,v[163],v[164],v[165]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v[226]),
        .CO({v[179],NLW_c103_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[176],v[156]}),
        .S({\<const0> ,\<const1> ,v[167],v[168]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v[232]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[175],v[177]}),
        .O({v[220],v[221],v[170]}),
        .S({\<const0> ,v[178],v[180],v[181]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c105
       (.CI(v[207]),
        .CO(v[226:223]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[149],v[151],v[153],v[115]}),
        .S({v[171],v[172],v[173],v[174]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c106
       (.CI(v[199]),
        .CO(v[232:229]),
        .CYINIT(\<const0> ),
        .DI({v[148],v[150],v[152],v[154]}),
        .O({v[143],v[99],v[91],v[94]}),
        .S({v[155],v[157],v[158],v[159]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c107
       (.C(clk),
        .CE(\<const1> ),
        .D(v[244]),
        .Q(\^Y [1]),
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
        .D(v[245]),
        .Q(\^Y [2]),
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
        .D(v[246]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h66696999)) 
    c11
       (.I0(v[66]),
        .I1(v[65]),
        .I2(v[70]),
        .I3(v[69]),
        .I4(v[57]),
        .O(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(v[190]),
        .Q(\^Y [9]),
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
        .D(A[0]),
        .Q(v[113]),
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
        .D(A[1]),
        .Q(v[109]),
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
        .D(A[2]),
        .Q(v[105]),
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
        .D(A[3]),
        .Q(v[110]),
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
        .D(A[4]),
        .Q(v[106]),
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
        .D(A[5]),
        .Q(v[59]),
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
        .D(A[6]),
        .Q(v[122]),
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
        .D(A[7]),
        .Q(v[52]),
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
        .D(A[8]),
        .Q(v[60]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c12
       (.I0(v[70]),
        .I1(v[69]),
        .I2(v[57]),
        .I3(v[72]),
        .I4(v[73]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(A[9]),
        .Q(v[54]),
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
        .Q(v[136]),
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
        .Q(v[182]),
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
        .Q(v[244]),
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
        .Q(v[245]),
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
        .Q(v[246]),
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
        .D(B[1]),
        .Q(v[58]),
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
        .D(B[2]),
        .Q(v[55]),
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
        .D(B[3]),
        .Q(v[123]),
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
        .D(B[4]),
        .Q(v[53]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hA6)) 
    c13
       (.I0(v[73]),
        .I1(v[72]),
        .I2(v[53]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v[121]),
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
        .D(B[6]),
        .Q(v[120]),
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
        .D(B[7]),
        .Q(v[103]),
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
        .D(B[8]),
        .Q(v[138]),
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
        .D(B[9]),
        .Q(v[104]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c14
       (.I0(v[52]),
        .I1(v[55]),
        .I2(v[60]),
        .I3(v[82]),
        .I4(v[54]),
        .I5(v[53]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c15
       (.I0(v[52]),
        .I1(v[55]),
        .I2(v[54]),
        .I3(v[60]),
        .I4(v[53]),
        .I5(v[82]),
        .O(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c16
       (.I0(v[77]),
        .I1(v[75]),
        .I2(v[76]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h5666A999)) 
    c17
       (.I0(v[85]),
        .I1(v[86]),
        .I2(v[87]),
        .I3(v[62]),
        .I4(v[88]),
        .O(v[77]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c18
       (.I0(v[54]),
        .I1(v[90]),
        .I2(v[91]),
        .I3(v[92]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFF6A6A00)) 
    c19
       (.I0(v[90]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[94]),
        .I4(v[95]),
        .O(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c20
       (.I0(v[91]),
        .I1(v[92]),
        .I2(v[54]),
        .I3(v[90]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c21
       (.I0(v[94]),
        .I1(v[95]),
        .I2(v[90]),
        .I3(v[53]),
        .I4(v[54]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    c22
       (.I0(v[92]),
        .I1(v[91]),
        .I2(v[81]),
        .I3(v[99]),
        .I4(v[100]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    c23
       (.I0(v[86]),
        .I1(v[87]),
        .I2(v[62]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c24
       (.I0(v[102]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[105]),
        .I4(v[106]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c25
       (.I0(v[108]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[109]),
        .I4(v[110]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE8808800)) 
    c26
       (.I0(v[112]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[105]),
        .I4(v[113]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c27
       (.I0(v[101]),
        .I1(v[110]),
        .I2(v[104]),
        .I3(v[115]),
        .I4(v[103]),
        .I5(v[59]),
        .O(v[114]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c28
       (.I0(v[107]),
        .I1(v[104]),
        .I2(v[105]),
        .I3(v[102]),
        .I4(v[103]),
        .I5(v[106]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c29
       (.I0(v[111]),
        .I1(v[104]),
        .I2(v[109]),
        .I3(v[108]),
        .I4(v[103]),
        .I5(v[110]),
        .O(v[117]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h80D8)) 
    c3
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .I3(v[61]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h90000800)) 
    c30
       (.I0(v[103]),
        .I1(v[105]),
        .I2(v[112]),
        .I3(v[113]),
        .I4(v[104]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c31
       (.I0(v[59]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[122]),
        .I4(v[123]),
        .I5(v[60]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c32
       (.I0(v[120]),
        .I1(v[106]),
        .I2(v[121]),
        .I3(v[52]),
        .I4(v[59]),
        .I5(v[123]),
        .O(v[124]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c33
       (.I0(v[81]),
        .I1(v[92]),
        .I2(v[91]),
        .I3(v[95]),
        .I4(v[94]),
        .I5(v[83]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD880000008000000)) 
    c34
       (.I0(v[110]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[122]),
        .I4(v[123]),
        .I5(v[106]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c35
       (.I0(v[119]),
        .I1(v[122]),
        .I2(v[120]),
        .I3(v[128]),
        .I4(v[123]),
        .I5(v[54]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c36
       (.I0(v[124]),
        .I1(v[59]),
        .I2(v[120]),
        .I3(v[130]),
        .I4(v[123]),
        .I5(v[60]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956AB5)) 
    c37
       (.I0(v[126]),
        .I1(v[59]),
        .I2(v[121]),
        .I3(v[132]),
        .I4(v[123]),
        .I5(v[52]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c38
       (.I0(v[122]),
        .I1(v[110]),
        .I2(v[121]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c39
       (.I0(v[54]),
        .I1(v[53]),
        .I2(v[55]),
        .I3(v[52]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c40
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[86]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c41
       (.I0(v[55]),
        .I1(v[52]),
        .I2(v[60]),
        .I3(v[58]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c42
       (.I0(v[58]),
        .I1(v[54]),
        .I2(v[60]),
        .I3(v[55]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c44
       (.I0(v[83]),
        .I1(v[95]),
        .I2(v[94]),
        .I3(v[84]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v[53]),
        .I1(v[60]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'hF8FF00F8)) 
    c46
       (.I0(v[62]),
        .I1(v[87]),
        .I2(v[86]),
        .I3(v[88]),
        .I4(v[85]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v[121]),
        .I1(v[52]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c48
       (.I0(v[121]),
        .I1(v[122]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c49
       (.I0(v[106]),
        .I1(v[120]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c5
       (.I0(v[52]),
        .I1(v[55]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c50
       (.I0(v[54]),
        .I1(v[136]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c51
       (.I0(v[110]),
        .I1(v[138]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c52
       (.I0(v[105]),
        .I1(v[138]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c53
       (.I0(v[136]),
        .I1(v[54]),
        .I2(v[138]),
        .I3(v[109]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    c54
       (.I0(v[100]),
        .I1(v[99]),
        .I2(v[89]),
        .I3(v[143]),
        .I4(v[144]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c55
       (.I0(v[93]),
        .I1(v[81]),
        .I2(v[91]),
        .I3(v[92]),
        .I4(v[100]),
        .I5(v[99]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c56
       (.I0(v[84]),
        .I1(v[96]),
        .I2(v[83]),
        .I3(v[94]),
        .I4(v[95]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE10F0F1E0F1E1EF0)) 
    c57
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[97]),
        .I3(v[77]),
        .I4(v[75]),
        .I5(v[76]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c58
       (.I0(v[149]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[122]),
        .I4(v[60]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c59
       (.I0(v[151]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[59]),
        .I4(v[52]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c60
       (.I0(v[153]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[106]),
        .I4(v[122]),
        .O(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c61
       (.I0(v[115]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[110]),
        .I4(v[59]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c62
       (.I0(v[148]),
        .I1(v[52]),
        .I2(v[104]),
        .I3(v[156]),
        .I4(v[103]),
        .I5(v[54]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c63
       (.I0(v[150]),
        .I1(v[122]),
        .I2(v[104]),
        .I3(v[149]),
        .I4(v[103]),
        .I5(v[60]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c64
       (.I0(v[152]),
        .I1(v[59]),
        .I2(v[104]),
        .I3(v[151]),
        .I4(v[103]),
        .I5(v[52]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c65
       (.I0(v[154]),
        .I1(v[106]),
        .I2(v[104]),
        .I3(v[153]),
        .I4(v[103]),
        .I5(v[122]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c66
       (.I0(v[54]),
        .I1(v[120]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c67
       (.I0(v[60]),
        .I1(v[120]),
        .I2(v[52]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c68
       (.I0(v[122]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[52]),
        .I4(v[123]),
        .I5(v[54]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c69
       (.I0(v[60]),
        .I1(v[121]),
        .I2(v[120]),
        .I3(v[54]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c70
       (.I0(v[52]),
        .I1(v[120]),
        .I2(v[60]),
        .I3(v[121]),
        .I4(v[54]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDABFB0402540B040)) 
    c71
       (.I0(v[166]),
        .I1(v[122]),
        .I2(v[120]),
        .I3(v[52]),
        .I4(v[121]),
        .I5(v[60]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c72
       (.I0(v[54]),
        .I1(v[138]),
        .O(v[167]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c73
       (.I0(v[60]),
        .I1(v[138]),
        .O(v[168]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c74
       (.I0(v[123]),
        .I1(v[54]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h78)) 
    c75
       (.I0(v[144]),
        .I1(v[143]),
        .I2(v[170]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c76
       (.I0(v[52]),
        .I1(v[138]),
        .O(v[171]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c77
       (.I0(v[122]),
        .I1(v[138]),
        .O(v[172]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c78
       (.I0(v[59]),
        .I1(v[138]),
        .O(v[173]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c79
       (.I0(v[106]),
        .I1(v[138]),
        .O(v[174]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c8
       (.I0(v[65]),
        .I1(v[66]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c80
       (.I0(v[176]),
        .I1(v[60]),
        .I2(v[104]),
        .O(v[175]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c81
       (.I0(v[156]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[52]),
        .I4(v[54]),
        .O(v[177]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c82
       (.I0(v[179]),
        .I1(v[54]),
        .I2(v[104]),
        .O(v[178]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87F078F0)) 
    c83
       (.I0(v[60]),
        .I1(v[176]),
        .I2(v[179]),
        .I3(v[104]),
        .I4(v[54]),
        .O(v[180]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c84
       (.I0(v[177]),
        .I1(v[176]),
        .I2(v[104]),
        .I3(v[60]),
        .O(v[181]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(\<const1> ),
        .D(v[182]),
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
        .D(v[183]),
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
        .D(v[184]),
        .Q(\^Y [11]),
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
        .D(v[185]),
        .Q(\^Y [12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET PROPCONST" *) 
  CARRY4 c89
       (.CI(\<const0> ),
        .CO({v[186],NLW_c89_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[50],v[67],v[68],v[71]}),
        .O({v[185:183],v[190]}),
        .S({v[248],v[78],v[79],v[80]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c9
       (.I0(v[57]),
        .I1(v[69]),
        .I2(v[70]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(v[191]),
        .Q(\^Y [13]),
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
        .D(v[192]),
        .Q(\^Y [14]),
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
        .D(v[193]),
        .Q(\^Y [15]),
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
        .D(v[194]),
        .Q(\^Y [16]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c94
       (.CI(v[186]),
        .CO({v[195],NLW_c94_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[98],v[125],v[134],v[247]}),
        .O(v[194:191]),
        .S({v[142],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(\<const0> ),
        .CO(v[199:196]),
        .CYINIT(\<const0> ),
        .DI({v[101],v[107],v[111],\<const0> }),
        .O({v[75],v[66],v[69],v[73]}),
        .S({v[114],v[116],v[117],v[118]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(\<const0> ),
        .CO(v[203:200]),
        .CYINIT(\<const0> ),
        .DI({v[119],v[124],v[126],\<const0> }),
        .O({v[76],v[65],v[70],v[72]}),
        .S({v[127],v[129],v[131],v[133]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c97
       (.CI(\<const0> ),
        .CO(v[207:204]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[135],\<const0> }),
        .O({v[102],v[108],v[112],NLW_c97_O_UNCONNECTED[0]}),
        .S({v[137],v[139],v[140],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c98
       (.C(clk),
        .CE(\<const1> ),
        .D(v[212]),
        .Q(\^Y [17]),
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
        .D(v[213]),
        .Q(\^Y [18]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9966906066996996)) 
    direct_quadol_6
       (.I0(v[75]),
        .I1(v[76]),
        .I2(v[66]),
        .I3(v[77]),
        .I4(v[65]),
        .I5(\<const1> ),
        .O5(v[248]),
        .O6(v[247]));
endmodule
