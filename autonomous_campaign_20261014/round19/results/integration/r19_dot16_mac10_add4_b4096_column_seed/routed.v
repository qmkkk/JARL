// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:13:37 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/integration/r19_dot16_mac10_add4_b4096_column_seed/routed.v
// Design      : r19_dot16_mac10_add4_b4096_column_seed
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "41935216" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.169167\",\n      \"Worst Negative Slack (WNS)\": \"7.378765\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"132\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"132\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"84\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.696000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.479000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_dot16_mac10_add4_b4096_column_seed
   (clk,
    reset,
    valid,
    start,
    last,
    A,
    B,
    Y,
    done);
  input clk;
  input reset;
  input valid;
  input start;
  input last;
  input [15:0]A;
  input [15:0]B;
  output [31:0]Y;
  output done;

  wire \<const0> ;
  wire \<const1> ;
  wire [15:0]A;
  wire [15:0]B;
  wire [31:9]\^Y ;
  wire \Y[31]_i_1_n_0 ;
  wire [31:9]acc0;
  wire [31:9]acc_reg;
  wire clk;
  wire core_n_0;
  wire core_n_1;
  wire core_n_10;
  wire core_n_11;
  wire core_n_12;
  wire core_n_13;
  wire core_n_14;
  wire core_n_15;
  wire core_n_16;
  wire core_n_17;
  wire core_n_18;
  wire core_n_19;
  wire core_n_2;
  wire core_n_20;
  wire core_n_21;
  wire core_n_22;
  wire core_n_3;
  wire core_n_4;
  wire core_n_5;
  wire core_n_6;
  wire core_n_7;
  wire core_n_8;
  wire core_n_9;
  wire done;
  wire done_i_1_n_0;
  wire l0;
  wire l1;
  wire last;
  wire reset;
  wire s0;
  wire s1;
  wire start;
  wire v0;
  wire v1;
  wire valid;

  assign Y[31:9] = \^Y [31:9];
  assign Y[8] = \<const0> ;
  assign Y[7] = \<const0> ;
  assign Y[6] = \<const0> ;
  assign Y[5] = \<const0> ;
  assign Y[4] = \<const0> ;
  assign Y[3] = \<const0> ;
  assign Y[2] = \<const0> ;
  assign Y[1] = \<const0> ;
  assign Y[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \Y[31]_i_1 
       (.I0(v1),
        .I1(l1),
        .O(\Y[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[10] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[10]),
        .Q(\^Y [10]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[11] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[11]),
        .Q(\^Y [11]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[12] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[12]),
        .Q(\^Y [12]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[13] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[13]),
        .Q(\^Y [13]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[14] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[14]),
        .Q(\^Y [14]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[15] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[15]),
        .Q(\^Y [15]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[16] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[16]),
        .Q(\^Y [16]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[17] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[17]),
        .Q(\^Y [17]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[18] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[18]),
        .Q(\^Y [18]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[19] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[19]),
        .Q(\^Y [19]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[20] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[20]),
        .Q(\^Y [20]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[21] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[21]),
        .Q(\^Y [21]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[22] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[22]),
        .Q(\^Y [22]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[23] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[23]),
        .Q(\^Y [23]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[24] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[24]),
        .Q(\^Y [24]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[25] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[25]),
        .Q(\^Y [25]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[26] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[26]),
        .Q(\^Y [26]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[27] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[27]),
        .Q(\^Y [27]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[28] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[28]),
        .Q(\^Y [28]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[29] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[29]),
        .Q(\^Y [29]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[30] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[30]),
        .Q(\^Y [30]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[31] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[31]),
        .Q(\^Y [31]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[9] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[9]),
        .Q(\^Y [9]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[10] 
       (.C(clk),
        .CE(v1),
        .D(core_n_2),
        .Q(acc_reg[10]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[11] 
       (.C(clk),
        .CE(v1),
        .D(core_n_1),
        .Q(acc_reg[11]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[12] 
       (.C(clk),
        .CE(v1),
        .D(core_n_0),
        .Q(acc_reg[12]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[13] 
       (.C(clk),
        .CE(v1),
        .D(core_n_7),
        .Q(acc_reg[13]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[14] 
       (.C(clk),
        .CE(v1),
        .D(core_n_6),
        .Q(acc_reg[14]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[15] 
       (.C(clk),
        .CE(v1),
        .D(core_n_5),
        .Q(acc_reg[15]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[16] 
       (.C(clk),
        .CE(v1),
        .D(core_n_4),
        .Q(acc_reg[16]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[17] 
       (.C(clk),
        .CE(v1),
        .D(core_n_11),
        .Q(acc_reg[17]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[18] 
       (.C(clk),
        .CE(v1),
        .D(core_n_10),
        .Q(acc_reg[18]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[19] 
       (.C(clk),
        .CE(v1),
        .D(core_n_9),
        .Q(acc_reg[19]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[20] 
       (.C(clk),
        .CE(v1),
        .D(core_n_8),
        .Q(acc_reg[20]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[21] 
       (.C(clk),
        .CE(v1),
        .D(core_n_15),
        .Q(acc_reg[21]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[22] 
       (.C(clk),
        .CE(v1),
        .D(core_n_14),
        .Q(acc_reg[22]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[23] 
       (.C(clk),
        .CE(v1),
        .D(core_n_13),
        .Q(acc_reg[23]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[24] 
       (.C(clk),
        .CE(v1),
        .D(core_n_12),
        .Q(acc_reg[24]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[25] 
       (.C(clk),
        .CE(v1),
        .D(core_n_19),
        .Q(acc_reg[25]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[26] 
       (.C(clk),
        .CE(v1),
        .D(core_n_18),
        .Q(acc_reg[26]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[27] 
       (.C(clk),
        .CE(v1),
        .D(core_n_17),
        .Q(acc_reg[27]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[28] 
       (.C(clk),
        .CE(v1),
        .D(core_n_16),
        .Q(acc_reg[28]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[29] 
       (.C(clk),
        .CE(v1),
        .D(core_n_22),
        .Q(acc_reg[29]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[30] 
       (.C(clk),
        .CE(v1),
        .D(core_n_21),
        .Q(acc_reg[30]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[31] 
       (.C(clk),
        .CE(v1),
        .D(core_n_20),
        .Q(acc_reg[31]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[9] 
       (.C(clk),
        .CE(v1),
        .D(core_n_3),
        .Q(acc_reg[9]),
        .R(reset));
  r19_mac10_add4_b4096_column_seed core
       (.A(A[9:0]),
        .B(B[9:0]),
        .D(acc0),
        .O({core_n_0,core_n_1,core_n_2,core_n_3}),
        .acc_reg(acc_reg),
        .\acc_reg[28] ({core_n_16,core_n_17,core_n_18,core_n_19}),
        .\acc_reg[31] ({core_n_20,core_n_21,core_n_22}),
        .c102_0({core_n_8,core_n_9,core_n_10,core_n_11}),
        .c102_1({core_n_12,core_n_13,core_n_14,core_n_15}),
        .c95_0({core_n_4,core_n_5,core_n_6,core_n_7}),
        .clk(clk),
        .s1(s1));
  LUT3 #(
    .INIT(8'h08)) 
    done_i_1
       (.I0(l1),
        .I1(v1),
        .I2(reset),
        .O(done_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done_i_1_n_0),
        .Q(done),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    l0_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(last),
        .Q(l0),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    l1_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(l0),
        .Q(l1),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    s0_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(start),
        .Q(s0),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    s1_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(s0),
        .Q(s1),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    v0_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(valid),
        .Q(v0),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    v1_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(v0),
        .Q(v1),
        .R(reset));
endmodule

module r19_mac10_add4_b4096_column_seed
   (O,
    c95_0,
    c102_0,
    c102_1,
    \acc_reg[28] ,
    \acc_reg[31] ,
    D,
    s1,
    acc_reg,
    clk,
    A,
    B);
  output [3:0]O;
  output [3:0]c95_0;
  output [3:0]c102_0;
  output [3:0]c102_1;
  output [3:0]\acc_reg[28] ;
  output [2:0]\acc_reg[31] ;
  output [22:0]D;
  input s1;
  input [22:0]acc_reg;
  input clk;
  input [9:0]A;
  input [9:0]B;

  wire \<const0> ;
  wire \<const1> ;
  wire [9:0]A;
  wire [9:0]B;
  wire [22:0]D;
  wire [3:0]O;
  wire \Y[12]_i_2_n_0 ;
  wire \Y[12]_i_3_n_0 ;
  wire \Y[12]_i_4_n_0 ;
  wire \Y[12]_i_5_n_0 ;
  wire \Y[12]_i_6_n_0 ;
  wire \Y[12]_i_7_n_0 ;
  wire \Y[12]_i_8_n_0 ;
  wire \Y[16]_i_10_n_0 ;
  wire \Y[16]_i_11_n_0 ;
  wire \Y[16]_i_12_n_0 ;
  wire \Y[16]_i_13_n_0 ;
  wire \Y[16]_i_2_n_0 ;
  wire \Y[16]_i_3_n_0 ;
  wire \Y[16]_i_4_n_0 ;
  wire \Y[16]_i_5_n_0 ;
  wire \Y[16]_i_6_n_0 ;
  wire \Y[16]_i_7_n_0 ;
  wire \Y[16]_i_8_n_0 ;
  wire \Y[16]_i_9_n_0 ;
  wire \Y[20]_i_10_n_0 ;
  wire \Y[20]_i_11_n_0 ;
  wire \Y[20]_i_12_n_0 ;
  wire \Y[20]_i_2_n_0 ;
  wire \Y[20]_i_3_n_0 ;
  wire \Y[20]_i_4_n_0 ;
  wire \Y[20]_i_5_n_0 ;
  wire \Y[20]_i_6_n_0 ;
  wire \Y[20]_i_7_n_0 ;
  wire \Y[20]_i_8_n_0 ;
  wire \Y[20]_i_9_n_0 ;
  wire \Y[24]_i_5_n_0 ;
  wire \Y[24]_i_6_n_0 ;
  wire \Y[24]_i_7_n_0 ;
  wire \Y[24]_i_8_n_0 ;
  wire \Y[24]_i_9_n_0 ;
  wire \Y[28]_i_6_n_0 ;
  wire \Y[28]_i_7_n_0 ;
  wire \Y[28]_i_8_n_0 ;
  wire \Y[28]_i_9_n_0 ;
  wire \Y[31]_i_5_n_0 ;
  wire \Y[31]_i_6_n_0 ;
  wire \Y[31]_i_7_n_0 ;
  wire \Y_reg[12]_i_1_n_0 ;
  wire \Y_reg[16]_i_1_n_0 ;
  wire \Y_reg[20]_i_1_n_0 ;
  wire \Y_reg[24]_i_1_n_0 ;
  wire \Y_reg[28]_i_1_n_0 ;
  wire \acc[13]_i_2_n_0 ;
  wire \acc[13]_i_3_n_0 ;
  wire \acc[13]_i_4_n_0 ;
  wire \acc[13]_i_5_n_0 ;
  wire \acc[17]_i_3_n_0 ;
  wire \acc[17]_i_4_n_0 ;
  wire \acc[17]_i_5_n_0 ;
  wire \acc[21]_i_2_n_0 ;
  wire \acc[21]_i_3_n_0 ;
  wire \acc[21]_i_4_n_0 ;
  wire \acc[21]_i_5_n_0 ;
  wire \acc[25]_i_2_n_0 ;
  wire \acc[25]_i_3_n_0 ;
  wire \acc[25]_i_4_n_0 ;
  wire \acc[25]_i_5_n_0 ;
  wire \acc[29]_i_4_n_0 ;
  wire \acc[9]_i_2_n_0 ;
  wire \acc[9]_i_3_n_0 ;
  wire \acc[9]_i_4_n_0 ;
  wire \acc[9]_i_5_n_0 ;
  wire [22:0]acc_reg;
  wire \acc_reg[13]_i_1_n_0 ;
  wire \acc_reg[17]_i_1_n_0 ;
  wire \acc_reg[21]_i_1_n_0 ;
  wire \acc_reg[25]_i_1_n_0 ;
  wire [3:0]\acc_reg[28] ;
  wire [2:0]\acc_reg[31] ;
  wire \acc_reg[9]_i_1_n_0 ;
  wire [3:0]c102_0;
  wire [3:0]c102_1;
  wire [3:0]c95_0;
  wire clk;
  wire [31:20]p_0_out;
  wire [29:21]p_0_out__0;
  wire [19:9]product;
  wire s1;
  wire [232:50]v;
  wire [3:0]\NLW_Y_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[13]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[17]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[25]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[9]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [3:0]NLW_c107_CO_UNCONNECTED;
  wire [3:0]NLW_c108_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;
  wire [3:0]NLW_c96_CO_UNCONNECTED;
  wire [3:0]NLW_c97_CO_UNCONNECTED;
  wire [3:0]NLW_c98_CO_UNCONNECTED;
  wire [3:0]NLW_c99_CO_UNCONNECTED;
  wire [3:0]NLW_c99_O_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[12]_i_2 
       (.I0(product[10]),
        .I1(acc_reg[1]),
        .I2(product[11]),
        .I3(acc_reg[2]),
        .I4(s1),
        .O(\Y[12]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \Y[12]_i_3 
       (.I0(product[9]),
        .O(\Y[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[12]_i_4 
       (.I0(acc_reg[1]),
        .I1(product[10]),
        .I2(\Y[12]_i_8_n_0 ),
        .I3(s1),
        .I4(acc_reg[2]),
        .I5(product[11]),
        .O(\Y[12]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hA5A51EE1)) 
    \Y[12]_i_5 
       (.I0(product[10]),
        .I1(acc_reg[1]),
        .I2(product[11]),
        .I3(acc_reg[2]),
        .I4(s1),
        .O(\Y[12]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hA659)) 
    \Y[12]_i_6 
       (.I0(product[10]),
        .I1(acc_reg[1]),
        .I2(s1),
        .I3(product[9]),
        .O(\Y[12]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h65)) 
    \Y[12]_i_7 
       (.I0(product[9]),
        .I1(s1),
        .I2(acc_reg[0]),
        .O(\Y[12]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[12]_i_8 
       (.I0(s1),
        .I1(acc_reg[3]),
        .I2(product[12]),
        .O(\Y[12]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_10 
       (.I0(s1),
        .I1(acc_reg[7]),
        .I2(product[16]),
        .O(\Y[16]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_11 
       (.I0(s1),
        .I1(acc_reg[6]),
        .I2(product[15]),
        .O(\Y[16]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_12 
       (.I0(s1),
        .I1(acc_reg[5]),
        .I2(product[14]),
        .O(\Y[16]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_13 
       (.I0(s1),
        .I1(acc_reg[4]),
        .I2(product[13]),
        .O(\Y[16]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[16]_i_2 
       (.I0(product[14]),
        .I1(acc_reg[5]),
        .I2(product[15]),
        .I3(acc_reg[6]),
        .I4(s1),
        .O(\Y[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[16]_i_3 
       (.I0(product[13]),
        .I1(acc_reg[4]),
        .I2(product[14]),
        .I3(acc_reg[5]),
        .I4(s1),
        .O(\Y[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[16]_i_4 
       (.I0(product[12]),
        .I1(acc_reg[3]),
        .I2(product[13]),
        .I3(acc_reg[4]),
        .I4(s1),
        .O(\Y[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[16]_i_5 
       (.I0(product[11]),
        .I1(acc_reg[2]),
        .I2(product[12]),
        .I3(acc_reg[3]),
        .I4(s1),
        .O(\Y[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[16]_i_6 
       (.I0(acc_reg[5]),
        .I1(product[14]),
        .I2(\Y[16]_i_10_n_0 ),
        .I3(s1),
        .I4(acc_reg[6]),
        .I5(product[15]),
        .O(\Y[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[16]_i_7 
       (.I0(acc_reg[4]),
        .I1(product[13]),
        .I2(\Y[16]_i_11_n_0 ),
        .I3(s1),
        .I4(acc_reg[5]),
        .I5(product[14]),
        .O(\Y[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[16]_i_8 
       (.I0(acc_reg[3]),
        .I1(product[12]),
        .I2(\Y[16]_i_12_n_0 ),
        .I3(s1),
        .I4(acc_reg[4]),
        .I5(product[13]),
        .O(\Y[16]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[16]_i_9 
       (.I0(acc_reg[2]),
        .I1(product[11]),
        .I2(\Y[16]_i_13_n_0 ),
        .I3(s1),
        .I4(acc_reg[3]),
        .I5(product[12]),
        .O(\Y[16]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[20]_i_10 
       (.I0(s1),
        .I1(acc_reg[10]),
        .I2(product[19]),
        .O(\Y[20]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[20]_i_11 
       (.I0(s1),
        .I1(acc_reg[9]),
        .I2(product[18]),
        .O(\Y[20]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[20]_i_12 
       (.I0(s1),
        .I1(acc_reg[8]),
        .I2(product[17]),
        .O(\Y[20]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[20]_i_2 
       (.I0(product[18]),
        .I1(acc_reg[9]),
        .I2(product[19]),
        .I3(acc_reg[10]),
        .I4(s1),
        .O(\Y[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[20]_i_3 
       (.I0(product[17]),
        .I1(acc_reg[8]),
        .I2(product[18]),
        .I3(acc_reg[9]),
        .I4(s1),
        .O(\Y[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[20]_i_4 
       (.I0(product[16]),
        .I1(acc_reg[7]),
        .I2(product[17]),
        .I3(acc_reg[8]),
        .I4(s1),
        .O(\Y[20]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0A0AE00E)) 
    \Y[20]_i_5 
       (.I0(product[15]),
        .I1(acc_reg[6]),
        .I2(product[16]),
        .I3(acc_reg[7]),
        .I4(s1),
        .O(\Y[20]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h001E00F033F033E1)) 
    \Y[20]_i_6 
       (.I0(acc_reg[9]),
        .I1(product[18]),
        .I2(acc_reg[11]),
        .I3(s1),
        .I4(acc_reg[10]),
        .I5(product[19]),
        .O(\Y[20]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[20]_i_7 
       (.I0(acc_reg[8]),
        .I1(product[17]),
        .I2(\Y[20]_i_10_n_0 ),
        .I3(s1),
        .I4(acc_reg[9]),
        .I5(product[18]),
        .O(\Y[20]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[20]_i_8 
       (.I0(acc_reg[7]),
        .I1(product[16]),
        .I2(\Y[20]_i_11_n_0 ),
        .I3(s1),
        .I4(acc_reg[8]),
        .I5(product[17]),
        .O(\Y[20]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hF01EF0F0C3F0C3E1)) 
    \Y[20]_i_9 
       (.I0(acc_reg[6]),
        .I1(product[15]),
        .I2(\Y[20]_i_12_n_0 ),
        .I3(s1),
        .I4(acc_reg[7]),
        .I5(product[16]),
        .O(\Y[20]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_2 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(p_0_out__0[23]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_3 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(p_0_out__0[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_4 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(p_0_out__0[21]));
  LUT4 #(
    .INIT(16'hFF32)) 
    \Y[24]_i_5 
       (.I0(acc_reg[11]),
        .I1(s1),
        .I2(acc_reg[10]),
        .I3(product[19]),
        .O(\Y[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_6 
       (.I0(acc_reg[14]),
        .I1(s1),
        .I2(acc_reg[15]),
        .O(\Y[24]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_7 
       (.I0(acc_reg[13]),
        .I1(s1),
        .I2(acc_reg[14]),
        .O(\Y[24]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_8 
       (.I0(acc_reg[12]),
        .I1(s1),
        .I2(acc_reg[13]),
        .O(\Y[24]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h55FE5501)) 
    \Y[24]_i_9 
       (.I0(product[19]),
        .I1(acc_reg[10]),
        .I2(acc_reg[11]),
        .I3(s1),
        .I4(acc_reg[12]),
        .O(\Y[24]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_2 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(p_0_out__0[27]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_3 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(p_0_out__0[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_4 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(p_0_out__0[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_5 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(p_0_out__0[24]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_6 
       (.I0(acc_reg[18]),
        .I1(s1),
        .I2(acc_reg[19]),
        .O(\Y[28]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_7 
       (.I0(acc_reg[17]),
        .I1(s1),
        .I2(acc_reg[18]),
        .O(\Y[28]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_8 
       (.I0(acc_reg[16]),
        .I1(s1),
        .I2(acc_reg[17]),
        .O(\Y[28]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_9 
       (.I0(acc_reg[15]),
        .I1(s1),
        .I2(acc_reg[16]),
        .O(\Y[28]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_3 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(p_0_out__0[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_4 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(p_0_out__0[28]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_5 
       (.I0(acc_reg[21]),
        .I1(s1),
        .I2(acc_reg[22]),
        .O(\Y[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_6 
       (.I0(acc_reg[20]),
        .I1(s1),
        .I2(acc_reg[21]),
        .O(\Y[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_7 
       (.I0(acc_reg[19]),
        .I1(s1),
        .I2(acc_reg[20]),
        .O(\Y[31]_i_7_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[12]_i_1 
       (.CI(\<const0> ),
        .CO({\Y_reg[12]_i_1_n_0 ,\NLW_Y_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const1> ),
        .DI({\Y[12]_i_2_n_0 ,\<const0> ,product[9],\Y[12]_i_3_n_0 }),
        .O(D[3:0]),
        .S({\Y[12]_i_4_n_0 ,\Y[12]_i_5_n_0 ,\Y[12]_i_6_n_0 ,\Y[12]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[16]_i_1 
       (.CI(\Y_reg[12]_i_1_n_0 ),
        .CO({\Y_reg[16]_i_1_n_0 ,\NLW_Y_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Y[16]_i_2_n_0 ,\Y[16]_i_3_n_0 ,\Y[16]_i_4_n_0 ,\Y[16]_i_5_n_0 }),
        .O(D[7:4]),
        .S({\Y[16]_i_6_n_0 ,\Y[16]_i_7_n_0 ,\Y[16]_i_8_n_0 ,\Y[16]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[20]_i_1 
       (.CI(\Y_reg[16]_i_1_n_0 ),
        .CO({\Y_reg[20]_i_1_n_0 ,\NLW_Y_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\Y[20]_i_2_n_0 ,\Y[20]_i_3_n_0 ,\Y[20]_i_4_n_0 ,\Y[20]_i_5_n_0 }),
        .O(D[11:8]),
        .S({\Y[20]_i_6_n_0 ,\Y[20]_i_7_n_0 ,\Y[20]_i_8_n_0 ,\Y[20]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[24]_i_1 
       (.CI(\Y_reg[20]_i_1_n_0 ),
        .CO({\Y_reg[24]_i_1_n_0 ,\NLW_Y_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({p_0_out__0[23:21],\Y[24]_i_5_n_0 }),
        .O(D[15:12]),
        .S({\Y[24]_i_6_n_0 ,\Y[24]_i_7_n_0 ,\Y[24]_i_8_n_0 ,\Y[24]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[28]_i_1 
       (.CI(\Y_reg[24]_i_1_n_0 ),
        .CO({\Y_reg[28]_i_1_n_0 ,\NLW_Y_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(p_0_out__0[27:24]),
        .O(D[19:16]),
        .S({\Y[28]_i_6_n_0 ,\Y[28]_i_7_n_0 ,\Y[28]_i_8_n_0 ,\Y[28]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_2 
       (.CI(\Y_reg[28]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,p_0_out__0[29:28]}),
        .O(D[22:20]),
        .S({\<const0> ,\Y[31]_i_5_n_0 ,\Y[31]_i_6_n_0 ,\Y[31]_i_7_n_0 }));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_2 
       (.I0(product[16]),
        .I1(s1),
        .I2(acc_reg[7]),
        .O(\acc[13]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_3 
       (.I0(product[15]),
        .I1(s1),
        .I2(acc_reg[6]),
        .O(\acc[13]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_4 
       (.I0(product[14]),
        .I1(s1),
        .I2(acc_reg[5]),
        .O(\acc[13]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_5 
       (.I0(product[13]),
        .I1(s1),
        .I2(acc_reg[4]),
        .O(\acc[13]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[17]_i_2 
       (.I0(acc_reg[11]),
        .I1(s1),
        .O(p_0_out[20]));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[17]_i_3 
       (.I0(product[19]),
        .I1(s1),
        .I2(acc_reg[10]),
        .O(\acc[17]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[17]_i_4 
       (.I0(product[18]),
        .I1(s1),
        .I2(acc_reg[9]),
        .O(\acc[17]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[17]_i_5 
       (.I0(product[17]),
        .I1(s1),
        .I2(acc_reg[8]),
        .O(\acc[17]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_2 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(\acc[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_3 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(\acc[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_4 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(\acc[21]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_5 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(\acc[21]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_2 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(\acc[25]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_3 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(\acc[25]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_4 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(\acc[25]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_5 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(\acc[25]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_2 
       (.I0(acc_reg[22]),
        .I1(s1),
        .O(p_0_out[31]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_3 
       (.I0(acc_reg[21]),
        .I1(s1),
        .O(p_0_out[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_4 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(\acc[29]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_2 
       (.I0(product[12]),
        .I1(s1),
        .I2(acc_reg[3]),
        .O(\acc[9]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_3 
       (.I0(product[11]),
        .I1(s1),
        .I2(acc_reg[2]),
        .O(\acc[9]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_4 
       (.I0(product[10]),
        .I1(s1),
        .I2(acc_reg[1]),
        .O(\acc[9]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD2)) 
    \acc[9]_i_5 
       (.I0(acc_reg[0]),
        .I1(s1),
        .I2(product[9]),
        .O(\acc[9]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[13]_i_1 
       (.CI(\acc_reg[9]_i_1_n_0 ),
        .CO({\acc_reg[13]_i_1_n_0 ,\NLW_acc_reg[13]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[16:13]),
        .O(c95_0),
        .S({\acc[13]_i_2_n_0 ,\acc[13]_i_3_n_0 ,\acc[13]_i_4_n_0 ,\acc[13]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[17]_i_1 
       (.CI(\acc_reg[13]_i_1_n_0 ),
        .CO({\acc_reg[17]_i_1_n_0 ,\NLW_acc_reg[17]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,product[19:17]}),
        .O(c102_0),
        .S({p_0_out[20],\acc[17]_i_3_n_0 ,\acc[17]_i_4_n_0 ,\acc[17]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[21]_i_1 
       (.CI(\acc_reg[17]_i_1_n_0 ),
        .CO({\acc_reg[21]_i_1_n_0 ,\NLW_acc_reg[21]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(c102_1),
        .S({\acc[21]_i_2_n_0 ,\acc[21]_i_3_n_0 ,\acc[21]_i_4_n_0 ,\acc[21]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[25]_i_1 
       (.CI(\acc_reg[21]_i_1_n_0 ),
        .CO({\acc_reg[25]_i_1_n_0 ,\NLW_acc_reg[25]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\acc_reg[28] ),
        .S({\acc[25]_i_2_n_0 ,\acc[25]_i_3_n_0 ,\acc[25]_i_4_n_0 ,\acc[25]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[29]_i_1 
       (.CI(\acc_reg[25]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\acc_reg[31] ),
        .S({\<const0> ,p_0_out[31:30],\acc[29]_i_4_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[9]_i_1 
       (.CI(\<const0> ),
        .CO({\acc_reg[9]_i_1_n_0 ,\NLW_acc_reg[9]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[12:9]),
        .O(O),
        .S({\acc[9]_i_2_n_0 ,\acc[9]_i_3_n_0 ,\acc[9]_i_4_n_0 ,\acc[9]_i_5_n_0 }));
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
        .D(v[212]),
        .Q(product[17]),
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
        .D(v[213]),
        .Q(product[18]),
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
        .D(v[214]),
        .Q(product[19]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v[195]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v[170]}),
        .O(v[214:212]),
        .S({\<const0> ,v[220],v[221],v[169]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v[203]),
        .CO({v[144],NLW_c104_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[160],v[161],v[162]}),
        .O({v[100],v[92],v[95]}),
        .S({\<const1> ,v[163],v[164],v[165]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c105
       (.CI(v[226]),
        .CO({v[179],NLW_c105_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[176],v[156]}),
        .S({\<const0> ,\<const1> ,v[167],v[168]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c106
       (.CI(v[232]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[175],v[177]}),
        .O({v[220],v[221],v[170]}),
        .S({\<const0> ,v[178],v[180],v[181]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c107
       (.CI(v[207]),
        .CO(v[226:223]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[149],v[151],v[153],v[115]}),
        .S({v[171],v[172],v[173],v[174]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c108
       (.CI(v[199]),
        .CO(v[232:229]),
        .CYINIT(\<const0> ),
        .DI({v[148],v[150],v[152],v[154]}),
        .O({v[143],v[99],v[91],v[94]}),
        .S({v[155],v[157],v[158],v[159]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669696969696996)) 
    c11
       (.I0(v[75]),
        .I1(v[76]),
        .I2(v[77]),
        .I3(v[50]),
        .I4(v[65]),
        .I5(v[66]),
        .O(v[74]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c112
       (.C(clk),
        .CE(\<const1> ),
        .D(v[190]),
        .Q(product[9]),
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
        .D(A[0]),
        .Q(v[113]),
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
        .D(A[1]),
        .Q(v[109]),
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
        .D(A[2]),
        .Q(v[105]),
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
        .D(A[3]),
        .Q(v[110]),
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
        .D(A[4]),
        .Q(v[106]),
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
        .D(A[5]),
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
        .D(A[6]),
        .Q(v[122]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696966996696969)) 
    c12
       (.I0(v[50]),
        .I1(v[66]),
        .I2(v[65]),
        .I3(v[70]),
        .I4(v[69]),
        .I5(v[57]),
        .O(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
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
    c121
       (.C(clk),
        .CE(\<const1> ),
        .D(A[8]),
        .Q(v[60]),
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
        .D(A[9]),
        .Q(v[54]),
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
        .D(B[0]),
        .Q(v[136]),
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
        .D(B[1]),
        .Q(v[58]),
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
        .D(B[2]),
        .Q(v[55]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c13
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
    c130
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
    c131
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[53]),
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
        .D(B[5]),
        .Q(v[121]),
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
        .D(B[6]),
        .Q(v[120]),
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
        .D(B[7]),
        .Q(v[103]),
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
        .D(B[8]),
        .Q(v[138]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c136
       (.C(clk),
        .CE(\<const1> ),
        .D(B[9]),
        .Q(v[104]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669699669966996)) 
    c14
       (.I0(v[73]),
        .I1(v[72]),
        .I2(v[63]),
        .I3(v[61]),
        .I4(v[59]),
        .I5(v[53]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c15
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
    c16
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
    c17
       (.I0(v[77]),
        .I1(v[75]),
        .I2(v[76]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAAA9999555)) 
    c18
       (.I0(v[85]),
        .I1(v[86]),
        .I2(v[87]),
        .I3(v[62]),
        .I4(v[56]),
        .I5(v[88]),
        .O(v[77]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFF808000)) 
    c19
       (.I0(v[53]),
        .I1(v[54]),
        .I2(v[90]),
        .I3(v[91]),
        .I4(v[92]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    c2
       (.I0(v[51]),
        .I1(v[52]),
        .I2(v[53]),
        .I3(v[54]),
        .I4(v[55]),
        .I5(v[56]),
        .O(v[50]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFF6A6A00)) 
    c20
       (.I0(v[90]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[94]),
        .I4(v[95]),
        .O(v[93]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96666666)) 
    c21
       (.I0(v[91]),
        .I1(v[92]),
        .I2(v[53]),
        .I3(v[54]),
        .I4(v[90]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c22
       (.I0(v[94]),
        .I1(v[95]),
        .I2(v[90]),
        .I3(v[53]),
        .I4(v[54]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    c23
       (.I0(v[92]),
        .I1(v[91]),
        .I2(v[81]),
        .I3(v[99]),
        .I4(v[100]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c24
       (.I0(v[86]),
        .I1(v[87]),
        .I2(v[62]),
        .I3(v[56]),
        .O(v[82]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c25
       (.I0(v[102]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[105]),
        .I4(v[106]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c26
       (.I0(v[108]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[109]),
        .I4(v[110]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE8A08800)) 
    c27
       (.I0(v[112]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[105]),
        .I4(v[113]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c28
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
    c29
       (.I0(v[107]),
        .I1(v[104]),
        .I2(v[105]),
        .I3(v[102]),
        .I4(v[103]),
        .I5(v[106]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFF135F8000ECA0)) 
    c3
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .I3(v[53]),
        .I4(v[61]),
        .I5(v[62]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c30
       (.I0(v[111]),
        .I1(v[104]),
        .I2(v[109]),
        .I3(v[108]),
        .I4(v[103]),
        .I5(v[110]),
        .O(v[117]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c31
       (.I0(v[103]),
        .I1(v[105]),
        .I2(v[112]),
        .I3(v[113]),
        .I4(v[104]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c32
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
    c33
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
    c34
       (.I0(v[81]),
        .I1(v[92]),
        .I2(v[91]),
        .I3(v[95]),
        .I4(v[94]),
        .I5(v[83]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c35
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
    c36
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
    c37
       (.I0(v[124]),
        .I1(v[59]),
        .I2(v[120]),
        .I3(v[130]),
        .I4(v[123]),
        .I5(v[60]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c38
       (.I0(v[126]),
        .I1(v[59]),
        .I2(v[121]),
        .I3(v[132]),
        .I4(v[123]),
        .I5(v[52]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c39
       (.I0(v[123]),
        .I1(v[122]),
        .I2(v[110]),
        .I3(v[120]),
        .I4(v[106]),
        .I5(v[121]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c4
       (.I0(v[60]),
        .I1(v[58]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c40
       (.I0(v[54]),
        .I1(v[53]),
        .I2(v[55]),
        .I3(v[52]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c41
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[86]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c42
       (.I0(v[55]),
        .I1(v[52]),
        .I2(v[53]),
        .I3(v[60]),
        .I4(v[59]),
        .I5(v[58]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c43
       (.I0(v[53]),
        .I1(v[122]),
        .I2(v[58]),
        .I3(v[54]),
        .I4(v[60]),
        .I5(v[55]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c44
       (.I0(v[55]),
        .I1(v[60]),
        .I2(v[58]),
        .I3(v[54]),
        .I4(v[122]),
        .I5(v[53]),
        .O(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c45
       (.I0(v[83]),
        .I1(v[95]),
        .I2(v[94]),
        .I3(v[84]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v[53]),
        .I1(v[60]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA80FFFF0000EA80)) 
    c47
       (.I0(v[56]),
        .I1(v[62]),
        .I2(v[87]),
        .I3(v[86]),
        .I4(v[88]),
        .I5(v[85]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c48
       (.I0(v[121]),
        .I1(v[52]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c49
       (.I0(v[121]),
        .I1(v[122]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[52]),
        .I1(v[55]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c50
       (.I0(v[106]),
        .I1(v[120]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c51
       (.I0(v[54]),
        .I1(v[136]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c52
       (.I0(v[110]),
        .I1(v[138]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c53
       (.I0(v[105]),
        .I1(v[138]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c54
       (.I0(v[136]),
        .I1(v[54]),
        .I2(v[138]),
        .I3(v[109]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c55
       (.I0(v[75]),
        .I1(v[76]),
        .I2(v[77]),
        .I3(v[66]),
        .I4(v[65]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    c56
       (.I0(v[100]),
        .I1(v[99]),
        .I2(v[89]),
        .I3(v[143]),
        .I4(v[144]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c57
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
    c58
       (.I0(v[84]),
        .I1(v[96]),
        .I2(v[83]),
        .I3(v[94]),
        .I4(v[95]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE10F0F1E0F1E1EF0)) 
    c59
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[97]),
        .I3(v[77]),
        .I4(v[75]),
        .I5(v[76]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFF135FFFFFFFFF)) 
    c6
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .I3(v[53]),
        .I4(v[61]),
        .I5(v[62]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c60
       (.I0(v[149]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[122]),
        .I4(v[60]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c61
       (.I0(v[151]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[59]),
        .I4(v[52]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c62
       (.I0(v[153]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[106]),
        .I4(v[122]),
        .O(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c63
       (.I0(v[115]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[110]),
        .I4(v[59]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c64
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
    c65
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
    c66
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
    c67
       (.I0(v[154]),
        .I1(v[106]),
        .I2(v[104]),
        .I3(v[153]),
        .I4(v[103]),
        .I5(v[122]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c68
       (.I0(v[54]),
        .I1(v[121]),
        .I2(v[60]),
        .I3(v[120]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c69
       (.I0(v[60]),
        .I1(v[120]),
        .I2(v[52]),
        .I3(v[121]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h90)) 
    c7
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[50]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c70
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
    c71
       (.I0(v[60]),
        .I1(v[121]),
        .I2(v[120]),
        .I3(v[54]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c72
       (.I0(v[52]),
        .I1(v[120]),
        .I2(v[60]),
        .I3(v[121]),
        .I4(v[54]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDABFB0402540B040)) 
    c73
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
    c74
       (.I0(v[54]),
        .I1(v[138]),
        .O(v[167]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c75
       (.I0(v[60]),
        .I1(v[138]),
        .O(v[168]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c76
       (.I0(v[123]),
        .I1(v[54]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h78)) 
    c77
       (.I0(v[144]),
        .I1(v[143]),
        .I2(v[170]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c78
       (.I0(v[52]),
        .I1(v[138]),
        .O(v[171]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c79
       (.I0(v[122]),
        .I1(v[138]),
        .O(v[172]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c8
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[50]),
        .O(v[67]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c80
       (.I0(v[59]),
        .I1(v[138]),
        .O(v[173]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c81
       (.I0(v[106]),
        .I1(v[138]),
        .O(v[174]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c82
       (.I0(v[176]),
        .I1(v[60]),
        .I2(v[104]),
        .O(v[175]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c83
       (.I0(v[156]),
        .I1(v[103]),
        .I2(v[104]),
        .I3(v[52]),
        .I4(v[54]),
        .O(v[177]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c84
       (.I0(v[179]),
        .I1(v[54]),
        .I2(v[104]),
        .O(v[178]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87F078F0)) 
    c85
       (.I0(v[60]),
        .I1(v[176]),
        .I2(v[179]),
        .I3(v[104]),
        .I4(v[54]),
        .O(v[180]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c86
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
    c88
       (.C(clk),
        .CE(\<const1> ),
        .D(v[183]),
        .Q(product[10]),
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
        .D(v[184]),
        .Q(product[11]),
        .R(\<const0> ));
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
        .D(v[185]),
        .Q(product[12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(\<const0> ),
        .CO({v[186],NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[64],v[67],v[68],v[71]}),
        .O({v[185:183],v[190]}),
        .S({v[74],v[78],v[79],v[80]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(\<const1> ),
        .D(v[191]),
        .Q(product[13]),
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
        .D(v[192]),
        .Q(product[14]),
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
        .D(v[193]),
        .Q(product[15]),
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
        .D(v[194]),
        .Q(product[16]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(v[186]),
        .CO({v[195],NLW_c96_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[98],v[125],v[134],v[141]}),
        .O(v[194:191]),
        .S({v[142],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c97
       (.CI(\<const0> ),
        .CO(v[199:196]),
        .CYINIT(\<const0> ),
        .DI({v[101],v[107],v[111],\<const0> }),
        .O({v[75],v[66],v[69],v[73]}),
        .S({v[114],v[116],v[117],v[118]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c98
       (.CI(\<const0> ),
        .CO(v[203:200]),
        .CYINIT(\<const0> ),
        .DI({v[119],v[124],v[126],\<const0> }),
        .O({v[76],v[65],v[70],v[72]}),
        .S({v[127],v[129],v[131],v[133]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(\<const0> ),
        .CO(v[207:204]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[135],\<const0> }),
        .O({v[102],v[108],v[112],NLW_c99_O_UNCONNECTED[0]}),
        .S({v[137],v[139],v[140],\<const0> }));
endmodule
