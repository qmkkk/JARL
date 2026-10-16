// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:20:24 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_absdiff8_b1_quadol_wce/routed.v
// Design      : r20_absdiff8_b1_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "85ee535f" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.082728\",\n      \"Worst Negative Slack (WNS)\": \"9.909645\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"12\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"12\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"25\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.409000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.548000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_absdiff8_b1_quadol_wce
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
  wire [31:0]\^Y ;
  wire clk;
  wire [105:44]v;
  wire [3:0]NLW_c32_CO_UNCONNECTED;
  wire [3:0]NLW_c37_CO_UNCONNECTED;
  wire [3:0]NLW_c38_CO_UNCONNECTED;

  assign Y[31] = \^Y [31];
  assign Y[30] = \^Y [31];
  assign Y[29] = \^Y [31];
  assign Y[28] = \^Y [31];
  assign Y[27] = \^Y [31];
  assign Y[26] = \^Y [31];
  assign Y[25] = \^Y [31];
  assign Y[24] = \^Y [31];
  assign Y[23] = \^Y [31];
  assign Y[22] = \^Y [31];
  assign Y[21] = \^Y [31];
  assign Y[20] = \^Y [31];
  assign Y[19] = \^Y [31];
  assign Y[18] = \^Y [31];
  assign Y[17] = \^Y [31];
  assign Y[16] = \^Y [31];
  assign Y[15] = \^Y [31];
  assign Y[14] = \^Y [31];
  assign Y[13] = \^Y [31];
  assign Y[12] = \^Y [31];
  assign Y[11] = \^Y [31];
  assign Y[10] = \^Y [31];
  assign Y[9] = \^Y [31];
  assign Y[8] = \^Y [31];
  assign Y[7:0] = \^Y [7:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    c10
       (.I0(v[62]),
        .I1(v[63]),
        .I2(v[64]),
        .I3(v[65]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    c11
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[69]),
        .I3(v[70]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    c12
       (.I0(v[48]),
        .I1(v[56]),
        .I2(v[54]),
        .I3(v[46]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    c13
       (.I0(v[52]),
        .I1(v[60]),
        .I2(v[58]),
        .I3(v[50]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    c14
       (.I0(v[62]),
        .I1(v[63]),
        .I2(v[65]),
        .I3(v[64]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    c15
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[70]),
        .I3(v[69]),
        .O(v[74]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    c16
       (.I0(v[48]),
        .I1(v[56]),
        .I2(v[46]),
        .I3(v[54]),
        .O(v[75]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9009)) 
    c17
       (.I0(v[52]),
        .I1(v[60]),
        .I2(v[50]),
        .I3(v[58]),
        .O(v[76]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c18
       (.I0(v[45]),
        .I1(v[65]),
        .O(v[77]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c19
       (.I0(v[45]),
        .I1(v[62]),
        .O(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c2
       (.I0(v[45]),
        .I1(v[46]),
        .O(v[44]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c20
       (.I0(v[45]),
        .I1(v[70]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c21
       (.I0(v[45]),
        .I1(v[67]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c22
       (.I0(v[65]),
        .I1(v[64]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c23
       (.I0(v[62]),
        .I1(v[63]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c24
       (.I0(v[70]),
        .I1(v[69]),
        .O(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c25
       (.I0(v[67]),
        .I1(v[68]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c26
       (.C(clk),
        .CE(\<const1> ),
        .D(v[85]),
        .Q(\^Y [0]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c27
       (.C(clk),
        .CE(\<const1> ),
        .D(v[86]),
        .Q(\^Y [1]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c28
       (.C(clk),
        .CE(\<const1> ),
        .D(v[87]),
        .Q(\^Y [2]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c29
       (.C(clk),
        .CE(\<const1> ),
        .D(v[88]),
        .Q(\^Y [31]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c3
       (.I0(v[45]),
        .I1(v[48]),
        .O(v[47]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c30
       (.CI(v[89]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v[88]),
        .S({\<const0> ,\<const0> ,\<const0> ,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c31
       (.C(clk),
        .CE(\<const1> ),
        .D(v[97]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c32
       (.CI(\<const0> ),
        .CO({v[98],NLW_c32_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({v[44],v[47],v[49],v[51]}),
        .O({v[97],v[87:85]}),
        .S({v[53],v[55],v[57],v[59]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c33
       (.C(clk),
        .CE(\<const1> ),
        .D(v[102]),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c34
       (.C(clk),
        .CE(\<const1> ),
        .D(v[103]),
        .Q(\^Y [5]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c35
       (.C(clk),
        .CE(\<const1> ),
        .D(v[104]),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c36
       (.C(clk),
        .CE(\<const1> ),
        .D(v[105]),
        .Q(\^Y [7]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c37
       (.CI(v[98]),
        .CO({v[89],NLW_c37_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[77],v[78],v[79],v[80]}),
        .O(v[105:102]),
        .S({v[81],v[82],v[83],v[84]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c38
       (.CI(\<const0> ),
        .CO({v[45],NLW_c38_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const1> ),
        .DI({v[61],v[66],v[71],v[72]}),
        .S({v[73],v[74],v[75],v[76]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c39
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[52]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c4
       (.I0(v[45]),
        .I1(v[50]),
        .O(v[49]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c40
       (.C(clk),
        .CE(\<const1> ),
        .D(A[1]),
        .Q(v[50]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c41
       (.C(clk),
        .CE(\<const1> ),
        .D(A[2]),
        .Q(v[48]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c42
       (.C(clk),
        .CE(\<const1> ),
        .D(A[3]),
        .Q(v[46]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c43
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v[67]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c44
       (.C(clk),
        .CE(\<const1> ),
        .D(A[5]),
        .Q(v[70]),
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
        .D(A[6]),
        .Q(v[62]),
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
        .D(A[7]),
        .Q(v[65]),
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
        .D(B[0]),
        .Q(v[60]),
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
        .D(B[1]),
        .Q(v[58]),
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
        .D(B[2]),
        .Q(v[56]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c5
       (.I0(v[45]),
        .I1(v[52]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c50
       (.C(clk),
        .CE(\<const1> ),
        .D(B[3]),
        .Q(v[54]),
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
        .D(B[4]),
        .Q(v[68]),
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
        .D(B[5]),
        .Q(v[69]),
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
        .D(B[6]),
        .Q(v[63]),
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
        .D(B[7]),
        .Q(v[64]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c6
       (.I0(v[46]),
        .I1(v[54]),
        .O(v[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c7
       (.I0(v[48]),
        .I1(v[56]),
        .O(v[55]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c8
       (.I0(v[50]),
        .I1(v[58]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c9
       (.I0(v[52]),
        .I1(v[60]),
        .O(v[59]));
endmodule
