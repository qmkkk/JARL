// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 14:59:50 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round21/results/hardware/r21_mac8_add8_b256_column_mse_quality_window/routed.v
// Design      : r21_mac8_add8_b256_column_mse_quality_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "2a7b6fdb" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"10.000000\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.142995\",\n      \"Worst Negative Slack (WNS)\": \"2.374158\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"49\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"49\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"40\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.421000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.127000 seconds\"\n      }\n    }\n  }\n}" *) 
module r21_mac8_add8_b256_column_mse_quality_window
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
  wire [199:51]v;
  wire [3:0]NLW_c70_CO_UNCONNECTED;
  wire [3:0]NLW_c71_CO_UNCONNECTED;
  wire [3:0]NLW_c71_O_UNCONNECTED;
  wire [3:0]NLW_c76_CO_UNCONNECTED;
  wire [3:0]NLW_c77_CO_UNCONNECTED;
  wire [3:0]NLW_c78_CO_UNCONNECTED;
  wire [3:0]NLW_c87_CO_UNCONNECTED;
  wire [3:0]NLW_c88_CO_UNCONNECTED;

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
       (.I0(v[59]),
        .I1(v[60]),
        .I2(v[58]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(B[11]),
        .Q(v[191]),
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
        .D(B[12]),
        .Q(v[132]),
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
        .D(B[13]),
        .Q(v[199]),
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
        .D(B[14]),
        .Q(v[139]),
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
        .D(B[15]),
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
        .D(B[1]),
        .Q(v[85]),
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
        .D(B[2]),
        .Q(v[54]),
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
        .D(B[3]),
        .Q(v[56]),
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
        .D(B[4]),
        .Q(v[123]),
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
        .D(B[5]),
        .Q(v[90]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c11
       (.I0(v[78]),
        .I1(v[84]),
        .I2(v[77]),
        .I3(v[51]),
        .I4(v[74]),
        .I5(v[73]),
        .O(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
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
    c111
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v[92]),
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
        .D(B[8]),
        .Q(v[149]),
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
        .D(B[9]),
        .Q(v[189]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c12
       (.I0(v[53]),
        .I1(v[54]),
        .I2(v[55]),
        .I3(v[56]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c13
       (.I0(v[53]),
        .I1(v[85]),
        .I2(v[56]),
        .I3(v[55]),
        .I4(v[54]),
        .I5(v[86]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c14
       (.I0(v[55]),
        .I1(v[85]),
        .I2(v[56]),
        .I3(v[70]),
        .I4(v[54]),
        .I5(v[86]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c15
       (.I0(v[86]),
        .I1(v[54]),
        .I2(v[56]),
        .I3(v[70]),
        .I4(v[85]),
        .I5(v[55]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c17
       (.I0(v[55]),
        .I1(v[54]),
        .I2(v[85]),
        .I3(v[53]),
        .I4(v[56]),
        .I5(v[86]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c18
       (.I0(v[88]),
        .I1(v[89]),
        .I2(v[90]),
        .I3(v[69]),
        .I4(v[91]),
        .I5(v[92]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c20
       (.I0(v[94]),
        .I1(v[88]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c23
       (.I0(v[94]),
        .I1(v[92]),
        .I2(v[89]),
        .I3(v[90]),
        .I4(v[88]),
        .I5(v[91]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c24
       (.I0(v[88]),
        .I1(v[94]),
        .I2(v[90]),
        .I3(v[91]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c26
       (.I0(v[53]),
        .I1(v[54]),
        .I2(v[55]),
        .I3(v[56]),
        .O(v[75]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c27
       (.I0(v[58]),
        .I1(v[60]),
        .I2(v[59]),
        .I3(v[67]),
        .I4(v[101]),
        .I5(v[102]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT6 #(
    .INIT(64'h9696009600960000)) 
    c28
       (.I0(v[67]),
        .I1(v[101]),
        .I2(v[102]),
        .I3(v[64]),
        .I4(v[81]),
        .I5(v[80]),
        .O(v[103]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c29
       (.I0(v[72]),
        .I1(v[78]),
        .I2(v[77]),
        .I3(v[84]),
        .I4(v[105]),
        .I5(v[106]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c3
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c30
       (.I0(v[57]),
        .I1(v[76]),
        .I2(v[73]),
        .I3(v[74]),
        .I4(v[51]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c32
       (.I0(v[79]),
        .I1(v[82]),
        .I2(v[102]),
        .I3(v[101]),
        .I4(v[67]),
        .O(v[109]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c34
       (.I0(v[55]),
        .I1(v[90]),
        .I2(v[86]),
        .I3(v[92]),
        .I4(v[70]),
        .I5(v[88]),
        .O(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c35
       (.I0(v[90]),
        .I1(v[86]),
        .I2(v[70]),
        .I3(v[88]),
        .I4(v[92]),
        .I5(v[69]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c36
       (.I0(v[70]),
        .I1(v[90]),
        .I2(v[92]),
        .I3(v[89]),
        .I4(v[88]),
        .I5(v[69]),
        .O(v[112]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c37
       (.I0(v[69]),
        .I1(v[90]),
        .I2(v[92]),
        .I3(v[89]),
        .I4(v[88]),
        .I5(v[91]),
        .O(v[113]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c38
       (.I0(v[110]),
        .I1(v[53]),
        .I2(v[90]),
        .I3(v[115]),
        .I4(v[88]),
        .I5(v[55]),
        .O(v[114]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c39
       (.I0(v[111]),
        .I1(v[92]),
        .I2(v[70]),
        .I3(v[117]),
        .I4(v[86]),
        .I5(v[88]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    c4
       (.I0(v[61]),
        .I1(v[62]),
        .I2(v[63]),
        .I3(v[64]),
        .I4(v[66]),
        .O(v[60]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    c40
       (.I0(v[112]),
        .I1(v[90]),
        .I2(v[86]),
        .I3(v[69]),
        .I4(v[92]),
        .I5(v[119]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c41
       (.I0(v[113]),
        .I1(v[90]),
        .I2(v[70]),
        .I3(v[121]),
        .I4(v[88]),
        .I5(v[69]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c42
       (.I0(v[53]),
        .I1(v[123]),
        .O(v[122]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c43
       (.I0(v[55]),
        .I1(v[123]),
        .O(v[124]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    c44
       (.I0(v[63]),
        .I1(v[64]),
        .I2(v[66]),
        .I3(v[61]),
        .I4(v[62]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v[86]),
        .I1(v[92]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v[90]),
        .I1(v[55]),
        .O(v[117]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v[70]),
        .I1(v[88]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c48
       (.I0(v[92]),
        .I1(v[89]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h11171777EEE8E888)) 
    c49
       (.I0(v[105]),
        .I1(v[106]),
        .I2(v[78]),
        .I3(v[77]),
        .I4(v[84]),
        .I5(v[126]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c5
       (.I0(v[64]),
        .I1(v[66]),
        .I2(v[63]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c50
       (.I0(v[55]),
        .I1(v[92]),
        .I2(v[53]),
        .I3(v[88]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c51
       (.I0(v[53]),
        .I1(v[90]),
        .I2(v[86]),
        .I3(v[92]),
        .I4(v[88]),
        .I5(v[55]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c52
       (.I0(v[88]),
        .I1(v[55]),
        .I2(v[92]),
        .I3(v[53]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c53
       (.I0(v[86]),
        .I1(v[90]),
        .I2(v[88]),
        .I3(v[53]),
        .I4(v[92]),
        .I5(v[55]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT1 #(
    .INIT(2'h1)) 
    c54
       (.I0(v[132]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h077F8800F8808800)) 
    c55
       (.I0(v[134]),
        .I1(v[53]),
        .I2(v[69]),
        .I3(v[135]),
        .I4(v[123]),
        .I5(v[70]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c56
       (.I0(v[137]),
        .I1(v[123]),
        .I2(v[69]),
        .I3(v[135]),
        .I4(v[53]),
        .I5(v[134]),
        .O(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c58
       (.I0(v[70]),
        .I1(v[54]),
        .I2(v[85]),
        .I3(v[86]),
        .I4(v[56]),
        .I5(v[69]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c59
       (.I0(v[80]),
        .I1(v[81]),
        .I2(v[64]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT6 #(
    .INIT(64'h2BD4D42BD42B2BD4)) 
    c60
       (.I0(v[64]),
        .I1(v[81]),
        .I2(v[80]),
        .I3(v[67]),
        .I4(v[101]),
        .I5(v[102]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96969669)) 
    c61
       (.I0(v[64]),
        .I1(v[81]),
        .I2(v[80]),
        .I3(v[144]),
        .I4(v[140]),
        .O(v[143]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c62
       (.I0(v[144]),
        .I1(v[140]),
        .I2(v[146]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hEA808080)) 
    c63
       (.I0(v[135]),
        .I1(v[69]),
        .I2(v[123]),
        .I3(v[53]),
        .I4(v[134]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c65
       (.I0(v[86]),
        .I1(v[123]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c66
       (.C(clk),
        .CE(\<const1> ),
        .D(v[149]),
        .Q(\^Y [0]),
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
        .D(v[150]),
        .Q(\^Y [10]),
        .R(\<const0> ));
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
        .Q(\^Y [11]),
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
        .Q(\^Y [12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE88E8EE88EE88EE8)) 
    c7
       (.I0(v[73]),
        .I1(v[74]),
        .I2(v[52]),
        .I3(v[75]),
        .I4(v[56]),
        .I5(v[53]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c70
       (.CI(v[153]),
        .CO({v[154],NLW_c70_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[83],v[97],v[100],v[103]}),
        .O({v[152:150],v[158]}),
        .S({v[104],v[107],v[108],v[109]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c71
       (.CI(\<const0> ),
        .CO({v[159],NLW_c71_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[87],v[93],v[95],\<const0> }),
        .O({v[101],v[81],v[144],NLW_c71_O_UNCONNECTED[0]}),
        .S({v[96],v[98],v[99],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c72
       (.C(clk),
        .CE(\<const1> ),
        .D(v[164]),
        .Q(\^Y [13]),
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
        .D(v[165]),
        .Q(\^Y [14]),
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
        .D(v[166]),
        .Q(\^Y [15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c75
       (.CI(v[154]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[126]}),
        .O(v[166:164]),
        .S({\<const0> ,v[172],v[173],v[125]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c76
       (.CI(v[174]),
        .CO(v[172:170]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[127],v[128]}),
        .O({v[173],v[126]}),
        .S({\<const0> ,\<const1> ,v[129],v[130]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c77
       (.CI(v[159]),
        .CO({v[174],NLW_c77_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[110],v[111],v[112],v[113]}),
        .O({v[106],v[77],v[74],v[59]}),
        .S({v[114],v[116],v[118],v[120]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c78
       (.CI(v[183]),
        .CO({v[105],NLW_c78_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[78],v[73]}),
        .S({\<const0> ,\<const1> ,v[122],v[124]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c79
       (.C(clk),
        .CE(\<const1> ),
        .D(v[189]),
        .Q(\^Y [1]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hA999955556666AAA)) 
    c8
       (.I0(v[77]),
        .I1(v[52]),
        .I2(v[56]),
        .I3(v[53]),
        .I4(v[75]),
        .I5(v[78]),
        .O(v[76]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c80
       (.C(clk),
        .CE(\<const1> ),
        .D(v[190]),
        .Q(\^Y [2]),
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
        .D(v[191]),
        .Q(\^Y [3]),
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
        .D(v[131]),
        .Q(\^Y [4]),
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
        .D(v[192]),
        .Q(\^Y [5]),
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
        .D(v[193]),
        .Q(\^Y [6]),
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
        .D(v[194]),
        .Q(\^Y [7]),
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
        .D(v[195]),
        .Q(\^Y [8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* \PinAttr:S[0]:HOLD_DETOUR  = "154" *) 
  CARRY4 c87
       (.CI(\<const0> ),
        .CO({v[153],NLW_c87_CO_UNCONNECTED[2:0]}),
        .CYINIT(v[132]),
        .DI({\<const0> ,v[141],v[146],\<const0> }),
        .O(v[195:192]),
        .S({v[142],v[143],v[145],v[199]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c88
       (.CI(\<const0> ),
        .CO(v[183:180]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[147],v[137],\<const0> }),
        .O({v[58],v[102],v[80],v[146]}),
        .S({v[148],v[133],v[136],v[138]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c89
       (.C(clk),
        .CE(\<const1> ),
        .D(v[158]),
        .Q(\^Y [9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    c9
       (.I0(v[80]),
        .I1(v[81]),
        .I2(v[64]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[94]),
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
        .D(A[1]),
        .Q(v[91]),
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
        .D(A[2]),
        .Q(v[89]),
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
        .D(A[3]),
        .Q(v[69]),
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
        .D(A[4]),
        .Q(v[70]),
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
        .D(A[5]),
        .Q(v[86]),
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
        .D(A[6]),
        .Q(v[55]),
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
        .D(A[7]),
        .Q(v[53]),
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
        .D(B[0]),
        .Q(v[134]),
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
        .D(B[10]),
        .Q(v[190]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hA6C04800C8008000)) 
    merge_0
       (.I0(v[55]),
        .I1(v[89]),
        .I2(v[123]),
        .I3(v[134]),
        .I4(v[139]),
        .I5(\<const1> ),
        .O5(v[137]),
        .O6(v[138]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hA666AAAAC8880000)) 
    merge_1
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .I4(v[56]),
        .I5(\<const1> ),
        .O5(v[84]),
        .O6(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h3FC0C0C06AAAAAAA)) 
    merge_2
       (.I0(v[87]),
        .I1(v[89]),
        .I2(v[90]),
        .I3(v[92]),
        .I4(v[94]),
        .I5(\<const1> ),
        .O5(v[96]),
        .O6(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8448844896696996)) 
    merge_5
       (.I0(v[51]),
        .I1(v[57]),
        .I2(v[73]),
        .I3(v[74]),
        .I4(v[100]),
        .I5(\<const1> ),
        .O5(v[108]),
        .O6(v[97]));
endmodule
