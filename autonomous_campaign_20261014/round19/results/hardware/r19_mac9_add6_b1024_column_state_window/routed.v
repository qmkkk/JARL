// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 11:58:52 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/hardware/r19_mac9_add6_b1024_column_state_window/routed.v
// Design      : r19_mac9_add6_b1024_column_state_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "c5b11c29" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"12.500000\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.171994\",\n      \"Worst Negative Slack (WNS)\": \"5.041741\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"66\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"66\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"40\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.374000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.607000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_mac9_add6_b1024_column_state_window
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
  wire [224:51]v;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c92_O_UNCONNECTED;
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
  assign Y[17:8] = \^Y [17:8];
  assign Y[7] = \<const1> ;
  assign Y[6] = \<const0> ;
  assign Y[5:0] = \^Y [5:0];
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(v[203]),
        .Q(\^Y [16]),
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
        .D(v[204]),
        .Q(\^Y [17]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v[195]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[165]}),
        .O(v[204:203]),
        .S({\<const0> ,\<const0> ,v[167],v[170]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v[199]),
        .CO({v[169],NLW_c103_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[168],v[138]}),
        .S({\<const0> ,\<const1> ,v[171],v[172]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c104
       (.CI(v[187]),
        .CO({v[137],NLW_c104_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[158],ZERO,v[160]}),
        .O({v[131],v[118],v[113]}),
        .S({\<const1> ,v[161],v[162],v[163]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c105
       (.C(clk),
        .CE(\<const1> ),
        .D(v[220]),
        .Q(\^Y [1]),
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
        .D(v[221]),
        .Q(\^Y [2]),
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
        .D(v[222]),
        .Q(\^Y [3]),
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
        .D(v[223]),
        .Q(\^Y [4]),
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
        .D(v[224]),
        .Q(\^Y [5]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c11
       (.I0(v[70]),
        .I1(v[83]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(v[181]),
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
        .D(v[180]),
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
        .Q(v[87]),
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
        .Q(v[85]),
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
        .Q(v[70]),
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
        .Q(v[94]),
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
        .Q(v[55]),
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
        .Q(v[90]),
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
        .Q(v[67]),
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
        .Q(v[57]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c12
       (.I0(v[85]),
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
        .Q(v[77]),
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
        .Q(v[78]),
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
        .Q(v[220]),
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
        .Q(v[221]),
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
        .Q(v[222]),
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
        .Q(v[223]),
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
        .Q(v[224]),
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
        .Q(v[58]),
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
        .Q(v[66]),
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
        .Q(v[92]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c13
       (.I0(v[78]),
        .I1(v[77]),
        .I2(v[83]),
        .I3(v[87]),
        .O(v[86]));
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
        .Q(v[60]),
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
        .Q(v[91]),
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
        .Q(v[89]),
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
        .Q(v[54]),
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
        .Q(v[173]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c14
       (.I0(v[55]),
        .I1(v[89]),
        .I2(v[90]),
        .I3(v[91]),
        .I4(v[57]),
        .I5(v[92]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c16
       (.I0(v[70]),
        .I1(v[89]),
        .I2(v[90]),
        .I3(v[91]),
        .I4(v[92]),
        .I5(v[94]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c17
       (.I0(v[88]),
        .I1(v[91]),
        .I2(v[67]),
        .I3(v[97]),
        .I4(v[92]),
        .I5(v[77]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c18
       (.I0(v[93]),
        .I1(v[89]),
        .I2(v[55]),
        .I3(v[99]),
        .I4(v[57]),
        .I5(v[92]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c19
       (.I0(v[95]),
        .I1(v[91]),
        .I2(v[55]),
        .I3(v[101]),
        .I4(v[67]),
        .I5(v[92]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c22
       (.I0(v[90]),
        .I1(v[89]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c23
       (.I0(v[90]),
        .I1(v[91]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c24
       (.I0(v[94]),
        .I1(v[89]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c26
       (.I0(v[61]),
        .I1(v[55]),
        .I2(v[60]),
        .I3(v[59]),
        .I4(v[58]),
        .I5(v[57]),
        .O(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h95565656566A6A6A)) 
    c27
       (.I0(v[51]),
        .I1(v[81]),
        .I2(v[68]),
        .I3(v[94]),
        .I4(v[54]),
        .I5(v[71]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    c29
       (.I0(v[104]),
        .I1(v[85]),
        .I2(v[54]),
        .I3(v[109]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696969)) 
    c30
       (.I0(v[75]),
        .I1(v[61]),
        .I2(v[109]),
        .I3(v[85]),
        .I4(v[54]),
        .O(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFE8E8E8E8000000)) 
    c31
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[54]),
        .I4(v[67]),
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
       (.I0(v[54]),
        .I1(v[90]),
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
       (.I0(v[54]),
        .I1(v[67]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h95556AAA)) 
    c37
       (.I0(v[118]),
        .I1(v[121]),
        .I2(v[77]),
        .I3(v[60]),
        .I4(v[117]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c4
       (.I0(v[63]),
        .I1(v[64]),
        .I2(v[65]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEABFBFEA802A2A80)) 
    c40
       (.I0(v[111]),
        .I1(v[57]),
        .I2(v[54]),
        .I3(v[131]),
        .I4(v[132]),
        .I5(v[116]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6996966996699669)) 
    c41
       (.I0(v[123]),
        .I1(v[113]),
        .I2(v[112]),
        .I3(v[114]),
        .I4(v[54]),
        .I5(v[90]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669966969969669)) 
    c43
       (.I0(v[134]),
        .I1(v[72]),
        .I2(v[73]),
        .I3(v[74]),
        .I4(v[69]),
        .I5(v[135]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c44
       (.I0(v[125]),
        .I1(v[126]),
        .I2(v[124]),
        .O(v[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c45
       (.I0(v[74]),
        .I1(v[72]),
        .I2(v[73]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA8080EA80EAEA80)) 
    c47
       (.I0(v[123]),
        .I1(v[54]),
        .I2(v[90]),
        .I3(v[113]),
        .I4(v[112]),
        .I5(v[114]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c48
       (.I0(v[57]),
        .I1(v[54]),
        .I2(v[131]),
        .I3(v[132]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h17E8E817E817E817)) 
    c49
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[115]),
        .I4(v[54]),
        .I5(v[67]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[66]),
        .I1(v[67]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c50
       (.I0(v[66]),
        .I1(v[67]),
        .I2(v[77]),
        .I3(v[57]),
        .I4(v[60]),
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
       (.I0(v[67]),
        .I1(v[83]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c53
       (.I0(v[90]),
        .I1(v[83]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c54
       (.I0(v[55]),
        .I1(v[83]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c55
       (.I0(v[94]),
        .I1(v[83]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c56
       (.I0(v[66]),
        .I1(v[67]),
        .I2(v[57]),
        .I3(v[142]),
        .I4(v[77]),
        .I5(v[60]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA80FFFF0000EA80)) 
    c57
       (.I0(v[148]),
        .I1(v[65]),
        .I2(v[64]),
        .I3(v[149]),
        .I4(v[150]),
        .I5(v[151]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAAA9999555)) 
    c58
       (.I0(v[151]),
        .I1(v[149]),
        .I2(v[64]),
        .I3(v[65]),
        .I4(v[148]),
        .I5(v[150]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c59
       (.I0(v[90]),
        .I1(v[60]),
        .I2(v[58]),
        .I3(v[77]),
        .I4(v[66]),
        .I5(v[57]),
        .O(v[65]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c6
       (.I0(v[69]),
        .I1(v[70]),
        .I2(v[54]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c60
       (.I0(v[67]),
        .I1(v[66]),
        .I2(v[60]),
        .I3(v[57]),
        .I4(v[55]),
        .I5(v[58]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c61
       (.I0(v[54]),
        .I1(v[94]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c63
       (.I0(v[149]),
        .I1(v[148]),
        .I2(v[65]),
        .I3(v[64]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c64
       (.I0(v[54]),
        .I1(v[70]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c65
       (.I0(v[149]),
        .I1(v[64]),
        .I2(v[65]),
        .I3(v[148]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c66
       (.I0(v[66]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[77]),
        .I4(v[60]),
        .I5(v[90]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c67
       (.I0(v[67]),
        .I1(v[60]),
        .I2(v[77]),
        .I3(v[66]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c68
       (.I0(v[60]),
        .I1(v[57]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c69
       (.I0(v[77]),
        .I1(v[60]),
        .I2(v[67]),
        .I3(v[66]),
        .O(v[151]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c7
       (.I0(v[72]),
        .I1(v[73]),
        .I2(v[74]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8000088808888000)) 
    c70
       (.I0(v[81]),
        .I1(v[80]),
        .I2(v[55]),
        .I3(v[54]),
        .I4(v[53]),
        .I5(v[52]),
        .O(v[153]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c71
       (.I0(v[130]),
        .I1(v[136]),
        .I2(v[131]),
        .I3(v[54]),
        .I4(v[57]),
        .I5(v[132]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE78E18711871E78E)) 
    c72
       (.I0(v[139]),
        .I1(v[128]),
        .I2(v[127]),
        .I3(v[115]),
        .I4(v[116]),
        .I5(v[140]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EEEE88881111777)) 
    c73
       (.I0(v[129]),
        .I1(v[123]),
        .I2(v[54]),
        .I3(v[90]),
        .I4(v[120]),
        .I5(v[141]),
        .O(v[156]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c74
       (.I0(v[153]),
        .I1(v[129]),
        .I2(v[133]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c77
       (.I0(v[89]),
        .I1(v[90]),
        .I2(v[67]),
        .I3(v[91]),
        .I4(v[92]),
        .I5(v[77]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDBAF2450B400B400)) 
    c80
       (.I0(v[164]),
        .I1(v[90]),
        .I2(v[67]),
        .I3(v[89]),
        .I4(v[57]),
        .I5(v[91]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c81
       (.I0(v[92]),
        .I1(v[77]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h57777FFFA8888000)) 
    c83
       (.I0(v[168]),
        .I1(v[137]),
        .I2(v[54]),
        .I3(v[77]),
        .I4(v[138]),
        .I5(v[169]),
        .O(v[167]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h93363636366C6C6C)) 
    c84
       (.I0(v[166]),
        .I1(v[168]),
        .I2(v[137]),
        .I3(v[54]),
        .I4(v[77]),
        .I5(v[138]),
        .O(v[170]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c85
       (.I0(v[131]),
        .I1(v[54]),
        .I2(v[57]),
        .I3(v[132]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c86
       (.I0(v[77]),
        .I1(v[83]),
        .O(v[171]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c87
       (.I0(v[57]),
        .I1(v[83]),
        .O(v[172]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c88
       (.C(clk),
        .CE(\<const1> ),
        .D(v[173]),
        .Q(\^Y [0]),
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
        .D(v[174]),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c9
       (.I0(v[77]),
        .I1(v[78]),
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
        .D(v[175]),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(\<const0> ),
        .CO({v[176],NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[79],v[103],v[104],v[105]}),
        .O({v[175:174],v[180],v[181]}),
        .S({v[106],v[107],v[108],v[110]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c92
       (.CI(\<const0> ),
        .CO({v[182],NLW_c92_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[76],\<const0> }),
        .O({v[74],v[69],v[109],NLW_c92_O_UNCONNECTED[0]}),
        .S({v[82],v[84],v[86],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c93
       (.CI(\<const0> ),
        .CO(v[187:184]),
        .CYINIT(\<const0> ),
        .DI({v[88],v[93],v[95],\<const0> }),
        .O({v[125],v[72],v[63],v[61]}),
        .S({v[96],v[98],v[100],v[102]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c94
       (.C(clk),
        .CE(\<const1> ),
        .D(v[191]),
        .Q(\^Y [12]),
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
        .D(v[192]),
        .Q(\^Y [13]),
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
        .D(v[193]),
        .Q(\^Y [14]),
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
        .D(v[194]),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c98
       (.CI(v[176]),
        .CO({v[195],NLW_c98_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[130],v[143],v[152],v[153]}),
        .O(v[194:191]),
        .S({v[154],v[155],v[156],v[157]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v[182]),
        .CO(v[199:196]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[132],v[117],v[114],v[124]}),
        .S({v[144],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6996C33CD4E8FCC0)) 
    merge_0
       (.I0(v[54]),
        .I1(v[56]),
        .I2(v[62]),
        .I3(v[69]),
        .I4(v[70]),
        .I5(\<const1> ),
        .O5(v[103]),
        .O6(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h78878778F770F880)) 
    merge_1
       (.I0(v[60]),
        .I1(v[77]),
        .I2(v[113]),
        .I3(v[114]),
        .I4(v[121]),
        .I5(\<const1> ),
        .O5(v[128]),
        .O6(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hE8C08800A0000000)) 
    merge_15
       (.I0(v[55]),
        .I1(v[67]),
        .I2(v[89]),
        .I3(v[91]),
        .I4(v[94]),
        .I5(v[92]),
        .O5(v[102]),
        .O6(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hD2F0AA00F000F000)) 
    merge_2
       (.I0(v[57]),
        .I1(v[67]),
        .I2(v[77]),
        .I3(v[89]),
        .I4(v[91]),
        .I5(\<const1> ),
        .O5(v[158]),
        .O6(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hFFFFD5FD6A95C03F)) 
    merge_21
       (.I0(v[55]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[59]),
        .I4(v[60]),
        .I5(v[61]),
        .O5(v[75]),
        .O6(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h0000E888E888E888)) 
    merge_24
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .I4(v[133]),
        .I5(\<const1> ),
        .O5(v[129]),
        .O6(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hBE4141BEBEBEBEBE)) 
    merge_26
       (.I0(v[63]),
        .I1(v[64]),
        .I2(v[65]),
        .I3(v[80]),
        .I4(v[103]),
        .I5(\<const1> ),
        .O5(v[81]),
        .O6(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6999966696669666)) 
    merge_27
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .I4(v[80]),
        .I5(v[81]),
        .O5(v[51]),
        .O6(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8778000087788778)) 
    merge_5
       (.I0(v[54]),
        .I1(v[77]),
        .I2(v[137]),
        .I3(v[138]),
        .I4(v[166]),
        .I5(\<const1> ),
        .O5(v[136]),
        .O6(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h5800F000)) 
    merge_7
       (.I0(v[57]),
        .I1(v[67]),
        .I2(v[77]),
        .I3(v[89]),
        .I4(v[91]),
        .O(v[161]));
endmodule
