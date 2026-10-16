// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:09:15 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/integration/r19_dot16_mac8_add8_b256_column_state_window/routed.v
// Design      : r19_dot16_mac8_add8_b256_column_state_window
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "6827fb13" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.089819\",\n      \"Worst Negative Slack (WNS)\": \"6.533041\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"103\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"103\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"88\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"3 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.820000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"22.075000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_dot16_mac8_add8_b256_column_state_window
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
  wire [31:5]\^Y ;
  wire \Y[31]_i_1_n_0 ;
  wire [31:5]acc0;
  wire [31:5]acc_reg;
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
  wire core_n_23;
  wire core_n_24;
  wire core_n_25;
  wire core_n_26;
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

  assign Y[31:5] = \^Y [31:5];
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
    \Y_reg[5] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[5]),
        .Q(\^Y [5]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[6] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[6]),
        .Q(\^Y [6]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[7] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[7]),
        .Q(\^Y [7]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \Y_reg[8] 
       (.C(clk),
        .CE(\Y[31]_i_1_n_0 ),
        .D(acc0[8]),
        .Q(\^Y [8]),
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
        .D(core_n_6),
        .Q(acc_reg[10]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[11] 
       (.C(clk),
        .CE(v1),
        .D(core_n_5),
        .Q(acc_reg[11]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[12] 
       (.C(clk),
        .CE(v1),
        .D(core_n_4),
        .Q(acc_reg[12]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[13] 
       (.C(clk),
        .CE(v1),
        .D(core_n_11),
        .Q(acc_reg[13]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[14] 
       (.C(clk),
        .CE(v1),
        .D(core_n_10),
        .Q(acc_reg[14]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[15] 
       (.C(clk),
        .CE(v1),
        .D(core_n_9),
        .Q(acc_reg[15]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[16] 
       (.C(clk),
        .CE(v1),
        .D(core_n_8),
        .Q(acc_reg[16]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[17] 
       (.C(clk),
        .CE(v1),
        .D(core_n_15),
        .Q(acc_reg[17]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[18] 
       (.C(clk),
        .CE(v1),
        .D(core_n_14),
        .Q(acc_reg[18]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[19] 
       (.C(clk),
        .CE(v1),
        .D(core_n_13),
        .Q(acc_reg[19]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[20] 
       (.C(clk),
        .CE(v1),
        .D(core_n_12),
        .Q(acc_reg[20]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[21] 
       (.C(clk),
        .CE(v1),
        .D(core_n_19),
        .Q(acc_reg[21]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[22] 
       (.C(clk),
        .CE(v1),
        .D(core_n_18),
        .Q(acc_reg[22]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[23] 
       (.C(clk),
        .CE(v1),
        .D(core_n_17),
        .Q(acc_reg[23]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[24] 
       (.C(clk),
        .CE(v1),
        .D(core_n_16),
        .Q(acc_reg[24]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[25] 
       (.C(clk),
        .CE(v1),
        .D(core_n_23),
        .Q(acc_reg[25]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[26] 
       (.C(clk),
        .CE(v1),
        .D(core_n_22),
        .Q(acc_reg[26]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[27] 
       (.C(clk),
        .CE(v1),
        .D(core_n_21),
        .Q(acc_reg[27]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[28] 
       (.C(clk),
        .CE(v1),
        .D(core_n_20),
        .Q(acc_reg[28]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[29] 
       (.C(clk),
        .CE(v1),
        .D(core_n_26),
        .Q(acc_reg[29]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[30] 
       (.C(clk),
        .CE(v1),
        .D(core_n_25),
        .Q(acc_reg[30]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[31] 
       (.C(clk),
        .CE(v1),
        .D(core_n_24),
        .Q(acc_reg[31]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[5] 
       (.C(clk),
        .CE(v1),
        .D(core_n_3),
        .Q(acc_reg[5]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[6] 
       (.C(clk),
        .CE(v1),
        .D(core_n_2),
        .Q(acc_reg[6]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[7] 
       (.C(clk),
        .CE(v1),
        .D(core_n_1),
        .Q(acc_reg[7]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[8] 
       (.C(clk),
        .CE(v1),
        .D(core_n_0),
        .Q(acc_reg[8]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[9] 
       (.C(clk),
        .CE(v1),
        .D(core_n_7),
        .Q(acc_reg[9]),
        .R(reset));
  r19_mac8_add8_b256_column_state_window core
       (.A(A[7:0]),
        .B(B[7:0]),
        .D(acc0),
        .O({core_n_0,core_n_1,core_n_2,core_n_3}),
        .acc_reg(acc_reg),
        .\acc_reg[24] ({core_n_16,core_n_17,core_n_18,core_n_19}),
        .\acc_reg[28] ({core_n_20,core_n_21,core_n_22,core_n_23}),
        .\acc_reg[31] ({core_n_24,core_n_25,core_n_26}),
        .c71_0({core_n_4,core_n_5,core_n_6,core_n_7}),
        .c78_0({core_n_8,core_n_9,core_n_10,core_n_11}),
        .c78_1({core_n_12,core_n_13,core_n_14,core_n_15}),
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

module r19_mac8_add8_b256_column_state_window
   (O,
    c71_0,
    c78_0,
    c78_1,
    \acc_reg[24] ,
    \acc_reg[28] ,
    \acc_reg[31] ,
    D,
    s1,
    acc_reg,
    clk,
    A,
    B);
  output [3:0]O;
  output [3:0]c71_0;
  output [3:0]c78_0;
  output [3:0]c78_1;
  output [3:0]\acc_reg[24] ;
  output [3:0]\acc_reg[28] ;
  output [2:0]\acc_reg[31] ;
  output [26:0]D;
  input s1;
  input [26:0]acc_reg;
  input clk;
  input [7:0]A;
  input [7:0]B;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]A;
  wire [7:0]B;
  wire [26:0]D;
  wire [3:0]O;
  wire \Y[12]_i_2_n_0 ;
  wire \Y[12]_i_3_n_0 ;
  wire \Y[12]_i_4_n_0 ;
  wire \Y[12]_i_5_n_0 ;
  wire \Y[16]_i_3_n_0 ;
  wire \Y[16]_i_4_n_0 ;
  wire \Y[16]_i_5_n_0 ;
  wire \Y[20]_i_5_n_0 ;
  wire \Y[20]_i_6_n_0 ;
  wire \Y[20]_i_7_n_0 ;
  wire \Y[20]_i_8_n_0 ;
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
  wire \Y[8]_i_2_n_0 ;
  wire \Y[8]_i_3_n_0 ;
  wire \Y[8]_i_4_n_0 ;
  wire \Y[8]_i_5_n_0 ;
  wire \Y_reg[12]_i_1_n_0 ;
  wire \Y_reg[16]_i_1_n_0 ;
  wire \Y_reg[20]_i_1_n_0 ;
  wire \Y_reg[24]_i_1_n_0 ;
  wire \Y_reg[28]_i_1_n_0 ;
  wire \Y_reg[8]_i_1_n_0 ;
  wire \acc[13]_i_2_n_0 ;
  wire \acc[13]_i_3_n_0 ;
  wire \acc[13]_i_4_n_0 ;
  wire \acc[13]_i_5_n_0 ;
  wire \acc[17]_i_2_n_0 ;
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
  wire \acc[5]_i_2_n_0 ;
  wire \acc[5]_i_3_n_0 ;
  wire \acc[5]_i_4_n_0 ;
  wire \acc[5]_i_5_n_0 ;
  wire \acc[9]_i_2_n_0 ;
  wire \acc[9]_i_3_n_0 ;
  wire \acc[9]_i_4_n_0 ;
  wire \acc[9]_i_5_n_0 ;
  wire [26:0]acc_reg;
  wire \acc_reg[13]_i_1_n_0 ;
  wire \acc_reg[17]_i_1_n_0 ;
  wire \acc_reg[21]_i_1_n_0 ;
  wire [3:0]\acc_reg[24] ;
  wire \acc_reg[25]_i_1_n_0 ;
  wire [3:0]\acc_reg[28] ;
  wire [2:0]\acc_reg[31] ;
  wire \acc_reg[5]_i_1_n_0 ;
  wire \acc_reg[9]_i_1_n_0 ;
  wire [3:0]c71_0;
  wire [3:0]c78_0;
  wire [3:0]c78_1;
  wire clk;
  wire [31:30]p_0_out;
  wire [29:16]p_0_out__0;
  wire [15:5]product;
  wire s1;
  wire [201:51]v;
  wire [3:0]\NLW_Y_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[13]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[17]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[25]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[9]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_c73_CO_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;
  wire [3:0]NLW_c75_CO_UNCONNECTED;
  wire [3:0]NLW_c75_O_UNCONNECTED;
  wire [3:0]NLW_c76_CO_UNCONNECTED;
  wire [3:0]NLW_c76_O_UNCONNECTED;
  wire [3:0]NLW_c80_CO_UNCONNECTED;
  wire [3:0]NLW_c81_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(v[85]));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "RETARGET" *) 
  VCC VCC_1
       (.P(v[134]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  VCC VCC_2
       (.P(v[145]));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[12]_i_2 
       (.I0(s1),
        .I1(acc_reg[7]),
        .I2(product[12]),
        .O(\Y[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[12]_i_3 
       (.I0(s1),
        .I1(acc_reg[6]),
        .I2(product[11]),
        .O(\Y[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[12]_i_4 
       (.I0(s1),
        .I1(acc_reg[5]),
        .I2(product[10]),
        .O(\Y[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[12]_i_5 
       (.I0(s1),
        .I1(acc_reg[4]),
        .I2(product[9]),
        .O(\Y[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[16]_i_2 
       (.I0(acc_reg[11]),
        .I1(s1),
        .O(p_0_out__0[16]));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_3 
       (.I0(s1),
        .I1(acc_reg[10]),
        .I2(product[15]),
        .O(\Y[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_4 
       (.I0(s1),
        .I1(acc_reg[9]),
        .I2(product[14]),
        .O(\Y[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[16]_i_5 
       (.I0(s1),
        .I1(acc_reg[8]),
        .I2(product[13]),
        .O(\Y[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[20]_i_2 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(p_0_out__0[19]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[20]_i_3 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(p_0_out__0[18]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[20]_i_4 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(p_0_out__0[17]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[20]_i_5 
       (.I0(acc_reg[14]),
        .I1(s1),
        .I2(acc_reg[15]),
        .O(\Y[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[20]_i_6 
       (.I0(acc_reg[13]),
        .I1(s1),
        .I2(acc_reg[14]),
        .O(\Y[20]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[20]_i_7 
       (.I0(acc_reg[12]),
        .I1(s1),
        .I2(acc_reg[13]),
        .O(\Y[20]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[20]_i_8 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(\Y[20]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_2 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(p_0_out__0[23]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_3 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(p_0_out__0[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_4 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(p_0_out__0[21]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[24]_i_5 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(p_0_out__0[20]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_6 
       (.I0(acc_reg[18]),
        .I1(s1),
        .I2(acc_reg[19]),
        .O(\Y[24]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_7 
       (.I0(acc_reg[17]),
        .I1(s1),
        .I2(acc_reg[18]),
        .O(\Y[24]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_8 
       (.I0(acc_reg[16]),
        .I1(s1),
        .I2(acc_reg[17]),
        .O(\Y[24]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[24]_i_9 
       (.I0(acc_reg[15]),
        .I1(s1),
        .I2(acc_reg[16]),
        .O(\Y[24]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_2 
       (.I0(acc_reg[22]),
        .I1(s1),
        .O(p_0_out__0[27]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_3 
       (.I0(acc_reg[21]),
        .I1(s1),
        .O(p_0_out__0[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_4 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(p_0_out__0[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[28]_i_5 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(p_0_out__0[24]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_6 
       (.I0(acc_reg[22]),
        .I1(s1),
        .I2(acc_reg[23]),
        .O(\Y[28]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_7 
       (.I0(acc_reg[21]),
        .I1(s1),
        .I2(acc_reg[22]),
        .O(\Y[28]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_8 
       (.I0(acc_reg[20]),
        .I1(s1),
        .I2(acc_reg[21]),
        .O(\Y[28]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[28]_i_9 
       (.I0(acc_reg[19]),
        .I1(s1),
        .I2(acc_reg[20]),
        .O(\Y[28]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_3 
       (.I0(acc_reg[24]),
        .I1(s1),
        .O(p_0_out__0[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_4 
       (.I0(acc_reg[23]),
        .I1(s1),
        .O(p_0_out__0[28]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_5 
       (.I0(acc_reg[25]),
        .I1(s1),
        .I2(acc_reg[26]),
        .O(\Y[31]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_6 
       (.I0(acc_reg[24]),
        .I1(s1),
        .I2(acc_reg[25]),
        .O(\Y[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_7 
       (.I0(acc_reg[23]),
        .I1(s1),
        .I2(acc_reg[24]),
        .O(\Y[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[8]_i_2 
       (.I0(s1),
        .I1(acc_reg[3]),
        .I2(product[8]),
        .O(\Y[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[8]_i_3 
       (.I0(s1),
        .I1(acc_reg[2]),
        .I2(product[7]),
        .O(\Y[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[8]_i_4 
       (.I0(s1),
        .I1(acc_reg[1]),
        .I2(product[6]),
        .O(\Y[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[8]_i_5 
       (.I0(s1),
        .I1(acc_reg[0]),
        .I2(product[5]),
        .O(\Y[8]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[12]_i_1 
       (.CI(\Y_reg[8]_i_1_n_0 ),
        .CO({\Y_reg[12]_i_1_n_0 ,\NLW_Y_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[12:9]),
        .O(D[7:4]),
        .S({\Y[12]_i_2_n_0 ,\Y[12]_i_3_n_0 ,\Y[12]_i_4_n_0 ,\Y[12]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[16]_i_1 
       (.CI(\Y_reg[12]_i_1_n_0 ),
        .CO({\Y_reg[16]_i_1_n_0 ,\NLW_Y_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,product[15:13]}),
        .O(D[11:8]),
        .S({p_0_out__0[16],\Y[16]_i_3_n_0 ,\Y[16]_i_4_n_0 ,\Y[16]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[20]_i_1 
       (.CI(\Y_reg[16]_i_1_n_0 ),
        .CO({\Y_reg[20]_i_1_n_0 ,\NLW_Y_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({p_0_out__0[19:17],\<const1> }),
        .O(D[15:12]),
        .S({\Y[20]_i_5_n_0 ,\Y[20]_i_6_n_0 ,\Y[20]_i_7_n_0 ,\Y[20]_i_8_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[24]_i_1 
       (.CI(\Y_reg[20]_i_1_n_0 ),
        .CO({\Y_reg[24]_i_1_n_0 ,\NLW_Y_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(p_0_out__0[23:20]),
        .O(D[19:16]),
        .S({\Y[24]_i_6_n_0 ,\Y[24]_i_7_n_0 ,\Y[24]_i_8_n_0 ,\Y[24]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[28]_i_1 
       (.CI(\Y_reg[24]_i_1_n_0 ),
        .CO({\Y_reg[28]_i_1_n_0 ,\NLW_Y_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(p_0_out__0[27:24]),
        .O(D[23:20]),
        .S({\Y[28]_i_6_n_0 ,\Y[28]_i_7_n_0 ,\Y[28]_i_8_n_0 ,\Y[28]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_2 
       (.CI(\Y_reg[28]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,p_0_out__0[29:28]}),
        .O(D[26:24]),
        .S({\<const0> ,\Y[31]_i_5_n_0 ,\Y[31]_i_6_n_0 ,\Y[31]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[8]_i_1 
       (.CI(\<const0> ),
        .CO({\Y_reg[8]_i_1_n_0 ,\NLW_Y_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[8:5]),
        .O(D[3:0]),
        .S({\Y[8]_i_2_n_0 ,\Y[8]_i_3_n_0 ,\Y[8]_i_4_n_0 ,\Y[8]_i_5_n_0 }));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[13]_i_2 
       (.I0(acc_reg[11]),
        .I1(s1),
        .O(\acc[13]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_3 
       (.I0(product[15]),
        .I1(s1),
        .I2(acc_reg[10]),
        .O(\acc[13]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_4 
       (.I0(product[14]),
        .I1(s1),
        .I2(acc_reg[9]),
        .O(\acc[13]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[13]_i_5 
       (.I0(product[13]),
        .I1(s1),
        .I2(acc_reg[8]),
        .O(\acc[13]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[17]_i_2 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(\acc[17]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[17]_i_3 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(\acc[17]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[17]_i_4 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(\acc[17]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[17]_i_5 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(\acc[17]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_2 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(\acc[21]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_3 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(\acc[21]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_4 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(\acc[21]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[21]_i_5 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(\acc[21]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_2 
       (.I0(acc_reg[23]),
        .I1(s1),
        .O(\acc[25]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_3 
       (.I0(acc_reg[22]),
        .I1(s1),
        .O(\acc[25]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_4 
       (.I0(acc_reg[21]),
        .I1(s1),
        .O(\acc[25]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[25]_i_5 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(\acc[25]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_2 
       (.I0(acc_reg[26]),
        .I1(s1),
        .O(p_0_out[31]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_3 
       (.I0(acc_reg[25]),
        .I1(s1),
        .O(p_0_out[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[29]_i_4 
       (.I0(acc_reg[24]),
        .I1(s1),
        .O(\acc[29]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[5]_i_2 
       (.I0(product[8]),
        .I1(s1),
        .I2(acc_reg[3]),
        .O(\acc[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[5]_i_3 
       (.I0(product[7]),
        .I1(s1),
        .I2(acc_reg[2]),
        .O(\acc[5]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[5]_i_4 
       (.I0(product[6]),
        .I1(s1),
        .I2(acc_reg[1]),
        .O(\acc[5]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[5]_i_5 
       (.I0(product[5]),
        .I1(s1),
        .I2(acc_reg[0]),
        .O(\acc[5]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_2 
       (.I0(product[12]),
        .I1(s1),
        .I2(acc_reg[7]),
        .O(\acc[9]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_3 
       (.I0(product[11]),
        .I1(s1),
        .I2(acc_reg[6]),
        .O(\acc[9]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_4 
       (.I0(product[10]),
        .I1(s1),
        .I2(acc_reg[5]),
        .O(\acc[9]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[9]_i_5 
       (.I0(product[9]),
        .I1(s1),
        .I2(acc_reg[4]),
        .O(\acc[9]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[13]_i_1 
       (.CI(\acc_reg[9]_i_1_n_0 ),
        .CO({\acc_reg[13]_i_1_n_0 ,\NLW_acc_reg[13]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,product[15:13]}),
        .O(c78_0),
        .S({\acc[13]_i_2_n_0 ,\acc[13]_i_3_n_0 ,\acc[13]_i_4_n_0 ,\acc[13]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[17]_i_1 
       (.CI(\acc_reg[13]_i_1_n_0 ),
        .CO({\acc_reg[17]_i_1_n_0 ,\NLW_acc_reg[17]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(c78_1),
        .S({\acc[17]_i_2_n_0 ,\acc[17]_i_3_n_0 ,\acc[17]_i_4_n_0 ,\acc[17]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[21]_i_1 
       (.CI(\acc_reg[17]_i_1_n_0 ),
        .CO({\acc_reg[21]_i_1_n_0 ,\NLW_acc_reg[21]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\acc_reg[24] ),
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
        .S({\<const0> ,p_0_out,\acc[29]_i_4_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[5]_i_1 
       (.CI(\<const0> ),
        .CO({\acc_reg[5]_i_1_n_0 ,\NLW_acc_reg[5]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[8:5]),
        .O(O),
        .S({\acc[5]_i_2_n_0 ,\acc[5]_i_3_n_0 ,\acc[5]_i_4_n_0 ,\acc[5]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[9]_i_1 
       (.CI(\acc_reg[5]_i_1_n_0 ),
        .CO({\acc_reg[9]_i_1_n_0 ,\NLW_acc_reg[9]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[12:9]),
        .O(c71_0),
        .S({\acc[9]_i_2_n_0 ,\acc[9]_i_3_n_0 ,\acc[9]_i_4_n_0 ,\acc[9]_i_5_n_0 }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c10
       (.I0(v[55]),
        .I1(v[75]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(\<const1> ),
        .D(B[0]),
        .Q(v[84]),
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
        .D(B[1]),
        .Q(v[94]),
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
        .D(B[2]),
        .Q(v[56]),
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
        .D(B[3]),
        .Q(v[54]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    c11
       (.I0(v[72]),
        .I1(v[73]),
        .I2(v[65]),
        .I3(v[64]),
        .I4(v[70]),
        .I5(v[71]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(\<const1> ),
        .D(B[4]),
        .Q(v[75]),
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
        .D(B[5]),
        .Q(v[101]),
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
        .D(B[6]),
        .Q(v[98]),
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
        .D(B[7]),
        .Q(v[100]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c12
       (.I0(v[75]),
        .I1(v[82]),
        .I2(v[84]),
        .I3(v[53]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c14
       (.I0(v[89]),
        .I1(v[75]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    c15
       (.I0(v[53]),
        .I1(v[84]),
        .I2(v[82]),
        .I3(v[75]),
        .I4(v[91]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET PROPCONST" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c16
       (.I0(v[75]),
        .I1(v[82]),
        .I2(v[53]),
        .I3(v[84]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8778787800000000)) 
    c18
       (.I0(v[94]),
        .I1(v[55]),
        .I2(v[95]),
        .I3(v[89]),
        .I4(v[56]),
        .I5(v[73]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c19
       (.I0(v[56]),
        .I1(v[55]),
        .I2(v[89]),
        .I3(v[54]),
        .I4(v[53]),
        .I5(v[94]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c21
       (.I0(v[54]),
        .I1(v[91]),
        .I2(v[94]),
        .I3(v[55]),
        .I4(v[56]),
        .I5(v[89]),
        .O(v[65]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c22
       (.I0(v[98]),
        .I1(v[86]),
        .I2(v[99]),
        .I3(v[100]),
        .I4(v[82]),
        .I5(v[101]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c24
       (.I0(v[103]),
        .I1(v[98]),
        .O(v[104]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c26
       (.I0(v[103]),
        .I1(v[100]),
        .I2(v[86]),
        .I3(v[101]),
        .I4(v[98]),
        .I5(v[99]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c27
       (.I0(v[98]),
        .I1(v[103]),
        .I2(v[101]),
        .I3(v[99]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c28
       (.I0(v[54]),
        .I1(v[55]),
        .I2(v[56]),
        .I3(v[53]),
        .O(v[69]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c29
       (.I0(v[56]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[70]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c3
       (.I0(v[58]),
        .I1(v[59]),
        .I2(v[60]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c30
       (.I0(v[54]),
        .I1(v[89]),
        .I2(v[94]),
        .I3(v[53]),
        .I4(v[56]),
        .I5(v[55]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c33
       (.I0(v[91]),
        .I1(v[54]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    c34
       (.I0(v[68]),
        .I1(v[77]),
        .I2(v[67]),
        .I3(v[112]),
        .I4(v[113]),
        .I5(v[114]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    c35
       (.I0(v[76]),
        .I1(v[112]),
        .I2(v[113]),
        .I3(v[68]),
        .I4(v[77]),
        .I5(v[67]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    c36
       (.I0(v[96]),
        .I1(v[66]),
        .I2(v[79]),
        .I3(v[51]),
        .I4(v[78]),
        .O(v[116]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c39
       (.I0(v[100]),
        .I1(v[86]),
        .I2(v[101]),
        .I3(v[91]),
        .I4(v[98]),
        .I5(v[82]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v[60]),
        .I1(v[58]),
        .I2(v[59]),
        .O(v[61]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c40
       (.I0(v[100]),
        .I1(v[99]),
        .I2(v[101]),
        .I3(v[82]),
        .I4(v[98]),
        .I5(v[86]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c41
       (.I0(v[121]),
        .I1(v[101]),
        .I2(v[53]),
        .I3(v[122]),
        .I4(v[55]),
        .I5(v[98]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c42
       (.I0(v[124]),
        .I1(v[101]),
        .I2(v[55]),
        .I3(v[125]),
        .I4(v[89]),
        .I5(v[98]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c43
       (.I0(v[118]),
        .I1(v[101]),
        .I2(v[89]),
        .I3(v[127]),
        .I4(v[91]),
        .I5(v[98]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c44
       (.I0(v[119]),
        .I1(v[101]),
        .I2(v[91]),
        .I3(v[129]),
        .I4(v[82]),
        .I5(v[98]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c45
       (.I0(v[89]),
        .I1(v[100]),
        .O(v[122]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c46
       (.I0(v[91]),
        .I1(v[100]),
        .O(v[125]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c47
       (.I0(v[82]),
        .I1(v[100]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c48
       (.I0(v[86]),
        .I1(v[100]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c49
       (.I0(v[100]),
        .I1(v[55]),
        .I2(v[98]),
        .I3(v[53]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c5
       (.I0(v[63]),
        .I1(v[64]),
        .I2(v[65]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c50
       (.I0(v[100]),
        .I1(v[89]),
        .I2(v[101]),
        .I3(v[53]),
        .I4(v[98]),
        .I5(v[55]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c51
       (.I0(v[98]),
        .I1(v[55]),
        .I2(v[100]),
        .I3(v[53]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c52
       (.I0(v[101]),
        .I1(v[89]),
        .I2(v[55]),
        .I3(v[100]),
        .I4(v[53]),
        .I5(v[98]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c53
       (.I0(v[100]),
        .I1(v[91]),
        .I2(v[101]),
        .I3(v[55]),
        .I4(v[98]),
        .I5(v[89]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c54
       (.I0(v[100]),
        .I1(v[82]),
        .I2(v[101]),
        .I3(v[89]),
        .I4(v[98]),
        .I5(v[91]),
        .O(v[124]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c57
       (.I0(v[56]),
        .I1(v[91]),
        .I2(v[82]),
        .I3(v[54]),
        .I4(v[89]),
        .I5(v[94]),
        .O(v[138]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c58
       (.I0(v[89]),
        .I1(v[94]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c59
       (.I0(v[56]),
        .I1(v[89]),
        .I2(v[91]),
        .I3(v[54]),
        .I4(v[55]),
        .I5(v[94]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9999966696666666)) 
    c6
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[54]),
        .I3(v[53]),
        .I4(v[69]),
        .I5(v[52]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c60
       (.I0(v[62]),
        .I1(v[110]),
        .I2(v[109]),
        .I3(v[140]),
        .I4(v[136]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c62
       (.I0(v[140]),
        .I1(v[136]),
        .I2(v[142]),
        .O(v[143]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c63
       (.I0(v[146]),
        .I1(v[138]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT5 #(
    .INIT(32'h96969669)) 
    c66
       (.I0(v[142]),
        .I1(v[136]),
        .I2(v[140]),
        .I3(v[138]),
        .I4(v[146]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c67
       (.I0(v[146]),
        .I1(v[138]),
        .O(v[150]));
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
        .Q(product[10]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    c7
       (.I0(v[70]),
        .I1(v[71]),
        .I2(v[72]),
        .I3(v[73]),
        .I4(v[65]),
        .I5(v[64]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(v[153]),
        .Q(product[11]),
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
        .D(v[154]),
        .Q(product[12]),
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
        .D(v[155]),
        .Q(product[13]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c73
       (.CI(v[156]),
        .CO({v[157],NLW_c73_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[114],v[76],v[96],v[108]}),
        .O(v[155:152]),
        .S({v[111],v[115],v[116],v[117]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(v[161]),
        .CO({v[112],NLW_c74_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v[67],v[78]}),
        .S({\<const0> ,\<const1> ,v[74],v[80]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c75
       (.CI(\<const0> ),
        .CO(v[161:158]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[81],v[85],\<const0> }),
        .O({v[60],v[109],v[142],NLW_c75_O_UNCONNECTED[0]}),
        .S({v[88],v[90],v[92],v[145]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c76
       (.CI(\<const0> ),
        .CO(v[170:167]),
        .CYINIT(\<const0> ),
        .DI({v[97],v[102],v[104],\<const0> }),
        .O({v[110],v[140],v[146],NLW_c76_O_UNCONNECTED[0]}),
        .S({v[105],v[106],v[107],\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c77
       (.C(clk),
        .CE(\<const1> ),
        .D(v[175]),
        .Q(product[14]),
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
        .D(v[176]),
        .Q(product[15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c79
       (.CI(v[157]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(v[176:175]),
        .S({\<const0> ,\<const0> ,v[183],v[184]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c8
       (.I0(v[53]),
        .I1(v[75]),
        .O(v[74]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c80
       (.CI(v[185]),
        .CO(v[183:181]),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v[130],v[131]}),
        .O({v[184],v[114]}),
        .S({\<const0> ,\<const1> ,v[132],v[133]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c81
       (.CI(v[170]),
        .CO({v[185],NLW_c81_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[121],v[124],v[118],v[119]}),
        .O({v[113],v[68],v[79],v[58]}),
        .S({v[120],v[123],v[126],v[128]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c86
       (.C(clk),
        .CE(\<const1> ),
        .D(v[134]),
        .Q(product[5]),
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
        .D(v[198]),
        .Q(product[6]),
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
        .D(v[199]),
        .Q(product[7]),
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
        .D(v[200]),
        .Q(product[8]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c9
       (.I0(v[77]),
        .I1(v[68]),
        .I2(v[67]),
        .I3(v[78]),
        .I4(v[51]),
        .I5(v[79]),
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
        .D(v[201]),
        .Q(product[9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c91
       (.CI(\<const0> ),
        .CO({v[156],NLW_c91_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v[139],v[141],v[143],v[144]}),
        .O(v[201:198]),
        .S({v[147],v[148],v[149],v[150]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(\<const1> ),
        .D(A[0]),
        .Q(v[103]),
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
        .D(A[1]),
        .Q(v[99]),
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
        .D(A[2]),
        .Q(v[86]),
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
        .D(A[3]),
        .Q(v[82]),
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
        .D(A[4]),
        .Q(v[91]),
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
        .D(A[5]),
        .Q(v[89]),
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
        .D(A[6]),
        .Q(v[55]),
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
        .D(A[7]),
        .Q(v[53]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hAA6A6A6AC0808080)) 
    merge_1
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .I4(v[56]),
        .I5(\<const1> ),
        .O5(v[77]),
        .O6(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h5AF0AA006CCCCCCC)) 
    merge_2
       (.I0(v[86]),
        .I1(v[97]),
        .I2(v[100]),
        .I3(v[101]),
        .I4(v[103]),
        .I5(\<const1> ),
        .O5(v[105]),
        .O6(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h135F7FFFECA08000)) 
    merge_20
       (.I0(v[54]),
        .I1(v[56]),
        .I2(v[82]),
        .I3(v[91]),
        .I4(v[137]),
        .I5(v[72]),
        .O5(v[73]),
        .O6(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9669696969696996)) 
    merge_25
       (.I0(v[62]),
        .I1(v[109]),
        .I2(v[110]),
        .I3(v[136]),
        .I4(v[140]),
        .I5(v[142]),
        .O5(v[141]),
        .O6(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'hA880A880A995566A)) 
    merge_5
       (.I0(v[61]),
        .I1(v[62]),
        .I2(v[109]),
        .I3(v[110]),
        .I4(v[139]),
        .I5(\<const1> ),
        .O5(v[147]),
        .O6(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h8448844896696996)) 
    merge_6
       (.I0(v[51]),
        .I1(v[57]),
        .I2(v[78]),
        .I3(v[79]),
        .I4(v[108]),
        .I5(\<const1> ),
        .O5(v[117]),
        .O6(v[96]));
endmodule
