// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 16:27:14 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/results/hardware/xc7a100tcsg324-1__r23_fir9_serial_then_quadol/routed.v
// Design      : r23_fir9_serial_then_quadol
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module r21_mac9_add6_b1024_column_mse_serial_then_quadol
   (busy_reg,
    a,
    D,
    Y,
    b0,
    index_reg,
    index_reg_4_sp_1,
    Q,
    c113_i_4_0,
    c113_i_4_1,
    c113_i_4_2,
    c113_i_4_3,
    c113_i_4_4,
    c113_i_4_5,
    c113_i_4_6,
    c113_i_2_0,
    c113_i_2_1,
    c113_i_2_2,
    c113_i_2_3,
    c113_i_2_4,
    c113_i_2_5,
    c113_i_2_6,
    c113_i_2_7,
    s2,
    S,
    \Y_reg[7] ,
    \Y_reg[11] ,
    \Y_reg[15] ,
    \Y_reg[19] ,
    clk);
  output busy_reg;
  output [0:0]a;
  output [31:0]D;
  output [15:0]Y;
  input [8:0]b0;
  input [4:0]index_reg;
  input index_reg_4_sp_1;
  input [8:0]Q;
  input [8:0]c113_i_4_0;
  input [8:0]c113_i_4_1;
  input [8:0]c113_i_4_2;
  input [8:0]c113_i_4_3;
  input [8:0]c113_i_4_4;
  input [8:0]c113_i_4_5;
  input [8:0]c113_i_4_6;
  input [8:0]c113_i_2_0;
  input [8:0]c113_i_2_1;
  input [8:0]c113_i_2_2;
  input [8:0]c113_i_2_3;
  input [8:0]c113_i_2_4;
  input [8:0]c113_i_2_5;
  input [8:0]c113_i_2_6;
  input [8:0]c113_i_2_7;
  input s2;
  input [2:0]S;
  input [2:0]\Y_reg[7] ;
  input [3:0]\Y_reg[11] ;
  input [3:0]\Y_reg[15] ;
  input [1:0]\Y_reg[19] ;
  input clk;

  wire [31:0]D;
  wire [8:0]Q;
  wire [2:0]S;
  wire [15:0]Y;
  wire [3:0]\Y_reg[11] ;
  wire \Y_reg[11]_i_1_n_0 ;
  wire [3:0]\Y_reg[15] ;
  wire \Y_reg[15]_i_1_n_0 ;
  wire [1:0]\Y_reg[19] ;
  wire \Y_reg[19]_i_1_n_0 ;
  wire \Y_reg[23]_i_1_n_0 ;
  wire \Y_reg[27]_i_1_n_0 ;
  wire \Y_reg[3]_i_1_n_0 ;
  wire [2:0]\Y_reg[7] ;
  wire \Y_reg[7]_i_1_n_0 ;
  wire [0:0]a;
  wire [7:1]a__0;
  wire [0:0]a__0__0;
  wire [8:0]b0;
  wire [0:0]b__0;
  wire busy_reg;
  wire c112_i_2_n_0;
  wire c112_i_3_n_0;
  wire c112_i_4_n_0;
  wire c112_i_5_n_0;
  wire c112_i_6_n_0;
  wire c113_i_10_n_0;
  wire c113_i_11_n_0;
  wire c113_i_12_n_0;
  wire c113_i_13_n_0;
  wire [8:0]c113_i_2_0;
  wire [8:0]c113_i_2_1;
  wire [8:0]c113_i_2_2;
  wire [8:0]c113_i_2_3;
  wire [8:0]c113_i_2_4;
  wire [8:0]c113_i_2_5;
  wire [8:0]c113_i_2_6;
  wire [8:0]c113_i_2_7;
  wire [8:0]c113_i_4_0;
  wire [8:0]c113_i_4_1;
  wire [8:0]c113_i_4_2;
  wire [8:0]c113_i_4_3;
  wire [8:0]c113_i_4_4;
  wire [8:0]c113_i_4_5;
  wire [8:0]c113_i_4_6;
  wire c113_i_4_n_0;
  wire c113_i_5_n_0;
  wire c113_i_6_n_0;
  wire c113_i_7_n_0;
  wire c113_i_8_n_0;
  wire c113_i_9_n_0;
  wire c114_i_3_n_0;
  wire c114_i_4_n_0;
  wire c114_i_5_n_0;
  wire c114_i_6_n_0;
  wire c114_i_7_n_0;
  wire c115_i_3_n_0;
  wire c115_i_4_n_0;
  wire c115_i_5_n_0;
  wire c115_i_6_n_0;
  wire c115_i_7_n_0;
  wire c116_i_3_n_0;
  wire c116_i_4_n_0;
  wire c116_i_5_n_0;
  wire c116_i_6_n_0;
  wire c116_i_7_n_0;
  wire c117_i_10_n_0;
  wire c117_i_2_n_0;
  wire c117_i_4_n_0;
  wire c117_i_5_n_0;
  wire c117_i_6_n_0;
  wire c117_i_7_n_0;
  wire c117_i_8_n_0;
  wire c117_i_9_n_0;
  wire c118_i_10_n_0;
  wire c118_i_11_n_0;
  wire c118_i_2_n_0;
  wire c118_i_6_n_0;
  wire c118_i_7_n_0;
  wire c118_i_8_n_0;
  wire c118_i_9_n_0;
  wire c119_i_10_n_0;
  wire c119_i_11_n_0;
  wire c119_i_2_n_0;
  wire c119_i_6_n_0;
  wire c119_i_7_n_0;
  wire c119_i_8_n_0;
  wire c119_i_9_n_0;
  wire c130_i_2_n_0;
  wire c132_i_2_n_0;
  wire clk;
  wire [3:0]history;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire [8:1]ma;
  wire [8:1]mb;
  wire [0:0]p;
  wire s2;
  wire [231:52]v;
  wire [2:0]\NLW_Y_reg[11]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[15]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[19]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[23]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[27]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[31]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[3]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_c100_CO_UNCONNECTED;
  wire [3:2]NLW_c100_O_UNCONNECTED;
  wire [2:0]NLW_c101_CO_UNCONNECTED;
  wire [3:3]NLW_c101_O_UNCONNECTED;
  wire [3:0]NLW_c105_CO_UNCONNECTED;
  wire [0:0]NLW_c105_O_UNCONNECTED;
  wire [3:0]NLW_c109_CO_UNCONNECTED;
  wire [3:0]NLW_c109_O_UNCONNECTED;
  wire [2:0]NLW_c88_CO_UNCONNECTED;
  wire [2:0]NLW_c89_CO_UNCONNECTED;
  wire [0:0]NLW_c89_O_UNCONNECTED;
  wire [2:0]NLW_c90_CO_UNCONNECTED;
  wire [2:0]NLW_c95_CO_UNCONNECTED;
  wire [2:0]NLW_c96_CO_UNCONNECTED;
  wire [3:0]NLW_c99_CO_UNCONNECTED;
  wire [3:2]NLW_c99_O_UNCONNECTED;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[11]_i_1 
       (.CI(\Y_reg[7]_i_1_n_0 ),
        .CO({\Y_reg[11]_i_1_n_0 ,\NLW_Y_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[11:8]),
        .S(\Y_reg[11] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[15]_i_1 
       (.CI(\Y_reg[11]_i_1_n_0 ),
        .CO({\Y_reg[15]_i_1_n_0 ,\NLW_Y_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[15:12]),
        .S(\Y_reg[15] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[19]_i_1 
       (.CI(\Y_reg[15]_i_1_n_0 ),
        .CO({\Y_reg[19]_i_1_n_0 ,\NLW_Y_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[19:16]),
        .S({s2,s2,\Y_reg[19] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[23]_i_1 
       (.CI(\Y_reg[19]_i_1_n_0 ),
        .CO({\Y_reg[23]_i_1_n_0 ,\NLW_Y_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[23:20]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[27]_i_1 
       (.CI(\Y_reg[23]_i_1_n_0 ),
        .CO({\Y_reg[27]_i_1_n_0 ,\NLW_Y_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[27:24]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_1 
       (.CI(\Y_reg[27]_i_1_n_0 ),
        .CO(\NLW_Y_reg[31]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[31:28]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 \Y_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\Y_reg[3]_i_1_n_0 ,\NLW_Y_reg[3]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,s2}),
        .O(D[3:0]),
        .S({S,p}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[7]_i_1 
       (.CI(\Y_reg[3]_i_1_n_0 ),
        .CO({\Y_reg[7]_i_1_n_0 ,\NLW_Y_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[7:4]),
        .S({s2,\Y_reg[7] }));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c10
       (.I0(v[79]),
        .I1(v[80]),
        .O(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c100
       (.CI(v[197]),
        .CO({NLW_c100_CO_UNCONNECTED[3],v[167],NLW_c100_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_c100_O_UNCONNECTED[3:2],v[166],v[138]}),
        .S({1'b0,1'b1,v[169],v[170]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v[185]),
        .CO({v[137],NLW_c101_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,v[156],v[157],v[158]}),
        .O({NLW_c101_O_UNCONNECTED[3],v[133],v[118],v[113]}),
        .S({1'b1,v[159],v[160],v[161]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c102
       (.C(clk),
        .CE(1'b1),
        .D(v[218]),
        .Q(Y[0]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c103
       (.C(clk),
        .CE(1'b1),
        .D(v[219]),
        .Q(Y[1]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c104
       (.C(clk),
        .CE(1'b1),
        .D(v[220]),
        .Q(Y[2]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c105
       (.CI(1'b0),
        .CO(NLW_c105_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(v[220:217]),
        .S({1'b0,1'b0,1'b0,1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c107
       (.C(clk),
        .CE(1'b1),
        .D(v[230]),
        .Q(Y[4]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c108
       (.C(clk),
        .CE(1'b1),
        .D(v[231]),
        .Q(Y[5]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c109
       (.CI(1'b0),
        .CO({NLW_c109_CO_UNCONNECTED[3],v[231],NLW_c109_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_c109_O_UNCONNECTED[3:2],v[230],NLW_c109_O_UNCONNECTED[0]}),
        .S({1'b0,1'b1,1'b0,1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c11
       (.I0(v[82]),
        .I1(v[83]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(1'b1),
        .D(v[179]),
        .Q(Y[6]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c111
       (.C(clk),
        .CE(1'b1),
        .D(v[178]),
        .Q(Y[7]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c112
       (.C(clk),
        .CE(1'b1),
        .D(a__0__0),
        .Q(v[86]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c112_i_1
       (.I0(busy_reg),
        .I1(c112_i_2_n_0),
        .I2(index_reg[3]),
        .I3(c112_i_3_n_0),
        .I4(index_reg[2]),
        .I5(c112_i_4_n_0),
        .O(a__0__0));
  MUXF7 c112_i_2
       (.I0(c112_i_5_n_0),
        .I1(c112_i_6_n_0),
        .O(c112_i_2_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_3
       (.I0(c113_i_2_0[0]),
        .I1(c113_i_2_1[0]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[0]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[0]),
        .O(c112_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_4
       (.I0(c113_i_2_4[0]),
        .I1(c113_i_2_5[0]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[0]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[0]),
        .O(c112_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_5
       (.I0(Q[0]),
        .I1(c113_i_4_0[0]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[0]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[0]),
        .O(c112_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_6
       (.I0(c113_i_4_3[0]),
        .I1(c113_i_4_4[0]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[0]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[0]),
        .O(c112_i_6_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c113
       (.C(clk),
        .CE(1'b1),
        .D(ma[1]),
        .Q(v[68]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    c113_i_1
       (.I0(a__0__0),
        .I1(a),
        .I2(a__0[1]),
        .O(ma[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_10
       (.I0(Q[8]),
        .I1(c113_i_4_0[8]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[8]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[8]),
        .O(c113_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_11
       (.I0(c113_i_4_3[8]),
        .I1(c113_i_4_4[8]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[8]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[8]),
        .O(c113_i_11_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_12
       (.I0(Q[1]),
        .I1(c113_i_4_0[1]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[1]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[1]),
        .O(c113_i_12_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_13
       (.I0(c113_i_4_3[1]),
        .I1(c113_i_4_4[1]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[1]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[1]),
        .O(c113_i_13_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c113_i_2
       (.I0(busy_reg),
        .I1(c113_i_4_n_0),
        .I2(index_reg[3]),
        .I3(c113_i_5_n_0),
        .I4(index_reg[2]),
        .I5(c113_i_6_n_0),
        .O(a));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c113_i_3
       (.I0(busy_reg),
        .I1(c113_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c113_i_8_n_0),
        .I4(index_reg[2]),
        .I5(c113_i_9_n_0),
        .O(a__0[1]));
  MUXF7 c113_i_4
       (.I0(c113_i_10_n_0),
        .I1(c113_i_11_n_0),
        .O(c113_i_4_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_5
       (.I0(c113_i_2_0[8]),
        .I1(c113_i_2_1[8]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[8]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[8]),
        .O(c113_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_6
       (.I0(c113_i_2_4[8]),
        .I1(c113_i_2_5[8]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[8]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[8]),
        .O(c113_i_6_n_0));
  MUXF7 c113_i_7
       (.I0(c113_i_12_n_0),
        .I1(c113_i_13_n_0),
        .O(c113_i_7_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_8
       (.I0(c113_i_2_0[1]),
        .I1(c113_i_2_1[1]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[1]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[1]),
        .O(c113_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_9
       (.I0(c113_i_2_4[1]),
        .I1(c113_i_2_5[1]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[1]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[1]),
        .O(c113_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c114
       (.C(clk),
        .CE(1'b1),
        .D(ma[2]),
        .Q(v[82]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    c114_i_1
       (.I0(a__0__0),
        .I1(a__0[1]),
        .I2(a),
        .I3(a__0[2]),
        .O(ma[2]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c114_i_2
       (.I0(busy_reg),
        .I1(c114_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c114_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c114_i_5_n_0),
        .O(a__0[2]));
  MUXF7 c114_i_3
       (.I0(c114_i_6_n_0),
        .I1(c114_i_7_n_0),
        .O(c114_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_4
       (.I0(c113_i_2_0[2]),
        .I1(c113_i_2_1[2]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[2]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[2]),
        .O(c114_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_5
       (.I0(c113_i_2_4[2]),
        .I1(c113_i_2_5[2]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[2]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[2]),
        .O(c114_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_6
       (.I0(Q[2]),
        .I1(c113_i_4_0[2]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[2]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[2]),
        .O(c114_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_7
       (.I0(c113_i_4_3[2]),
        .I1(c113_i_4_4[2]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[2]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[2]),
        .O(c114_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c115
       (.C(clk),
        .CE(1'b1),
        .D(ma[3]),
        .Q(v[93]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01FFFE00)) 
    c115_i_1
       (.I0(a__0[2]),
        .I1(a__0[1]),
        .I2(a__0__0),
        .I3(a),
        .I4(a__0[3]),
        .O(ma[3]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c115_i_2
       (.I0(busy_reg),
        .I1(c115_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c115_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c115_i_5_n_0),
        .O(a__0[3]));
  MUXF7 c115_i_3
       (.I0(c115_i_6_n_0),
        .I1(c115_i_7_n_0),
        .O(c115_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_4
       (.I0(c113_i_2_0[3]),
        .I1(c113_i_2_1[3]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[3]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[3]),
        .O(c115_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_5
       (.I0(c113_i_2_4[3]),
        .I1(c113_i_2_5[3]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[3]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[3]),
        .O(c115_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_6
       (.I0(Q[3]),
        .I1(c113_i_4_0[3]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[3]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[3]),
        .O(c115_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_7
       (.I0(c113_i_4_3[3]),
        .I1(c113_i_4_4[3]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[3]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[3]),
        .O(c115_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c116
       (.C(clk),
        .CE(1'b1),
        .D(ma[4]),
        .Q(v[71]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000)) 
    c116_i_1
       (.I0(a__0[3]),
        .I1(a__0__0),
        .I2(a__0[1]),
        .I3(a__0[2]),
        .I4(a),
        .I5(a__0[4]),
        .O(ma[4]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c116_i_2
       (.I0(busy_reg),
        .I1(c116_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c116_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c116_i_5_n_0),
        .O(a__0[4]));
  MUXF7 c116_i_3
       (.I0(c116_i_6_n_0),
        .I1(c116_i_7_n_0),
        .O(c116_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_4
       (.I0(c113_i_2_0[4]),
        .I1(c113_i_2_1[4]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[4]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[4]),
        .O(c116_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_5
       (.I0(c113_i_2_4[4]),
        .I1(c113_i_2_5[4]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[4]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[4]),
        .O(c116_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_6
       (.I0(Q[4]),
        .I1(c113_i_4_0[4]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[4]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[4]),
        .O(c116_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_7
       (.I0(c113_i_4_3[4]),
        .I1(c113_i_4_4[4]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[4]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[4]),
        .O(c116_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c117
       (.C(clk),
        .CE(1'b1),
        .D(ma[5]),
        .Q(v[89]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c117_i_1
       (.I0(a__0[4]),
        .I1(a__0[2]),
        .I2(c117_i_2_n_0),
        .I3(a__0[3]),
        .I4(a),
        .I5(a__0[5]),
        .O(ma[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_10
       (.I0(c113_i_4_3[5]),
        .I1(c113_i_4_4[5]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[5]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[5]),
        .O(c117_i_10_n_0));
  LUT6 #(
    .INIT(64'h05000533FFFFFFFF)) 
    c117_i_2
       (.I0(c117_i_4_n_0),
        .I1(c113_i_7_n_0),
        .I2(c117_i_5_n_0),
        .I3(index_reg[3]),
        .I4(c112_i_2_n_0),
        .I5(busy_reg),
        .O(c117_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c117_i_3
       (.I0(busy_reg),
        .I1(c117_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c117_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c117_i_8_n_0),
        .O(a__0[5]));
  MUXF7 c117_i_4
       (.I0(c113_i_8_n_0),
        .I1(c113_i_9_n_0),
        .O(c117_i_4_n_0),
        .S(index_reg[2]));
  MUXF7 c117_i_5
       (.I0(c112_i_3_n_0),
        .I1(c112_i_4_n_0),
        .O(c117_i_5_n_0),
        .S(index_reg[2]));
  MUXF7 c117_i_6
       (.I0(c117_i_9_n_0),
        .I1(c117_i_10_n_0),
        .O(c117_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_7
       (.I0(c113_i_2_0[5]),
        .I1(c113_i_2_1[5]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[5]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[5]),
        .O(c117_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_8
       (.I0(c113_i_2_4[5]),
        .I1(c113_i_2_5[5]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[5]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[5]),
        .O(c117_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_9
       (.I0(Q[5]),
        .I1(c113_i_4_0[5]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[5]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[5]),
        .O(c117_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c118
       (.C(clk),
        .CE(1'b1),
        .D(ma[6]),
        .Q(v[65]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c118_i_1
       (.I0(a__0[5]),
        .I1(a__0[3]),
        .I2(c118_i_2_n_0),
        .I3(a__0[4]),
        .I4(a),
        .I5(a__0[6]),
        .O(ma[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_10
       (.I0(Q[6]),
        .I1(c113_i_4_0[6]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[6]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[6]),
        .O(c118_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_11
       (.I0(c113_i_4_3[6]),
        .I1(c113_i_4_4[6]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[6]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[6]),
        .O(c118_i_11_n_0));
  LUT6 #(
    .INIT(64'h00000151FFFFFFFF)) 
    c118_i_2
       (.I0(history[0]),
        .I1(c113_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c117_i_4_n_0),
        .I4(history[2]),
        .I5(busy_reg),
        .O(c118_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c118_i_3
       (.I0(busy_reg),
        .I1(c118_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c118_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c118_i_8_n_0),
        .O(a__0[6]));
  MUXF8 c118_i_4
       (.I0(c112_i_2_n_0),
        .I1(c117_i_5_n_0),
        .O(history[0]),
        .S(index_reg[3]));
  MUXF8 c118_i_5
       (.I0(c114_i_3_n_0),
        .I1(c118_i_9_n_0),
        .O(history[2]),
        .S(index_reg[3]));
  MUXF7 c118_i_6
       (.I0(c118_i_10_n_0),
        .I1(c118_i_11_n_0),
        .O(c118_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_7
       (.I0(c113_i_2_0[6]),
        .I1(c113_i_2_1[6]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[6]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[6]),
        .O(c118_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_8
       (.I0(c113_i_2_4[6]),
        .I1(c113_i_2_5[6]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[6]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[6]),
        .O(c118_i_8_n_0));
  MUXF7 c118_i_9
       (.I0(c114_i_4_n_0),
        .I1(c114_i_5_n_0),
        .O(c118_i_9_n_0),
        .S(index_reg[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c119
       (.C(clk),
        .CE(1'b1),
        .D(ma[7]),
        .Q(v[74]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c119_i_1
       (.I0(a__0[6]),
        .I1(a__0[4]),
        .I2(c119_i_2_n_0),
        .I3(a__0[5]),
        .I4(a),
        .I5(a__0[7]),
        .O(ma[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_10
       (.I0(Q[7]),
        .I1(c113_i_4_0[7]),
        .I2(index_reg[1]),
        .I3(c113_i_4_1[7]),
        .I4(index_reg[0]),
        .I5(c113_i_4_2[7]),
        .O(c119_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_11
       (.I0(c113_i_4_3[7]),
        .I1(c113_i_4_4[7]),
        .I2(index_reg[1]),
        .I3(c113_i_4_5[7]),
        .I4(index_reg[0]),
        .I5(c113_i_4_6[7]),
        .O(c119_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF0001FFFF)) 
    c119_i_2
       (.I0(history[2]),
        .I1(history[1]),
        .I2(history[0]),
        .I3(history[3]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
        .O(c119_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c119_i_3
       (.I0(busy_reg),
        .I1(c119_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c119_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c119_i_8_n_0),
        .O(a__0[7]));
  MUXF8 c119_i_4
       (.I0(c113_i_7_n_0),
        .I1(c117_i_4_n_0),
        .O(history[1]),
        .S(index_reg[3]));
  MUXF8 c119_i_5
       (.I0(c115_i_3_n_0),
        .I1(c119_i_9_n_0),
        .O(history[3]),
        .S(index_reg[3]));
  MUXF7 c119_i_6
       (.I0(c119_i_10_n_0),
        .I1(c119_i_11_n_0),
        .O(c119_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_7
       (.I0(c113_i_2_0[7]),
        .I1(c113_i_2_1[7]),
        .I2(index_reg[1]),
        .I3(c113_i_2_2[7]),
        .I4(index_reg[0]),
        .I5(c113_i_2_3[7]),
        .O(c119_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_8
       (.I0(c113_i_2_4[7]),
        .I1(c113_i_2_5[7]),
        .I2(index_reg[1]),
        .I3(c113_i_2_6[7]),
        .I4(index_reg[0]),
        .I5(c113_i_2_7[7]),
        .O(c119_i_8_n_0));
  MUXF7 c119_i_9
       (.I0(c115_i_4_n_0),
        .I1(c115_i_5_n_0),
        .O(c119_i_9_n_0),
        .S(index_reg[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c12
       (.I0(v[68]),
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
        .CE(1'b1),
        .D(ma[8]),
        .Q(v[76]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    c120_i_1
       (.I0(a),
        .I1(a__0[6]),
        .I2(a__0[4]),
        .I3(c119_i_2_n_0),
        .I4(a__0[5]),
        .I5(a__0[7]),
        .O(ma[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c121
       (.C(clk),
        .CE(1'b1),
        .D(b__0),
        .Q(v[77]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h40)) 
    c121_i_1
       (.I0(index_reg[4]),
        .I1(index_reg_4_sn_1),
        .I2(b0[0]),
        .O(b__0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c127
       (.C(clk),
        .CE(1'b1),
        .D(mb[1]),
        .Q(v[73]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h10302000)) 
    c127_i_1
       (.I0(b0[0]),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[8]),
        .I4(b0[1]),
        .O(mb[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c128
       (.C(clk),
        .CE(1'b1),
        .D(mb[2]),
        .Q(v[64]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h01000F000E000000)) 
    c128_i_1
       (.I0(b0[0]),
        .I1(b0[1]),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[8]),
        .I5(b0[2]),
        .O(mb[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c129
       (.C(clk),
        .CE(1'b1),
        .D(mb[3]),
        .Q(v[91]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0100FF00FE000000)) 
    c129_i_1
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(busy_reg),
        .I4(b0[8]),
        .I5(b0[3]),
        .O(mb[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c13
       (.I0(v[77]),
        .I1(v[76]),
        .I2(v[83]),
        .I3(v[86]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(1'b1),
        .D(mb[4]),
        .Q(v[72]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h20301000)) 
    c130_i_1
       (.I0(c130_i_2_n_0),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[8]),
        .I4(b0[4]),
        .O(mb[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0001FFFF)) 
    c130_i_2
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(b0[3]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
        .O(c130_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c131
       (.C(clk),
        .CE(1'b1),
        .D(mb[5]),
        .Q(v[90]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c131_i_1
       (.I0(b0[4]),
        .I1(c130_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[8]),
        .I5(b0[5]),
        .O(mb[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c132
       (.C(clk),
        .CE(1'b1),
        .D(mb[6]),
        .Q(v[88]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c132_i_1
       (.I0(b0[5]),
        .I1(c132_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[8]),
        .I5(b0[6]),
        .O(mb[6]));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    c132_i_2
       (.I0(b0[3]),
        .I1(b0[0]),
        .I2(b0[1]),
        .I3(b0[2]),
        .I4(b0[4]),
        .I5(busy_reg),
        .O(c132_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c133
       (.C(clk),
        .CE(1'b1),
        .D(mb[7]),
        .Q(v[67]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0400FF00FB000000)) 
    c133_i_1
       (.I0(b0[6]),
        .I1(c132_i_2_n_0),
        .I2(b0[5]),
        .I3(busy_reg),
        .I4(b0[8]),
        .I5(b0[7]),
        .O(mb[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c134
       (.C(clk),
        .CE(1'b1),
        .D(mb[8]),
        .Q(v[83]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    c134_i_1
       (.I0(busy_reg),
        .I1(b0[8]),
        .I2(b0[6]),
        .I3(c132_i_2_n_0),
        .I4(b0[5]),
        .I5(b0[7]),
        .O(mb[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c14
       (.I0(v[71]),
        .I1(v[88]),
        .I2(v[89]),
        .I3(v[90]),
        .I4(v[74]),
        .I5(v[91]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880808088000000)) 
    c15
       (.I0(v[88]),
        .I1(v[93]),
        .I2(v[65]),
        .I3(v[90]),
        .I4(v[71]),
        .I5(v[91]),
        .O(v[92]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c16
       (.I0(v[82]),
        .I1(v[88]),
        .I2(v[89]),
        .I3(v[90]),
        .I4(v[91]),
        .I5(v[93]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c17
       (.I0(v[87]),
        .I1(v[90]),
        .I2(v[65]),
        .I3(v[96]),
        .I4(v[91]),
        .I5(v[76]),
        .O(v[95]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c18
       (.I0(v[92]),
        .I1(v[88]),
        .I2(v[71]),
        .I3(v[98]),
        .I4(v[74]),
        .I5(v[91]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c19
       (.I0(v[94]),
        .I1(v[90]),
        .I2(v[71]),
        .I3(v[100]),
        .I4(v[65]),
        .I5(v[91]),
        .O(v[99]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'hE)) 
    c2
       (.I0(v[53]),
        .I1(v[54]),
        .O(v[52]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c20
       (.I0(v[91]),
        .I1(v[89]),
        .O(v[101]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c21
       (.I0(v[52]),
        .I1(v[55]),
        .I2(v[67]),
        .I3(v[93]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c22
       (.I0(v[89]),
        .I1(v[88]),
        .O(v[96]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c23
       (.I0(v[89]),
        .I1(v[90]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c24
       (.I0(v[93]),
        .I1(v[88]),
        .O(v[100]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h659A956A956A956A)) 
    c25
       (.I0(v[62]),
        .I1(v[82]),
        .I2(v[67]),
        .I3(v[104]),
        .I4(v[68]),
        .I5(v[69]),
        .O(v[103]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7887878787787878)) 
    c26
       (.I0(v[74]),
        .I1(v[73]),
        .I2(v[63]),
        .I3(v[72]),
        .I4(v[71]),
        .I5(v[106]),
        .O(v[105]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c27
       (.I0(v[80]),
        .I1(v[79]),
        .I2(v[55]),
        .I3(v[93]),
        .I4(v[67]),
        .I5(v[52]),
        .O(v[107]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAA95555696)) 
    c28
       (.I0(v[102]),
        .I1(v[62]),
        .I2(v[82]),
        .I3(v[67]),
        .I4(v[104]),
        .I5(v[66]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h56)) 
    c29
       (.I0(v[103]),
        .I1(v[106]),
        .I2(v[70]),
        .O(v[109]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8778788778878778)) 
    c3
       (.I0(v[56]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[59]),
        .I4(v[60]),
        .I5(v[61]),
        .O(v[55]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696969)) 
    c30
       (.I0(v[106]),
        .I1(v[70]),
        .I2(v[69]),
        .I3(v[68]),
        .I4(v[67]),
        .O(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFE8E8E8E8000000)) 
    c31
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[67]),
        .I4(v[65]),
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
        .I1(v[76]),
        .I2(v[72]),
        .I3(v[121]),
        .I4(v[114]),
        .O(v[120]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c34
       (.I0(v[67]),
        .I1(v[89]),
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
       (.I0(v[67]),
        .I1(v[65]),
        .O(v[127]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h95556AAA)) 
    c37
       (.I0(v[118]),
        .I1(v[121]),
        .I2(v[76]),
        .I3(v[72]),
        .I4(v[117]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h8EEEE888)) 
    c38
       (.I0(v[114]),
        .I1(v[113]),
        .I2(v[76]),
        .I3(v[72]),
        .I4(v[121]),
        .O(v[128]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c39
       (.I0(v[130]),
        .I1(v[67]),
        .I2(v[71]),
        .I3(v[131]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c4
       (.I0(v[54]),
        .I1(v[53]),
        .O(v[62]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEABFBFEA802A2A80)) 
    c40
       (.I0(v[111]),
        .I1(v[74]),
        .I2(v[67]),
        .I3(v[133]),
        .I4(v[134]),
        .I5(v[116]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6996966996699669)) 
    c41
       (.I0(v[123]),
        .I1(v[113]),
        .I2(v[112]),
        .I3(v[114]),
        .I4(v[67]),
        .I5(v[89]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    c42
       (.I0(v[62]),
        .I1(v[104]),
        .I2(v[69]),
        .I3(v[68]),
        .I4(v[67]),
        .I5(v[82]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c43
       (.I0(v[130]),
        .I1(v[131]),
        .I2(v[67]),
        .I3(v[71]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c44
       (.I0(v[76]),
        .I1(v[67]),
        .I2(v[137]),
        .I3(v[138]),
        .O(v[136]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA8080EA80EAEA80)) 
    c45
       (.I0(v[123]),
        .I1(v[67]),
        .I2(v[89]),
        .I3(v[113]),
        .I4(v[112]),
        .I5(v[114]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8778)) 
    c46
       (.I0(v[74]),
        .I1(v[67]),
        .I2(v[133]),
        .I3(v[134]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h17E8E817E817E817)) 
    c47
       (.I0(v[112]),
        .I1(v[113]),
        .I2(v[114]),
        .I3(v[115]),
        .I4(v[67]),
        .I5(v[65]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hFFFF877887780000)) 
    c48
       (.I0(v[56]),
        .I1(v[57]),
        .I2(v[58]),
        .I3(v[59]),
        .I4(v[61]),
        .I5(v[60]),
        .O(v[130]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c49
       (.I0(v[125]),
        .I1(v[126]),
        .I2(v[124]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[64]),
        .I1(v[65]),
        .O(v[63]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c50
       (.I0(v[64]),
        .I1(v[65]),
        .I2(v[76]),
        .I3(v[74]),
        .I4(v[72]),
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
       (.I0(v[65]),
        .I1(v[83]),
        .O(v[144]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c53
       (.I0(v[89]),
        .I1(v[83]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c54
       (.I0(v[71]),
        .I1(v[83]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c55
       (.I0(v[93]),
        .I1(v[83]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c56
       (.I0(v[64]),
        .I1(v[65]),
        .I2(v[74]),
        .I3(v[142]),
        .I4(v[76]),
        .I5(v[72]),
        .O(v[119]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hEA80FFFF0000EA80)) 
    c57
       (.I0(v[59]),
        .I1(v[56]),
        .I2(v[57]),
        .I3(v[58]),
        .I4(v[148]),
        .I5(v[149]),
        .O(v[121]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h56666AAAA9999555)) 
    c58
       (.I0(v[149]),
        .I1(v[58]),
        .I2(v[57]),
        .I3(v[56]),
        .I4(v[59]),
        .I5(v[148]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c59
       (.I0(v[89]),
        .I1(v[72]),
        .I2(v[73]),
        .I3(v[76]),
        .I4(v[64]),
        .I5(v[74]),
        .O(v[56]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    c6
       (.I0(v[67]),
        .I1(v[68]),
        .I2(v[69]),
        .O(v[66]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c60
       (.I0(v[65]),
        .I1(v[64]),
        .I2(v[72]),
        .I3(v[74]),
        .I4(v[71]),
        .I5(v[73]),
        .O(v[57]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c61
       (.I0(v[65]),
        .I1(v[72]),
        .I2(v[76]),
        .I3(v[64]),
        .O(v[58]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h2)) 
    c62
       (.I0(v[129]),
        .I1(v[135]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c63
       (.I0(v[64]),
        .I1(v[74]),
        .I2(v[73]),
        .I3(v[76]),
        .I4(v[72]),
        .I5(v[89]),
        .O(v[59]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c64
       (.I0(v[58]),
        .I1(v[57]),
        .I2(v[56]),
        .I3(v[59]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c65
       (.I0(v[72]),
        .I1(v[74]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c66
       (.I0(v[76]),
        .I1(v[72]),
        .I2(v[65]),
        .I3(v[64]),
        .O(v[149]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c67
       (.I0(v[79]),
        .I1(v[80]),
        .O(v[151]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9996969696666666)) 
    c68
       (.I0(v[132]),
        .I1(v[136]),
        .I2(v[133]),
        .I3(v[67]),
        .I4(v[74]),
        .I5(v[134]),
        .O(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE78E18711871E78E)) 
    c69
       (.I0(v[139]),
        .I1(v[128]),
        .I2(v[127]),
        .I3(v[115]),
        .I4(v[116]),
        .I5(v[140]),
        .O(v[153]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    c7
       (.I0(v[71]),
        .I1(v[72]),
        .I2(v[64]),
        .I3(v[65]),
        .I4(v[73]),
        .I5(v[74]),
        .O(v[70]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EEEE88881111777)) 
    c70
       (.I0(v[129]),
        .I1(v[123]),
        .I2(v[67]),
        .I3(v[89]),
        .I4(v[120]),
        .I5(v[141]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EEEE88881111777)) 
    c71
       (.I0(v[79]),
        .I1(v[130]),
        .I2(v[67]),
        .I3(v[71]),
        .I4(v[131]),
        .I5(v[135]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c72
       (.I0(v[76]),
        .I1(v[88]),
        .O(v[156]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c73
       (.I0(v[65]),
        .I1(v[88]),
        .I2(v[74]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c74
       (.I0(v[88]),
        .I1(v[89]),
        .I2(v[65]),
        .I3(v[90]),
        .I4(v[91]),
        .I5(v[76]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c75
       (.I0(v[74]),
        .I1(v[90]),
        .I2(v[88]),
        .I3(v[76]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c76
       (.I0(v[65]),
        .I1(v[74]),
        .I2(v[88]),
        .I3(v[90]),
        .I4(v[76]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDBAF2450B400B400)) 
    c77
       (.I0(v[162]),
        .I1(v[89]),
        .I2(v[65]),
        .I3(v[88]),
        .I4(v[74]),
        .I5(v[90]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c78
       (.I0(v[91]),
        .I1(v[76]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96660000)) 
    c79
       (.I0(v[138]),
        .I1(v[137]),
        .I2(v[67]),
        .I3(v[76]),
        .I4(v[164]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6EFD135F8000ECA0)) 
    c8
       (.I0(v[73]),
        .I1(v[71]),
        .I2(v[74]),
        .I3(v[72]),
        .I4(v[63]),
        .I5(v[56]),
        .O(v[53]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h57777FFFA8888000)) 
    c80
       (.I0(v[166]),
        .I1(v[137]),
        .I2(v[67]),
        .I3(v[76]),
        .I4(v[138]),
        .I5(v[167]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h93363636366C6C6C)) 
    c81
       (.I0(v[164]),
        .I1(v[166]),
        .I2(v[137]),
        .I3(v[67]),
        .I4(v[76]),
        .I5(v[138]),
        .O(v[168]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'hEA80)) 
    c82
       (.I0(v[133]),
        .I1(v[67]),
        .I2(v[74]),
        .I3(v[134]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c83
       (.I0(v[76]),
        .I1(v[83]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c84
       (.I0(v[74]),
        .I1(v[83]),
        .O(v[170]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c85
       (.C(clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(p),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c86
       (.C(clk),
        .CE(1'b1),
        .D(v[172]),
        .Q(Y[8]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c87
       (.C(clk),
        .CE(1'b1),
        .D(v[173]),
        .Q(Y[9]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c88
       (.CI(1'b0),
        .CO({v[174],NLW_c88_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v[78],v[102],v[103],v[105]}),
        .O({v[173:172],v[178],v[179]}),
        .S({v[107],v[108],v[109],v[110]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c89
       (.CI(1'b0),
        .CO({v[180],NLW_c89_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,v[75],1'b0}),
        .O({v[61],v[104],v[69],NLW_c89_O_UNCONNECTED[0]}),
        .S({v[81],v[84],v[85],1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c9
       (.I0(v[76]),
        .I1(v[77]),
        .O(v[75]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c90
       (.CI(1'b0),
        .CO(v[185:182]),
        .CYINIT(1'b0),
        .DI({v[87],v[92],v[94],1'b0}),
        .O({v[125],v[60],v[54],v[106]}),
        .S({v[95],v[97],v[99],v[101]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(1'b1),
        .D(v[189]),
        .Q(Y[10]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c92
       (.C(clk),
        .CE(1'b1),
        .D(v[190]),
        .Q(Y[11]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c93
       (.C(clk),
        .CE(1'b1),
        .D(v[191]),
        .Q(Y[12]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c94
       (.C(clk),
        .CE(1'b1),
        .D(v[192]),
        .Q(Y[13]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c95
       (.CI(v[174]),
        .CO({v[193],NLW_c95_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v[132],v[143],v[150],v[151]}),
        .O(v[192:189]),
        .S({v[152],v[153],v[154],v[155]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(v[180]),
        .CO(v[197:194]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({v[134],v[117],v[114],v[124]}),
        .S({v[144],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c97
       (.C(clk),
        .CE(1'b1),
        .D(v[201]),
        .Q(Y[14]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c98
       (.C(clk),
        .CE(1'b1),
        .D(v[202]),
        .Q(Y[15]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c99
       (.CI(v[193]),
        .CO(NLW_c99_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,v[163]}),
        .O({NLW_c99_O_UNCONNECTED[3:2],v[202:201]}),
        .S({1'b0,1'b0,v[165],v[168]}));
  LUT2 #(
    .INIT(4'h2)) 
    \vpipe[0]_i_1 
       (.I0(index_reg_4_sn_1),
        .I1(index_reg[4]),
        .O(busy_reg));
endmodule

(* ECO_CHECKSUM = "48fdd778" *) (* LAT = "3" *) (* TAPS = "16" *) 
(* NotValidForBitStream *)
module r23_fir9_serial_then_quadol
   (clk,
    reset,
    coeff_we,
    coeff_addr,
    coeff_data,
    sample_valid,
    sample_data,
    sample_ready,
    result_valid,
    result);
  input clk;
  input reset;
  input coeff_we;
  input [3:0]coeff_addr;
  input [8:0]coeff_data;
  input sample_valid;
  input [8:0]sample_data;
  output sample_ready;
  output result_valid;
  output [39:0]result;

  wire [39:0]acc;
  wire \acc[39]_i_1_n_0 ;
  wire [8:0]b0;
  wire busy0;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire clk;
  wire [3:0]coeff_addr;
  wire [8:0]coeff_data;
  wire coeff_reg_0_15_0_5_i_1_n_0;
  wire coeff_we;
  wire core_n_1;
  wire core_n_42;
  wire core_n_43;
  wire core_n_44;
  wire core_n_45;
  wire core_n_46;
  wire core_n_47;
  wire core_n_48;
  wire core_n_49;
  wire core_n_50;
  wire core_n_51;
  wire core_n_52;
  wire core_n_53;
  wire core_n_54;
  wire core_n_55;
  wire core_n_56;
  wire core_n_57;
  wire core_n_58;
  wire core_n_59;
  wire core_n_60;
  wire core_n_61;
  wire core_n_62;
  wire core_n_63;
  wire core_n_64;
  wire core_n_65;
  wire core_n_66;
  wire core_n_67;
  wire core_n_68;
  wire core_n_69;
  wire core_n_70;
  wire core_n_71;
  wire core_n_72;
  wire core_n_73;
  wire core_n_74;
  wire core_n_75;
  wire core_n_76;
  wire core_n_77;
  wire core_n_78;
  wire core_n_79;
  wire core_n_80;
  wire [1:0]firstpipe;
  wire [2:2]firstpipe__0;
  wire [8:0]\history_reg[0] ;
  wire [8:0]\history_reg[10] ;
  wire [8:0]\history_reg[11] ;
  wire [8:0]\history_reg[12] ;
  wire [8:0]\history_reg[13] ;
  wire [8:0]\history_reg[14] ;
  wire [8:0]\history_reg[15] ;
  wire [8:0]\history_reg[1] ;
  wire [8:0]\history_reg[2] ;
  wire [8:0]\history_reg[3] ;
  wire [8:0]\history_reg[4] ;
  wire [8:0]\history_reg[5] ;
  wire [8:0]\history_reg[6] ;
  wire [8:0]\history_reg[7] ;
  wire [8:0]\history_reg[8] ;
  wire [8:0]\history_reg[9] ;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[4]_i_1_n_0 ;
  wire [4:0]index_reg;
  wire issue;
  wire \lastpipe[0]_i_1_n_0 ;
  wire \lastpipe_reg_n_0_[0] ;
  wire \lastpipe_reg_n_0_[1] ;
  wire [39:0]next_acc;
  wire p_0_in;
  wire [4:4]p_0_in__0;
  wire [0:0]p_0_out;
  wire p_1_in;
  wire reset;
  wire [39:0]result;
  wire \result[39]_i_1_n_0 ;
  wire result_valid;
  wire result_valid_i_1_n_0;
  wire [8:0]sample_data;
  wire sample_ready;
  wire sample_valid;
  wire \vpipe_reg_n_0_[0] ;
  wire \vpipe_reg_n_0_[1] ;
  wire [1:0]NLW_coeff_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:1]NLW_coeff_reg_0_15_6_8_DOB_UNCONNECTED;
  wire [1:0]NLW_coeff_reg_0_15_6_8_DOC_UNCONNECTED;
  wire [1:0]NLW_coeff_reg_0_15_6_8_DOD_UNCONNECTED;

  LUT4 #(
    .INIT(16'hFF02)) 
    \acc[39]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(p_0_in),
        .O(\acc[39]_i_1_n_0 ));
  FDRE \acc_reg[0] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_1),
        .Q(acc[0]),
        .R(reset));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_51),
        .Q(acc[10]),
        .R(reset));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_52),
        .Q(acc[11]),
        .R(reset));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_53),
        .Q(acc[12]),
        .R(reset));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_54),
        .Q(acc[13]),
        .R(reset));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_55),
        .Q(acc[14]),
        .R(reset));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_56),
        .Q(acc[15]),
        .R(reset));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_57),
        .Q(acc[16]),
        .R(reset));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_58),
        .Q(acc[17]),
        .R(reset));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_59),
        .Q(acc[18]),
        .R(reset));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_60),
        .Q(acc[19]),
        .R(reset));
  FDRE \acc_reg[1] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_42),
        .Q(acc[1]),
        .R(reset));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_61),
        .Q(acc[20]),
        .R(reset));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_62),
        .Q(acc[21]),
        .R(reset));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_63),
        .Q(acc[22]),
        .R(reset));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_64),
        .Q(acc[23]),
        .R(reset));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_65),
        .Q(acc[24]),
        .R(reset));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_66),
        .Q(acc[25]),
        .R(reset));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_67),
        .Q(acc[26]),
        .R(reset));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_68),
        .Q(acc[27]),
        .R(reset));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_69),
        .Q(acc[28]),
        .R(reset));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_70),
        .Q(acc[29]),
        .R(reset));
  FDRE \acc_reg[2] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_43),
        .Q(acc[2]),
        .R(reset));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_71),
        .Q(acc[30]),
        .R(reset));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_72),
        .Q(acc[31]),
        .R(reset));
  FDRE \acc_reg[32] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_73),
        .Q(acc[32]),
        .R(reset));
  FDRE \acc_reg[33] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_74),
        .Q(acc[33]),
        .R(reset));
  FDRE \acc_reg[34] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_75),
        .Q(acc[34]),
        .R(reset));
  FDRE \acc_reg[35] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_76),
        .Q(acc[35]),
        .R(reset));
  FDRE \acc_reg[36] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_77),
        .Q(acc[36]),
        .R(reset));
  FDRE \acc_reg[37] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_78),
        .Q(acc[37]),
        .R(reset));
  FDRE \acc_reg[38] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_79),
        .Q(acc[38]),
        .R(reset));
  FDRE \acc_reg[39] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_80),
        .Q(acc[39]),
        .R(reset));
  FDRE \acc_reg[3] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_44),
        .Q(acc[3]),
        .R(reset));
  FDRE \acc_reg[4] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_45),
        .Q(acc[4]),
        .R(reset));
  FDRE \acc_reg[5] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_46),
        .Q(acc[5]),
        .R(reset));
  FDRE \acc_reg[6] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_47),
        .Q(acc[6]),
        .R(reset));
  FDRE \acc_reg[7] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_48),
        .Q(acc[7]),
        .R(reset));
  FDRE \acc_reg[8] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_49),
        .Q(acc[8]),
        .R(reset));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_50),
        .Q(acc[9]),
        .R(reset));
  LUT6 #(
    .INIT(64'h000000F200F200F2)) 
    busy_i_1
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(reset),
        .I4(p_0_in),
        .I5(p_1_in),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk),
        .CE(1'b1),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "144" *) 
  (* RTL_RAM_NAME = "r23_fir9_serial_then_quadol/coeff_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M coeff_reg_0_15_0_5
       (.ADDRA({1'b0,index_reg[3:0]}),
        .ADDRB({1'b0,index_reg[3:0]}),
        .ADDRC({1'b0,index_reg[3:0]}),
        .ADDRD({1'b0,coeff_addr}),
        .DIA(coeff_data[1:0]),
        .DIB(coeff_data[3:2]),
        .DIC(coeff_data[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(b0[1:0]),
        .DOB(b0[3:2]),
        .DOC(b0[5:4]),
        .DOD(NLW_coeff_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  LUT3 #(
    .INIT(8'h04)) 
    coeff_reg_0_15_0_5_i_1
       (.I0(busy_reg_n_0),
        .I1(coeff_we),
        .I2(reset),
        .O(coeff_reg_0_15_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "144" *) 
  (* RTL_RAM_NAME = "r23_fir9_serial_then_quadol/coeff_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "8" *) 
  RAM32M coeff_reg_0_15_6_8
       (.ADDRA({1'b0,index_reg[3:0]}),
        .ADDRB({1'b0,index_reg[3:0]}),
        .ADDRC({1'b0,index_reg[3:0]}),
        .ADDRD({1'b0,coeff_addr}),
        .DIA(coeff_data[7:6]),
        .DIB({1'b0,coeff_data[8]}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(b0[7:6]),
        .DOB({NLW_coeff_reg_0_15_6_8_DOB_UNCONNECTED[1],b0[8]}),
        .DOC(NLW_coeff_reg_0_15_6_8_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_coeff_reg_0_15_6_8_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  r23_fir9_serial_then_quadol_signed core
       (.D(next_acc),
        .Q(\history_reg[3] ),
        .acc(acc),
        .\acc_reg[0] (p_0_in),
        .b0(b0),
        .c113_i_2(\history_reg[11] ),
        .c113_i_2_0(\history_reg[10] ),
        .c113_i_2_1(\history_reg[9] ),
        .c113_i_2_2(\history_reg[8] ),
        .c113_i_2_3(\history_reg[15] ),
        .c113_i_2_4(\history_reg[14] ),
        .c113_i_2_5(\history_reg[13] ),
        .c113_i_2_6(\history_reg[12] ),
        .c113_i_4(\history_reg[2] ),
        .c113_i_4_0(\history_reg[1] ),
        .c113_i_4_1(\history_reg[0] ),
        .c113_i_4_2(\history_reg[7] ),
        .c113_i_4_3(\history_reg[6] ),
        .c113_i_4_4(\history_reg[5] ),
        .c113_i_4_5(\history_reg[4] ),
        .clk(clk),
        .index_reg(index_reg),
        .index_reg_4_sp_1(busy_reg_n_0),
        .issue(issue),
        .\result_reg[3] (firstpipe__0),
        .\vpipe_reg[2] (core_n_1),
        .\vpipe_reg[2]_0 (core_n_42),
        .\vpipe_reg[2]_1 (core_n_43),
        .\vpipe_reg[2]_10 (core_n_52),
        .\vpipe_reg[2]_11 (core_n_53),
        .\vpipe_reg[2]_12 (core_n_54),
        .\vpipe_reg[2]_13 (core_n_55),
        .\vpipe_reg[2]_14 (core_n_56),
        .\vpipe_reg[2]_15 (core_n_57),
        .\vpipe_reg[2]_16 (core_n_58),
        .\vpipe_reg[2]_17 (core_n_59),
        .\vpipe_reg[2]_18 (core_n_60),
        .\vpipe_reg[2]_19 (core_n_61),
        .\vpipe_reg[2]_2 (core_n_44),
        .\vpipe_reg[2]_20 (core_n_62),
        .\vpipe_reg[2]_21 (core_n_63),
        .\vpipe_reg[2]_22 (core_n_64),
        .\vpipe_reg[2]_23 (core_n_65),
        .\vpipe_reg[2]_24 (core_n_66),
        .\vpipe_reg[2]_25 (core_n_67),
        .\vpipe_reg[2]_26 (core_n_68),
        .\vpipe_reg[2]_27 (core_n_69),
        .\vpipe_reg[2]_28 (core_n_70),
        .\vpipe_reg[2]_29 (core_n_71),
        .\vpipe_reg[2]_3 (core_n_45),
        .\vpipe_reg[2]_30 (core_n_72),
        .\vpipe_reg[2]_31 (core_n_73),
        .\vpipe_reg[2]_32 (core_n_74),
        .\vpipe_reg[2]_33 (core_n_75),
        .\vpipe_reg[2]_34 (core_n_76),
        .\vpipe_reg[2]_35 (core_n_77),
        .\vpipe_reg[2]_36 (core_n_78),
        .\vpipe_reg[2]_37 (core_n_79),
        .\vpipe_reg[2]_38 (core_n_80),
        .\vpipe_reg[2]_4 (core_n_46),
        .\vpipe_reg[2]_5 (core_n_47),
        .\vpipe_reg[2]_6 (core_n_48),
        .\vpipe_reg[2]_7 (core_n_49),
        .\vpipe_reg[2]_8 (core_n_50),
        .\vpipe_reg[2]_9 (core_n_51));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \firstpipe[0]_i_1 
       (.I0(busy_reg_n_0),
        .I1(index_reg[2]),
        .I2(index_reg[4]),
        .I3(index_reg[0]),
        .I4(index_reg[1]),
        .I5(index_reg[3]),
        .O(p_0_out));
  FDRE \firstpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_out),
        .Q(firstpipe[0]),
        .R(reset));
  FDRE \firstpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(firstpipe[0]),
        .Q(firstpipe[1]),
        .R(reset));
  FDRE \firstpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(firstpipe[1]),
        .Q(firstpipe__0),
        .R(reset));
  LUT3 #(
    .INIT(8'h02)) 
    \history[0][8]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .O(busy0));
  FDRE \history_reg[0][0] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[0]),
        .Q(\history_reg[0] [0]),
        .R(reset));
  FDRE \history_reg[0][1] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[1]),
        .Q(\history_reg[0] [1]),
        .R(reset));
  FDRE \history_reg[0][2] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[2]),
        .Q(\history_reg[0] [2]),
        .R(reset));
  FDRE \history_reg[0][3] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[3]),
        .Q(\history_reg[0] [3]),
        .R(reset));
  FDRE \history_reg[0][4] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[4]),
        .Q(\history_reg[0] [4]),
        .R(reset));
  FDRE \history_reg[0][5] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[5]),
        .Q(\history_reg[0] [5]),
        .R(reset));
  FDRE \history_reg[0][6] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[6]),
        .Q(\history_reg[0] [6]),
        .R(reset));
  FDRE \history_reg[0][7] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[7]),
        .Q(\history_reg[0] [7]),
        .R(reset));
  FDRE \history_reg[0][8] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[8]),
        .Q(\history_reg[0] [8]),
        .R(reset));
  FDRE \history_reg[10][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [0]),
        .Q(\history_reg[10] [0]),
        .R(reset));
  FDRE \history_reg[10][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [1]),
        .Q(\history_reg[10] [1]),
        .R(reset));
  FDRE \history_reg[10][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [2]),
        .Q(\history_reg[10] [2]),
        .R(reset));
  FDRE \history_reg[10][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [3]),
        .Q(\history_reg[10] [3]),
        .R(reset));
  FDRE \history_reg[10][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [4]),
        .Q(\history_reg[10] [4]),
        .R(reset));
  FDRE \history_reg[10][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [5]),
        .Q(\history_reg[10] [5]),
        .R(reset));
  FDRE \history_reg[10][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [6]),
        .Q(\history_reg[10] [6]),
        .R(reset));
  FDRE \history_reg[10][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [7]),
        .Q(\history_reg[10] [7]),
        .R(reset));
  FDRE \history_reg[10][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [8]),
        .Q(\history_reg[10] [8]),
        .R(reset));
  FDRE \history_reg[11][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [0]),
        .Q(\history_reg[11] [0]),
        .R(reset));
  FDRE \history_reg[11][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [1]),
        .Q(\history_reg[11] [1]),
        .R(reset));
  FDRE \history_reg[11][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [2]),
        .Q(\history_reg[11] [2]),
        .R(reset));
  FDRE \history_reg[11][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [3]),
        .Q(\history_reg[11] [3]),
        .R(reset));
  FDRE \history_reg[11][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [4]),
        .Q(\history_reg[11] [4]),
        .R(reset));
  FDRE \history_reg[11][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [5]),
        .Q(\history_reg[11] [5]),
        .R(reset));
  FDRE \history_reg[11][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [6]),
        .Q(\history_reg[11] [6]),
        .R(reset));
  FDRE \history_reg[11][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [7]),
        .Q(\history_reg[11] [7]),
        .R(reset));
  FDRE \history_reg[11][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [8]),
        .Q(\history_reg[11] [8]),
        .R(reset));
  FDRE \history_reg[12][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [0]),
        .Q(\history_reg[12] [0]),
        .R(reset));
  FDRE \history_reg[12][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [1]),
        .Q(\history_reg[12] [1]),
        .R(reset));
  FDRE \history_reg[12][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [2]),
        .Q(\history_reg[12] [2]),
        .R(reset));
  FDRE \history_reg[12][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [3]),
        .Q(\history_reg[12] [3]),
        .R(reset));
  FDRE \history_reg[12][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [4]),
        .Q(\history_reg[12] [4]),
        .R(reset));
  FDRE \history_reg[12][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [5]),
        .Q(\history_reg[12] [5]),
        .R(reset));
  FDRE \history_reg[12][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [6]),
        .Q(\history_reg[12] [6]),
        .R(reset));
  FDRE \history_reg[12][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [7]),
        .Q(\history_reg[12] [7]),
        .R(reset));
  FDRE \history_reg[12][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [8]),
        .Q(\history_reg[12] [8]),
        .R(reset));
  FDRE \history_reg[13][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [0]),
        .Q(\history_reg[13] [0]),
        .R(reset));
  FDRE \history_reg[13][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [1]),
        .Q(\history_reg[13] [1]),
        .R(reset));
  FDRE \history_reg[13][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [2]),
        .Q(\history_reg[13] [2]),
        .R(reset));
  FDRE \history_reg[13][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [3]),
        .Q(\history_reg[13] [3]),
        .R(reset));
  FDRE \history_reg[13][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [4]),
        .Q(\history_reg[13] [4]),
        .R(reset));
  FDRE \history_reg[13][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [5]),
        .Q(\history_reg[13] [5]),
        .R(reset));
  FDRE \history_reg[13][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [6]),
        .Q(\history_reg[13] [6]),
        .R(reset));
  FDRE \history_reg[13][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [7]),
        .Q(\history_reg[13] [7]),
        .R(reset));
  FDRE \history_reg[13][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [8]),
        .Q(\history_reg[13] [8]),
        .R(reset));
  FDRE \history_reg[14][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [0]),
        .Q(\history_reg[14] [0]),
        .R(reset));
  FDRE \history_reg[14][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [1]),
        .Q(\history_reg[14] [1]),
        .R(reset));
  FDRE \history_reg[14][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [2]),
        .Q(\history_reg[14] [2]),
        .R(reset));
  FDRE \history_reg[14][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [3]),
        .Q(\history_reg[14] [3]),
        .R(reset));
  FDRE \history_reg[14][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [4]),
        .Q(\history_reg[14] [4]),
        .R(reset));
  FDRE \history_reg[14][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [5]),
        .Q(\history_reg[14] [5]),
        .R(reset));
  FDRE \history_reg[14][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [6]),
        .Q(\history_reg[14] [6]),
        .R(reset));
  FDRE \history_reg[14][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [7]),
        .Q(\history_reg[14] [7]),
        .R(reset));
  FDRE \history_reg[14][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [8]),
        .Q(\history_reg[14] [8]),
        .R(reset));
  FDRE \history_reg[15][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [0]),
        .Q(\history_reg[15] [0]),
        .R(reset));
  FDRE \history_reg[15][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [1]),
        .Q(\history_reg[15] [1]),
        .R(reset));
  FDRE \history_reg[15][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [2]),
        .Q(\history_reg[15] [2]),
        .R(reset));
  FDRE \history_reg[15][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [3]),
        .Q(\history_reg[15] [3]),
        .R(reset));
  FDRE \history_reg[15][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [4]),
        .Q(\history_reg[15] [4]),
        .R(reset));
  FDRE \history_reg[15][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [5]),
        .Q(\history_reg[15] [5]),
        .R(reset));
  FDRE \history_reg[15][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [6]),
        .Q(\history_reg[15] [6]),
        .R(reset));
  FDRE \history_reg[15][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [7]),
        .Q(\history_reg[15] [7]),
        .R(reset));
  FDRE \history_reg[15][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [8]),
        .Q(\history_reg[15] [8]),
        .R(reset));
  FDRE \history_reg[1][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [0]),
        .Q(\history_reg[1] [0]),
        .R(reset));
  FDRE \history_reg[1][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [1]),
        .Q(\history_reg[1] [1]),
        .R(reset));
  FDRE \history_reg[1][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [2]),
        .Q(\history_reg[1] [2]),
        .R(reset));
  FDRE \history_reg[1][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [3]),
        .Q(\history_reg[1] [3]),
        .R(reset));
  FDRE \history_reg[1][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [4]),
        .Q(\history_reg[1] [4]),
        .R(reset));
  FDRE \history_reg[1][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [5]),
        .Q(\history_reg[1] [5]),
        .R(reset));
  FDRE \history_reg[1][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [6]),
        .Q(\history_reg[1] [6]),
        .R(reset));
  FDRE \history_reg[1][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [7]),
        .Q(\history_reg[1] [7]),
        .R(reset));
  FDRE \history_reg[1][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [8]),
        .Q(\history_reg[1] [8]),
        .R(reset));
  FDRE \history_reg[2][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [0]),
        .Q(\history_reg[2] [0]),
        .R(reset));
  FDRE \history_reg[2][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [1]),
        .Q(\history_reg[2] [1]),
        .R(reset));
  FDRE \history_reg[2][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [2]),
        .Q(\history_reg[2] [2]),
        .R(reset));
  FDRE \history_reg[2][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [3]),
        .Q(\history_reg[2] [3]),
        .R(reset));
  FDRE \history_reg[2][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [4]),
        .Q(\history_reg[2] [4]),
        .R(reset));
  FDRE \history_reg[2][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [5]),
        .Q(\history_reg[2] [5]),
        .R(reset));
  FDRE \history_reg[2][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [6]),
        .Q(\history_reg[2] [6]),
        .R(reset));
  FDRE \history_reg[2][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [7]),
        .Q(\history_reg[2] [7]),
        .R(reset));
  FDRE \history_reg[2][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [8]),
        .Q(\history_reg[2] [8]),
        .R(reset));
  FDRE \history_reg[3][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [0]),
        .Q(\history_reg[3] [0]),
        .R(reset));
  FDRE \history_reg[3][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [1]),
        .Q(\history_reg[3] [1]),
        .R(reset));
  FDRE \history_reg[3][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [2]),
        .Q(\history_reg[3] [2]),
        .R(reset));
  FDRE \history_reg[3][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [3]),
        .Q(\history_reg[3] [3]),
        .R(reset));
  FDRE \history_reg[3][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [4]),
        .Q(\history_reg[3] [4]),
        .R(reset));
  FDRE \history_reg[3][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [5]),
        .Q(\history_reg[3] [5]),
        .R(reset));
  FDRE \history_reg[3][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [6]),
        .Q(\history_reg[3] [6]),
        .R(reset));
  FDRE \history_reg[3][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [7]),
        .Q(\history_reg[3] [7]),
        .R(reset));
  FDRE \history_reg[3][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [8]),
        .Q(\history_reg[3] [8]),
        .R(reset));
  FDRE \history_reg[4][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [0]),
        .Q(\history_reg[4] [0]),
        .R(reset));
  FDRE \history_reg[4][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [1]),
        .Q(\history_reg[4] [1]),
        .R(reset));
  FDRE \history_reg[4][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [2]),
        .Q(\history_reg[4] [2]),
        .R(reset));
  FDRE \history_reg[4][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [3]),
        .Q(\history_reg[4] [3]),
        .R(reset));
  FDRE \history_reg[4][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [4]),
        .Q(\history_reg[4] [4]),
        .R(reset));
  FDRE \history_reg[4][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [5]),
        .Q(\history_reg[4] [5]),
        .R(reset));
  FDRE \history_reg[4][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [6]),
        .Q(\history_reg[4] [6]),
        .R(reset));
  FDRE \history_reg[4][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [7]),
        .Q(\history_reg[4] [7]),
        .R(reset));
  FDRE \history_reg[4][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [8]),
        .Q(\history_reg[4] [8]),
        .R(reset));
  FDRE \history_reg[5][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [0]),
        .Q(\history_reg[5] [0]),
        .R(reset));
  FDRE \history_reg[5][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [1]),
        .Q(\history_reg[5] [1]),
        .R(reset));
  FDRE \history_reg[5][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [2]),
        .Q(\history_reg[5] [2]),
        .R(reset));
  FDRE \history_reg[5][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [3]),
        .Q(\history_reg[5] [3]),
        .R(reset));
  FDRE \history_reg[5][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [4]),
        .Q(\history_reg[5] [4]),
        .R(reset));
  FDRE \history_reg[5][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [5]),
        .Q(\history_reg[5] [5]),
        .R(reset));
  FDRE \history_reg[5][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [6]),
        .Q(\history_reg[5] [6]),
        .R(reset));
  FDRE \history_reg[5][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [7]),
        .Q(\history_reg[5] [7]),
        .R(reset));
  FDRE \history_reg[5][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [8]),
        .Q(\history_reg[5] [8]),
        .R(reset));
  FDRE \history_reg[6][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [0]),
        .Q(\history_reg[6] [0]),
        .R(reset));
  FDRE \history_reg[6][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [1]),
        .Q(\history_reg[6] [1]),
        .R(reset));
  FDRE \history_reg[6][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [2]),
        .Q(\history_reg[6] [2]),
        .R(reset));
  FDRE \history_reg[6][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [3]),
        .Q(\history_reg[6] [3]),
        .R(reset));
  FDRE \history_reg[6][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [4]),
        .Q(\history_reg[6] [4]),
        .R(reset));
  FDRE \history_reg[6][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [5]),
        .Q(\history_reg[6] [5]),
        .R(reset));
  FDRE \history_reg[6][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [6]),
        .Q(\history_reg[6] [6]),
        .R(reset));
  FDRE \history_reg[6][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [7]),
        .Q(\history_reg[6] [7]),
        .R(reset));
  FDRE \history_reg[6][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [8]),
        .Q(\history_reg[6] [8]),
        .R(reset));
  FDRE \history_reg[7][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [0]),
        .Q(\history_reg[7] [0]),
        .R(reset));
  FDRE \history_reg[7][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [1]),
        .Q(\history_reg[7] [1]),
        .R(reset));
  FDRE \history_reg[7][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [2]),
        .Q(\history_reg[7] [2]),
        .R(reset));
  FDRE \history_reg[7][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [3]),
        .Q(\history_reg[7] [3]),
        .R(reset));
  FDRE \history_reg[7][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [4]),
        .Q(\history_reg[7] [4]),
        .R(reset));
  FDRE \history_reg[7][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [5]),
        .Q(\history_reg[7] [5]),
        .R(reset));
  FDRE \history_reg[7][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [6]),
        .Q(\history_reg[7] [6]),
        .R(reset));
  FDRE \history_reg[7][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [7]),
        .Q(\history_reg[7] [7]),
        .R(reset));
  FDRE \history_reg[7][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [8]),
        .Q(\history_reg[7] [8]),
        .R(reset));
  FDRE \history_reg[8][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [0]),
        .Q(\history_reg[8] [0]),
        .R(reset));
  FDRE \history_reg[8][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [1]),
        .Q(\history_reg[8] [1]),
        .R(reset));
  FDRE \history_reg[8][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [2]),
        .Q(\history_reg[8] [2]),
        .R(reset));
  FDRE \history_reg[8][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [3]),
        .Q(\history_reg[8] [3]),
        .R(reset));
  FDRE \history_reg[8][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [4]),
        .Q(\history_reg[8] [4]),
        .R(reset));
  FDRE \history_reg[8][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [5]),
        .Q(\history_reg[8] [5]),
        .R(reset));
  FDRE \history_reg[8][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [6]),
        .Q(\history_reg[8] [6]),
        .R(reset));
  FDRE \history_reg[8][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [7]),
        .Q(\history_reg[8] [7]),
        .R(reset));
  FDRE \history_reg[8][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [8]),
        .Q(\history_reg[8] [8]),
        .R(reset));
  FDRE \history_reg[9][0] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [0]),
        .Q(\history_reg[9] [0]),
        .R(reset));
  FDRE \history_reg[9][1] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [1]),
        .Q(\history_reg[9] [1]),
        .R(reset));
  FDRE \history_reg[9][2] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [2]),
        .Q(\history_reg[9] [2]),
        .R(reset));
  FDRE \history_reg[9][3] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [3]),
        .Q(\history_reg[9] [3]),
        .R(reset));
  FDRE \history_reg[9][4] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [4]),
        .Q(\history_reg[9] [4]),
        .R(reset));
  FDRE \history_reg[9][5] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [5]),
        .Q(\history_reg[9] [5]),
        .R(reset));
  FDRE \history_reg[9][6] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [6]),
        .Q(\history_reg[9] [6]),
        .R(reset));
  FDRE \history_reg[9][7] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [7]),
        .Q(\history_reg[9] [7]),
        .R(reset));
  FDRE \history_reg[9][8] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [8]),
        .Q(\history_reg[9] [8]),
        .R(reset));
  LUT1 #(
    .INIT(2'h1)) 
    \index[0]_i_1 
       (.I0(index_reg[0]),
        .O(\index[0]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "191" *) 
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \index[1]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .O(\index[1]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "191" *) 
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \index[2]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .I2(index_reg[2]),
        .O(\index[2]_i_1_n_0 ));
  (* \PinAttr:I0:HOLD_DETOUR  = "197" *) 
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \index[3]_i_1 
       (.I0(index_reg[1]),
        .I1(index_reg[0]),
        .I2(index_reg[2]),
        .I3(index_reg[3]),
        .O(\index[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \index[4]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(reset),
        .O(\index[4]_i_1_n_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "197" *) 
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \index[4]_i_2 
       (.I0(index_reg[2]),
        .I1(index_reg[0]),
        .I2(index_reg[1]),
        .I3(index_reg[3]),
        .O(p_0_in__0));
  FDRE \index_reg[0] 
       (.C(clk),
        .CE(issue),
        .D(\index[0]_i_1_n_0 ),
        .Q(index_reg[0]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[1] 
       (.C(clk),
        .CE(issue),
        .D(\index[1]_i_1_n_0 ),
        .Q(index_reg[1]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[2] 
       (.C(clk),
        .CE(issue),
        .D(\index[2]_i_1_n_0 ),
        .Q(index_reg[2]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[3] 
       (.C(clk),
        .CE(issue),
        .D(\index[3]_i_1_n_0 ),
        .Q(index_reg[3]),
        .R(\index[4]_i_1_n_0 ));
  FDRE \index_reg[4] 
       (.C(clk),
        .CE(issue),
        .D(p_0_in__0),
        .Q(index_reg[4]),
        .R(\index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \lastpipe[0]_i_1 
       (.I0(busy_reg_n_0),
        .I1(index_reg[2]),
        .I2(index_reg[3]),
        .I3(index_reg[0]),
        .I4(index_reg[1]),
        .I5(index_reg[4]),
        .O(\lastpipe[0]_i_1_n_0 ));
  FDRE \lastpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe[0]_i_1_n_0 ),
        .Q(\lastpipe_reg_n_0_[0] ),
        .R(reset));
  FDRE \lastpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe_reg_n_0_[0] ),
        .Q(\lastpipe_reg_n_0_[1] ),
        .R(reset));
  FDRE \lastpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\lastpipe_reg_n_0_[1] ),
        .Q(p_1_in),
        .R(reset));
  LUT2 #(
    .INIT(4'h8)) 
    \result[39]_i_1 
       (.I0(p_0_in),
        .I1(p_1_in),
        .O(\result[39]_i_1_n_0 ));
  FDRE \result_reg[0] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[0]),
        .Q(result[0]),
        .R(reset));
  FDRE \result_reg[10] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[10]),
        .Q(result[10]),
        .R(reset));
  FDRE \result_reg[11] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[11]),
        .Q(result[11]),
        .R(reset));
  FDRE \result_reg[12] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[12]),
        .Q(result[12]),
        .R(reset));
  FDRE \result_reg[13] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[13]),
        .Q(result[13]),
        .R(reset));
  FDRE \result_reg[14] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[14]),
        .Q(result[14]),
        .R(reset));
  FDRE \result_reg[15] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[15]),
        .Q(result[15]),
        .R(reset));
  FDRE \result_reg[16] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[16]),
        .Q(result[16]),
        .R(reset));
  FDRE \result_reg[17] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[17]),
        .Q(result[17]),
        .R(reset));
  FDRE \result_reg[18] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[18]),
        .Q(result[18]),
        .R(reset));
  FDRE \result_reg[19] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[19]),
        .Q(result[19]),
        .R(reset));
  FDRE \result_reg[1] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[1]),
        .Q(result[1]),
        .R(reset));
  FDRE \result_reg[20] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[20]),
        .Q(result[20]),
        .R(reset));
  FDRE \result_reg[21] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[21]),
        .Q(result[21]),
        .R(reset));
  FDRE \result_reg[22] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[22]),
        .Q(result[22]),
        .R(reset));
  FDRE \result_reg[23] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[23]),
        .Q(result[23]),
        .R(reset));
  FDRE \result_reg[24] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[24]),
        .Q(result[24]),
        .R(reset));
  FDRE \result_reg[25] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[25]),
        .Q(result[25]),
        .R(reset));
  FDRE \result_reg[26] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[26]),
        .Q(result[26]),
        .R(reset));
  FDRE \result_reg[27] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[27]),
        .Q(result[27]),
        .R(reset));
  FDRE \result_reg[28] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[28]),
        .Q(result[28]),
        .R(reset));
  FDRE \result_reg[29] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[29]),
        .Q(result[29]),
        .R(reset));
  FDRE \result_reg[2] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[2]),
        .Q(result[2]),
        .R(reset));
  FDRE \result_reg[30] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[30]),
        .Q(result[30]),
        .R(reset));
  FDRE \result_reg[31] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[31]),
        .Q(result[31]),
        .R(reset));
  FDRE \result_reg[32] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[32]),
        .Q(result[32]),
        .R(reset));
  FDRE \result_reg[33] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[33]),
        .Q(result[33]),
        .R(reset));
  FDRE \result_reg[34] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[34]),
        .Q(result[34]),
        .R(reset));
  FDRE \result_reg[35] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[35]),
        .Q(result[35]),
        .R(reset));
  FDRE \result_reg[36] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[36]),
        .Q(result[36]),
        .R(reset));
  FDRE \result_reg[37] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[37]),
        .Q(result[37]),
        .R(reset));
  FDRE \result_reg[38] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[38]),
        .Q(result[38]),
        .R(reset));
  FDRE \result_reg[39] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[39]),
        .Q(result[39]),
        .R(reset));
  FDRE \result_reg[3] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[3]),
        .Q(result[3]),
        .R(reset));
  FDRE \result_reg[4] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[4]),
        .Q(result[4]),
        .R(reset));
  FDRE \result_reg[5] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[5]),
        .Q(result[5]),
        .R(reset));
  FDRE \result_reg[6] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[6]),
        .Q(result[6]),
        .R(reset));
  FDRE \result_reg[7] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[7]),
        .Q(result[7]),
        .R(reset));
  FDRE \result_reg[8] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[8]),
        .Q(result[8]),
        .R(reset));
  FDRE \result_reg[9] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[9]),
        .Q(result[9]),
        .R(reset));
  LUT3 #(
    .INIT(8'h08)) 
    result_valid_i_1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(reset),
        .O(result_valid_i_1_n_0));
  FDRE result_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(result_valid_i_1_n_0),
        .Q(result_valid),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    sample_ready_INST_0
       (.I0(busy_reg_n_0),
        .I1(coeff_we),
        .O(sample_ready));
  FDRE \vpipe_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(issue),
        .Q(\vpipe_reg_n_0_[0] ),
        .R(reset));
  FDRE \vpipe_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\vpipe_reg_n_0_[0] ),
        .Q(\vpipe_reg_n_0_[1] ),
        .R(reset));
  FDRE \vpipe_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\vpipe_reg_n_0_[1] ),
        .Q(p_0_in),
        .R(reset));
endmodule

module r23_fir9_serial_then_quadol_signed
   (issue,
    \vpipe_reg[2] ,
    D,
    \vpipe_reg[2]_0 ,
    \vpipe_reg[2]_1 ,
    \vpipe_reg[2]_2 ,
    \vpipe_reg[2]_3 ,
    \vpipe_reg[2]_4 ,
    \vpipe_reg[2]_5 ,
    \vpipe_reg[2]_6 ,
    \vpipe_reg[2]_7 ,
    \vpipe_reg[2]_8 ,
    \vpipe_reg[2]_9 ,
    \vpipe_reg[2]_10 ,
    \vpipe_reg[2]_11 ,
    \vpipe_reg[2]_12 ,
    \vpipe_reg[2]_13 ,
    \vpipe_reg[2]_14 ,
    \vpipe_reg[2]_15 ,
    \vpipe_reg[2]_16 ,
    \vpipe_reg[2]_17 ,
    \vpipe_reg[2]_18 ,
    \vpipe_reg[2]_19 ,
    \vpipe_reg[2]_20 ,
    \vpipe_reg[2]_21 ,
    \vpipe_reg[2]_22 ,
    \vpipe_reg[2]_23 ,
    \vpipe_reg[2]_24 ,
    \vpipe_reg[2]_25 ,
    \vpipe_reg[2]_26 ,
    \vpipe_reg[2]_27 ,
    \vpipe_reg[2]_28 ,
    \vpipe_reg[2]_29 ,
    \vpipe_reg[2]_30 ,
    \vpipe_reg[2]_31 ,
    \vpipe_reg[2]_32 ,
    \vpipe_reg[2]_33 ,
    \vpipe_reg[2]_34 ,
    \vpipe_reg[2]_35 ,
    \vpipe_reg[2]_36 ,
    \vpipe_reg[2]_37 ,
    \vpipe_reg[2]_38 ,
    clk,
    b0,
    index_reg_4_sp_1,
    index_reg,
    Q,
    c113_i_4,
    c113_i_4_0,
    c113_i_4_1,
    c113_i_4_2,
    c113_i_4_3,
    c113_i_4_4,
    c113_i_4_5,
    c113_i_2,
    c113_i_2_0,
    c113_i_2_1,
    c113_i_2_2,
    c113_i_2_3,
    c113_i_2_4,
    c113_i_2_5,
    c113_i_2_6,
    \acc_reg[0] ,
    acc,
    \result_reg[3] );
  output issue;
  output \vpipe_reg[2] ;
  output [39:0]D;
  output \vpipe_reg[2]_0 ;
  output \vpipe_reg[2]_1 ;
  output \vpipe_reg[2]_2 ;
  output \vpipe_reg[2]_3 ;
  output \vpipe_reg[2]_4 ;
  output \vpipe_reg[2]_5 ;
  output \vpipe_reg[2]_6 ;
  output \vpipe_reg[2]_7 ;
  output \vpipe_reg[2]_8 ;
  output \vpipe_reg[2]_9 ;
  output \vpipe_reg[2]_10 ;
  output \vpipe_reg[2]_11 ;
  output \vpipe_reg[2]_12 ;
  output \vpipe_reg[2]_13 ;
  output \vpipe_reg[2]_14 ;
  output \vpipe_reg[2]_15 ;
  output \vpipe_reg[2]_16 ;
  output \vpipe_reg[2]_17 ;
  output \vpipe_reg[2]_18 ;
  output \vpipe_reg[2]_19 ;
  output \vpipe_reg[2]_20 ;
  output \vpipe_reg[2]_21 ;
  output \vpipe_reg[2]_22 ;
  output \vpipe_reg[2]_23 ;
  output \vpipe_reg[2]_24 ;
  output \vpipe_reg[2]_25 ;
  output \vpipe_reg[2]_26 ;
  output \vpipe_reg[2]_27 ;
  output \vpipe_reg[2]_28 ;
  output \vpipe_reg[2]_29 ;
  output \vpipe_reg[2]_30 ;
  output \vpipe_reg[2]_31 ;
  output \vpipe_reg[2]_32 ;
  output \vpipe_reg[2]_33 ;
  output \vpipe_reg[2]_34 ;
  output \vpipe_reg[2]_35 ;
  output \vpipe_reg[2]_36 ;
  output \vpipe_reg[2]_37 ;
  output \vpipe_reg[2]_38 ;
  input clk;
  input [8:0]b0;
  input index_reg_4_sp_1;
  input [4:0]index_reg;
  input [8:0]Q;
  input [8:0]c113_i_4;
  input [8:0]c113_i_4_0;
  input [8:0]c113_i_4_1;
  input [8:0]c113_i_4_2;
  input [8:0]c113_i_4_3;
  input [8:0]c113_i_4_4;
  input [8:0]c113_i_4_5;
  input [8:0]c113_i_2;
  input [8:0]c113_i_2_0;
  input [8:0]c113_i_2_1;
  input [8:0]c113_i_2_2;
  input [8:0]c113_i_2_3;
  input [8:0]c113_i_2_4;
  input [8:0]c113_i_2_5;
  input [8:0]c113_i_2_6;
  input [0:0]\acc_reg[0] ;
  input [39:0]acc;
  input [0:0]\result_reg[3] ;

  wire [39:0]D;
  wire [8:0]Q;
  wire \Y[11]_i_2_n_0 ;
  wire \Y[11]_i_3_n_0 ;
  wire \Y[11]_i_4_n_0 ;
  wire \Y[11]_i_5_n_0 ;
  wire \Y[15]_i_2_n_0 ;
  wire \Y[15]_i_3_n_0 ;
  wire \Y[15]_i_4_n_0 ;
  wire \Y[15]_i_5_n_0 ;
  wire \Y[19]_i_2_n_0 ;
  wire \Y[19]_i_3_n_0 ;
  wire \Y[3]_i_2_n_0 ;
  wire \Y[3]_i_3_n_0 ;
  wire \Y[3]_i_4_n_0 ;
  wire \Y[7]_i_2_n_0 ;
  wire \Y[7]_i_3_n_0 ;
  wire \Y_reg_n_0_[0] ;
  wire \Y_reg_n_0_[10] ;
  wire \Y_reg_n_0_[11] ;
  wire \Y_reg_n_0_[12] ;
  wire \Y_reg_n_0_[13] ;
  wire \Y_reg_n_0_[14] ;
  wire \Y_reg_n_0_[15] ;
  wire \Y_reg_n_0_[16] ;
  wire \Y_reg_n_0_[17] ;
  wire \Y_reg_n_0_[18] ;
  wire \Y_reg_n_0_[19] ;
  wire \Y_reg_n_0_[1] ;
  wire \Y_reg_n_0_[20] ;
  wire \Y_reg_n_0_[21] ;
  wire \Y_reg_n_0_[22] ;
  wire \Y_reg_n_0_[23] ;
  wire \Y_reg_n_0_[24] ;
  wire \Y_reg_n_0_[25] ;
  wire \Y_reg_n_0_[26] ;
  wire \Y_reg_n_0_[27] ;
  wire \Y_reg_n_0_[28] ;
  wire \Y_reg_n_0_[29] ;
  wire \Y_reg_n_0_[2] ;
  wire \Y_reg_n_0_[30] ;
  wire \Y_reg_n_0_[31] ;
  wire \Y_reg_n_0_[3] ;
  wire \Y_reg_n_0_[4] ;
  wire \Y_reg_n_0_[5] ;
  wire \Y_reg_n_0_[6] ;
  wire \Y_reg_n_0_[7] ;
  wire \Y_reg_n_0_[8] ;
  wire \Y_reg_n_0_[9] ;
  wire [15:15]a;
  wire [39:0]acc;
  wire [0:0]\acc_reg[0] ;
  wire [8:0]b0;
  wire [8:0]c113_i_2;
  wire [8:0]c113_i_2_0;
  wire [8:0]c113_i_2_1;
  wire [8:0]c113_i_2_2;
  wire [8:0]c113_i_2_3;
  wire [8:0]c113_i_2_4;
  wire [8:0]c113_i_2_5;
  wire [8:0]c113_i_2_6;
  wire [8:0]c113_i_4;
  wire [8:0]c113_i_4_0;
  wire [8:0]c113_i_4_1;
  wire [8:0]c113_i_4_2;
  wire [8:0]c113_i_4_3;
  wire [8:0]c113_i_4_4;
  wire [8:0]c113_i_4_5;
  wire clk;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire issue;
  wire [17:1]p;
  wire \result[11]_i_2_n_0 ;
  wire \result[11]_i_3_n_0 ;
  wire \result[11]_i_4_n_0 ;
  wire \result[11]_i_5_n_0 ;
  wire \result[15]_i_2_n_0 ;
  wire \result[15]_i_3_n_0 ;
  wire \result[15]_i_4_n_0 ;
  wire \result[15]_i_5_n_0 ;
  wire \result[19]_i_2_n_0 ;
  wire \result[19]_i_3_n_0 ;
  wire \result[19]_i_4_n_0 ;
  wire \result[19]_i_5_n_0 ;
  wire \result[23]_i_2_n_0 ;
  wire \result[23]_i_3_n_0 ;
  wire \result[23]_i_4_n_0 ;
  wire \result[23]_i_5_n_0 ;
  wire \result[27]_i_2_n_0 ;
  wire \result[27]_i_3_n_0 ;
  wire \result[27]_i_4_n_0 ;
  wire \result[27]_i_5_n_0 ;
  wire \result[31]_i_2_n_0 ;
  wire \result[31]_i_3_n_0 ;
  wire \result[31]_i_4_n_0 ;
  wire \result[31]_i_5_n_0 ;
  wire \result[35]_i_2_n_0 ;
  wire \result[35]_i_3_n_0 ;
  wire \result[35]_i_4_n_0 ;
  wire \result[35]_i_5_n_0 ;
  wire \result[35]_i_6_n_0 ;
  wire \result[35]_i_7_n_0 ;
  wire \result[35]_i_8_n_0 ;
  wire \result[35]_i_9_n_0 ;
  wire \result[39]_i_3_n_0 ;
  wire \result[39]_i_4_n_0 ;
  wire \result[39]_i_5_n_0 ;
  wire \result[39]_i_6_n_0 ;
  wire \result[39]_i_7_n_0 ;
  wire \result[39]_i_8_n_0 ;
  wire \result[39]_i_9_n_0 ;
  wire \result[3]_i_2_n_0 ;
  wire \result[3]_i_3_n_0 ;
  wire \result[3]_i_4_n_0 ;
  wire \result[3]_i_5_n_0 ;
  wire \result[7]_i_2_n_0 ;
  wire \result[7]_i_3_n_0 ;
  wire \result[7]_i_4_n_0 ;
  wire \result[7]_i_5_n_0 ;
  wire \result_reg[11]_i_1_n_0 ;
  wire \result_reg[15]_i_1_n_0 ;
  wire \result_reg[19]_i_1_n_0 ;
  wire \result_reg[23]_i_1_n_0 ;
  wire \result_reg[27]_i_1_n_0 ;
  wire \result_reg[31]_i_1_n_0 ;
  wire \result_reg[35]_i_1_n_0 ;
  wire [0:0]\result_reg[3] ;
  wire \result_reg[3]_i_1_n_0 ;
  wire \result_reg[7]_i_1_n_0 ;
  wire s1;
  wire s1_i_1_n_0;
  wire s2;
  wire u_n_10;
  wire u_n_11;
  wire u_n_12;
  wire u_n_13;
  wire u_n_14;
  wire u_n_15;
  wire u_n_16;
  wire u_n_17;
  wire u_n_18;
  wire u_n_19;
  wire u_n_2;
  wire u_n_20;
  wire u_n_21;
  wire u_n_22;
  wire u_n_23;
  wire u_n_24;
  wire u_n_25;
  wire u_n_26;
  wire u_n_27;
  wire u_n_28;
  wire u_n_29;
  wire u_n_3;
  wire u_n_30;
  wire u_n_31;
  wire u_n_32;
  wire u_n_33;
  wire u_n_4;
  wire u_n_5;
  wire u_n_6;
  wire u_n_7;
  wire u_n_8;
  wire u_n_9;
  wire \vpipe_reg[2] ;
  wire \vpipe_reg[2]_0 ;
  wire \vpipe_reg[2]_1 ;
  wire \vpipe_reg[2]_10 ;
  wire \vpipe_reg[2]_11 ;
  wire \vpipe_reg[2]_12 ;
  wire \vpipe_reg[2]_13 ;
  wire \vpipe_reg[2]_14 ;
  wire \vpipe_reg[2]_15 ;
  wire \vpipe_reg[2]_16 ;
  wire \vpipe_reg[2]_17 ;
  wire \vpipe_reg[2]_18 ;
  wire \vpipe_reg[2]_19 ;
  wire \vpipe_reg[2]_2 ;
  wire \vpipe_reg[2]_20 ;
  wire \vpipe_reg[2]_21 ;
  wire \vpipe_reg[2]_22 ;
  wire \vpipe_reg[2]_23 ;
  wire \vpipe_reg[2]_24 ;
  wire \vpipe_reg[2]_25 ;
  wire \vpipe_reg[2]_26 ;
  wire \vpipe_reg[2]_27 ;
  wire \vpipe_reg[2]_28 ;
  wire \vpipe_reg[2]_29 ;
  wire \vpipe_reg[2]_3 ;
  wire \vpipe_reg[2]_30 ;
  wire \vpipe_reg[2]_31 ;
  wire \vpipe_reg[2]_32 ;
  wire \vpipe_reg[2]_33 ;
  wire \vpipe_reg[2]_34 ;
  wire \vpipe_reg[2]_35 ;
  wire \vpipe_reg[2]_36 ;
  wire \vpipe_reg[2]_37 ;
  wire \vpipe_reg[2]_38 ;
  wire \vpipe_reg[2]_4 ;
  wire \vpipe_reg[2]_5 ;
  wire \vpipe_reg[2]_6 ;
  wire \vpipe_reg[2]_7 ;
  wire \vpipe_reg[2]_8 ;
  wire \vpipe_reg[2]_9 ;
  wire [2:0]\NLW_result_reg[11]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[15]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[19]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[23]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[27]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[31]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[35]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[39]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[3]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:3]NLW_u_Y_UNCONNECTED;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_2 
       (.I0(s2),
        .I1(p[11]),
        .O(\Y[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_3 
       (.I0(s2),
        .I1(p[10]),
        .O(\Y[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_4 
       (.I0(s2),
        .I1(p[9]),
        .O(\Y[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[11]_i_5 
       (.I0(s2),
        .I1(p[8]),
        .O(\Y[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_2 
       (.I0(s2),
        .I1(p[15]),
        .O(\Y[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_3 
       (.I0(s2),
        .I1(p[14]),
        .O(\Y[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_4 
       (.I0(s2),
        .I1(p[13]),
        .O(\Y[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[15]_i_5 
       (.I0(s2),
        .I1(p[12]),
        .O(\Y[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[19]_i_2 
       (.I0(s2),
        .I1(p[17]),
        .O(\Y[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[19]_i_3 
       (.I0(s2),
        .I1(p[16]),
        .O(\Y[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[3]_i_2 
       (.I0(s2),
        .I1(p[3]),
        .O(\Y[3]_i_2_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "156" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Y[3]_i_3 
       (.I0(s2),
        .I1(p[2]),
        .O(\Y[3]_i_3_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "154" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Y[3]_i_4 
       (.I0(s2),
        .I1(p[1]),
        .O(\Y[3]_i_4_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "156" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_i_2 
       (.I0(s2),
        .I1(p[6]),
        .O(\Y[7]_i_2_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "154" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \Y[7]_i_3 
       (.I0(s2),
        .I1(p[5]),
        .O(\Y[7]_i_3_n_0 ));
  FDRE \Y_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_33),
        .Q(\Y_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \Y_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_23),
        .Q(\Y_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \Y_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_22),
        .Q(\Y_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \Y_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_21),
        .Q(\Y_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \Y_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_20),
        .Q(\Y_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \Y_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_19),
        .Q(\Y_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \Y_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_18),
        .Q(\Y_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \Y_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_17),
        .Q(\Y_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \Y_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_16),
        .Q(\Y_reg_n_0_[17] ),
        .R(1'b0));
  FDRE \Y_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_15),
        .Q(\Y_reg_n_0_[18] ),
        .R(1'b0));
  FDRE \Y_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_14),
        .Q(\Y_reg_n_0_[19] ),
        .R(1'b0));
  FDRE \Y_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_32),
        .Q(\Y_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \Y_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_13),
        .Q(\Y_reg_n_0_[20] ),
        .R(1'b0));
  FDRE \Y_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_12),
        .Q(\Y_reg_n_0_[21] ),
        .R(1'b0));
  FDRE \Y_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_11),
        .Q(\Y_reg_n_0_[22] ),
        .R(1'b0));
  FDRE \Y_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_10),
        .Q(\Y_reg_n_0_[23] ),
        .R(1'b0));
  FDRE \Y_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_9),
        .Q(\Y_reg_n_0_[24] ),
        .R(1'b0));
  FDRE \Y_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_8),
        .Q(\Y_reg_n_0_[25] ),
        .R(1'b0));
  FDRE \Y_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_7),
        .Q(\Y_reg_n_0_[26] ),
        .R(1'b0));
  FDRE \Y_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_6),
        .Q(\Y_reg_n_0_[27] ),
        .R(1'b0));
  FDRE \Y_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_5),
        .Q(\Y_reg_n_0_[28] ),
        .R(1'b0));
  FDRE \Y_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_4),
        .Q(\Y_reg_n_0_[29] ),
        .R(1'b0));
  FDRE \Y_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_31),
        .Q(\Y_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \Y_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_3),
        .Q(\Y_reg_n_0_[30] ),
        .R(1'b0));
  FDRE \Y_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_2),
        .Q(\Y_reg_n_0_[31] ),
        .R(1'b0));
  FDRE \Y_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_30),
        .Q(\Y_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \Y_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_29),
        .Q(\Y_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \Y_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_28),
        .Q(\Y_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \Y_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_27),
        .Q(\Y_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \Y_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_26),
        .Q(\Y_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \Y_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_25),
        .Q(\Y_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \Y_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_24),
        .Q(\Y_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[0]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[0]),
        .O(\vpipe_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[10]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[10]),
        .O(\vpipe_reg[2]_9 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[11]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[11]),
        .O(\vpipe_reg[2]_10 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[12]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[12]),
        .O(\vpipe_reg[2]_11 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[13]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[13]),
        .O(\vpipe_reg[2]_12 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[14]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[14]),
        .O(\vpipe_reg[2]_13 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[15]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[15]),
        .O(\vpipe_reg[2]_14 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[16]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[16]),
        .O(\vpipe_reg[2]_15 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[17]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[17]),
        .O(\vpipe_reg[2]_16 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[18]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[18]),
        .O(\vpipe_reg[2]_17 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[19]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[19]),
        .O(\vpipe_reg[2]_18 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[1]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[1]),
        .O(\vpipe_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[20]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[20]),
        .O(\vpipe_reg[2]_19 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[21]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[21]),
        .O(\vpipe_reg[2]_20 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[22]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[22]),
        .O(\vpipe_reg[2]_21 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[23]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[23]),
        .O(\vpipe_reg[2]_22 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[24]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[24]),
        .O(\vpipe_reg[2]_23 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[25]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[25]),
        .O(\vpipe_reg[2]_24 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[26]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[26]),
        .O(\vpipe_reg[2]_25 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[27]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[27]),
        .O(\vpipe_reg[2]_26 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[28]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[28]),
        .O(\vpipe_reg[2]_27 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[29]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[29]),
        .O(\vpipe_reg[2]_28 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[2]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[2]),
        .O(\vpipe_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[30]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[30]),
        .O(\vpipe_reg[2]_29 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[31]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[31]),
        .O(\vpipe_reg[2]_30 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[32]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[32]),
        .O(\vpipe_reg[2]_31 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[33]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[33]),
        .O(\vpipe_reg[2]_32 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[34]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[34]),
        .O(\vpipe_reg[2]_33 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[35]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[35]),
        .O(\vpipe_reg[2]_34 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[36]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[36]),
        .O(\vpipe_reg[2]_35 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[37]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[37]),
        .O(\vpipe_reg[2]_36 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[38]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[38]),
        .O(\vpipe_reg[2]_37 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[39]_i_2 
       (.I0(\acc_reg[0] ),
        .I1(D[39]),
        .O(\vpipe_reg[2]_38 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[3]),
        .O(\vpipe_reg[2]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[4]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[4]),
        .O(\vpipe_reg[2]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[5]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[5]),
        .O(\vpipe_reg[2]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[6]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[6]),
        .O(\vpipe_reg[2]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[7]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[7]),
        .O(\vpipe_reg[2]_6 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[8]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[8]),
        .O(\vpipe_reg[2]_7 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[9]_i_1 
       (.I0(\acc_reg[0] ),
        .I1(D[9]),
        .O(\vpipe_reg[2]_8 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[11]),
        .I2(\Y_reg_n_0_[11] ),
        .O(\result[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[10]),
        .I2(\Y_reg_n_0_[10] ),
        .O(\result[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[9]),
        .I2(\Y_reg_n_0_[9] ),
        .O(\result[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[11]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[8]),
        .I2(\Y_reg_n_0_[8] ),
        .O(\result[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[15]),
        .I2(\Y_reg_n_0_[15] ),
        .O(\result[15]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[14]),
        .I2(\Y_reg_n_0_[14] ),
        .O(\result[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[13]),
        .I2(\Y_reg_n_0_[13] ),
        .O(\result[15]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[15]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[12]),
        .I2(\Y_reg_n_0_[12] ),
        .O(\result[15]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[19]),
        .I2(\Y_reg_n_0_[19] ),
        .O(\result[19]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[18]),
        .I2(\Y_reg_n_0_[18] ),
        .O(\result[19]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[17]),
        .I2(\Y_reg_n_0_[17] ),
        .O(\result[19]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[19]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[16]),
        .I2(\Y_reg_n_0_[16] ),
        .O(\result[19]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[23]),
        .I2(\Y_reg_n_0_[23] ),
        .O(\result[23]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[22]),
        .I2(\Y_reg_n_0_[22] ),
        .O(\result[23]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[21]),
        .I2(\Y_reg_n_0_[21] ),
        .O(\result[23]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[23]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[20]),
        .I2(\Y_reg_n_0_[20] ),
        .O(\result[23]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[27]),
        .I2(\Y_reg_n_0_[27] ),
        .O(\result[27]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[26]),
        .I2(\Y_reg_n_0_[26] ),
        .O(\result[27]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[25]),
        .I2(\Y_reg_n_0_[25] ),
        .O(\result[27]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[27]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[24]),
        .I2(\Y_reg_n_0_[24] ),
        .O(\result[27]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[31]_i_2 
       (.I0(\Y_reg_n_0_[31] ),
        .I1(\result_reg[3] ),
        .I2(acc[31]),
        .O(\result[31]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[30]),
        .I2(\Y_reg_n_0_[30] ),
        .O(\result[31]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[29]),
        .I2(\Y_reg_n_0_[29] ),
        .O(\result[31]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[31]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[28]),
        .I2(\Y_reg_n_0_[28] ),
        .O(\result[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_2 
       (.I0(acc[34]),
        .I1(\result_reg[3] ),
        .O(\result[35]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_3 
       (.I0(acc[33]),
        .I1(\result_reg[3] ),
        .O(\result[35]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[35]_i_4 
       (.I0(acc[32]),
        .I1(\result_reg[3] ),
        .O(\result[35]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[35]_i_5 
       (.I0(\Y_reg_n_0_[31] ),
        .O(\result[35]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_6 
       (.I0(acc[34]),
        .I1(\result_reg[3] ),
        .I2(acc[35]),
        .O(\result[35]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_7 
       (.I0(acc[33]),
        .I1(\result_reg[3] ),
        .I2(acc[34]),
        .O(\result[35]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[35]_i_8 
       (.I0(acc[32]),
        .I1(\result_reg[3] ),
        .I2(acc[33]),
        .O(\result[35]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[35]_i_9 
       (.I0(\Y_reg_n_0_[31] ),
        .I1(\result_reg[3] ),
        .I2(acc[32]),
        .O(\result[35]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_3 
       (.I0(acc[37]),
        .I1(\result_reg[3] ),
        .O(\result[39]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_4 
       (.I0(acc[36]),
        .I1(\result_reg[3] ),
        .O(\result[39]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_5 
       (.I0(acc[35]),
        .I1(\result_reg[3] ),
        .O(\result[39]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_6 
       (.I0(acc[38]),
        .I1(\result_reg[3] ),
        .I2(acc[39]),
        .O(\result[39]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_7 
       (.I0(acc[37]),
        .I1(\result_reg[3] ),
        .I2(acc[38]),
        .O(\result[39]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_8 
       (.I0(acc[36]),
        .I1(\result_reg[3] ),
        .I2(acc[37]),
        .O(\result[39]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_9 
       (.I0(acc[35]),
        .I1(\result_reg[3] ),
        .I2(acc[36]),
        .O(\result[39]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[3]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[3]),
        .I2(\Y_reg_n_0_[3] ),
        .O(\result[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[3]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[2]),
        .I2(\Y_reg_n_0_[2] ),
        .O(\result[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[3]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[1]),
        .I2(\Y_reg_n_0_[1] ),
        .O(\result[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[3]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[0]),
        .I2(\Y_reg_n_0_[0] ),
        .O(\result[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_2 
       (.I0(\result_reg[3] ),
        .I1(acc[7]),
        .I2(\Y_reg_n_0_[7] ),
        .O(\result[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_3 
       (.I0(\result_reg[3] ),
        .I1(acc[6]),
        .I2(\Y_reg_n_0_[6] ),
        .O(\result[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_4 
       (.I0(\result_reg[3] ),
        .I1(acc[5]),
        .I2(\Y_reg_n_0_[5] ),
        .O(\result[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[7]_i_5 
       (.I0(\result_reg[3] ),
        .I1(acc[4]),
        .I2(\Y_reg_n_0_[4] ),
        .O(\result[7]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[11]_i_1 
       (.CI(\result_reg[7]_i_1_n_0 ),
        .CO({\result_reg[11]_i_1_n_0 ,\NLW_result_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[11] ,\Y_reg_n_0_[10] ,\Y_reg_n_0_[9] ,\Y_reg_n_0_[8] }),
        .O(D[11:8]),
        .S({\result[11]_i_2_n_0 ,\result[11]_i_3_n_0 ,\result[11]_i_4_n_0 ,\result[11]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[15]_i_1 
       (.CI(\result_reg[11]_i_1_n_0 ),
        .CO({\result_reg[15]_i_1_n_0 ,\NLW_result_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[15] ,\Y_reg_n_0_[14] ,\Y_reg_n_0_[13] ,\Y_reg_n_0_[12] }),
        .O(D[15:12]),
        .S({\result[15]_i_2_n_0 ,\result[15]_i_3_n_0 ,\result[15]_i_4_n_0 ,\result[15]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[19]_i_1 
       (.CI(\result_reg[15]_i_1_n_0 ),
        .CO({\result_reg[19]_i_1_n_0 ,\NLW_result_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[19] ,\Y_reg_n_0_[18] ,\Y_reg_n_0_[17] ,\Y_reg_n_0_[16] }),
        .O(D[19:16]),
        .S({\result[19]_i_2_n_0 ,\result[19]_i_3_n_0 ,\result[19]_i_4_n_0 ,\result[19]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[23]_i_1 
       (.CI(\result_reg[19]_i_1_n_0 ),
        .CO({\result_reg[23]_i_1_n_0 ,\NLW_result_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[23] ,\Y_reg_n_0_[22] ,\Y_reg_n_0_[21] ,\Y_reg_n_0_[20] }),
        .O(D[23:20]),
        .S({\result[23]_i_2_n_0 ,\result[23]_i_3_n_0 ,\result[23]_i_4_n_0 ,\result[23]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[27]_i_1 
       (.CI(\result_reg[23]_i_1_n_0 ),
        .CO({\result_reg[27]_i_1_n_0 ,\NLW_result_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[27] ,\Y_reg_n_0_[26] ,\Y_reg_n_0_[25] ,\Y_reg_n_0_[24] }),
        .O(D[27:24]),
        .S({\result[27]_i_2_n_0 ,\result[27]_i_3_n_0 ,\result[27]_i_4_n_0 ,\result[27]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[31]_i_1 
       (.CI(\result_reg[27]_i_1_n_0 ),
        .CO({\result_reg[31]_i_1_n_0 ,\NLW_result_reg[31]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[31] ,\Y_reg_n_0_[30] ,\Y_reg_n_0_[29] ,\Y_reg_n_0_[28] }),
        .O(D[31:28]),
        .S({\result[31]_i_2_n_0 ,\result[31]_i_3_n_0 ,\result[31]_i_4_n_0 ,\result[31]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[35]_i_1 
       (.CI(\result_reg[31]_i_1_n_0 ),
        .CO({\result_reg[35]_i_1_n_0 ,\NLW_result_reg[35]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[35]_i_2_n_0 ,\result[35]_i_3_n_0 ,\result[35]_i_4_n_0 ,\result[35]_i_5_n_0 }),
        .O(D[35:32]),
        .S({\result[35]_i_6_n_0 ,\result[35]_i_7_n_0 ,\result[35]_i_8_n_0 ,\result[35]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[39]_i_2 
       (.CI(\result_reg[35]_i_1_n_0 ),
        .CO(\NLW_result_reg[39]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\result[39]_i_3_n_0 ,\result[39]_i_4_n_0 ,\result[39]_i_5_n_0 }),
        .O(D[39:36]),
        .S({\result[39]_i_6_n_0 ,\result[39]_i_7_n_0 ,\result[39]_i_8_n_0 ,\result[39]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\result_reg[3]_i_1_n_0 ,\NLW_result_reg[3]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[3] ,\Y_reg_n_0_[2] ,\Y_reg_n_0_[1] ,\Y_reg_n_0_[0] }),
        .O(D[3:0]),
        .S({\result[3]_i_2_n_0 ,\result[3]_i_3_n_0 ,\result[3]_i_4_n_0 ,\result[3]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_1 
       (.CI(\result_reg[3]_i_1_n_0 ),
        .CO({\result_reg[7]_i_1_n_0 ,\NLW_result_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[7] ,\Y_reg_n_0_[6] ,\Y_reg_n_0_[5] ,\Y_reg_n_0_[4] }),
        .O(D[7:4]),
        .S({\result[7]_i_2_n_0 ,\result[7]_i_3_n_0 ,\result[7]_i_4_n_0 ,\result[7]_i_5_n_0 }));
  LUT4 #(
    .INIT(16'hF708)) 
    s1_i_1
       (.I0(b0[8]),
        .I1(index_reg_4_sn_1),
        .I2(index_reg[4]),
        .I3(a),
        .O(s1_i_1_n_0));
  FDRE s1_reg
       (.C(clk),
        .CE(1'b1),
        .D(s1_i_1_n_0),
        .Q(s1),
        .R(1'b0));
  FDRE s2_reg
       (.C(clk),
        .CE(1'b1),
        .D(s1),
        .Q(s2),
        .R(1'b0));
  r21_mac9_add6_b1024_column_mse_serial_then_quadol u
       (.D({u_n_2,u_n_3,u_n_4,u_n_5,u_n_6,u_n_7,u_n_8,u_n_9,u_n_10,u_n_11,u_n_12,u_n_13,u_n_14,u_n_15,u_n_16,u_n_17,u_n_18,u_n_19,u_n_20,u_n_21,u_n_22,u_n_23,u_n_24,u_n_25,u_n_26,u_n_27,u_n_28,u_n_29,u_n_30,u_n_31,u_n_32,u_n_33}),
        .Q(Q),
        .S({\Y[3]_i_2_n_0 ,\Y[3]_i_3_n_0 ,\Y[3]_i_4_n_0 }),
        .Y({p[17:8],p[6:5],NLW_u_Y_UNCONNECTED[3],p[3:1]}),
        .\Y_reg[11] ({\Y[11]_i_2_n_0 ,\Y[11]_i_3_n_0 ,\Y[11]_i_4_n_0 ,\Y[11]_i_5_n_0 }),
        .\Y_reg[15] ({\Y[15]_i_2_n_0 ,\Y[15]_i_3_n_0 ,\Y[15]_i_4_n_0 ,\Y[15]_i_5_n_0 }),
        .\Y_reg[19] ({\Y[19]_i_2_n_0 ,\Y[19]_i_3_n_0 }),
        .\Y_reg[7] ({\Y[7]_i_2_n_0 ,\Y[7]_i_3_n_0 ,s2}),
        .a(a),
        .b0(b0),
        .busy_reg(issue),
        .c113_i_2_0(c113_i_2),
        .c113_i_2_1(c113_i_2_0),
        .c113_i_2_2(c113_i_2_1),
        .c113_i_2_3(c113_i_2_2),
        .c113_i_2_4(c113_i_2_3),
        .c113_i_2_5(c113_i_2_4),
        .c113_i_2_6(c113_i_2_5),
        .c113_i_2_7(c113_i_2_6),
        .c113_i_4_0(c113_i_4),
        .c113_i_4_1(c113_i_4_0),
        .c113_i_4_2(c113_i_4_1),
        .c113_i_4_3(c113_i_4_2),
        .c113_i_4_4(c113_i_4_3),
        .c113_i_4_5(c113_i_4_4),
        .c113_i_4_6(c113_i_4_5),
        .clk(clk),
        .index_reg(index_reg),
        .index_reg_4_sp_1(index_reg_4_sn_1),
        .s2(s2));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
