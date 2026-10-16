// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:14:40 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/integration/r19_dot16_mac10_add4_b4096_column_quadol_wce/routed.v
// Design      : r19_dot16_mac10_add4_b4096_column_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "1e14938d" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.201167\",\n      \"Worst Negative Slack (WNS)\": \"7.609650\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"131\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"131\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"84\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.720000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"19.442000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_dot16_mac10_add4_b4096_column_quadol_wce
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
  r19_mac10_add4_b4096_column_quadol_wce core
       (.A(A[9:0]),
        .B(B[9:0]),
        .D(acc0),
        .O({core_n_0,core_n_1,core_n_2,core_n_3}),
        .acc_reg(acc_reg),
        .\acc_reg[28] ({core_n_16,core_n_17,core_n_18,core_n_19}),
        .\acc_reg[31] ({core_n_20,core_n_21,core_n_22}),
        .c91_0({core_n_4,core_n_5,core_n_6,core_n_7}),
        .c98_0({core_n_8,core_n_9,core_n_10,core_n_11}),
        .c98_1({core_n_12,core_n_13,core_n_14,core_n_15}),
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

module r19_mac10_add4_b4096_column_quadol_wce
   (O,
    c91_0,
    c98_0,
    c98_1,
    \acc_reg[28] ,
    \acc_reg[31] ,
    D,
    clk,
    A,
    B,
    s1,
    acc_reg);
  output [3:0]O;
  output [3:0]c91_0;
  output [3:0]c98_0;
  output [3:0]c98_1;
  output [3:0]\acc_reg[28] ;
  output [2:0]\acc_reg[31] ;
  output [22:0]D;
  input clk;
  input [9:0]A;
  input [9:0]B;
  input s1;
  input [22:0]acc_reg;

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
  wire [3:0]c91_0;
  wire [3:0]c98_0;
  wire [3:0]c98_1;
  wire clk;
  wire [31:20]p_0_out;
  wire [29:21]p_0_out__0;
  wire [19:9]product;
  wire s1;
  wire v_100;
  wire v_101;
  wire v_102;
  wire v_103;
  wire v_104;
  wire v_105;
  wire v_106;
  wire v_108;
  wire v_109;
  wire v_110;
  wire v_111;
  wire v_112;
  wire v_113;
  wire v_114;
  wire v_115;
  wire v_116;
  wire v_118;
  wire v_119;
  wire v_120;
  wire v_121;
  wire v_122;
  wire v_123;
  wire v_124;
  wire v_125;
  wire v_127;
  wire v_128;
  wire v_129;
  wire v_130;
  wire v_131;
  wire v_132;
  wire v_134;
  wire v_135;
  wire v_136;
  wire v_137;
  wire v_138;
  wire v_139;
  wire v_140;
  wire v_141;
  wire v_142;
  wire v_143;
  wire v_144;
  wire v_145;
  wire v_146;
  wire v_147;
  wire v_148;
  wire v_149;
  wire v_150;
  wire v_151;
  wire v_152;
  wire v_153;
  wire v_154;
  wire v_155;
  wire v_156;
  wire v_157;
  wire v_158;
  wire v_159;
  wire v_160;
  wire v_161;
  wire v_162;
  wire v_163;
  wire v_164;
  wire v_165;
  wire v_166;
  wire v_167;
  wire v_168;
  wire v_169;
  wire v_170;
  wire v_171;
  wire v_172;
  wire v_173;
  wire v_174;
  wire v_175;
  wire v_176;
  wire v_177;
  wire v_178;
  wire v_179;
  wire v_180;
  wire v_181;
  wire v_183;
  wire v_184;
  wire v_185;
  wire v_186;
  wire v_190;
  wire v_191;
  wire v_192;
  wire v_193;
  wire v_194;
  wire v_195;
  wire v_199;
  wire v_203;
  wire v_207;
  wire v_212;
  wire v_213;
  wire v_214;
  wire v_220;
  wire v_221;
  wire v_226;
  wire v_232;
  wire v_247;
  wire v_249;
  wire v_250;
  wire v_252;
  wire v_253;
  wire v_254;
  wire v_50;
  wire v_51;
  wire v_52;
  wire v_53;
  wire v_54;
  wire v_55;
  wire v_56;
  wire v_57;
  wire v_58;
  wire v_59;
  wire v_60;
  wire v_61;
  wire v_62;
  wire v_63;
  wire v_64;
  wire v_65;
  wire v_66;
  wire v_67;
  wire v_68;
  wire v_69;
  wire v_70;
  wire v_71;
  wire v_72;
  wire v_73;
  wire v_74;
  wire v_75;
  wire v_76;
  wire v_77;
  wire v_78;
  wire v_79;
  wire v_80;
  wire v_81;
  wire v_82;
  wire v_83;
  wire v_84;
  wire v_85;
  wire v_86;
  wire v_87;
  wire v_88;
  wire v_89;
  wire v_90;
  wire v_91;
  wire v_92;
  wire v_93;
  wire v_94;
  wire v_95;
  wire v_96;
  wire v_97;
  wire v_98;
  wire v_99;
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
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:0]NLW_c101_CO_UNCONNECTED;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c87_CO_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c93_CO_UNCONNECTED;
  wire [3:0]NLW_c94_CO_UNCONNECTED;
  wire [3:0]NLW_c95_CO_UNCONNECTED;
  wire [3:0]NLW_c95_O_UNCONNECTED;

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
        .O(c91_0),
        .S({\acc[13]_i_2_n_0 ,\acc[13]_i_3_n_0 ,\acc[13]_i_4_n_0 ,\acc[13]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[17]_i_1 
       (.CI(\acc_reg[13]_i_1_n_0 ),
        .CO({\acc_reg[17]_i_1_n_0 ,\NLW_acc_reg[17]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,product[19:17]}),
        .O(c98_0),
        .S({p_0_out[20],\acc[17]_i_3_n_0 ,\acc[17]_i_4_n_0 ,\acc[17]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[21]_i_1 
       (.CI(\acc_reg[17]_i_1_n_0 ),
        .CO({\acc_reg[21]_i_1_n_0 ,\NLW_acc_reg[21]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(c98_1),
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
       (.I0(v_72),
        .I1(v_73),
        .O(v_71));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(v_203),
        .CO({v_144,NLW_c100_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v_160,v_161,v_162}),
        .O({v_100,v_92,v_95}),
        .S({\<const1> ,v_163,v_164,v_165}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v_226),
        .CO({v_179,NLW_c101_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_176,v_156}),
        .S({\<const0> ,\<const1> ,v_167,v_168}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v_232),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_175,v_177}),
        .O({v_220,v_221,v_170}),
        .S({\<const0> ,v_178,v_180,v_181}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v_207),
        .CO({v_226,NLW_c103_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_149,v_151,v_153,v_115}),
        .S({v_171,v_172,v_173,v_174}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v_199),
        .CO({v_232,NLW_c104_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_148,v_150,v_152,v_154}),
        .O({v_143,v_99,v_91,v_94}),
        .S({v_155,v_157,v_158,v_159}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c108
       (.C(clk),
        .CE(\<const1> ),
        .D(v_190),
        .Q(product[9]),
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
        .D(A[0]),
        .Q(v_113),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669696969696996)) 
    c11
       (.I0(v_75),
        .I1(v_76),
        .I2(v_77),
        .I3(v_50),
        .I4(v_65),
        .I5(v_66),
        .O(v_74));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(A[1]),
        .Q(v_109),
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
        .D(A[2]),
        .Q(v_105),
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
        .D(A[3]),
        .Q(v_110),
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
        .D(A[4]),
        .Q(v_106),
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
        .D(A[5]),
        .Q(v_59),
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
        .D(A[6]),
        .Q(v_122),
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
        .D(A[7]),
        .Q(v_52),
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
        .D(A[8]),
        .Q(v_60),
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
        .D(A[9]),
        .Q(v_54),
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
        .D(B[0]),
        .Q(v_136),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696966996696969)) 
    c12
       (.I0(v_50),
        .I1(v_66),
        .I2(v_65),
        .I3(v_70),
        .I4(v_69),
        .I5(v_57),
        .O(v_78));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c124
       (.C(clk),
        .CE(\<const1> ),
        .D(B[1]),
        .Q(v_58),
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
        .D(B[2]),
        .Q(v_55),
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
        .D(B[3]),
        .Q(v_123),
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
        .D(B[4]),
        .Q(v_53),
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
        .D(B[5]),
        .Q(v_121),
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
        .D(B[6]),
        .Q(v_120),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c13
       (.I0(v_70),
        .I1(v_69),
        .I2(v_57),
        .I3(v_72),
        .I4(v_73),
        .O(v_79));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(\<const1> ),
        .D(B[7]),
        .Q(v_103),
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
        .D(B[8]),
        .Q(v_138),
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
        .D(B[9]),
        .Q(v_104),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669699669966996)) 
    c14
       (.I0(v_73),
        .I1(v_72),
        .I2(v_63),
        .I3(v_61),
        .I4(v_59),
        .I5(v_53),
        .O(v_80));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c15
       (.I0(v_52),
        .I1(v_55),
        .I2(v_60),
        .I3(v_82),
        .I4(v_54),
        .I5(v_53),
        .O(v_81));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c16
       (.I0(v_52),
        .I1(v_55),
        .I2(v_54),
        .I3(v_60),
        .I4(v_53),
        .I5(v_82),
        .O(v_83));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c17
       (.I0(v_77),
        .I1(v_75),
        .I2(v_76),
        .O(v_84));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAAA9999555)) 
    c18
       (.I0(v_85),
        .I1(v_86),
        .I2(v_87),
        .I3(v_62),
        .I4(v_56),
        .I5(v_88),
        .O(v_77));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFF808000)) 
    c19
       (.I0(v_53),
        .I1(v_54),
        .I2(v_90),
        .I3(v_91),
        .I4(v_92),
        .O(v_89));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    c2
       (.I0(v_51),
        .I1(v_52),
        .I2(v_53),
        .I3(v_54),
        .I4(v_55),
        .I5(v_56),
        .O(v_50));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFF6A6A00)) 
    c20
       (.I0(v_90),
        .I1(v_53),
        .I2(v_54),
        .I3(v_94),
        .I4(v_95),
        .O(v_93));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96666666)) 
    c21
       (.I0(v_91),
        .I1(v_92),
        .I2(v_53),
        .I3(v_54),
        .I4(v_90),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h69969696)) 
    c22
       (.I0(v_94),
        .I1(v_95),
        .I2(v_90),
        .I3(v_53),
        .I4(v_54),
        .O(v_97));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    c23
       (.I0(v_92),
        .I1(v_91),
        .I2(v_81),
        .I3(v_99),
        .I4(v_100),
        .O(v_98));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c24
       (.I0(v_86),
        .I1(v_87),
        .I2(v_62),
        .I3(v_56),
        .O(v_82));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c25
       (.I0(v_102),
        .I1(v_103),
        .I2(v_104),
        .I3(v_105),
        .I4(v_106),
        .O(v_101));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE8A08800)) 
    c26
       (.I0(v_112),
        .I1(v_103),
        .I2(v_104),
        .I3(v_105),
        .I4(v_113),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c27
       (.I0(v_101),
        .I1(v_110),
        .I2(v_104),
        .I3(v_115),
        .I4(v_103),
        .I5(v_59),
        .O(v_114));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c28
       (.I0(v_250),
        .I1(v_104),
        .I2(v_105),
        .I3(v_102),
        .I4(v_103),
        .I5(v_106),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87787878)) 
    c29
       (.I0(v_103),
        .I1(v_105),
        .I2(v_112),
        .I3(v_113),
        .I4(v_104),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFF135F8000ECA0)) 
    c3
       (.I0(v_58),
        .I1(v_59),
        .I2(v_60),
        .I3(v_53),
        .I4(v_61),
        .I5(v_62),
        .O(v_57));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c30
       (.I0(v_59),
        .I1(v_120),
        .I2(v_121),
        .I3(v_122),
        .I4(v_123),
        .I5(v_60),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c31
       (.I0(v_120),
        .I1(v_106),
        .I2(v_121),
        .I3(v_52),
        .I4(v_59),
        .I5(v_123),
        .O(v_124));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c32
       (.I0(v_81),
        .I1(v_92),
        .I2(v_91),
        .I3(v_95),
        .I4(v_94),
        .I5(v_83),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c33
       (.I0(v_119),
        .I1(v_122),
        .I2(v_120),
        .I3(v_128),
        .I4(v_123),
        .I5(v_54),
        .O(v_127));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c34
       (.I0(v_124),
        .I1(v_59),
        .I2(v_120),
        .I3(v_130),
        .I4(v_123),
        .I5(v_60),
        .O(v_129));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c35
       (.I0(v_247),
        .I1(v_59),
        .I2(v_121),
        .I3(v_132),
        .I4(v_123),
        .I5(v_52),
        .O(v_131));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c36
       (.I0(v_54),
        .I1(v_53),
        .I2(v_55),
        .I3(v_52),
        .O(v_85));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c37
       (.I0(v_52),
        .I1(v_53),
        .I2(v_54),
        .I3(v_55),
        .O(v_86));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c38
       (.I0(v_55),
        .I1(v_52),
        .I2(v_53),
        .I3(v_60),
        .I4(v_59),
        .I5(v_58),
        .O(v_87));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c39
       (.I0(v_53),
        .I1(v_122),
        .I2(v_58),
        .I3(v_54),
        .I4(v_60),
        .I5(v_55),
        .O(v_62));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c4
       (.I0(v_60),
        .I1(v_58),
        .O(v_63));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c40
       (.I0(v_55),
        .I1(v_60),
        .I2(v_58),
        .I3(v_54),
        .I4(v_122),
        .I5(v_53),
        .O(v_56));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c41
       (.I0(v_83),
        .I1(v_95),
        .I2(v_94),
        .I3(v_84),
        .O(v_134));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c42
       (.I0(v_53),
        .I1(v_60),
        .O(v_88));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA80FFFF0000EA80)) 
    c43
       (.I0(v_56),
        .I1(v_62),
        .I2(v_87),
        .I3(v_86),
        .I4(v_88),
        .I5(v_85),
        .O(v_90));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c44
       (.I0(v_121),
        .I1(v_52),
        .O(v_128));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c45
       (.I0(v_121),
        .I1(v_122),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v_106),
        .I1(v_120),
        .O(v_132));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c47
       (.I0(v_54),
        .I1(v_136),
        .O(v_135));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c48
       (.I0(v_110),
        .I1(v_138),
        .O(v_137));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c49
       (.I0(v_105),
        .I1(v_138),
        .O(v_139));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v_52),
        .I1(v_55),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c50
       (.I0(v_136),
        .I1(v_54),
        .I2(v_138),
        .I3(v_109),
        .O(v_140));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c51
       (.I0(v_75),
        .I1(v_76),
        .I2(v_77),
        .I3(v_66),
        .I4(v_65),
        .O(v_141));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    c52
       (.I0(v_100),
        .I1(v_99),
        .I2(v_89),
        .I3(v_143),
        .I4(v_144),
        .O(v_142));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c53
       (.I0(v_93),
        .I1(v_81),
        .I2(v_91),
        .I3(v_92),
        .I4(v_100),
        .I5(v_99),
        .O(v_145));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c54
       (.I0(v_84),
        .I1(v_96),
        .I2(v_83),
        .I3(v_94),
        .I4(v_95),
        .O(v_146));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE10F0F1E0F1E1EF0)) 
    c55
       (.I0(v_65),
        .I1(v_66),
        .I2(v_97),
        .I3(v_77),
        .I4(v_75),
        .I5(v_76),
        .O(v_147));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c56
       (.I0(v_149),
        .I1(v_103),
        .I2(v_104),
        .I3(v_122),
        .I4(v_60),
        .O(v_148));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c57
       (.I0(v_151),
        .I1(v_103),
        .I2(v_104),
        .I3(v_59),
        .I4(v_52),
        .O(v_150));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c58
       (.I0(v_153),
        .I1(v_103),
        .I2(v_104),
        .I3(v_106),
        .I4(v_122),
        .O(v_152));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c59
       (.I0(v_115),
        .I1(v_103),
        .I2(v_104),
        .I3(v_110),
        .I4(v_59),
        .O(v_154));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7FFF135FFFFFFFFF)) 
    c6
       (.I0(v_58),
        .I1(v_59),
        .I2(v_60),
        .I3(v_53),
        .I4(v_61),
        .I5(v_62),
        .O(v_51));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c60
       (.I0(v_148),
        .I1(v_52),
        .I2(v_104),
        .I3(v_156),
        .I4(v_103),
        .I5(v_54),
        .O(v_155));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c61
       (.I0(v_150),
        .I1(v_122),
        .I2(v_104),
        .I3(v_149),
        .I4(v_103),
        .I5(v_60),
        .O(v_157));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c62
       (.I0(v_152),
        .I1(v_59),
        .I2(v_104),
        .I3(v_151),
        .I4(v_103),
        .I5(v_52),
        .O(v_158));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c63
       (.I0(v_154),
        .I1(v_106),
        .I2(v_104),
        .I3(v_153),
        .I4(v_103),
        .I5(v_122),
        .O(v_159));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c64
       (.I0(v_54),
        .I1(v_121),
        .I2(v_60),
        .I3(v_120),
        .O(v_160));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c65
       (.I0(v_60),
        .I1(v_120),
        .I2(v_52),
        .I3(v_121),
        .O(v_161));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c66
       (.I0(v_122),
        .I1(v_120),
        .I2(v_121),
        .I3(v_52),
        .I4(v_123),
        .I5(v_54),
        .O(v_162));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c67
       (.I0(v_60),
        .I1(v_121),
        .I2(v_120),
        .I3(v_54),
        .O(v_163));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c68
       (.I0(v_52),
        .I1(v_120),
        .I2(v_60),
        .I3(v_121),
        .I4(v_54),
        .O(v_164));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDABFB0402540B040)) 
    c69
       (.I0(v_166),
        .I1(v_122),
        .I2(v_120),
        .I3(v_52),
        .I4(v_121),
        .I5(v_60),
        .O(v_165));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h90)) 
    c7
       (.I0(v_65),
        .I1(v_66),
        .I2(v_50),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c70
       (.I0(v_54),
        .I1(v_138),
        .O(v_167));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c71
       (.I0(v_60),
        .I1(v_138),
        .O(v_168));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c72
       (.I0(v_123),
        .I1(v_54),
        .O(v_166));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h78)) 
    c73
       (.I0(v_144),
        .I1(v_143),
        .I2(v_170),
        .O(v_169));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c74
       (.I0(v_52),
        .I1(v_138),
        .O(v_171));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c75
       (.I0(v_122),
        .I1(v_138),
        .O(v_172));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c76
       (.I0(v_59),
        .I1(v_138),
        .O(v_173));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c77
       (.I0(v_106),
        .I1(v_138),
        .O(v_174));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c78
       (.I0(v_176),
        .I1(v_60),
        .I2(v_104),
        .O(v_175));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c79
       (.I0(v_156),
        .I1(v_103),
        .I2(v_104),
        .I3(v_52),
        .I4(v_54),
        .O(v_177));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c8
       (.I0(v_65),
        .I1(v_66),
        .I2(v_50),
        .O(v_67));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c80
       (.I0(v_179),
        .I1(v_54),
        .I2(v_104),
        .O(v_178));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87F078F0)) 
    c81
       (.I0(v_60),
        .I1(v_176),
        .I2(v_179),
        .I3(v_104),
        .I4(v_54),
        .O(v_180));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c82
       (.I0(v_177),
        .I1(v_176),
        .I2(v_104),
        .I3(v_60),
        .O(v_181));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c84
       (.C(clk),
        .CE(\<const1> ),
        .D(v_183),
        .Q(product[10]),
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
        .D(v_184),
        .Q(product[11]),
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
        .D(v_185),
        .Q(product[12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c87
       (.CI(\<const0> ),
        .CO({v_186,NLW_c87_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_64,v_67,v_68,v_71}),
        .O({v_185,v_184,v_183,v_190}),
        .S({v_74,v_78,v_79,v_80}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c88
       (.C(clk),
        .CE(\<const1> ),
        .D(v_191),
        .Q(product[13]),
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
        .D(v_192),
        .Q(product[14]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c9
       (.I0(v_57),
        .I1(v_69),
        .I2(v_70),
        .O(v_68));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(\<const1> ),
        .D(v_193),
        .Q(product[15]),
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
        .D(v_194),
        .Q(product[16]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c92
       (.CI(v_186),
        .CO({v_195,NLW_c92_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_98,v_125,v_134,v_141}),
        .O({v_194,v_193,v_192,v_191}),
        .S({v_142,v_145,v_146,v_147}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c93
       (.CI(\<const0> ),
        .CO({v_199,NLW_c93_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_101,v_250,v_111,\<const0> }),
        .O({v_75,v_66,v_69,v_73}),
        .S({v_114,v_116,v_252,v_118}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c94
       (.CI(\<const0> ),
        .CO({v_203,NLW_c94_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_119,v_124,v_247,\<const0> }),
        .O({v_76,v_65,v_70,v_72}),
        .S({v_127,v_129,v_131,v_249}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(\<const0> ),
        .CO({v_207,NLW_c95_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_135,\<const0> }),
        .O({v_102,v_108,v_112,NLW_c95_O_UNCONNECTED[0]}),
        .S({v_137,v_139,v_140,\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c96
       (.C(clk),
        .CE(\<const1> ),
        .D(v_212),
        .Q(product[17]),
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
        .D(v_213),
        .Q(product[18]),
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
        .D(v_214),
        .Q(product[19]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v_195),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,v_170}),
        .O({v_214,v_213,v_212}),
        .S({\<const0> ,v_220,v_221,v_169}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h87787788F8808800)) 
    direct_quadol_0
       (.I0(v_106),
        .I1(v_121),
        .I2(v_122),
        .I3(v_120),
        .I4(v_123),
        .I5(v_253),
        .O5(v_247),
        .O6(v_249));
  LUT1 #(
    .INIT(2'h1)) 
    direct_quadol_0_i_1
       (.I0(v_110),
        .O(v_253));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h87787878F8808080)) 
    direct_quadol_5
       (.I0(v_109),
        .I1(v_104),
        .I2(v_108),
        .I3(v_110),
        .I4(v_103),
        .I5(v_254),
        .O5(v_250),
        .O6(v_252));
  LUT1 #(
    .INIT(2'h1)) 
    direct_quadol_5_i_1
       (.I0(v_111),
        .O(v_254));
endmodule
