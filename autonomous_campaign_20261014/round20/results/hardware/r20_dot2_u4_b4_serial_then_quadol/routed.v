// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:21:43 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_dot2_u4_b4_serial_then_quadol/routed.v
// Design      : r20_dot2_u4_b4_serial_then_quadol
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "5faa9468" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.330285\",\n      \"Worst Negative Slack (WNS)\": \"9.389401\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"38\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"38\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"25\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.240000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"20.495000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_dot2_u4_b4_serial_then_quadol
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
  wire [8:0]\^Y ;
  wire ZERO;
  wire clk;
  wire [152:44]v;
  wire [3:0]NLW_c58_CO_UNCONNECTED;
  wire [3:0]NLW_c59_CO_UNCONNECTED;
  wire [3:0]NLW_c60_CO_UNCONNECTED;
  wire [3:0]NLW_c65_CO_UNCONNECTED;
  wire [3:0]NLW_c66_CO_UNCONNECTED;
  wire [3:0]NLW_c67_CO_UNCONNECTED;

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
  assign Y[8:0] = \^Y [8:0];
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h28A2)) 
    c11
       (.I0(v[66]),
        .I1(v[63]),
        .I2(v[59]),
        .I3(v[61]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c12
       (.I0(v[61]),
        .I1(v[66]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c13
       (.I0(v[74]),
        .I1(v[75]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c14
       (.I0(v[77]),
        .I1(v[78]),
        .O(v[76]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c15
       (.I0(v[80]),
        .I1(v[81]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c16
       (.I0(v[83]),
        .I1(v[84]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c17
       (.I0(v[54]),
        .I1(v[46]),
        .I2(v[85]),
        .I3(v[48]),
        .I4(v[52]),
        .I5(v[53]),
        .O(v[45]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c18
       (.I0(v[46]),
        .I1(v[53]),
        .I2(v[48]),
        .I3(v[52]),
        .O(v[86]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c19
       (.I0(v[53]),
        .I1(v[49]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h95556AAA6AAA6AAA)) 
    c2
       (.I0(v[45]),
        .I1(v[46]),
        .I2(v[47]),
        .I3(v[48]),
        .I4(v[49]),
        .I5(v[50]),
        .O(v[44]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h1777808088000000)) 
    c20
       (.I0(v[54]),
        .I1(v[52]),
        .I2(v[53]),
        .I3(v[46]),
        .I4(v[50]),
        .I5(v[85]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    c21
       (.I0(v[49]),
        .I1(v[90]),
        .I2(v[50]),
        .I3(v[91]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c22
       (.I0(v[93]),
        .I1(v[94]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8000200000000000)) 
    c23
       (.I0(v[48]),
        .I1(v[85]),
        .I2(v[52]),
        .I3(v[53]),
        .I4(v[54]),
        .I5(v[46]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c24
       (.I0(v[52]),
        .I1(v[53]),
        .O(v[47]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c25
       (.I0(v[46]),
        .I1(v[50]),
        .I2(v[52]),
        .I3(v[54]),
        .I4(v[85]),
        .I5(v[53]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hC4B470F04CCC8000)) 
    c26
       (.I0(v[46]),
        .I1(v[50]),
        .I2(v[85]),
        .I3(v[53]),
        .I4(v[52]),
        .I5(v[54]),
        .O(v[91]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c27
       (.I0(v[54]),
        .I1(v[46]),
        .I2(v[53]),
        .I3(v[85]),
        .I4(v[52]),
        .I5(v[48]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c28
       (.I0(v[69]),
        .I1(v[60]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c29
       (.I0(v[66]),
        .I1(v[98]),
        .I2(v[69]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c3
       (.I0(v[52]),
        .I1(v[48]),
        .I2(v[53]),
        .I3(v[46]),
        .I4(v[49]),
        .I5(v[54]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    c30
       (.I0(v[69]),
        .I1(v[59]),
        .I2(v[68]),
        .I3(v[61]),
        .I4(v[66]),
        .I5(v[100]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h1777808088000000)) 
    c31
       (.I0(v[58]),
        .I1(v[62]),
        .I2(v[63]),
        .I3(v[59]),
        .I4(v[69]),
        .I5(v[60]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    c32
       (.I0(v[69]),
        .I1(v[98]),
        .I2(v[66]),
        .I3(v[103]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c33
       (.I0(v[99]),
        .I1(v[105]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8000200000000000)) 
    c34
       (.I0(v[61]),
        .I1(v[60]),
        .I2(v[62]),
        .I3(v[63]),
        .I4(v[58]),
        .I5(v[59]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c35
       (.I0(v[62]),
        .I1(v[63]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c36
       (.I0(v[59]),
        .I1(v[69]),
        .I2(v[62]),
        .I3(v[58]),
        .I4(v[60]),
        .I5(v[63]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hC4B470F04CCC8000)) 
    c37
       (.I0(v[59]),
        .I1(v[69]),
        .I2(v[60]),
        .I3(v[63]),
        .I4(v[62]),
        .I5(v[58]),
        .O(v[103]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c38
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[63]),
        .I3(v[60]),
        .I4(v[62]),
        .I5(v[61]),
        .O(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c39
       (.I0(v[107]),
        .I1(v[108]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c4
       (.I0(v[49]),
        .I1(v[53]),
        .I2(v[46]),
        .I3(v[48]),
        .O(v[55]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c40
       (.I0(v[110]),
        .I1(v[111]),
        .O(v[109]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c41
       (.I0(v[113]),
        .I1(v[114]),
        .O(v[112]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c42
       (.I0(v[116]),
        .I1(v[117]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFC88800080000000)) 
    c43
       (.I0(v[46]),
        .I1(v[50]),
        .I2(v[53]),
        .I3(v[85]),
        .I4(v[52]),
        .I5(v[54]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c44
       (.I0(v[50]),
        .I1(v[90]),
        .I2(v[49]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    c45
       (.I0(v[49]),
        .I1(v[46]),
        .I2(v[47]),
        .I3(v[48]),
        .I4(v[50]),
        .I5(v[95]),
        .O(v[93]));
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
        .Q(v[60]),
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
        .D(A[7]),
        .Q(v[69]),
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
        .D(B[6]),
        .Q(v[62]),
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
        .D(A[6]),
        .Q(v[58]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c5
       (.I0(v[48]),
        .I1(v[49]),
        .O(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c50
       (.C(clk),
        .CE(\<const1> ),
        .D(B[5]),
        .Q(v[59]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c51
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v[63]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c52
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[66]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c53
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v[61]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c54
       (.C(clk),
        .CE(\<const1> ),
        .D(v[120]),
        .Q(\^Y [0]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c55
       (.C(clk),
        .CE(\<const1> ),
        .D(v[121]),
        .Q(\^Y [1]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c56
       (.C(clk),
        .CE(\<const1> ),
        .D(v[122]),
        .Q(\^Y [2]),
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
        .D(v[123]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c58
       (.CI(\<const0> ),
        .CO({v[124],NLW_c58_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[74],v[77],v[80],v[83]}),
        .O(v[123:120]),
        .S({v[73],v[76],v[79],v[82]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c59
       (.CI(\<const0> ),
        .CO(v[128:125]),
        .CYINIT(\<const0> ),
        .DI({v[57],v[64],v[65],\<const0> }),
        .O({v[75],v[78],v[81],v[84]}),
        .S({v[67],ZERO,v[71],v[72]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c6
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .I3(v[61]),
        .I4(v[62]),
        .I5(v[63]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c60
       (.CI(\<const0> ),
        .CO(v[132:129]),
        .CYINIT(\<const0> ),
        .DI({v[45],v[86],v[87],\<const0> }),
        .O({v[74],v[77],v[80],v[83]}),
        .S({v[44],v[51],v[55],v[56]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c61
       (.C(clk),
        .CE(\<const1> ),
        .D(v[136]),
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
        .D(v[137]),
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
        .D(v[138]),
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
        .D(v[139]),
        .Q(\^Y [7]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c65
       (.CI(v[124]),
        .CO({v[140],NLW_c65_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[107],v[110],v[113],v[116]}),
        .O(v[139:136]),
        .S({v[106],v[109],v[112],v[115]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c66
       (.CI(v[128]),
        .CO({v[108],NLW_c66_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[96],v[97],v[99]}),
        .O({v[111],v[114],v[117]}),
        .S({\<const1> ,v[101],v[102],v[104]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c67
       (.CI(v[132]),
        .CO({v[107],NLW_c67_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[118],v[119],v[93]}),
        .O({v[110],v[113],v[116]}),
        .S({\<const1> ,v[88],v[89],v[92]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c68
       (.C(clk),
        .CE(\<const1> ),
        .D(v[152]),
        .Q(\^Y [8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c69
       (.CI(v[140]),
        .CO(v[152]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,\<const0> ,\<const0> ,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c7
       (.I0(v[59]),
        .I1(v[63]),
        .I2(v[61]),
        .I3(v[62]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[48]),
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
        .D(A[1]),
        .Q(v[53]),
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
        .D(A[2]),
        .Q(v[54]),
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
        .D(A[3]),
        .Q(v[50]),
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
        .D(B[0]),
        .Q(v[49]),
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
        .D(B[1]),
        .Q(v[46]),
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
        .D(B[2]),
        .Q(v[52]),
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
        .D(B[3]),
        .Q(v[85]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c8
       (.I0(v[63]),
        .I1(v[66]),
        .O(v[65]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h95556AAA6AAA6AAA)) 
    c9
       (.I0(v[57]),
        .I1(v[59]),
        .I2(v[68]),
        .I3(v[61]),
        .I4(v[69]),
        .I5(v[66]),
        .O(v[67]));
endmodule
