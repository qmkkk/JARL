// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:26:42 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_mac6_add4_b16_state_window/routed.v
// Design      : r20_mac6_add4_b16_state_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "25e8441a" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.309409\",\n      \"Worst Negative Slack (WNS)\": \"7.061079\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"35\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"35\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"28\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.378000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.948000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_mac6_add4_b16_state_window
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
  wire ZERO;
  wire clk;
  wire [181:47]v;
  wire [3:0]NLW_c62_CO_UNCONNECTED;
  wire [3:0]NLW_c63_CO_UNCONNECTED;
  wire [3:0]NLW_c67_CO_UNCONNECTED;
  wire [3:0]NLW_c68_CO_UNCONNECTED;
  wire [3:0]NLW_c73_CO_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;

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
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    c12
       (.I0(v[77]),
        .I1(v[54]),
        .I2(v[78]),
        .I3(v[49]),
        .I4(v[73]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c14
       (.I0(v[57]),
        .I1(v[49]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c15
       (.I0(v[55]),
        .I1(v[49]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c16
       (.I0(v[50]),
        .I1(v[49]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c17
       (.I0(v[75]),
        .I1(v[54]),
        .O(v[69]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c18
       (.I0(v[77]),
        .I1(v[56]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c19
       (.I0(v[80]),
        .I1(v[57]),
        .I2(v[81]),
        .I3(v[55]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h956A)) 
    c2
       (.I0(v[48]),
        .I1(v[49]),
        .I2(v[50]),
        .I3(v[51]),
        .O(v[47]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c20
       (.I0(v[80]),
        .I1(v[50]),
        .I2(v[81]),
        .I3(v[57]),
        .I4(v[83]),
        .I5(v[55]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c22
       (.I0(v[80]),
        .I1(v[75]),
        .I2(v[81]),
        .I3(v[73]),
        .I4(v[83]),
        .I5(v[50]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c23
       (.I0(v[81]),
        .I1(v[57]),
        .I2(v[80]),
        .I3(v[55]),
        .O(v[86]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c24
       (.I0(v[83]),
        .I1(v[50]),
        .I2(v[57]),
        .I3(v[80]),
        .I4(v[55]),
        .I5(v[81]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c25
       (.I0(v[84]),
        .I1(v[81]),
        .I2(v[57]),
        .I3(v[89]),
        .I4(v[55]),
        .I5(v[83]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c26
       (.I0(v[85]),
        .I1(v[81]),
        .I2(v[50]),
        .I3(v[91]),
        .I4(v[57]),
        .I5(v[83]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c27
       (.I0(v[50]),
        .I1(v[80]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c28
       (.I0(v[73]),
        .I1(v[80]),
        .O(v[91]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6C40400080008000)) 
    c29
       (.I0(v[55]),
        .I1(v[57]),
        .I2(v[54]),
        .I3(v[72]),
        .I4(v[50]),
        .I5(v[56]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A959595956A6A6A)) 
    c3
       (.I0(v[53]),
        .I1(v[54]),
        .I2(v[55]),
        .I3(v[56]),
        .I4(v[57]),
        .I5(v[58]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c30
       (.I0(v[55]),
        .I1(v[54]),
        .I2(v[57]),
        .I3(v[56]),
        .O(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0EC070007800F000)) 
    c31
       (.I0(v[50]),
        .I1(v[72]),
        .I2(v[55]),
        .I3(v[56]),
        .I4(v[57]),
        .I5(v[54]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c32
       (.I0(v[49]),
        .I1(v[55]),
        .I2(v[63]),
        .I3(v[65]),
        .O(v[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c33
       (.I0(v[49]),
        .I1(v[57]),
        .I2(v[61]),
        .I3(v[60]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c34
       (.I0(v[49]),
        .I1(v[50]),
        .I2(v[48]),
        .I3(v[51]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c38
       (.I0(v[77]),
        .I1(v[83]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    c4
       (.I0(v[60]),
        .I1(v[61]),
        .I2(v[62]),
        .I3(v[63]),
        .I4(v[64]),
        .I5(v[65]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c40
       (.I0(v[103]),
        .I1(v[104]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c41
       (.I0(v[106]),
        .I1(v[107]),
        .O(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c42
       (.I0(v[109]),
        .I1(v[110]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c43
       (.I0(v[112]),
        .I1(v[113]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c44
       (.I0(v[81]),
        .I1(v[73]),
        .I2(v[80]),
        .I3(v[75]),
        .I4(v[50]),
        .I5(v[83]),
        .O(v[114]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c46
       (.I0(v[83]),
        .I1(v[75]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c47
       (.I0(v[54]),
        .I1(v[75]),
        .I2(v[70]),
        .I3(v[77]),
        .I4(v[56]),
        .O(v[117]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    c48
       (.I0(v[78]),
        .I1(v[77]),
        .I2(v[54]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A6A6A6A)) 
    c49
       (.I0(v[117]),
        .I1(v[73]),
        .I2(v[49]),
        .I3(v[78]),
        .I4(v[54]),
        .I5(v[77]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    c5
       (.I0(v[51]),
        .I1(v[48]),
        .I2(v[67]),
        .I3(v[61]),
        .I4(v[62]),
        .I5(v[60]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    c50
       (.I0(v[78]),
        .I1(v[77]),
        .I2(v[54]),
        .I3(v[49]),
        .I4(v[75]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    c51
       (.I0(v[122]),
        .I1(v[49]),
        .I2(v[77]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c52
       (.C(clk),
        .CE(\<const1> ),
        .D(B[9]),
        .Q(v[104]),
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
        .D(B[8]),
        .Q(v[107]),
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
        .Q(v[110]),
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
        .D(B[6]),
        .Q(v[113]),
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
        .D(v[123]),
        .Q(\^Y [0]),
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
        .D(v[124]),
        .Q(\^Y [10]),
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
        .D(v[125]),
        .Q(\^Y [11]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c59
       (.CI(v[126]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[125:124],v[131],v[132]}),
        .S({v[133],v[134],v[135],v[136]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6996696996966996)) 
    c6
       (.I0(v[48]),
        .I1(v[67]),
        .I2(v[51]),
        .I3(v[69]),
        .I4(v[70]),
        .I5(v[71]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c60
       (.CI(v[137]),
        .CO(v[72]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,\<const0> ,\<const0> ,\<const1> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c61
       (.CI(v[145]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[92]}),
        .O({v[133],v[134]}),
        .S({\<const0> ,\<const0> ,v[93],v[94]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c62
       (.CI(v[152]),
        .CO({v[137],NLW_c62_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[79],v[82],v[84],v[85]}),
        .O({v[74],v[76],v[70],v[78]}),
        .S({v[86],v[87],v[88],v[90]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c63
       (.CI(v[156]),
        .CO(v[145:142]),
        .CYINIT(\<const0> ),
        .DI({v[53],v[95],v[96],v[47]}),
        .O({v[135],v[136],v[160],v[161]}),
        .S({v[52],v[59],v[66],v[68]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c64
       (.C(clk),
        .CE(\<const1> ),
        .D(v[162]),
        .Q(\^Y [1]),
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
        .D(v[163]),
        .Q(\^Y [2]),
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
        .D(v[164]),
        .Q(\^Y [3]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c67
       (.CI(\<const0> ),
        .CO({v[165],NLW_c67_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[103],v[106],v[109],v[112]}),
        .O({v[164:162],v[123]}),
        .S({v[102],v[105],v[108],v[111]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c68
       (.CI(\<const0> ),
        .CO(v[152:149]),
        .CYINIT(\<const0> ),
        .DI({v[114],ZERO,v[116],\<const0> }),
        .O({v[122],v[172],v[109],v[112]}),
        .S({ZERO,v[99],ZERO,v[101]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c69
       (.C(clk),
        .CE(\<const1> ),
        .D(v[173]),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(v[174]),
        .Q(\^Y [5]),
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
        .D(v[175]),
        .Q(\^Y [6]),
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
        .D(v[176]),
        .Q(\^Y [7]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c73
       (.CI(v[165]),
        .CO({v[126],NLW_c73_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v[176:173]),
        .S({v[160],v[161],v[180],v[181]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(\<const0> ),
        .CO(v[156:153]),
        .CYINIT(\<const0> ),
        .DI({v[117],v[118],v[122],\<const0> }),
        .O({v[180],v[181],v[103],v[106]}),
        .S({v[119],v[120],v[121],v[172]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c75
       (.C(clk),
        .CE(\<const1> ),
        .D(v[132]),
        .Q(\^Y [8]),
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
        .D(v[131]),
        .Q(\^Y [9]),
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
        .D(A[0]),
        .Q(v[77]),
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
        .D(A[1]),
        .Q(v[75]),
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
        .D(A[2]),
        .Q(v[73]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c80
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
    c81
       (.C(clk),
        .CE(\<const1> ),
        .D(A[4]),
        .Q(v[57]),
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
        .D(A[5]),
        .Q(v[55]),
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
        .D(B[0]),
        .Q(v[83]),
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
        .D(B[1]),
        .Q(v[81]),
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
        .D(B[2]),
        .Q(v[80]),
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
        .D(B[3]),
        .Q(v[49]),
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
        .D(B[4]),
        .Q(v[54]),
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
        .D(B[5]),
        .Q(v[56]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h935F6CA0ECA08000)) 
    merge_0
       (.I0(v[54]),
        .I1(v[56]),
        .I2(v[73]),
        .I3(v[75]),
        .I4(v[76]),
        .I5(\<const1> ),
        .O5(v[60]),
        .O6(v[48]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h87777888F8888000)) 
    merge_1
       (.I0(v[50]),
        .I1(v[54]),
        .I2(v[56]),
        .I3(v[73]),
        .I4(v[74]),
        .I5(\<const1> ),
        .O5(v[65]),
        .O6(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h935F6CA0ECA08000)) 
    merge_2
       (.I0(v[50]),
        .I1(v[54]),
        .I2(v[56]),
        .I3(v[57]),
        .I4(v[72]),
        .I5(\<const1> ),
        .O5(v[58]),
        .O6(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hE888A000C0000000)) 
    merge_6
       (.I0(v[50]),
        .I1(v[57]),
        .I2(v[73]),
        .I3(v[80]),
        .I4(v[83]),
        .I5(v[81]),
        .O5(v[99]),
        .O6(v[84]));
endmodule
