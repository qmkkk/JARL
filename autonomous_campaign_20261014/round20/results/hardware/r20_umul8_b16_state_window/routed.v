// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:30:37 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round20/results/hardware/r20_umul8_b16_state_window/routed.v
// Design      : r20_umul8_b16_state_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "1fbc2af5" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.267574\",\n      \"Worst Negative Slack (WNS)\": \"7.705904\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"64\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"64\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"32\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.315000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"20.495000 seconds\"\n      }\n    }\n  }\n}" *) 
module r20_umul8_b16_state_window
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
  wire ZERO;
  wire clk;
  wire [229:51]v;
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:0]NLW_c101_CO_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c107_CO_UNCONNECTED;
  wire [3:0]NLW_c112_CO_UNCONNECTED;
  wire [3:0]NLW_c113_CO_UNCONNECTED;
  wire [3:0]NLW_c93_CO_UNCONNECTED;
  wire [3:0]NLW_c94_CO_UNCONNECTED;
  wire [3:0]NLW_c95_CO_UNCONNECTED;

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
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8F08)) 
    c10
       (.I0(v[63]),
        .I1(v[62]),
        .I2(v[51]),
        .I3(v[56]),
        .O(v[73]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(v[178]),
        .CO({v[197],NLW_c100_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[122],v[132],v[133],v[134]}),
        .O(v[196:193]),
        .S({v[135],v[136],v[137],v[138]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v[201]),
        .CO({v[115],NLW_c101_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[125],v[128]}),
        .O({v[55],v[58]}),
        .S({\<const0> ,\<const1> ,v[130],v[131]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c102
       (.C(clk),
        .CE(\<const1> ),
        .D(v[207]),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v[197]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v[207]),
        .S({\<const0> ,\<const0> ,\<const0> ,v[139]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v[189]),
        .CO({v[119],NLW_c104_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[140],v[141]}),
        .O({v[117],v[124]}),
        .S({\<const0> ,\<const1> ,v[142],v[143]}));
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
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c107
       (.CI(\<const0> ),
        .CO({v[222],NLW_c107_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[144],ZERO,v[146],\<const0> }),
        .O({v[173],v[221:220],v[175]}),
        .S({v[147],v[149],ZERO,v[151]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c108
       (.C(clk),
        .CE(\<const1> ),
        .D(v[226]),
        .Q(\^Y [3]),
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
        .D(v[227]),
        .Q(\^Y [4]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(v[228]),
        .Q(\^Y [5]),
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
        .D(v[229]),
        .Q(\^Y [6]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c112
       (.CI(\<const0> ),
        .CO({v[177],NLW_c112_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[164],v[167],v[170],v[173]}),
        .O(v[229:226]),
        .S({v[165],v[166],v[169],v[172]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c113
       (.CI(v[222]),
        .CO(v[201:198]),
        .CYINIT(\<const0> ),
        .DI({v[155],v[158],v[152],v[153]}),
        .O({v[72],v[65],v[167],v[170]}),
        .S({v[154],v[157],v[160],v[162]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c114
       (.C(clk),
        .CE(\<const1> ),
        .D(v[184]),
        .Q(\^Y [7]),
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
        .D(v[183]),
        .Q(\^Y [8]),
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
        .D(v[182]),
        .Q(\^Y [9]),
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
        .D(A[0]),
        .Q(v[69]),
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
        .D(A[1]),
        .Q(v[59]),
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
        .D(A[2]),
        .Q(v[53]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(\<const1> ),
        .D(A[3]),
        .Q(v[62]),
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
        .D(A[4]),
        .Q(v[86]),
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
        .D(A[5]),
        .Q(v[87]),
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
        .D(A[6]),
        .Q(v[88]),
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
        .D(A[7]),
        .Q(v[95]),
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
        .D(B[0]),
        .Q(v[129]),
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
        .Q(v[127]),
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
        .Q(v[126]),
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
        .Q(v[77]),
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
        .Q(v[75]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c13
       (.I0(v[77]),
        .I1(v[59]),
        .O(v[79]));
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
        .Q(v[76]),
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
        .Q(v[63]),
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
        .Q(v[52]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c15
       (.I0(v[69]),
        .I1(v[76]),
        .I2(v[59]),
        .I3(v[75]),
        .I4(v[77]),
        .I5(v[53]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c17
       (.I0(v[69]),
        .I1(v[77]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c18
       (.I0(v[76]),
        .I1(v[86]),
        .I2(v[75]),
        .I3(v[87]),
        .I4(v[77]),
        .I5(v[88]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c19
       (.I0(v[76]),
        .I1(v[62]),
        .I2(v[75]),
        .I3(v[86]),
        .I4(v[77]),
        .I5(v[87]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c2
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c20
       (.I0(v[76]),
        .I1(v[53]),
        .I2(v[75]),
        .I3(v[62]),
        .I4(v[77]),
        .I5(v[86]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8A08080808080808)) 
    c21
       (.I0(v[63]),
        .I1(v[53]),
        .I2(v[60]),
        .I3(v[59]),
        .I4(v[66]),
        .I5(v[65]),
        .O(v[91]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c22
       (.I0(v[76]),
        .I1(v[59]),
        .I2(v[75]),
        .I3(v[53]),
        .I4(v[77]),
        .I5(v[62]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c23
       (.I0(v[85]),
        .I1(v[75]),
        .I2(v[88]),
        .I3(v[94]),
        .I4(v[95]),
        .I5(v[77]),
        .O(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c24
       (.I0(v[89]),
        .I1(v[75]),
        .I2(v[87]),
        .I3(v[97]),
        .I4(v[88]),
        .I5(v[77]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c25
       (.I0(v[90]),
        .I1(v[75]),
        .I2(v[86]),
        .I3(v[99]),
        .I4(v[87]),
        .I5(v[77]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c26
       (.I0(v[92]),
        .I1(v[75]),
        .I2(v[62]),
        .I3(v[101]),
        .I4(v[86]),
        .I5(v[77]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c27
       (.I0(v[62]),
        .I1(v[77]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c28
       (.I0(v[87]),
        .I1(v[76]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c29
       (.I0(v[86]),
        .I1(v[76]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c3
       (.I0(v[57]),
        .I1(v[58]),
        .I2(v[52]),
        .I3(v[59]),
        .O(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c30
       (.I0(v[62]),
        .I1(v[76]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c31
       (.I0(v[53]),
        .I1(v[76]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h5995959595959595)) 
    c32
       (.I0(v[60]),
        .I1(v[63]),
        .I2(v[53]),
        .I3(v[65]),
        .I4(v[66]),
        .I5(v[59]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c33
       (.I0(v[72]),
        .I1(v[71]),
        .I2(v[69]),
        .I3(v[52]),
        .O(v[103]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c34
       (.I0(v[56]),
        .I1(v[51]),
        .I2(v[61]),
        .I3(v[105]),
        .I4(v[106]),
        .I5(v[107]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c35
       (.I0(v[64]),
        .I1(v[60]),
        .I2(v[67]),
        .I3(v[51]),
        .I4(v[61]),
        .I5(v[56]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969966996699696)) 
    c36
       (.I0(v[60]),
        .I1(v[67]),
        .I2(v[64]),
        .I3(v[68]),
        .I4(v[72]),
        .I5(v[71]),
        .O(v[109]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c39
       (.I0(v[88]),
        .I1(v[63]),
        .O(v[112]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c4
       (.I0(v[52]),
        .I1(v[59]),
        .I2(v[57]),
        .I3(v[58]),
        .O(v[60]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c40
       (.I0(v[114]),
        .I1(v[115]),
        .I2(v[52]),
        .I3(v[62]),
        .O(v[113]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c41
       (.I0(v[52]),
        .I1(v[62]),
        .I2(v[114]),
        .I3(v[115]),
        .O(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    c42
       (.I0(v[54]),
        .I1(v[55]),
        .I2(v[52]),
        .I3(v[53]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    c43
       (.I0(v[52]),
        .I1(v[87]),
        .I2(v[117]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h87)) 
    c44
       (.I0(v[52]),
        .I1(v[88]),
        .I2(v[119]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v[87]),
        .I1(v[63]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6A959595)) 
    c46
       (.I0(v[117]),
        .I1(v[87]),
        .I2(v[52]),
        .I3(v[63]),
        .I4(v[88]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v[86]),
        .I1(v[63]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h87)) 
    c49
       (.I0(v[52]),
        .I1(v[86]),
        .I2(v[124]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[62]),
        .I1(v[63]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c50
       (.I0(v[126]),
        .I1(v[88]),
        .I2(v[127]),
        .I3(v[95]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c51
       (.I0(v[126]),
        .I1(v[87]),
        .I2(v[127]),
        .I3(v[88]),
        .I4(v[129]),
        .I5(v[95]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c52
       (.I0(v[127]),
        .I1(v[88]),
        .I2(v[126]),
        .I3(v[95]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c53
       (.I0(v[129]),
        .I1(v[87]),
        .I2(v[88]),
        .I3(v[126]),
        .I4(v[95]),
        .I5(v[127]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7D44144414441444)) 
    c54
       (.I0(v[112]),
        .I1(v[117]),
        .I2(v[87]),
        .I3(v[52]),
        .I4(v[124]),
        .I5(v[86]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8FF8F8F808808080)) 
    c55
       (.I0(v[63]),
        .I1(v[87]),
        .I2(v[124]),
        .I3(v[86]),
        .I4(v[52]),
        .I5(v[113]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8F08)) 
    c56
       (.I0(v[63]),
        .I1(v[86]),
        .I2(v[105]),
        .I3(v[107]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h4FD525D52540B040)) 
    c57
       (.I0(v[116]),
        .I1(v[63]),
        .I2(v[95]),
        .I3(v[52]),
        .I4(v[88]),
        .I5(v[119]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69999666)) 
    c58
       (.I0(v[132]),
        .I1(v[118]),
        .I2(v[63]),
        .I3(v[95]),
        .I4(v[116]),
        .O(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD2B4B4B4B42D2D2D)) 
    c59
       (.I0(v[113]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[52]),
        .I4(v[86]),
        .I5(v[124]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hD42B2BD42BD4D42B)) 
    c60
       (.I0(v[107]),
        .I1(v[105]),
        .I2(v[106]),
        .I3(v[123]),
        .I4(v[120]),
        .I5(v[113]),
        .O(v[138]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c61
       (.I0(v[95]),
        .I1(v[119]),
        .I2(v[88]),
        .I3(v[52]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c62
       (.I0(v[76]),
        .I1(v[88]),
        .I2(v[75]),
        .I3(v[95]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c63
       (.I0(v[76]),
        .I1(v[87]),
        .I2(v[75]),
        .I3(v[88]),
        .I4(v[77]),
        .I5(v[95]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c64
       (.I0(v[75]),
        .I1(v[88]),
        .I2(v[76]),
        .I3(v[95]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c65
       (.I0(v[77]),
        .I1(v[87]),
        .I2(v[88]),
        .I3(v[76]),
        .I4(v[95]),
        .I5(v[75]),
        .O(v[143]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c66
       (.I0(v[127]),
        .I1(v[53]),
        .I2(v[126]),
        .I3(v[59]),
        .I4(v[62]),
        .I5(v[129]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c68
       (.I0(v[129]),
        .I1(v[59]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h99C369C399339933)) 
    c69
       (.I0(v[53]),
        .I1(v[148]),
        .I2(v[59]),
        .I3(v[127]),
        .I4(v[69]),
        .I5(v[126]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c7
       (.I0(v[53]),
        .I1(v[63]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c72
       (.I0(v[69]),
        .I1(v[129]),
        .O(v[151]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c73
       (.I0(v[62]),
        .I1(v[129]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c75
       (.I0(v[126]),
        .I1(v[59]),
        .I2(v[127]),
        .I3(v[53]),
        .I4(v[129]),
        .I5(v[62]),
        .O(v[153]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c76
       (.I0(v[155]),
        .I1(v[127]),
        .I2(v[88]),
        .I3(v[156]),
        .I4(v[95]),
        .I5(v[129]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c77
       (.I0(v[158]),
        .I1(v[127]),
        .I2(v[87]),
        .I3(v[159]),
        .I4(v[88]),
        .I5(v[129]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c78
       (.I0(v[152]),
        .I1(v[127]),
        .I2(v[86]),
        .I3(v[161]),
        .I4(v[87]),
        .I5(v[129]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c79
       (.I0(v[153]),
        .I1(v[127]),
        .I2(v[62]),
        .I3(v[163]),
        .I4(v[86]),
        .I5(v[129]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c8
       (.I0(v[69]),
        .I1(v[52]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c80
       (.I0(v[87]),
        .I1(v[126]),
        .O(v[156]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c81
       (.I0(v[86]),
        .I1(v[126]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c82
       (.I0(v[62]),
        .I1(v[126]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c83
       (.I0(v[53]),
        .I1(v[126]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c84
       (.I0(v[65]),
        .I1(v[66]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c85
       (.I0(v[66]),
        .I1(v[65]),
        .I2(v[63]),
        .I3(v[69]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c86
       (.I0(v[167]),
        .I1(v[168]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c87
       (.I0(v[170]),
        .I1(v[171]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c88
       (.I0(v[173]),
        .I1(v[174]),
        .O(v[172]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c89
       (.I0(v[126]),
        .I1(v[86]),
        .I2(v[127]),
        .I3(v[87]),
        .I4(v[129]),
        .I5(v[88]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7887)) 
    c9
       (.I0(v[52]),
        .I1(v[69]),
        .I2(v[71]),
        .I3(v[72]),
        .O(v[70]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c90
       (.I0(v[126]),
        .I1(v[62]),
        .I2(v[127]),
        .I3(v[86]),
        .I4(v[129]),
        .I5(v[87]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(\<const1> ),
        .D(v[175]),
        .Q(\^Y [0]),
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
        .D(v[176]),
        .Q(\^Y [10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c93
       (.CI(v[177]),
        .CO({v[178],NLW_c93_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[73],v[91],v[102],v[103]}),
        .O({v[176],v[182],v[183],v[184]}),
        .S({v[104],v[108],v[109],v[110]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c94
       (.CI(\<const0> ),
        .CO({v[185],NLW_c94_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[74],v[78],v[79],\<const0> }),
        .O({v[66],v[168],v[171],v[174]}),
        .S({v[80],v[82],v[83],v[84]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(v[185]),
        .CO(v[189:186]),
        .CYINIT(\<const0> ),
        .DI({v[85],v[89],v[90],v[92]}),
        .O({v[114],v[54],v[57],v[71]}),
        .S({v[93],v[96],v[98],v[100]}));
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
        .Q(\^Y [11]),
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
        .Q(\^Y [12]),
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
        .D(v[195]),
        .Q(\^Y [13]),
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
        .D(v[196]),
        .Q(\^Y [14]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h7888877780008000)) 
    merge_0
       (.I0(v[59]),
        .I1(v[63]),
        .I2(v[65]),
        .I3(v[66]),
        .I4(v[70]),
        .I5(\<const1> ),
        .O5(v[64]),
        .O6(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6A6AC0C06CA06CA0)) 
    merge_1
       (.I0(v[59]),
        .I1(v[69]),
        .I2(v[75]),
        .I3(v[76]),
        .I4(v[77]),
        .I5(\<const1> ),
        .O5(v[78]),
        .O6(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hEC80A00080800000)) 
    merge_13
       (.I0(v[53]),
        .I1(v[86]),
        .I2(v[126]),
        .I3(v[127]),
        .I4(v[129]),
        .I5(v[62]),
        .O5(v[149]),
        .O6(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hACA0535F6CA0935F)) 
    merge_16
       (.I0(v[53]),
        .I1(v[59]),
        .I2(v[75]),
        .I3(v[76]),
        .I4(v[81]),
        .I5(v[69]),
        .O5(v[74]),
        .O6(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET PROPCONST" *) 
  LUT4 #(
    .INIT(16'h20A0)) 
    merge_34
       (.I0(v[52]),
        .I1(v[88]),
        .I2(v[95]),
        .I3(v[119]),
        .O(v[122]));
endmodule
