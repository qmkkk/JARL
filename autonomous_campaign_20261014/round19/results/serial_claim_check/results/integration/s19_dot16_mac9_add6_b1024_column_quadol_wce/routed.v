// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 12:21:58 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round19/results/serial_claim_check/results/integration/s19_dot16_mac9_add6_b1024_column_quadol_wce/routed.v
// Design      : s19_dot16_mac9_add6_b1024_column_quadol_wce
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "ccb6a5da" *) 
(* STRUCTURAL_NETLIST = "yes" *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
(* \DesignAttr:TELEMETRY_DATA  = "{\n  \"Design Characteristics Data\": {\n    \"Timing Summary\": {\n      \"Status\": \"All user specified timing constraints are met.\",\n      \"Timing requirement\": \"14.999999\",\n      \"Total Hold Slack (THS)\": \"0.000000\",\n      \"Total Negative Slack (TNS)\": \"0.000000\",\n      \"Worst Hold Slack (WHS)\": \"0.169167\",\n      \"Worst Negative Slack (WNS)\": \"7.747623\"\n    },\n    \"Utilization Report\": {\n      \"BRAM\": {\n        \"Available\": \"135\",\n        \"Utilization\": \"0\"\n      },\n      \"BUFGCTRL\": {\n        \"Available\": \"32\",\n        \"Utilization\": \"0\"\n      },\n      \"DSP\": {\n        \"Available\": \"240\",\n        \"Utilization\": \"0\"\n      },\n      \"F7MUX\": {\n        \"Available\": \"31700\",\n        \"Utilization\": \"0\"\n      },\n      \"F8MUX\": {\n        \"Available\": \"15850\",\n        \"Utilization\": \"0\"\n      },\n      \"LUT\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"121\"\n      },\n      \"LUTAsLogic\": {\n        \"Available\": \"63400\",\n        \"Utilization\": \"121\"\n      },\n      \"LUTAsMem\": {\n        \"Available\": \"19000\",\n        \"Utilization\": \"0\"\n      },\n      \"MMCM\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"PLL\": {\n        \"Available\": \"6\",\n        \"Utilization\": \"0\"\n      },\n      \"REG\": {\n        \"Available\": \"126800\",\n        \"Utilization\": \"85\"\n      }\n    }\n  },\n  \"Design Flow Data\": {\n    \"Implementation\": {\n      \"Opt Design\": {\n        \"Run Time\": \"2 seconds\"\n      },\n      \"Place Design\": {\n        \"Run Time\": \"1.645000 seconds\"\n      },\n      \"Route Design\": {\n        \"Run Time\": \"20.515000 seconds\"\n      }\n    }\n  }\n}" *) 
module s19_dot16_mac9_add6_b1024_column_quadol_wce
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
  wire [31:7]\^Y ;
  wire \Y[31]_i_1_n_0 ;
  wire [31:7]acc0;
  wire [31:7]acc_reg;
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

  assign Y[31:7] = \^Y [31:7];
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
  LUT2 #(
    .INIT(4'hB)) 
    \Y[7]_i_1 
       (.I0(s1),
        .I1(acc_reg[7]),
        .O(acc0[7]));
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
        .D(core_n_1),
        .Q(acc_reg[10]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[11] 
       (.C(clk),
        .CE(v1),
        .D(core_n_0),
        .Q(acc_reg[11]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[12] 
       (.C(clk),
        .CE(v1),
        .D(core_n_7),
        .Q(acc_reg[12]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[13] 
       (.C(clk),
        .CE(v1),
        .D(core_n_6),
        .Q(acc_reg[13]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[14] 
       (.C(clk),
        .CE(v1),
        .D(core_n_5),
        .Q(acc_reg[14]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[15] 
       (.C(clk),
        .CE(v1),
        .D(core_n_4),
        .Q(acc_reg[15]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[16] 
       (.C(clk),
        .CE(v1),
        .D(core_n_11),
        .Q(acc_reg[16]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[17] 
       (.C(clk),
        .CE(v1),
        .D(core_n_10),
        .Q(acc_reg[17]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[18] 
       (.C(clk),
        .CE(v1),
        .D(core_n_9),
        .Q(acc_reg[18]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[19] 
       (.C(clk),
        .CE(v1),
        .D(core_n_8),
        .Q(acc_reg[19]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[20] 
       (.C(clk),
        .CE(v1),
        .D(core_n_15),
        .Q(acc_reg[20]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[21] 
       (.C(clk),
        .CE(v1),
        .D(core_n_14),
        .Q(acc_reg[21]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[22] 
       (.C(clk),
        .CE(v1),
        .D(core_n_13),
        .Q(acc_reg[22]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[23] 
       (.C(clk),
        .CE(v1),
        .D(core_n_12),
        .Q(acc_reg[23]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[24] 
       (.C(clk),
        .CE(v1),
        .D(core_n_19),
        .Q(acc_reg[24]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[25] 
       (.C(clk),
        .CE(v1),
        .D(core_n_18),
        .Q(acc_reg[25]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[26] 
       (.C(clk),
        .CE(v1),
        .D(core_n_17),
        .Q(acc_reg[26]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[27] 
       (.C(clk),
        .CE(v1),
        .D(core_n_16),
        .Q(acc_reg[27]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[28] 
       (.C(clk),
        .CE(v1),
        .D(core_n_23),
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
    \acc_reg[7] 
       (.C(clk),
        .CE(v1),
        .D(acc0[7]),
        .Q(acc_reg[7]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[8] 
       (.C(clk),
        .CE(v1),
        .D(core_n_3),
        .Q(acc_reg[8]),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[9] 
       (.C(clk),
        .CE(v1),
        .D(core_n_2),
        .Q(acc_reg[9]),
        .R(reset));
  s19_mac9_add6_b1024_column_quadol_wce core
       (.A(A[8:0]),
        .B(B[8:0]),
        .D(acc0[31:8]),
        .O({core_n_0,core_n_1,core_n_2,core_n_3}),
        .acc_reg(acc_reg),
        .\acc_reg[27] ({core_n_16,core_n_17,core_n_18,core_n_19}),
        .\acc_reg[31] ({core_n_20,core_n_21,core_n_22,core_n_23}),
        .c101_0({core_n_8,core_n_9,core_n_10,core_n_11}),
        .c101_1({core_n_12,core_n_13,core_n_14,core_n_15}),
        .c97_0({core_n_4,core_n_5,core_n_6,core_n_7}),
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

module s19_mac9_add6_b1024_column_quadol_wce
   (O,
    c97_0,
    c101_0,
    c101_1,
    \acc_reg[27] ,
    \acc_reg[31] ,
    D,
    s1,
    acc_reg,
    clk,
    A,
    B);
  output [3:0]O;
  output [3:0]c97_0;
  output [3:0]c101_0;
  output [3:0]c101_1;
  output [3:0]\acc_reg[27] ;
  output [3:0]\acc_reg[31] ;
  output [23:0]D;
  input s1;
  input [24:0]acc_reg;
  input clk;
  input [8:0]A;
  input [8:0]B;

  wire \<const0> ;
  wire \<const1> ;
  wire [8:0]A;
  wire [8:0]B;
  wire [23:0]D;
  wire [3:0]O;
  wire \Y[11]_i_3_n_0 ;
  wire \Y[11]_i_4_n_0 ;
  wire \Y[11]_i_5_n_0 ;
  wire \Y[11]_i_6_n_0 ;
  wire \Y[15]_i_2_n_0 ;
  wire \Y[15]_i_3_n_0 ;
  wire \Y[15]_i_4_n_0 ;
  wire \Y[15]_i_5_n_0 ;
  wire \Y[19]_i_2_n_0 ;
  wire \Y[19]_i_4_n_0 ;
  wire \Y[19]_i_5_n_0 ;
  wire \Y[23]_i_6_n_0 ;
  wire \Y[23]_i_7_n_0 ;
  wire \Y[23]_i_8_n_0 ;
  wire \Y[23]_i_9_n_0 ;
  wire \Y[27]_i_6_n_0 ;
  wire \Y[27]_i_7_n_0 ;
  wire \Y[27]_i_8_n_0 ;
  wire \Y[27]_i_9_n_0 ;
  wire \Y[31]_i_6_n_0 ;
  wire \Y[31]_i_7_n_0 ;
  wire \Y[31]_i_8_n_0 ;
  wire \Y[31]_i_9_n_0 ;
  wire \Y_reg[11]_i_1_n_0 ;
  wire \Y_reg[15]_i_1_n_0 ;
  wire \Y_reg[19]_i_1_n_0 ;
  wire \Y_reg[23]_i_1_n_0 ;
  wire \Y_reg[27]_i_1_n_0 ;
  wire \acc[12]_i_2_n_0 ;
  wire \acc[12]_i_3_n_0 ;
  wire \acc[12]_i_4_n_0 ;
  wire \acc[12]_i_5_n_0 ;
  wire \acc[16]_i_2_n_0 ;
  wire \acc[16]_i_3_n_0 ;
  wire \acc[16]_i_4_n_0 ;
  wire \acc[16]_i_5_n_0 ;
  wire \acc[20]_i_2_n_0 ;
  wire \acc[20]_i_3_n_0 ;
  wire \acc[20]_i_4_n_0 ;
  wire \acc[20]_i_5_n_0 ;
  wire \acc[24]_i_2_n_0 ;
  wire \acc[24]_i_3_n_0 ;
  wire \acc[24]_i_4_n_0 ;
  wire \acc[24]_i_5_n_0 ;
  wire \acc[28]_i_4_n_0 ;
  wire \acc[28]_i_5_n_0 ;
  wire \acc[8]_i_2_n_0 ;
  wire \acc[8]_i_3_n_0 ;
  wire \acc[8]_i_4_n_0 ;
  wire \acc[8]_i_5_n_0 ;
  wire [24:0]acc_reg;
  wire \acc_reg[12]_i_1_n_0 ;
  wire \acc_reg[16]_i_1_n_0 ;
  wire \acc_reg[20]_i_1_n_0 ;
  wire \acc_reg[24]_i_1_n_0 ;
  wire [3:0]\acc_reg[27] ;
  wire [3:0]\acc_reg[31] ;
  wire \acc_reg[8]_i_1_n_0 ;
  wire [3:0]c101_0;
  wire [3:0]c101_1;
  wire [3:0]c97_0;
  wire clk;
  wire [29:7]p_0_out;
  wire [31:30]p_0_out__0;
  wire [17:8]product;
  wire s1;
  wire [204:51]v;
  wire [3:0]\NLW_Y_reg[11]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[19]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[23]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[27]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[24]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_acc_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:0]NLW_c91_CO_UNCONNECTED;
  wire [3:0]NLW_c92_CO_UNCONNECTED;
  wire [3:0]NLW_c92_O_UNCONNECTED;
  wire [3:0]NLW_c93_CO_UNCONNECTED;
  wire [3:0]NLW_c98_CO_UNCONNECTED;
  wire [3:0]NLW_c99_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[11]_i_2 
       (.I0(acc_reg[0]),
        .I1(s1),
        .O(p_0_out[7]));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[11]_i_3 
       (.I0(s1),
        .I1(acc_reg[4]),
        .I2(product[11]),
        .O(\Y[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[11]_i_4 
       (.I0(s1),
        .I1(acc_reg[3]),
        .I2(product[10]),
        .O(\Y[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[11]_i_5 
       (.I0(s1),
        .I1(acc_reg[2]),
        .I2(product[9]),
        .O(\Y[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[11]_i_6 
       (.I0(s1),
        .I1(acc_reg[1]),
        .I2(product[8]),
        .O(\Y[11]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[15]_i_2 
       (.I0(s1),
        .I1(acc_reg[8]),
        .I2(product[15]),
        .O(\Y[15]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[15]_i_3 
       (.I0(s1),
        .I1(acc_reg[7]),
        .I2(product[14]),
        .O(\Y[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[15]_i_4 
       (.I0(s1),
        .I1(acc_reg[6]),
        .I2(product[13]),
        .O(\Y[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[15]_i_5 
       (.I0(s1),
        .I1(acc_reg[5]),
        .I2(product[12]),
        .O(\Y[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[19]_i_2 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(\Y[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[19]_i_3 
       (.I0(acc_reg[11]),
        .I1(s1),
        .O(p_0_out[18]));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[19]_i_4 
       (.I0(s1),
        .I1(acc_reg[10]),
        .I2(product[17]),
        .O(\Y[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \Y[19]_i_5 
       (.I0(s1),
        .I1(acc_reg[9]),
        .I2(product[16]),
        .O(\Y[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[23]_i_2 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(p_0_out[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[23]_i_3 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(p_0_out[21]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[23]_i_4 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(p_0_out[20]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[23]_i_5 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(p_0_out[19]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[23]_i_6 
       (.I0(acc_reg[15]),
        .I1(s1),
        .I2(acc_reg[16]),
        .O(\Y[23]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[23]_i_7 
       (.I0(acc_reg[14]),
        .I1(s1),
        .I2(acc_reg[15]),
        .O(\Y[23]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[23]_i_8 
       (.I0(acc_reg[13]),
        .I1(s1),
        .I2(acc_reg[14]),
        .O(\Y[23]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[23]_i_9 
       (.I0(acc_reg[12]),
        .I1(s1),
        .I2(acc_reg[13]),
        .O(\Y[23]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[27]_i_2 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(p_0_out[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[27]_i_3 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(p_0_out[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[27]_i_4 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(p_0_out[24]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[27]_i_5 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(p_0_out[23]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[27]_i_6 
       (.I0(acc_reg[19]),
        .I1(s1),
        .I2(acc_reg[20]),
        .O(\Y[27]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[27]_i_7 
       (.I0(acc_reg[18]),
        .I1(s1),
        .I2(acc_reg[19]),
        .O(\Y[27]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[27]_i_8 
       (.I0(acc_reg[17]),
        .I1(s1),
        .I2(acc_reg[18]),
        .O(\Y[27]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[27]_i_9 
       (.I0(acc_reg[16]),
        .I1(s1),
        .I2(acc_reg[17]),
        .O(\Y[27]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_3 
       (.I0(acc_reg[22]),
        .I1(s1),
        .O(p_0_out[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_4 
       (.I0(acc_reg[21]),
        .I1(s1),
        .O(p_0_out[28]));
  LUT2 #(
    .INIT(4'h2)) 
    \Y[31]_i_5 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(p_0_out[27]));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_6 
       (.I0(acc_reg[23]),
        .I1(s1),
        .I2(acc_reg[24]),
        .O(\Y[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_7 
       (.I0(acc_reg[22]),
        .I1(s1),
        .I2(acc_reg[23]),
        .O(\Y[31]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_8 
       (.I0(acc_reg[21]),
        .I1(s1),
        .I2(acc_reg[22]),
        .O(\Y[31]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \Y[31]_i_9 
       (.I0(acc_reg[20]),
        .I1(s1),
        .I2(acc_reg[21]),
        .O(\Y[31]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[11]_i_1 
       (.CI(\<const0> ),
        .CO({\Y_reg[11]_i_1_n_0 ,\NLW_Y_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(p_0_out[7]),
        .DI(product[11:8]),
        .O(D[3:0]),
        .S({\Y[11]_i_3_n_0 ,\Y[11]_i_4_n_0 ,\Y[11]_i_5_n_0 ,\Y[11]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[15]_i_1 
       (.CI(\Y_reg[11]_i_1_n_0 ),
        .CO({\Y_reg[15]_i_1_n_0 ,\NLW_Y_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[15:12]),
        .O(D[7:4]),
        .S({\Y[15]_i_2_n_0 ,\Y[15]_i_3_n_0 ,\Y[15]_i_4_n_0 ,\Y[15]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[19]_i_1 
       (.CI(\Y_reg[15]_i_1_n_0 ),
        .CO({\Y_reg[19]_i_1_n_0 ,\NLW_Y_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const1> ,\<const0> ,product[17:16]}),
        .O(D[11:8]),
        .S({\Y[19]_i_2_n_0 ,p_0_out[18],\Y[19]_i_4_n_0 ,\Y[19]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[23]_i_1 
       (.CI(\Y_reg[19]_i_1_n_0 ),
        .CO({\Y_reg[23]_i_1_n_0 ,\NLW_Y_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(p_0_out[22:19]),
        .O(D[15:12]),
        .S({\Y[23]_i_6_n_0 ,\Y[23]_i_7_n_0 ,\Y[23]_i_8_n_0 ,\Y[23]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[27]_i_1 
       (.CI(\Y_reg[23]_i_1_n_0 ),
        .CO({\Y_reg[27]_i_1_n_0 ,\NLW_Y_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(p_0_out[26:23]),
        .O(D[19:16]),
        .S({\Y[27]_i_6_n_0 ,\Y[27]_i_7_n_0 ,\Y[27]_i_8_n_0 ,\Y[27]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_2 
       (.CI(\Y_reg[27]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,p_0_out[29:27]}),
        .O(D[23:20]),
        .S({\Y[31]_i_6_n_0 ,\Y[31]_i_7_n_0 ,\Y[31]_i_8_n_0 ,\Y[31]_i_9_n_0 }));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[12]_i_2 
       (.I0(product[15]),
        .I1(s1),
        .I2(acc_reg[8]),
        .O(\acc[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[12]_i_3 
       (.I0(product[14]),
        .I1(s1),
        .I2(acc_reg[7]),
        .O(\acc[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[12]_i_4 
       (.I0(product[13]),
        .I1(s1),
        .I2(acc_reg[6]),
        .O(\acc[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[12]_i_5 
       (.I0(product[12]),
        .I1(s1),
        .I2(acc_reg[5]),
        .O(\acc[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[16]_i_2 
       (.I0(acc_reg[12]),
        .I1(s1),
        .O(\acc[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[16]_i_3 
       (.I0(acc_reg[11]),
        .I1(s1),
        .O(\acc[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[16]_i_4 
       (.I0(product[17]),
        .I1(s1),
        .I2(acc_reg[10]),
        .O(\acc[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[16]_i_5 
       (.I0(product[16]),
        .I1(s1),
        .I2(acc_reg[9]),
        .O(\acc[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[20]_i_2 
       (.I0(acc_reg[16]),
        .I1(s1),
        .O(\acc[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[20]_i_3 
       (.I0(acc_reg[15]),
        .I1(s1),
        .O(\acc[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[20]_i_4 
       (.I0(acc_reg[14]),
        .I1(s1),
        .O(\acc[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[20]_i_5 
       (.I0(acc_reg[13]),
        .I1(s1),
        .O(\acc[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[24]_i_2 
       (.I0(acc_reg[20]),
        .I1(s1),
        .O(\acc[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[24]_i_3 
       (.I0(acc_reg[19]),
        .I1(s1),
        .O(\acc[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[24]_i_4 
       (.I0(acc_reg[18]),
        .I1(s1),
        .O(\acc[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[24]_i_5 
       (.I0(acc_reg[17]),
        .I1(s1),
        .O(\acc[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[28]_i_2 
       (.I0(acc_reg[24]),
        .I1(s1),
        .O(p_0_out__0[31]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[28]_i_3 
       (.I0(acc_reg[23]),
        .I1(s1),
        .O(p_0_out__0[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[28]_i_4 
       (.I0(acc_reg[22]),
        .I1(s1),
        .O(\acc[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \acc[28]_i_5 
       (.I0(acc_reg[21]),
        .I1(s1),
        .O(\acc[28]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[8]_i_2 
       (.I0(product[11]),
        .I1(s1),
        .I2(acc_reg[4]),
        .O(\acc[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[8]_i_3 
       (.I0(product[10]),
        .I1(s1),
        .I2(acc_reg[3]),
        .O(\acc[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[8]_i_4 
       (.I0(product[9]),
        .I1(s1),
        .I2(acc_reg[2]),
        .O(\acc[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \acc[8]_i_5 
       (.I0(product[8]),
        .I1(s1),
        .I2(acc_reg[1]),
        .O(\acc[8]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[12]_i_1 
       (.CI(\acc_reg[8]_i_1_n_0 ),
        .CO({\acc_reg[12]_i_1_n_0 ,\NLW_acc_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI(product[15:12]),
        .O(c97_0),
        .S({\acc[12]_i_2_n_0 ,\acc[12]_i_3_n_0 ,\acc[12]_i_4_n_0 ,\acc[12]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[16]_i_1 
       (.CI(\acc_reg[12]_i_1_n_0 ),
        .CO({\acc_reg[16]_i_1_n_0 ,\NLW_acc_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,product[17:16]}),
        .O(c101_0),
        .S({\acc[16]_i_2_n_0 ,\acc[16]_i_3_n_0 ,\acc[16]_i_4_n_0 ,\acc[16]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[20]_i_1 
       (.CI(\acc_reg[16]_i_1_n_0 ),
        .CO({\acc_reg[20]_i_1_n_0 ,\NLW_acc_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(c101_1),
        .S({\acc[20]_i_2_n_0 ,\acc[20]_i_3_n_0 ,\acc[20]_i_4_n_0 ,\acc[20]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[24]_i_1 
       (.CI(\acc_reg[20]_i_1_n_0 ),
        .CO({\acc_reg[24]_i_1_n_0 ,\NLW_acc_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\acc_reg[27] ),
        .S({\acc[24]_i_2_n_0 ,\acc[24]_i_3_n_0 ,\acc[24]_i_4_n_0 ,\acc[24]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[28]_i_1 
       (.CI(\acc_reg[24]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\acc_reg[31] ),
        .S({p_0_out__0,\acc[28]_i_4_n_0 ,\acc[28]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[8]_i_1 
       (.CI(\<const0> ),
        .CO({\acc_reg[8]_i_1_n_0 ,\NLW_acc_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(p_0_out[7]),
        .DI(product[11:8]),
        .O(O),
        .S({\acc[8]_i_2_n_0 ,\acc[8]_i_3_n_0 ,\acc[8]_i_4_n_0 ,\acc[8]_i_5_n_0 }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h78)) 
    c10
       (.I0(v[80]),
        .I1(v[81]),
        .I2(v[51]),
        .O(v[79]));
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
        .Q(product[16]),
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
        .Q(product[17]),
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
  CARRY4 c104
       (.CI(v[187]),
        .CO({v[137],NLW_c104_CO_UNCONNECTED[2:0]}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,v[158],v[159],v[160]}),
        .O({v[131],v[118],v[113]}),
        .S({\<const1> ,v[161],v[162],v[163]}));
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
        .Q(product[8]),
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
        .Q(product[9]),
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
    .INIT(64'hF880808088000000)) 
    c15
       (.I0(v[89]),
        .I1(v[94]),
        .I2(v[67]),
        .I3(v[91]),
        .I4(v[55]),
        .I5(v[92]),
        .O(v[93]));
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
  LUT4 #(
    .INIT(16'h9666)) 
    c2
       (.I0(v[52]),
        .I1(v[53]),
        .I2(v[54]),
        .I3(v[55]),
        .O(v[51]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c20
       (.I0(v[70]),
        .I1(v[91]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFEA2A80)) 
    c21
       (.I0(v[56]),
        .I1(v[70]),
        .I2(v[54]),
        .I3(v[69]),
        .I4(v[62]),
        .O(v[103]));
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
  LUT5 #(
    .INIT(32'h6A95956A)) 
    c25
       (.I0(v[56]),
        .I1(v[70]),
        .I2(v[54]),
        .I3(v[69]),
        .I4(v[62]),
        .O(v[104]));
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
  LUT3 #(
    .INIT(8'h96)) 
    c28
       (.I0(v[103]),
        .I1(v[81]),
        .I2(v[80]),
        .O(v[107]));
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
  LUT6 #(
    .INIT(64'hFF0C8E0868868404)) 
    c3
       (.I0(v[57]),
        .I1(v[58]),
        .I2(v[59]),
        .I3(v[60]),
        .I4(v[55]),
        .I5(v[61]),
        .O(v[56]));
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
  LUT5 #(
    .INIT(32'h6A95956A)) 
    c33
       (.I0(v[113]),
        .I1(v[77]),
        .I2(v[60]),
        .I3(v[121]),
        .I4(v[114]),
        .O(v[120]));
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
  LUT5 #(
    .INIT(32'h8EEEE888)) 
    c38
       (.I0(v[114]),
        .I1(v[113]),
        .I2(v[77]),
        .I3(v[60]),
        .I4(v[121]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c39
       (.I0(v[52]),
        .I1(v[54]),
        .I2(v[55]),
        .I3(v[53]),
        .O(v[129]));
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
  LUT3 #(
    .INIT(8'hBE)) 
    c42
       (.I0(v[63]),
        .I1(v[65]),
        .I2(v[64]),
        .O(v[81]));
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
  LUT4 #(
    .INIT(16'h8778)) 
    c46
       (.I0(v[77]),
        .I1(v[54]),
        .I2(v[137]),
        .I3(v[138]),
        .O(v[136]));
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
  LUT2 #(
    .INIT(4'h2)) 
    c62
       (.I0(v[129]),
        .I1(v[133]),
        .O(v[152]));
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
  LUT2 #(
    .INIT(4'h8)) 
    c75
       (.I0(v[77]),
        .I1(v[89]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c76
       (.I0(v[67]),
        .I1(v[89]),
        .I2(v[57]),
        .O(v[159]));
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
  LUT4 #(
    .INIT(16'h7000)) 
    c78
       (.I0(v[57]),
        .I1(v[91]),
        .I2(v[89]),
        .I3(v[77]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c79
       (.I0(v[67]),
        .I1(v[57]),
        .I2(v[89]),
        .I3(v[91]),
        .I4(v[77]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c8
       (.I0(v[55]),
        .I1(v[60]),
        .I2(v[66]),
        .I3(v[67]),
        .I4(v[58]),
        .I5(v[57]),
        .O(v[75]));
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
  LUT5 #(
    .INIT(32'h96660000)) 
    c82
       (.I0(v[138]),
        .I1(v[137]),
        .I2(v[54]),
        .I3(v[77]),
        .I4(v[166]),
        .O(v[165]));
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
    c89
       (.C(clk),
        .CE(\<const1> ),
        .D(v[174]),
        .Q(product[10]),
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
        .Q(product[11]),
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
        .Q(product[12]),
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
        .Q(product[13]),
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
        .Q(product[14]),
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
        .Q(product[15]),
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
endmodule
