// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:08:06 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/integration/r19_dot16_mac8_add8_b256_column_quadol_wce/routed.v
// Design      : r19_dot16_mac8_add8_b256_column_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "f36e9454" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.169167\",\n      \"Worst Negative Slack (WNS)\": \"8.891409\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"110\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"110\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"88\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"3 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"2.002000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"21.504000 seconds\"\n      }\n    }\n  }\n}" *) 
module r19_dot16_mac8_add8_b256_column_quadol_wce
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
  r19_mac8_add8_b256_column_quadol_wce core
       (.A(A[7:0]),
        .B(B[7:0]),
        .D(acc0),
        .O({core_n_0,core_n_1,core_n_2,core_n_3}),
        .acc_reg(acc_reg),
        .\acc_reg[24] ({core_n_16,core_n_17,core_n_18,core_n_19}),
        .\acc_reg[28] ({core_n_20,core_n_21,core_n_22,core_n_23}),
        .\acc_reg[31] ({core_n_24,core_n_25,core_n_26}),
        .c69_0({core_n_4,core_n_5,core_n_6,core_n_7}),
        .c76_0({core_n_8,core_n_9,core_n_10,core_n_11}),
        .c76_1({core_n_12,core_n_13,core_n_14,core_n_15}),
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

module r19_mac8_add8_b256_column_quadol_wce
   (O,
    c69_0,
    c76_0,
    c76_1,
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
  output [3:0]c69_0;
  output [3:0]c76_0;
  output [3:0]c76_1;
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
  wire [3:0]c69_0;
  wire [3:0]c76_0;
  wire [3:0]c76_1;
  wire clk;
  wire [31:30]p_0_out;
  wire [29:16]p_0_out__0;
  wire [15:5]product;
  wire s1;
  wire v_100;
  wire v_101;
  wire v_102;
  wire v_103;
  wire v_104;
  wire v_105;
  wire v_106;
  wire v_107;
  wire v_108;
  wire v_109;
  wire v_110;
  wire v_111;
  wire v_112;
  wire v_113;
  wire v_114;
  wire v_115;
  wire v_116;
  wire v_117;
  wire v_118;
  wire v_119;
  wire v_120;
  wire v_121;
  wire v_122;
  wire v_123;
  wire v_124;
  wire v_125;
  wire v_126;
  wire v_127;
  wire v_128;
  wire v_129;
  wire v_130;
  wire v_131;
  wire v_132;
  wire v_133;
  wire v_134;
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
  wire v_152;
  wire v_153;
  wire v_154;
  wire v_155;
  wire v_156;
  wire v_157;
  wire v_161;
  wire v_170;
  wire v_175;
  wire v_176;
  wire v_183;
  wire v_184;
  wire v_185;
  wire v_198;
  wire v_199;
  wire v_200;
  wire v_201;
  wire v_205;
  wire v_207;
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
  wire v_82;
  wire v_84;
  wire v_85;
  wire v_86;
  wire v_88;
  wire v_89;
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
  wire [3:0]\NLW_Y_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[13]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[17]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[21]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[25]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[5]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[9]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_c71_CO_UNCONNECTED;
  wire [3:0]NLW_c72_CO_UNCONNECTED;
  wire [3:0]NLW_c73_CO_UNCONNECTED;
  wire [3:0]NLW_c74_CO_UNCONNECTED;
  wire [3:0]NLW_c74_O_UNCONNECTED;
  wire [3:0]NLW_c78_CO_UNCONNECTED;
  wire [3:0]NLW_c79_CO_UNCONNECTED;
  wire [3:0]NLW_c89_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "RETARGET" *) 
  VCC VCC_1
       (.P(v_134));
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
        .O(c76_0),
        .S({\acc[13]_i_2_n_0 ,\acc[13]_i_3_n_0 ,\acc[13]_i_4_n_0 ,\acc[13]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[17]_i_1 
       (.CI(\acc_reg[13]_i_1_n_0 ),
        .CO({\acc_reg[17]_i_1_n_0 ,\NLW_acc_reg[17]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(c76_1),
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
        .O(c69_0),
        .S({\acc[9]_i_2_n_0 ,\acc[9]_i_3_n_0 ,\acc[9]_i_4_n_0 ,\acc[9]_i_5_n_0 }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c10
       (.I0(v_55),
        .I1(v_75),
        .O(v_80));
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
        .Q(v_94),
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
        .Q(v_56),
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
        .Q(v_54),
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
        .Q(v_75),
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
        .Q(v_101),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    c11
       (.I0(v_72),
        .I1(v_73),
        .I2(v_65),
        .I3(v_64),
        .I4(v_70),
        .I5(v_71),
        .O(v_59));
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
        .Q(v_98),
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
        .Q(v_100),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c12
       (.I0(v_75),
        .I1(v_86),
        .I2(v_84),
        .I3(v_55),
        .O(v_85));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c13
       (.I0(v_89),
        .I1(v_75),
        .O(v_88));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'h956A6A6A)) 
    c14
       (.I0(v_85),
        .I1(v_75),
        .I2(v_82),
        .I3(v_53),
        .I4(v_84),
        .O(v_92));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c15
       (.I0(v_75),
        .I1(v_86),
        .I2(v_84),
        .I3(v_55),
        .O(v_93));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8778787800000000)) 
    c16
       (.I0(v_94),
        .I1(v_55),
        .I2(v_95),
        .I3(v_89),
        .I4(v_56),
        .I5(v_73),
        .O(v_63));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c17
       (.I0(v_56),
        .I1(v_55),
        .I2(v_89),
        .I3(v_54),
        .I4(v_53),
        .I5(v_94),
        .O(v_64));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c18
       (.I0(v_51),
        .I1(v_79),
        .I2(v_78),
        .I3(v_57),
        .O(v_96));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c19
       (.I0(v_54),
        .I1(v_91),
        .I2(v_94),
        .I3(v_55),
        .I4(v_56),
        .I5(v_89),
        .O(v_65));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hAA6A6A6A)) 
    c2
       (.I0(v_52),
        .I1(v_53),
        .I2(v_54),
        .I3(v_55),
        .I4(v_56),
        .O(v_51));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c20
       (.I0(v_98),
        .I1(v_86),
        .I2(v_99),
        .I3(v_100),
        .I4(v_82),
        .I5(v_101),
        .O(v_97));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c21
       (.I0(v_101),
        .I1(v_86),
        .I2(v_100),
        .I3(v_103),
        .O(v_102));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c22
       (.I0(v_103),
        .I1(v_98),
        .O(v_104));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    c23
       (.I0(v_97),
        .I1(v_86),
        .I2(v_101),
        .I3(v_103),
        .I4(v_100),
        .O(v_105));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c24
       (.I0(v_103),
        .I1(v_100),
        .I2(v_86),
        .I3(v_101),
        .I4(v_98),
        .I5(v_99),
        .O(v_106));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c25
       (.I0(v_98),
        .I1(v_103),
        .I2(v_101),
        .I3(v_99),
        .O(v_107));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c26
       (.I0(v_54),
        .I1(v_55),
        .I2(v_56),
        .I3(v_53),
        .O(v_69));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c27
       (.I0(v_56),
        .I1(v_53),
        .I2(v_54),
        .I3(v_55),
        .O(v_70));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c28
       (.I0(v_54),
        .I1(v_89),
        .I2(v_94),
        .I3(v_53),
        .I4(v_56),
        .I5(v_55),
        .O(v_71));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hA880)) 
    c29
       (.I0(v_61),
        .I1(v_109),
        .I2(v_62),
        .I3(v_110),
        .O(v_108));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c3
       (.I0(v_58),
        .I1(v_59),
        .I2(v_60),
        .O(v_57));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c30
       (.I0(v_54),
        .I1(v_82),
        .I2(v_94),
        .I3(v_89),
        .I4(v_56),
        .I5(v_91),
        .O(v_73));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c31
       (.I0(v_91),
        .I1(v_54),
        .O(v_95));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    c32
       (.I0(v_68),
        .I1(v_77),
        .I2(v_67),
        .I3(v_112),
        .I4(v_113),
        .I5(v_114),
        .O(v_111));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6969699669969696)) 
    c33
       (.I0(v_76),
        .I1(v_112),
        .I2(v_113),
        .I3(v_68),
        .I4(v_77),
        .I5(v_67),
        .O(v_115));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h99969666)) 
    c34
       (.I0(v_96),
        .I1(v_66),
        .I2(v_79),
        .I3(v_51),
        .I4(v_78),
        .O(v_116));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    c35
       (.I0(v_51),
        .I1(v_79),
        .I2(v_78),
        .I3(v_57),
        .I4(v_108),
        .O(v_117));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hAA008000)) 
    c36
       (.I0(v_53),
        .I1(v_56),
        .I2(v_55),
        .I3(v_54),
        .I4(v_52),
        .O(v_77));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c37
       (.I0(v_100),
        .I1(v_86),
        .I2(v_101),
        .I3(v_91),
        .I4(v_98),
        .I5(v_82),
        .O(v_118));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c38
       (.I0(v_100),
        .I1(v_99),
        .I2(v_101),
        .I3(v_82),
        .I4(v_98),
        .I5(v_86),
        .O(v_119));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c39
       (.I0(v_121),
        .I1(v_101),
        .I2(v_53),
        .I3(v_122),
        .I4(v_55),
        .I5(v_98),
        .O(v_120));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v_60),
        .I1(v_58),
        .I2(v_59),
        .O(v_61));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c40
       (.I0(v_124),
        .I1(v_101),
        .I2(v_55),
        .I3(v_125),
        .I4(v_89),
        .I5(v_98),
        .O(v_123));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c41
       (.I0(v_118),
        .I1(v_101),
        .I2(v_89),
        .I3(v_127),
        .I4(v_91),
        .I5(v_98),
        .O(v_126));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c42
       (.I0(v_119),
        .I1(v_101),
        .I2(v_91),
        .I3(v_129),
        .I4(v_82),
        .I5(v_98),
        .O(v_128));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c43
       (.I0(v_89),
        .I1(v_100),
        .O(v_122));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c44
       (.I0(v_91),
        .I1(v_100),
        .O(v_125));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c45
       (.I0(v_82),
        .I1(v_100),
        .O(v_127));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c46
       (.I0(v_86),
        .I1(v_100),
        .O(v_129));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c47
       (.I0(v_100),
        .I1(v_55),
        .I2(v_98),
        .I3(v_53),
        .O(v_130));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c48
       (.I0(v_100),
        .I1(v_89),
        .I2(v_101),
        .I3(v_53),
        .I4(v_98),
        .I5(v_55),
        .O(v_131));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c49
       (.I0(v_98),
        .I1(v_55),
        .I2(v_100),
        .I3(v_53),
        .O(v_132));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c5
       (.I0(v_63),
        .I1(v_64),
        .I2(v_65),
        .O(v_62));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE75F30007800F000)) 
    c50
       (.I0(v_101),
        .I1(v_89),
        .I2(v_55),
        .I3(v_100),
        .I4(v_53),
        .I5(v_98),
        .O(v_133));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c51
       (.I0(v_100),
        .I1(v_91),
        .I2(v_101),
        .I3(v_55),
        .I4(v_98),
        .I5(v_89),
        .O(v_121));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c52
       (.I0(v_100),
        .I1(v_82),
        .I2(v_101),
        .I3(v_89),
        .I4(v_98),
        .I5(v_91),
        .O(v_124));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h077F7F7FF8808080)) 
    c54
       (.I0(v_91),
        .I1(v_56),
        .I2(v_137),
        .I3(v_82),
        .I4(v_54),
        .I5(v_72),
        .O(v_136));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c55
       (.I0(v_56),
        .I1(v_91),
        .I2(v_82),
        .I3(v_54),
        .I4(v_89),
        .I5(v_94),
        .O(v_138));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c56
       (.I0(v_89),
        .I1(v_94),
        .O(v_137));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c57
       (.I0(v_56),
        .I1(v_89),
        .I2(v_91),
        .I3(v_54),
        .I4(v_55),
        .I5(v_94),
        .O(v_72));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96969600)) 
    c58
       (.I0(v_62),
        .I1(v_110),
        .I2(v_109),
        .I3(v_140),
        .I4(v_136),
        .O(v_139));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h82)) 
    c59
       (.I0(v_142),
        .I1(v_140),
        .I2(v_136),
        .O(v_141));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9999966696666666)) 
    c6
       (.I0(v_67),
        .I1(v_68),
        .I2(v_54),
        .I3(v_53),
        .I4(v_69),
        .I5(v_52),
        .O(v_66));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h69)) 
    c60
       (.I0(v_140),
        .I1(v_136),
        .I2(v_142),
        .O(v_143));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c61
       (.I0(v_145),
        .I1(v_146),
        .I2(v_138),
        .O(v_144));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hA995566A)) 
    c62
       (.I0(v_61),
        .I1(v_109),
        .I2(v_62),
        .I3(v_110),
        .I4(v_139),
        .O(v_147));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9669966996696996)) 
    c63
       (.I0(v_141),
        .I1(v_109),
        .I2(v_110),
        .I3(v_62),
        .I4(v_136),
        .I5(v_140),
        .O(v_148));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696966996696969)) 
    c64
       (.I0(v_142),
        .I1(v_136),
        .I2(v_140),
        .I3(v_145),
        .I4(v_138),
        .I5(v_146),
        .O(v_149));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c65
       (.I0(v_145),
        .I1(v_146),
        .I2(v_138),
        .O(v_150));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c67
       (.C(clk),
        .CE(\<const1> ),
        .D(v_152),
        .Q(product[10]),
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
        .D(v_153),
        .Q(product[11]),
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
        .D(v_154),
        .Q(product[12]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    c7
       (.I0(v_70),
        .I1(v_71),
        .I2(v_72),
        .I3(v_73),
        .I4(v_65),
        .I5(v_64),
        .O(v_52));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c70
       (.C(clk),
        .CE(\<const1> ),
        .D(v_155),
        .Q(product[13]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c71
       (.CI(v_156),
        .CO({v_157,NLW_c71_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_114,v_76,v_96,v_108}),
        .O({v_155,v_154,v_153,v_152}),
        .S({v_111,v_115,v_116,v_117}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c72
       (.CI(v_161),
        .CO({v_112,NLW_c72_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_67,v_78}),
        .S({\<const0> ,\<const1> ,v_74,v_80}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 c73
       (.CI(\<const0> ),
        .CO({v_161,NLW_c73_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v_205,v_85,\<const0> }),
        .O({v_60,v_109,v_142,v_145}),
        .S({v_88,v_207,v_92,v_93}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c74
       (.CI(\<const0> ),
        .CO({v_170,NLW_c74_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_97,v_102,v_104,\<const0> }),
        .O({v_110,v_140,v_146,NLW_c74_O_UNCONNECTED[0]}),
        .S({v_105,v_106,v_107,\<const0> }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c75
       (.C(clk),
        .CE(\<const1> ),
        .D(v_175),
        .Q(product[14]),
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
        .D(v_176),
        .Q(product[15]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c77
       (.CI(v_157),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({v_176,v_175}),
        .S({\<const0> ,\<const0> ,v_183,v_184}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c78
       (.CI(v_185),
        .CO({v_183,NLW_c78_CO_UNCONNECTED[1:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,v_130,v_131}),
        .O({v_184,v_114}),
        .S({\<const0> ,\<const1> ,v_132,v_133}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c79
       (.CI(v_170),
        .CO({v_185,NLW_c79_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_121,v_124,v_118,v_119}),
        .O({v_113,v_68,v_79,v_58}),
        .S({v_120,v_123,v_126,v_128}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c8
       (.I0(v_53),
        .I1(v_75),
        .O(v_74));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c84
       (.C(clk),
        .CE(\<const1> ),
        .D(v_134),
        .Q(product[5]),
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
        .D(v_198),
        .Q(product[6]),
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
        .D(v_199),
        .Q(product[7]),
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
        .D(v_200),
        .Q(product[8]),
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
        .D(v_201),
        .Q(product[9]),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c89
       (.CI(\<const0> ),
        .CO({v_156,NLW_c89_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({v_139,v_141,v_143,v_144}),
        .O({v_201,v_200,v_199,v_198}),
        .S({v_147,v_148,v_149,v_150}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c9
       (.I0(v_77),
        .I1(v_68),
        .I2(v_67),
        .I3(v_78),
        .I4(v_51),
        .I5(v_79),
        .O(v_76));
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
        .Q(v_103),
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
        .Q(v_99),
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
        .Q(v_86),
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
        .Q(v_82),
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
        .Q(v_91),
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
        .Q(v_89),
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
        .Q(v_55),
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
        .Q(v_53),
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
        .Q(v_84),
        .R(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h187830F0E888C000)) 
    direct_quadol_0
       (.I0(v_53),
        .I1(\<const0> ),
        .I2(v_75),
        .I3(v_82),
        .I4(v_84),
        .I5(v_91),
        .O5(v_205),
        .O6(v_207));
endmodule
