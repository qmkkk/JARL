// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
// Date        : Thu Oct 15 16:33:06 2026
// Host        : LAPTOP-T3JRTQ8Q running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -force
//               D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/results/hardware/xc7a100tcsg324-1__r23_fir10_serial_then_quadol/routed.v
// Design      : r23_fir10_serial_then_quadol
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module r21_mac10_add4_b4096_column_mse_serial_then_quadol
   (busy_reg,
    a,
    D,
    Y,
    b0,
    index_reg,
    index_reg_4_sp_1,
    Q,
    c112_i_4_0,
    c112_i_4_1,
    c112_i_4_2,
    c112_i_4_3,
    c112_i_4_4,
    c112_i_4_5,
    c112_i_4_6,
    c112_i_2_0,
    c112_i_2_1,
    c112_i_2_2,
    c112_i_2_3,
    c112_i_2_4,
    c112_i_2_5,
    c112_i_2_6,
    c112_i_2_7,
    s2,
    S,
    \Y_reg[16] ,
    \Y_reg[20] ,
    clk);
  output busy_reg;
  output [0:0]a;
  output [22:0]D;
  output [10:0]Y;
  input [9:0]b0;
  input [4:0]index_reg;
  input index_reg_4_sp_1;
  input [9:0]Q;
  input [9:0]c112_i_4_0;
  input [9:0]c112_i_4_1;
  input [9:0]c112_i_4_2;
  input [9:0]c112_i_4_3;
  input [9:0]c112_i_4_4;
  input [9:0]c112_i_4_5;
  input [9:0]c112_i_4_6;
  input [9:0]c112_i_2_0;
  input [9:0]c112_i_2_1;
  input [9:0]c112_i_2_2;
  input [9:0]c112_i_2_3;
  input [9:0]c112_i_2_4;
  input [9:0]c112_i_2_5;
  input [9:0]c112_i_2_6;
  input [9:0]c112_i_2_7;
  input s2;
  input [3:0]S;
  input [3:0]\Y_reg[16] ;
  input [2:0]\Y_reg[20] ;
  input clk;

  wire [22:0]D;
  wire [9:0]Q;
  wire [3:0]S;
  wire [10:0]Y;
  wire \Y_reg[12]_i_1_n_0 ;
  wire [3:0]\Y_reg[16] ;
  wire \Y_reg[16]_i_1_n_0 ;
  wire [2:0]\Y_reg[20] ;
  wire \Y_reg[20]_i_1_n_0 ;
  wire \Y_reg[24]_i_1_n_0 ;
  wire \Y_reg[28]_i_1_n_0 ;
  wire [0:0]a;
  wire [8:1]a__0;
  wire [0:0]a__0__0;
  wire [9:0]b0;
  wire [0:0]b__0;
  wire busy_reg;
  wire c111_i_2_n_0;
  wire c111_i_3_n_0;
  wire c111_i_4_n_0;
  wire c111_i_5_n_0;
  wire c111_i_6_n_0;
  wire c112_i_10_n_0;
  wire c112_i_11_n_0;
  wire c112_i_12_n_0;
  wire c112_i_13_n_0;
  wire [9:0]c112_i_2_0;
  wire [9:0]c112_i_2_1;
  wire [9:0]c112_i_2_2;
  wire [9:0]c112_i_2_3;
  wire [9:0]c112_i_2_4;
  wire [9:0]c112_i_2_5;
  wire [9:0]c112_i_2_6;
  wire [9:0]c112_i_2_7;
  wire [9:0]c112_i_4_0;
  wire [9:0]c112_i_4_1;
  wire [9:0]c112_i_4_2;
  wire [9:0]c112_i_4_3;
  wire [9:0]c112_i_4_4;
  wire [9:0]c112_i_4_5;
  wire [9:0]c112_i_4_6;
  wire c112_i_4_n_0;
  wire c112_i_5_n_0;
  wire c112_i_6_n_0;
  wire c112_i_7_n_0;
  wire c112_i_8_n_0;
  wire c112_i_9_n_0;
  wire c113_i_3_n_0;
  wire c113_i_4_n_0;
  wire c113_i_5_n_0;
  wire c113_i_6_n_0;
  wire c113_i_7_n_0;
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
  wire c116_i_10_n_0;
  wire c116_i_2_n_0;
  wire c116_i_4_n_0;
  wire c116_i_5_n_0;
  wire c116_i_6_n_0;
  wire c116_i_7_n_0;
  wire c116_i_8_n_0;
  wire c116_i_9_n_0;
  wire c117_i_10_n_0;
  wire c117_i_11_n_0;
  wire c117_i_2_n_0;
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
  wire c119_i_2_n_0;
  wire c119_i_5_n_0;
  wire c119_i_6_n_0;
  wire c119_i_7_n_0;
  wire c119_i_8_n_0;
  wire c119_i_9_n_0;
  wire c129_i_2_n_0;
  wire c131_i_2_n_0;
  wire c133_i_2_n_0;
  wire clk;
  wire [4:0]history;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire [9:1]ma;
  wire [9:1]mb;
  wire s2;
  wire [248:50]v;
  wire [2:0]\NLW_Y_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[24]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_Y_reg[28]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_Y_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_Y_reg[31]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_c101_CO_UNCONNECTED;
  wire [3:3]NLW_c101_O_UNCONNECTED;
  wire [2:0]NLW_c102_CO_UNCONNECTED;
  wire [3:3]NLW_c102_O_UNCONNECTED;
  wire [3:0]NLW_c103_CO_UNCONNECTED;
  wire [3:2]NLW_c103_O_UNCONNECTED;
  wire [3:0]NLW_c104_CO_UNCONNECTED;
  wire [3:3]NLW_c104_O_UNCONNECTED;
  wire [2:0]NLW_c105_CO_UNCONNECTED;
  wire [2:0]NLW_c106_CO_UNCONNECTED;
  wire [2:0]NLW_c89_CO_UNCONNECTED;
  wire [2:0]NLW_c94_CO_UNCONNECTED;
  wire [2:0]NLW_c95_CO_UNCONNECTED;
  wire [0:0]NLW_c95_O_UNCONNECTED;
  wire [2:0]NLW_c96_CO_UNCONNECTED;
  wire [2:0]NLW_c97_CO_UNCONNECTED;
  wire [0:0]NLW_c97_O_UNCONNECTED;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(v[50]));
  (* OPT_MODIFIED = "PROPCONST" *) 
  VCC VCC_1
       (.P(v[86]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[12]_i_1 
       (.CI(1'b0),
        .CO({\Y_reg[12]_i_1_n_0 ,\NLW_Y_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(s2),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[3:0]),
        .S(S));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[16]_i_1 
       (.CI(\Y_reg[12]_i_1_n_0 ),
        .CO({\Y_reg[16]_i_1_n_0 ,\NLW_Y_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[7:4]),
        .S(\Y_reg[16] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[20]_i_1 
       (.CI(\Y_reg[16]_i_1_n_0 ),
        .CO({\Y_reg[20]_i_1_n_0 ,\NLW_Y_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[11:8]),
        .S({s2,\Y_reg[20] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[24]_i_1 
       (.CI(\Y_reg[20]_i_1_n_0 ),
        .CO({\Y_reg[24]_i_1_n_0 ,\NLW_Y_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[15:12]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[28]_i_1 
       (.CI(\Y_reg[24]_i_1_n_0 ),
        .CO({\Y_reg[28]_i_1_n_0 ,\NLW_Y_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(D[19:16]),
        .S({s2,s2,s2,s2}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \Y_reg[31]_i_1 
       (.CI(\Y_reg[28]_i_1_n_0 ),
        .CO(\NLW_Y_reg[31]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_Y_reg[31]_i_1_O_UNCONNECTED [3],D[22:20]}),
        .S({1'b0,s2,s2,s2}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c100
       (.C(clk),
        .CE(1'b1),
        .D(v[214]),
        .Q(Y[10]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c101
       (.CI(v[195]),
        .CO(NLW_c101_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,v[170]}),
        .O({NLW_c101_O_UNCONNECTED[3],v[214:212]}),
        .S({1'b0,v[220],v[221],v[169]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c102
       (.CI(v[199]),
        .CO({v[144],NLW_c102_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,v[160],v[161],v[162]}),
        .O({NLW_c102_O_UNCONNECTED[3],v[100],v[93],v[96]}),
        .S({1'b1,v[163],v[164],v[165]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c103
       (.CI(v[226]),
        .CO({NLW_c103_CO_UNCONNECTED[3],v[179],NLW_c103_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_c103_O_UNCONNECTED[3:2],v[176],v[156]}),
        .S({1'b0,1'b1,v[167],v[168]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c104
       (.CI(v[232]),
        .CO(NLW_c104_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,v[175],v[177]}),
        .O({NLW_c104_O_UNCONNECTED[3],v[220],v[221],v[170]}),
        .S({1'b0,v[178],v[180],v[181]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c105
       (.CI(v[207]),
        .CO(v[226:223]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({v[149],v[151],v[153],v[130]}),
        .S({v[171],v[172],v[173],v[174]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c106
       (.CI(v[203]),
        .CO(v[232:229]),
        .CYINIT(1'b0),
        .DI({v[148],v[150],v[152],v[154]}),
        .O({v[143],v[99],v[92],v[95]}),
        .S({v[155],v[157],v[158],v[159]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT4 #(
    .INIT(16'h566A)) 
    c11
       (.I0(v[60]),
        .I1(v[68]),
        .I2(v[70]),
        .I3(v[69]),
        .O(v[76]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c110
       (.C(clk),
        .CE(1'b1),
        .D(v[190]),
        .Q(Y[0]),
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
        .D(a__0__0),
        .Q(v[128]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c111_i_1
       (.I0(busy_reg),
        .I1(c111_i_2_n_0),
        .I2(index_reg[3]),
        .I3(c111_i_3_n_0),
        .I4(index_reg[2]),
        .I5(c111_i_4_n_0),
        .O(a__0__0));
  MUXF7 c111_i_2
       (.I0(c111_i_5_n_0),
        .I1(c111_i_6_n_0),
        .O(c111_i_2_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c111_i_3
       (.I0(c112_i_2_0[0]),
        .I1(c112_i_2_1[0]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[0]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[0]),
        .O(c111_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c111_i_4
       (.I0(c112_i_2_4[0]),
        .I1(c112_i_2_5[0]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[0]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[0]),
        .O(c111_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c111_i_5
       (.I0(Q[0]),
        .I1(c112_i_4_0[0]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[0]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[0]),
        .O(c111_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c111_i_6
       (.I0(c112_i_4_3[0]),
        .I1(c112_i_4_4[0]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[0]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[0]),
        .O(c111_i_6_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c112
       (.C(clk),
        .CE(1'b1),
        .D(ma[1]),
        .Q(v[125]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h78)) 
    c112_i_1
       (.I0(a__0__0),
        .I1(a),
        .I2(a__0[1]),
        .O(ma[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_10
       (.I0(Q[9]),
        .I1(c112_i_4_0[9]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[9]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[9]),
        .O(c112_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_11
       (.I0(c112_i_4_3[9]),
        .I1(c112_i_4_4[9]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[9]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[9]),
        .O(c112_i_11_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_12
       (.I0(Q[1]),
        .I1(c112_i_4_0[1]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[1]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[1]),
        .O(c112_i_12_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_13
       (.I0(c112_i_4_3[1]),
        .I1(c112_i_4_4[1]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[1]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[1]),
        .O(c112_i_13_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c112_i_2
       (.I0(busy_reg),
        .I1(c112_i_4_n_0),
        .I2(index_reg[3]),
        .I3(c112_i_5_n_0),
        .I4(index_reg[2]),
        .I5(c112_i_6_n_0),
        .O(a));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c112_i_3
       (.I0(busy_reg),
        .I1(c112_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c112_i_8_n_0),
        .I4(index_reg[2]),
        .I5(c112_i_9_n_0),
        .O(a__0[1]));
  MUXF7 c112_i_4
       (.I0(c112_i_10_n_0),
        .I1(c112_i_11_n_0),
        .O(c112_i_4_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_5
       (.I0(c112_i_2_0[9]),
        .I1(c112_i_2_1[9]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[9]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[9]),
        .O(c112_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_6
       (.I0(c112_i_2_4[9]),
        .I1(c112_i_2_5[9]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[9]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[9]),
        .O(c112_i_6_n_0));
  MUXF7 c112_i_7
       (.I0(c112_i_12_n_0),
        .I1(c112_i_13_n_0),
        .O(c112_i_7_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_8
       (.I0(c112_i_2_0[1]),
        .I1(c112_i_2_1[1]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[1]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[1]),
        .O(c112_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c112_i_9
       (.I0(c112_i_2_4[1]),
        .I1(c112_i_2_5[1]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[1]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[1]),
        .O(c112_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c113
       (.C(clk),
        .CE(1'b1),
        .D(ma[2]),
        .Q(v[122]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    c113_i_1
       (.I0(a__0__0),
        .I1(a__0[1]),
        .I2(a),
        .I3(a__0[2]),
        .O(ma[2]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c113_i_2
       (.I0(busy_reg),
        .I1(c113_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c113_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c113_i_5_n_0),
        .O(a__0[2]));
  MUXF7 c113_i_3
       (.I0(c113_i_6_n_0),
        .I1(c113_i_7_n_0),
        .O(c113_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_4
       (.I0(c112_i_2_0[2]),
        .I1(c112_i_2_1[2]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[2]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[2]),
        .O(c113_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_5
       (.I0(c112_i_2_4[2]),
        .I1(c112_i_2_5[2]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[2]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[2]),
        .O(c113_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_6
       (.I0(Q[2]),
        .I1(c112_i_4_0[2]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[2]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[2]),
        .O(c113_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c113_i_7
       (.I0(c112_i_4_3[2]),
        .I1(c112_i_4_4[2]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[2]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[2]),
        .O(c113_i_7_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c114
       (.C(clk),
        .CE(1'b1),
        .D(ma[3]),
        .Q(v[109]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01FFFE00)) 
    c114_i_1
       (.I0(a__0[2]),
        .I1(a__0[1]),
        .I2(a__0__0),
        .I3(a),
        .I4(a__0[3]),
        .O(ma[3]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c114_i_2
       (.I0(busy_reg),
        .I1(c114_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c114_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c114_i_5_n_0),
        .O(a__0[3]));
  MUXF7 c114_i_3
       (.I0(c114_i_6_n_0),
        .I1(c114_i_7_n_0),
        .O(c114_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_4
       (.I0(c112_i_2_0[3]),
        .I1(c112_i_2_1[3]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[3]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[3]),
        .O(c114_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_5
       (.I0(c112_i_2_4[3]),
        .I1(c112_i_2_5[3]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[3]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[3]),
        .O(c114_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_6
       (.I0(Q[3]),
        .I1(c112_i_4_0[3]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[3]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[3]),
        .O(c114_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c114_i_7
       (.I0(c112_i_4_3[3]),
        .I1(c112_i_4_4[3]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[3]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[3]),
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
        .D(ma[4]),
        .Q(v[107]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000)) 
    c115_i_1
       (.I0(a__0[3]),
        .I1(a__0__0),
        .I2(a__0[1]),
        .I3(a__0[2]),
        .I4(a),
        .I5(a__0[4]),
        .O(ma[4]));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c115_i_2
       (.I0(busy_reg),
        .I1(c115_i_3_n_0),
        .I2(index_reg[3]),
        .I3(c115_i_4_n_0),
        .I4(index_reg[2]),
        .I5(c115_i_5_n_0),
        .O(a__0[4]));
  MUXF7 c115_i_3
       (.I0(c115_i_6_n_0),
        .I1(c115_i_7_n_0),
        .O(c115_i_3_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_4
       (.I0(c112_i_2_0[4]),
        .I1(c112_i_2_1[4]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[4]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[4]),
        .O(c115_i_4_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_5
       (.I0(c112_i_2_4[4]),
        .I1(c112_i_2_5[4]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[4]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[4]),
        .O(c115_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_6
       (.I0(Q[4]),
        .I1(c112_i_4_0[4]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[4]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[4]),
        .O(c115_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c115_i_7
       (.I0(c112_i_4_3[4]),
        .I1(c112_i_4_4[4]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[4]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[4]),
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
        .D(ma[5]),
        .Q(v[52]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c116_i_1
       (.I0(a__0[4]),
        .I1(a__0[2]),
        .I2(c116_i_2_n_0),
        .I3(a__0[3]),
        .I4(a),
        .I5(a__0[5]),
        .O(ma[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_10
       (.I0(c112_i_4_3[5]),
        .I1(c112_i_4_4[5]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[5]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[5]),
        .O(c116_i_10_n_0));
  LUT6 #(
    .INIT(64'h05000533FFFFFFFF)) 
    c116_i_2
       (.I0(c116_i_4_n_0),
        .I1(c112_i_7_n_0),
        .I2(c116_i_5_n_0),
        .I3(index_reg[3]),
        .I4(c111_i_2_n_0),
        .I5(busy_reg),
        .O(c116_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c116_i_3
       (.I0(busy_reg),
        .I1(c116_i_6_n_0),
        .I2(index_reg[3]),
        .I3(c116_i_7_n_0),
        .I4(index_reg[2]),
        .I5(c116_i_8_n_0),
        .O(a__0[5]));
  MUXF7 c116_i_4
       (.I0(c112_i_8_n_0),
        .I1(c112_i_9_n_0),
        .O(c116_i_4_n_0),
        .S(index_reg[2]));
  MUXF7 c116_i_5
       (.I0(c111_i_3_n_0),
        .I1(c111_i_4_n_0),
        .O(c116_i_5_n_0),
        .S(index_reg[2]));
  MUXF7 c116_i_6
       (.I0(c116_i_9_n_0),
        .I1(c116_i_10_n_0),
        .O(c116_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_7
       (.I0(c112_i_2_0[5]),
        .I1(c112_i_2_1[5]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[5]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[5]),
        .O(c116_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_8
       (.I0(c112_i_2_4[5]),
        .I1(c112_i_2_5[5]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[5]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[5]),
        .O(c116_i_8_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c116_i_9
       (.I0(Q[5]),
        .I1(c112_i_4_0[5]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[5]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[5]),
        .O(c116_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c117
       (.C(clk),
        .CE(1'b1),
        .D(ma[6]),
        .Q(v[101]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c117_i_1
       (.I0(a__0[5]),
        .I1(a__0[3]),
        .I2(c117_i_2_n_0),
        .I3(a__0[4]),
        .I4(a),
        .I5(a__0[6]),
        .O(ma[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_10
       (.I0(Q[6]),
        .I1(c112_i_4_0[6]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[6]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[6]),
        .O(c117_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_11
       (.I0(c112_i_4_3[6]),
        .I1(c112_i_4_4[6]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[6]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[6]),
        .O(c117_i_11_n_0));
  LUT6 #(
    .INIT(64'h00000151FFFFFFFF)) 
    c117_i_2
       (.I0(history[0]),
        .I1(c112_i_7_n_0),
        .I2(index_reg[3]),
        .I3(c116_i_4_n_0),
        .I4(history[2]),
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
        .O(a__0[6]));
  MUXF8 c117_i_4
       (.I0(c111_i_2_n_0),
        .I1(c116_i_5_n_0),
        .O(history[0]),
        .S(index_reg[3]));
  MUXF8 c117_i_5
       (.I0(c113_i_3_n_0),
        .I1(c117_i_9_n_0),
        .O(history[2]),
        .S(index_reg[3]));
  MUXF7 c117_i_6
       (.I0(c117_i_10_n_0),
        .I1(c117_i_11_n_0),
        .O(c117_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_7
       (.I0(c112_i_2_0[6]),
        .I1(c112_i_2_1[6]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[6]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[6]),
        .O(c117_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c117_i_8
       (.I0(c112_i_2_4[6]),
        .I1(c112_i_2_5[6]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[6]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[6]),
        .O(c117_i_8_n_0));
  MUXF7 c117_i_9
       (.I0(c113_i_4_n_0),
        .I1(c113_i_5_n_0),
        .O(c117_i_9_n_0),
        .S(index_reg[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c118
       (.C(clk),
        .CE(1'b1),
        .D(ma[7]),
        .Q(v[65]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c118_i_1
       (.I0(a__0[6]),
        .I1(a__0[4]),
        .I2(c118_i_2_n_0),
        .I3(a__0[5]),
        .I4(a),
        .I5(a__0[7]),
        .O(ma[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_10
       (.I0(Q[7]),
        .I1(c112_i_4_0[7]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[7]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[7]),
        .O(c118_i_10_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_11
       (.I0(c112_i_4_3[7]),
        .I1(c112_i_4_4[7]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[7]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[7]),
        .O(c118_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF0001FFFF)) 
    c118_i_2
       (.I0(history[2]),
        .I1(history[1]),
        .I2(history[0]),
        .I3(history[3]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
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
        .O(a__0[7]));
  MUXF8 c118_i_4
       (.I0(c112_i_7_n_0),
        .I1(c116_i_4_n_0),
        .O(history[1]),
        .S(index_reg[3]));
  MUXF8 c118_i_5
       (.I0(c114_i_3_n_0),
        .I1(c118_i_9_n_0),
        .O(history[3]),
        .S(index_reg[3]));
  MUXF7 c118_i_6
       (.I0(c118_i_10_n_0),
        .I1(c118_i_11_n_0),
        .O(c118_i_6_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_7
       (.I0(c112_i_2_0[7]),
        .I1(c112_i_2_1[7]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[7]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[7]),
        .O(c118_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c118_i_8
       (.I0(c112_i_2_4[7]),
        .I1(c112_i_2_5[7]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[7]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[7]),
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
        .D(ma[8]),
        .Q(v[53]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0010FFFFFFEF0000)) 
    c119_i_1
       (.I0(a__0[7]),
        .I1(a__0[5]),
        .I2(c119_i_2_n_0),
        .I3(a__0[6]),
        .I4(a),
        .I5(a__0[8]),
        .O(ma[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_10
       (.I0(c112_i_4_3[8]),
        .I1(c112_i_4_4[8]),
        .I2(index_reg[1]),
        .I3(c112_i_4_5[8]),
        .I4(index_reg[0]),
        .I5(c112_i_4_6[8]),
        .O(c119_i_10_n_0));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    c119_i_2
       (.I0(history[3]),
        .I1(history[0]),
        .I2(history[1]),
        .I3(history[2]),
        .I4(history[4]),
        .I5(busy_reg),
        .O(c119_i_2_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8080808A808)) 
    c119_i_3
       (.I0(busy_reg),
        .I1(c119_i_5_n_0),
        .I2(index_reg[3]),
        .I3(c119_i_6_n_0),
        .I4(index_reg[2]),
        .I5(c119_i_7_n_0),
        .O(a__0[8]));
  MUXF8 c119_i_4
       (.I0(c115_i_3_n_0),
        .I1(c119_i_8_n_0),
        .O(history[4]),
        .S(index_reg[3]));
  MUXF7 c119_i_5
       (.I0(c119_i_9_n_0),
        .I1(c119_i_10_n_0),
        .O(c119_i_5_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_6
       (.I0(c112_i_2_0[8]),
        .I1(c112_i_2_1[8]),
        .I2(index_reg[1]),
        .I3(c112_i_2_2[8]),
        .I4(index_reg[0]),
        .I5(c112_i_2_3[8]),
        .O(c119_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_7
       (.I0(c112_i_2_4[8]),
        .I1(c112_i_2_5[8]),
        .I2(index_reg[1]),
        .I3(c112_i_2_6[8]),
        .I4(index_reg[0]),
        .I5(c112_i_2_7[8]),
        .O(c119_i_7_n_0));
  MUXF7 c119_i_8
       (.I0(c115_i_4_n_0),
        .I1(c115_i_5_n_0),
        .O(c119_i_8_n_0),
        .S(index_reg[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    c119_i_9
       (.I0(Q[8]),
        .I1(c112_i_4_0[8]),
        .I2(index_reg[1]),
        .I3(c112_i_4_1[8]),
        .I4(index_reg[0]),
        .I5(c112_i_4_2[8]),
        .O(c119_i_9_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h56)) 
    c12
       (.I0(v[71]),
        .I1(v[74]),
        .I2(v[73]),
        .O(v[77]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c120
       (.C(clk),
        .CE(1'b1),
        .D(ma[9]),
        .Q(v[82]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    c120_i_1
       (.I0(a),
        .I1(a__0[7]),
        .I2(a__0[5]),
        .I3(c119_i_2_n_0),
        .I4(a__0[6]),
        .I5(a__0[8]),
        .O(ma[9]));
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
        .Q(v[136]),
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
    c126
       (.C(clk),
        .CE(1'b1),
        .D(mb[1]),
        .Q(v[51]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h10302000)) 
    c126_i_1
       (.I0(b0[0]),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[9]),
        .I4(b0[1]),
        .O(mb[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c127
       (.C(clk),
        .CE(1'b1),
        .D(mb[2]),
        .Q(v[66]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h01000F000E000000)) 
    c127_i_1
       (.I0(b0[0]),
        .I1(b0[1]),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[9]),
        .I5(b0[2]),
        .O(mb[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c128
       (.C(clk),
        .CE(1'b1),
        .D(mb[3]),
        .Q(v[105]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0100FF00FE000000)) 
    c128_i_1
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(busy_reg),
        .I4(b0[9]),
        .I5(b0[3]),
        .O(mb[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c129
       (.C(clk),
        .CE(1'b1),
        .D(mb[4]),
        .Q(v[54]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h20301000)) 
    c129_i_1
       (.I0(c129_i_2_n_0),
        .I1(index_reg[4]),
        .I2(index_reg_4_sn_1),
        .I3(b0[9]),
        .I4(b0[4]),
        .O(mb[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFF0001FFFF)) 
    c129_i_2
       (.I0(b0[2]),
        .I1(b0[1]),
        .I2(b0[0]),
        .I3(b0[3]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
        .O(c129_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c13
       (.I0(v[74]),
        .I1(v[73]),
        .O(v[78]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c130
       (.C(clk),
        .CE(1'b1),
        .D(mb[5]),
        .Q(v[104]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c130_i_1
       (.I0(b0[4]),
        .I1(c129_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[9]),
        .I5(b0[5]),
        .O(mb[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c131
       (.C(clk),
        .CE(1'b1),
        .D(mb[6]),
        .Q(v[103]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c131_i_1
       (.I0(b0[5]),
        .I1(c131_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[9]),
        .I5(b0[6]),
        .O(mb[6]));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFF)) 
    c131_i_2
       (.I0(b0[3]),
        .I1(b0[0]),
        .I2(b0[1]),
        .I3(b0[2]),
        .I4(b0[4]),
        .I5(busy_reg),
        .O(c131_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c132
       (.C(clk),
        .CE(1'b1),
        .D(mb[7]),
        .Q(v[120]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0400FF00FB000000)) 
    c132_i_1
       (.I0(b0[6]),
        .I1(c131_i_2_n_0),
        .I2(b0[5]),
        .I3(busy_reg),
        .I4(b0[9]),
        .I5(b0[7]),
        .O(mb[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c133
       (.C(clk),
        .CE(1'b1),
        .D(mb[8]),
        .Q(v[138]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h04000F000B000000)) 
    c133_i_1
       (.I0(b0[7]),
        .I1(c133_i_2_n_0),
        .I2(index_reg[4]),
        .I3(index_reg_4_sn_1),
        .I4(b0[9]),
        .I5(b0[8]),
        .O(mb[8]));
  LUT6 #(
    .INIT(64'hCCCCCCCC0004CCCC)) 
    c133_i_2
       (.I0(b0[5]),
        .I1(c129_i_2_n_0),
        .I2(b0[4]),
        .I3(b0[6]),
        .I4(index_reg_4_sn_1),
        .I5(index_reg[4]),
        .O(c133_i_2_n_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c134
       (.C(clk),
        .CE(1'b1),
        .D(mb[9]),
        .Q(v[121]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    c134_i_1
       (.I0(index_reg[4]),
        .I1(index_reg_4_sn_1),
        .I2(b0[9]),
        .I3(b0[7]),
        .I4(c133_i_2_n_0),
        .I5(b0[8]),
        .O(mb[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c14
       (.I0(v[59]),
        .I1(v[64]),
        .O(v[79]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880000000000000)) 
    c15
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[53]),
        .I3(v[81]),
        .I4(v[82]),
        .I5(v[54]),
        .O(v[80]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h0F70000070F00000)) 
    c16
       (.I0(v[65]),
        .I1(v[66]),
        .I2(v[82]),
        .I3(v[53]),
        .I4(v[54]),
        .I5(v[81]),
        .O(v[83]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    c17
       (.I0(v[247]),
        .I1(v[61]),
        .I2(v[62]),
        .O(v[84]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c18
       (.I0(v[87]),
        .I1(v[85]),
        .O(v[68]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'hF880)) 
    c19
       (.I0(v[82]),
        .I1(v[248]),
        .I2(v[92]),
        .I3(v[93]),
        .O(v[90]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT5 #(
    .INIT(32'hFF6A6A00)) 
    c20
       (.I0(v[248]),
        .I1(v[54]),
        .I2(v[82]),
        .I3(v[95]),
        .I4(v[96]),
        .O(v[94]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c21
       (.I0(v[92]),
        .I1(v[93]),
        .I2(v[82]),
        .I3(v[248]),
        .O(v[97]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hFFE8E800)) 
    c22
       (.I0(v[93]),
        .I1(v[92]),
        .I2(v[80]),
        .I3(v[99]),
        .I4(v[100]),
        .O(v[98]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'hE)) 
    c23
       (.I0(v[87]),
        .I1(v[85]),
        .O(v[81]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c24
       (.I0(v[66]),
        .I1(v[53]),
        .I2(v[51]),
        .I3(v[82]),
        .I4(v[101]),
        .I5(v[54]),
        .O(v[85]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h6888)) 
    c27
       (.I0(v[65]),
        .I1(v[54]),
        .I2(v[82]),
        .I3(v[66]),
        .O(v[87]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    c28
       (.I0(v[82]),
        .I1(v[54]),
        .I2(v[66]),
        .I3(v[65]),
        .O(v[88]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c29
       (.I0(v[54]),
        .I1(v[53]),
        .O(v[89]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c30
       (.I0(v[52]),
        .I1(v[103]),
        .I2(v[101]),
        .I3(v[104]),
        .I4(v[105]),
        .I5(v[53]),
        .O(v[102]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    c31
       (.I0(v[103]),
        .I1(v[107]),
        .I2(v[104]),
        .I3(v[65]),
        .I4(v[52]),
        .I5(v[105]),
        .O(v[106]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hE880000080000000)) 
    c32
       (.I0(v[109]),
        .I1(v[103]),
        .I2(v[101]),
        .I3(v[104]),
        .I4(v[105]),
        .I5(v[107]),
        .O(v[108]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c33
       (.I0(v[80]),
        .I1(v[93]),
        .I2(v[92]),
        .I3(v[96]),
        .I4(v[95]),
        .I5(v[83]),
        .O(v[110]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c34
       (.I0(v[102]),
        .I1(v[103]),
        .I2(v[101]),
        .I3(v[112]),
        .I4(v[105]),
        .I5(v[82]),
        .O(v[111]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h956A6A956A956A95)) 
    c35
       (.I0(v[106]),
        .I1(v[52]),
        .I2(v[103]),
        .I3(v[114]),
        .I4(v[105]),
        .I5(v[53]),
        .O(v[113]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT1 #(
    .INIT(2'h1)) 
    c36
       (.I0(v[108]),
        .O(v[115]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c38
       (.I0(v[119]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[122]),
        .I4(v[107]),
        .O(v[118]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c39
       (.I0(v[124]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[125]),
        .I4(v[109]),
        .O(v[123]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c4
       (.I0(v[61]),
        .I1(v[62]),
        .I2(v[247]),
        .O(v[60]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hC8008800)) 
    c40
       (.I0(v[127]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[122]),
        .I4(v[128]),
        .O(v[126]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c41
       (.I0(v[118]),
        .I1(v[109]),
        .I2(v[121]),
        .I3(v[130]),
        .I4(v[120]),
        .I5(v[52]),
        .O(v[129]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c42
       (.I0(v[123]),
        .I1(v[121]),
        .I2(v[122]),
        .I3(v[119]),
        .I4(v[120]),
        .I5(v[107]),
        .O(v[131]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c43
       (.I0(v[126]),
        .I1(v[121]),
        .I2(v[125]),
        .I3(v[124]),
        .I4(v[120]),
        .I5(v[109]),
        .O(v[132]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9600)) 
    c44
       (.I0(v[83]),
        .I1(v[96]),
        .I2(v[95]),
        .I3(v[84]),
        .O(v[133]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    c45
       (.I0(v[120]),
        .I1(v[122]),
        .I2(v[127]),
        .I3(v[121]),
        .O(v[134]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c46
       (.I0(v[104]),
        .I1(v[65]),
        .O(v[112]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c47
       (.I0(v[101]),
        .I1(v[104]),
        .O(v[114]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c49
       (.I0(v[82]),
        .I1(v[136]),
        .O(v[135]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c5
       (.I0(v[53]),
        .I1(v[51]),
        .O(v[64]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c50
       (.I0(v[109]),
        .I1(v[138]),
        .O(v[137]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c51
       (.I0(v[122]),
        .I1(v[138]),
        .O(v[139]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    c52
       (.I0(v[136]),
        .I1(v[82]),
        .I2(v[138]),
        .I3(v[125]),
        .O(v[140]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h9696960096000000)) 
    c53
       (.I0(v[247]),
        .I1(v[62]),
        .I2(v[61]),
        .I3(v[69]),
        .I4(v[70]),
        .I5(v[68]),
        .O(v[141]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE81717E8)) 
    c54
       (.I0(v[100]),
        .I1(v[99]),
        .I2(v[90]),
        .I3(v[143]),
        .I4(v[144]),
        .O(v[142]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h7EE8811781177EE8)) 
    c55
       (.I0(v[94]),
        .I1(v[80]),
        .I2(v[92]),
        .I3(v[93]),
        .I4(v[100]),
        .I5(v[99]),
        .O(v[145]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h9336366C)) 
    c56
       (.I0(v[84]),
        .I1(v[97]),
        .I2(v[83]),
        .I3(v[95]),
        .I4(v[96]),
        .O(v[146]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    c57
       (.I0(v[141]),
        .I1(v[95]),
        .I2(v[96]),
        .I3(v[83]),
        .I4(v[84]),
        .O(v[147]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c58
       (.I0(v[149]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[101]),
        .I4(v[53]),
        .O(v[148]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c59
       (.I0(v[151]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[52]),
        .I4(v[65]),
        .O(v[150]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c60
       (.I0(v[153]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[107]),
        .I4(v[101]),
        .O(v[152]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c61
       (.I0(v[130]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[109]),
        .I4(v[52]),
        .O(v[154]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c62
       (.I0(v[148]),
        .I1(v[65]),
        .I2(v[121]),
        .I3(v[156]),
        .I4(v[120]),
        .I5(v[82]),
        .O(v[155]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c63
       (.I0(v[150]),
        .I1(v[101]),
        .I2(v[121]),
        .I3(v[149]),
        .I4(v[120]),
        .I5(v[53]),
        .O(v[157]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c64
       (.I0(v[152]),
        .I1(v[52]),
        .I2(v[121]),
        .I3(v[151]),
        .I4(v[120]),
        .I5(v[65]),
        .O(v[158]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    c65
       (.I0(v[154]),
        .I1(v[107]),
        .I2(v[121]),
        .I3(v[153]),
        .I4(v[120]),
        .I5(v[101]),
        .O(v[159]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c66
       (.I0(v[82]),
        .I1(v[103]),
        .O(v[160]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c67
       (.I0(v[53]),
        .I1(v[103]),
        .I2(v[65]),
        .O(v[161]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    c68
       (.I0(v[103]),
        .I1(v[101]),
        .I2(v[104]),
        .I3(v[65]),
        .I4(v[105]),
        .I5(v[82]),
        .O(v[162]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h7000)) 
    c69
       (.I0(v[53]),
        .I1(v[104]),
        .I2(v[103]),
        .I3(v[82]),
        .O(v[163]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hBFC040C0)) 
    c70
       (.I0(v[65]),
        .I1(v[103]),
        .I2(v[53]),
        .I3(v[104]),
        .I4(v[82]),
        .O(v[164]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6 #(
    .INIT(64'hDABFB0402540B040)) 
    c71
       (.I0(v[166]),
        .I1(v[101]),
        .I2(v[103]),
        .I3(v[65]),
        .I4(v[104]),
        .I5(v[53]),
        .O(v[165]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c72
       (.I0(v[82]),
        .I1(v[138]),
        .O(v[167]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c73
       (.I0(v[53]),
        .I1(v[138]),
        .O(v[168]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h7)) 
    c74
       (.I0(v[105]),
        .I1(v[82]),
        .O(v[166]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h78)) 
    c75
       (.I0(v[144]),
        .I1(v[143]),
        .I2(v[170]),
        .O(v[169]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c76
       (.I0(v[65]),
        .I1(v[138]),
        .O(v[171]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c77
       (.I0(v[101]),
        .I1(v[138]),
        .O(v[172]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c78
       (.I0(v[52]),
        .I1(v[138]),
        .O(v[173]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h8)) 
    c79
       (.I0(v[107]),
        .I1(v[138]),
        .O(v[174]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT3 #(
    .INIT(8'h96)) 
    c8
       (.I0(v[68]),
        .I1(v[69]),
        .I2(v[70]),
        .O(v[71]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c80
       (.I0(v[176]),
        .I1(v[53]),
        .I2(v[121]),
        .O(v[175]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'hE888A000)) 
    c81
       (.I0(v[156]),
        .I1(v[120]),
        .I2(v[121]),
        .I3(v[65]),
        .I4(v[82]),
        .O(v[177]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT3 #(
    .INIT(8'h80)) 
    c82
       (.I0(v[179]),
        .I1(v[82]),
        .I2(v[121]),
        .O(v[178]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT5 #(
    .INIT(32'h87F078F0)) 
    c83
       (.I0(v[53]),
        .I1(v[176]),
        .I2(v[179]),
        .I3(v[121]),
        .I4(v[82]),
        .O(v[180]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    c84
       (.I0(v[177]),
        .I1(v[176]),
        .I2(v[121]),
        .I3(v[53]),
        .O(v[181]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c86
       (.C(clk),
        .CE(1'b1),
        .D(v[183]),
        .Q(Y[1]),
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
        .D(v[184]),
        .Q(Y[2]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c88
       (.C(clk),
        .CE(1'b1),
        .D(v[185]),
        .Q(Y[3]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c89
       (.CI(1'b0),
        .CO({v[186],NLW_c89_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v[50],v[71],v[72],v[59]}),
        .O({v[185:183],v[190]}),
        .S({v[76],v[77],v[78],v[79]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h9)) 
    c9
       (.I0(v[73]),
        .I1(v[74]),
        .O(v[72]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c90
       (.C(clk),
        .CE(1'b1),
        .D(v[191]),
        .Q(Y[4]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c91
       (.C(clk),
        .CE(1'b1),
        .D(v[192]),
        .Q(Y[5]),
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
        .D(v[193]),
        .Q(Y[6]),
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
        .D(v[194]),
        .Q(Y[7]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c94
       (.CI(v[186]),
        .CO({v[195],NLW_c94_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({v[98],v[110],v[133],v[141]}),
        .O(v[194:191]),
        .S({v[142],v[145],v[146],v[147]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 c95
       (.CI(1'b0),
        .CO(v[199:196]),
        .CYINIT(1'b0),
        .DI({v[102],v[106],v[108],1'b0}),
        .O({v[62],v[69],v[73],NLW_c95_O_UNCONNECTED[0]}),
        .S({v[111],v[113],v[115],v[50]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c96
       (.CI(1'b0),
        .CO(v[203:200]),
        .CYINIT(1'b0),
        .DI({v[118],v[123],v[126],1'b0}),
        .O({v[61],v[70],v[74],v[59]}),
        .S({v[129],v[131],v[132],v[134]}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY4 c97
       (.CI(1'b0),
        .CO(v[207:204]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,v[135],1'b0}),
        .O({v[119],v[124],v[127],NLW_c97_O_UNCONNECTED[0]}),
        .S({v[137],v[139],v[140],1'b0}));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c98
       (.C(clk),
        .CE(1'b1),
        .D(v[212]),
        .Q(Y[8]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    c99
       (.C(clk),
        .CE(1'b1),
        .D(v[213]),
        .Q(Y[9]),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h66696999BBB2B222)) 
    direct_quadol_0
       (.I0(v[88]),
        .I1(v[89]),
        .I2(v[85]),
        .I3(v[87]),
        .I4(v[86]),
        .I5(1'b1),
        .O5(v[248]),
        .O6(v[247]));
  LUT2 #(
    .INIT(4'h2)) 
    \vpipe[0]_i_1 
       (.I0(index_reg_4_sn_1),
        .I1(index_reg[4]),
        .O(busy_reg));
endmodule

(* ECO_CHECKSUM = "9e44d1be" *) (* LAT = "3" *) (* TAPS = "16" *) 
(* NotValidForBitStream *)
module r23_fir10_serial_then_quadol
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
  input [9:0]coeff_data;
  input sample_valid;
  input [9:0]sample_data;
  output sample_ready;
  output result_valid;
  output [39:0]result;

  wire \<const0> ;
  wire [39:9]acc;
  wire \acc[39]_i_1_n_0 ;
  wire [9:0]b0;
  wire busy0;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire clk;
  wire [3:0]coeff_addr;
  wire [9:0]coeff_data;
  wire coeff_reg_0_15_0_5_i_1_n_0;
  wire coeff_we;
  wire core_n_1;
  wire core_n_33;
  wire core_n_34;
  wire core_n_35;
  wire core_n_36;
  wire core_n_37;
  wire core_n_38;
  wire core_n_39;
  wire core_n_40;
  wire core_n_41;
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
  wire [1:0]firstpipe;
  wire [2:2]firstpipe__0;
  wire [9:0]\history_reg[0] ;
  wire [9:0]\history_reg[10] ;
  wire [9:0]\history_reg[11] ;
  wire [9:0]\history_reg[12] ;
  wire [9:0]\history_reg[13] ;
  wire [9:0]\history_reg[14] ;
  wire [9:0]\history_reg[15] ;
  wire [9:0]\history_reg[1] ;
  wire [9:0]\history_reg[2] ;
  wire [9:0]\history_reg[3] ;
  wire [9:0]\history_reg[4] ;
  wire [9:0]\history_reg[5] ;
  wire [9:0]\history_reg[6] ;
  wire [9:0]\history_reg[7] ;
  wire [9:0]\history_reg[8] ;
  wire [9:0]\history_reg[9] ;
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
  wire [39:9]next_acc;
  wire p_0_in;
  wire [4:4]p_0_in__0;
  wire [0:0]p_0_out;
  wire p_1_in;
  wire reset;
  wire [39:9]\^result ;
  wire \result[39]_i_1_n_0 ;
  wire result_valid;
  wire result_valid_i_1_n_0;
  wire [9:0]sample_data;
  wire sample_ready;
  wire sample_valid;
  wire \vpipe_reg_n_0_[0] ;
  wire \vpipe_reg_n_0_[1] ;
  wire [1:0]NLW_coeff_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_coeff_reg_0_15_6_9_DOC_UNCONNECTED;
  wire [1:0]NLW_coeff_reg_0_15_6_9_DOD_UNCONNECTED;

  assign result[39:9] = \^result [39:9];
  assign result[8] = \<const0> ;
  assign result[7] = \<const0> ;
  assign result[6] = \<const0> ;
  assign result[5] = \<const0> ;
  assign result[4] = \<const0> ;
  assign result[3] = \<const0> ;
  assign result[2] = \<const0> ;
  assign result[1] = \<const0> ;
  assign result[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'hFF02)) 
    \acc[39]_i_1 
       (.I0(sample_valid),
        .I1(coeff_we),
        .I2(busy_reg_n_0),
        .I3(p_0_in),
        .O(\acc[39]_i_1_n_0 ));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_33),
        .Q(acc[10]),
        .R(reset));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_34),
        .Q(acc[11]),
        .R(reset));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_35),
        .Q(acc[12]),
        .R(reset));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_36),
        .Q(acc[13]),
        .R(reset));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_37),
        .Q(acc[14]),
        .R(reset));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_38),
        .Q(acc[15]),
        .R(reset));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_39),
        .Q(acc[16]),
        .R(reset));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_40),
        .Q(acc[17]),
        .R(reset));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_41),
        .Q(acc[18]),
        .R(reset));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_42),
        .Q(acc[19]),
        .R(reset));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_43),
        .Q(acc[20]),
        .R(reset));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_44),
        .Q(acc[21]),
        .R(reset));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_45),
        .Q(acc[22]),
        .R(reset));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_46),
        .Q(acc[23]),
        .R(reset));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_47),
        .Q(acc[24]),
        .R(reset));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_48),
        .Q(acc[25]),
        .R(reset));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_49),
        .Q(acc[26]),
        .R(reset));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_50),
        .Q(acc[27]),
        .R(reset));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_51),
        .Q(acc[28]),
        .R(reset));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_52),
        .Q(acc[29]),
        .R(reset));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_53),
        .Q(acc[30]),
        .R(reset));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_54),
        .Q(acc[31]),
        .R(reset));
  FDRE \acc_reg[32] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_55),
        .Q(acc[32]),
        .R(reset));
  FDRE \acc_reg[33] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_56),
        .Q(acc[33]),
        .R(reset));
  FDRE \acc_reg[34] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_57),
        .Q(acc[34]),
        .R(reset));
  FDRE \acc_reg[35] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_58),
        .Q(acc[35]),
        .R(reset));
  FDRE \acc_reg[36] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_59),
        .Q(acc[36]),
        .R(reset));
  FDRE \acc_reg[37] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_60),
        .Q(acc[37]),
        .R(reset));
  FDRE \acc_reg[38] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_61),
        .Q(acc[38]),
        .R(reset));
  FDRE \acc_reg[39] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_62),
        .Q(acc[39]),
        .R(reset));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(\acc[39]_i_1_n_0 ),
        .D(core_n_1),
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
  (* RTL_RAM_BITS = "160" *) 
  (* RTL_RAM_NAME = "r23_fir10_serial_then_quadol/coeff_reg" *) 
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
  (* RTL_RAM_BITS = "160" *) 
  (* RTL_RAM_NAME = "r23_fir10_serial_then_quadol/coeff_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "9" *) 
  RAM32M coeff_reg_0_15_6_9
       (.ADDRA({1'b0,index_reg[3:0]}),
        .ADDRB({1'b0,index_reg[3:0]}),
        .ADDRC({1'b0,index_reg[3:0]}),
        .ADDRD({1'b0,coeff_addr}),
        .DIA(coeff_data[7:6]),
        .DIB(coeff_data[9:8]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(b0[7:6]),
        .DOB(b0[9:8]),
        .DOC(NLW_coeff_reg_0_15_6_9_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_coeff_reg_0_15_6_9_DOD_UNCONNECTED[1:0]),
        .WCLK(clk),
        .WE(coeff_reg_0_15_0_5_i_1_n_0));
  r23_fir10_serial_then_quadol_signed core
       (.D(next_acc),
        .Q(\history_reg[3] ),
        .acc(acc),
        .\acc_reg[9] (p_0_in),
        .b0(b0),
        .c112_i_2(\history_reg[11] ),
        .c112_i_2_0(\history_reg[10] ),
        .c112_i_2_1(\history_reg[9] ),
        .c112_i_2_2(\history_reg[8] ),
        .c112_i_2_3(\history_reg[15] ),
        .c112_i_2_4(\history_reg[14] ),
        .c112_i_2_5(\history_reg[13] ),
        .c112_i_2_6(\history_reg[12] ),
        .c112_i_4(\history_reg[2] ),
        .c112_i_4_0(\history_reg[1] ),
        .c112_i_4_1(\history_reg[0] ),
        .c112_i_4_2(\history_reg[7] ),
        .c112_i_4_3(\history_reg[6] ),
        .c112_i_4_4(\history_reg[5] ),
        .c112_i_4_5(\history_reg[4] ),
        .clk(clk),
        .index_reg(index_reg),
        .index_reg_4_sp_1(busy_reg_n_0),
        .issue(issue),
        .\result_reg[12] (firstpipe__0),
        .\vpipe_reg[2] (core_n_1),
        .\vpipe_reg[2]_0 (core_n_33),
        .\vpipe_reg[2]_1 (core_n_34),
        .\vpipe_reg[2]_10 (core_n_43),
        .\vpipe_reg[2]_11 (core_n_44),
        .\vpipe_reg[2]_12 (core_n_45),
        .\vpipe_reg[2]_13 (core_n_46),
        .\vpipe_reg[2]_14 (core_n_47),
        .\vpipe_reg[2]_15 (core_n_48),
        .\vpipe_reg[2]_16 (core_n_49),
        .\vpipe_reg[2]_17 (core_n_50),
        .\vpipe_reg[2]_18 (core_n_51),
        .\vpipe_reg[2]_19 (core_n_52),
        .\vpipe_reg[2]_2 (core_n_35),
        .\vpipe_reg[2]_20 (core_n_53),
        .\vpipe_reg[2]_21 (core_n_54),
        .\vpipe_reg[2]_22 (core_n_55),
        .\vpipe_reg[2]_23 (core_n_56),
        .\vpipe_reg[2]_24 (core_n_57),
        .\vpipe_reg[2]_25 (core_n_58),
        .\vpipe_reg[2]_26 (core_n_59),
        .\vpipe_reg[2]_27 (core_n_60),
        .\vpipe_reg[2]_28 (core_n_61),
        .\vpipe_reg[2]_29 (core_n_62),
        .\vpipe_reg[2]_3 (core_n_36),
        .\vpipe_reg[2]_4 (core_n_37),
        .\vpipe_reg[2]_5 (core_n_38),
        .\vpipe_reg[2]_6 (core_n_39),
        .\vpipe_reg[2]_7 (core_n_40),
        .\vpipe_reg[2]_8 (core_n_41),
        .\vpipe_reg[2]_9 (core_n_42));
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
    \history[0][9]_i_1 
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
  FDRE \history_reg[0][9] 
       (.C(clk),
        .CE(busy0),
        .D(sample_data[9]),
        .Q(\history_reg[0] [9]),
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
  FDRE \history_reg[10][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[9] [9]),
        .Q(\history_reg[10] [9]),
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
  FDRE \history_reg[11][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[10] [9]),
        .Q(\history_reg[11] [9]),
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
  FDRE \history_reg[12][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[11] [9]),
        .Q(\history_reg[12] [9]),
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
  FDRE \history_reg[13][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[12] [9]),
        .Q(\history_reg[13] [9]),
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
  FDRE \history_reg[14][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[13] [9]),
        .Q(\history_reg[14] [9]),
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
  FDRE \history_reg[15][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[14] [9]),
        .Q(\history_reg[15] [9]),
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
  FDRE \history_reg[1][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[0] [9]),
        .Q(\history_reg[1] [9]),
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
  FDRE \history_reg[2][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[1] [9]),
        .Q(\history_reg[2] [9]),
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
  FDRE \history_reg[3][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[2] [9]),
        .Q(\history_reg[3] [9]),
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
  FDRE \history_reg[4][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[3] [9]),
        .Q(\history_reg[4] [9]),
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
  FDRE \history_reg[5][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[4] [9]),
        .Q(\history_reg[5] [9]),
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
  FDRE \history_reg[6][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[5] [9]),
        .Q(\history_reg[6] [9]),
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
  FDRE \history_reg[7][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[6] [9]),
        .Q(\history_reg[7] [9]),
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
  FDRE \history_reg[8][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[7] [9]),
        .Q(\history_reg[8] [9]),
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
  FDRE \history_reg[9][9] 
       (.C(clk),
        .CE(busy0),
        .D(\history_reg[8] [9]),
        .Q(\history_reg[9] [9]),
        .R(reset));
  LUT1 #(
    .INIT(2'h1)) 
    \index[0]_i_1 
       (.I0(index_reg[0]),
        .O(\index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \index[1]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .O(\index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \index[2]_i_1 
       (.I0(index_reg[0]),
        .I1(index_reg[1]),
        .I2(index_reg[2]),
        .O(\index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
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
  FDRE \result_reg[10] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[10]),
        .Q(\^result [10]),
        .R(reset));
  FDRE \result_reg[11] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[11]),
        .Q(\^result [11]),
        .R(reset));
  FDRE \result_reg[12] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[12]),
        .Q(\^result [12]),
        .R(reset));
  FDRE \result_reg[13] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[13]),
        .Q(\^result [13]),
        .R(reset));
  FDRE \result_reg[14] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[14]),
        .Q(\^result [14]),
        .R(reset));
  FDRE \result_reg[15] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[15]),
        .Q(\^result [15]),
        .R(reset));
  FDRE \result_reg[16] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[16]),
        .Q(\^result [16]),
        .R(reset));
  FDRE \result_reg[17] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[17]),
        .Q(\^result [17]),
        .R(reset));
  FDRE \result_reg[18] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[18]),
        .Q(\^result [18]),
        .R(reset));
  FDRE \result_reg[19] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[19]),
        .Q(\^result [19]),
        .R(reset));
  FDRE \result_reg[20] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[20]),
        .Q(\^result [20]),
        .R(reset));
  FDRE \result_reg[21] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[21]),
        .Q(\^result [21]),
        .R(reset));
  FDRE \result_reg[22] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[22]),
        .Q(\^result [22]),
        .R(reset));
  FDRE \result_reg[23] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[23]),
        .Q(\^result [23]),
        .R(reset));
  FDRE \result_reg[24] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[24]),
        .Q(\^result [24]),
        .R(reset));
  FDRE \result_reg[25] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[25]),
        .Q(\^result [25]),
        .R(reset));
  FDRE \result_reg[26] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[26]),
        .Q(\^result [26]),
        .R(reset));
  FDRE \result_reg[27] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[27]),
        .Q(\^result [27]),
        .R(reset));
  FDRE \result_reg[28] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[28]),
        .Q(\^result [28]),
        .R(reset));
  FDRE \result_reg[29] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[29]),
        .Q(\^result [29]),
        .R(reset));
  FDRE \result_reg[30] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[30]),
        .Q(\^result [30]),
        .R(reset));
  FDRE \result_reg[31] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[31]),
        .Q(\^result [31]),
        .R(reset));
  FDRE \result_reg[32] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[32]),
        .Q(\^result [32]),
        .R(reset));
  FDRE \result_reg[33] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[33]),
        .Q(\^result [33]),
        .R(reset));
  FDRE \result_reg[34] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[34]),
        .Q(\^result [34]),
        .R(reset));
  FDRE \result_reg[35] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[35]),
        .Q(\^result [35]),
        .R(reset));
  FDRE \result_reg[36] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[36]),
        .Q(\^result [36]),
        .R(reset));
  FDRE \result_reg[37] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[37]),
        .Q(\^result [37]),
        .R(reset));
  FDRE \result_reg[38] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[38]),
        .Q(\^result [38]),
        .R(reset));
  FDRE \result_reg[39] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[39]),
        .Q(\^result [39]),
        .R(reset));
  FDRE \result_reg[9] 
       (.C(clk),
        .CE(\result[39]_i_1_n_0 ),
        .D(next_acc[9]),
        .Q(\^result [9]),
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

module r23_fir10_serial_then_quadol_signed
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
    clk,
    b0,
    index_reg_4_sp_1,
    index_reg,
    Q,
    c112_i_4,
    c112_i_4_0,
    c112_i_4_1,
    c112_i_4_2,
    c112_i_4_3,
    c112_i_4_4,
    c112_i_4_5,
    c112_i_2,
    c112_i_2_0,
    c112_i_2_1,
    c112_i_2_2,
    c112_i_2_3,
    c112_i_2_4,
    c112_i_2_5,
    c112_i_2_6,
    \acc_reg[9] ,
    acc,
    \result_reg[12] );
  output issue;
  output \vpipe_reg[2] ;
  output [30:0]D;
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
  input clk;
  input [9:0]b0;
  input index_reg_4_sp_1;
  input [4:0]index_reg;
  input [9:0]Q;
  input [9:0]c112_i_4;
  input [9:0]c112_i_4_0;
  input [9:0]c112_i_4_1;
  input [9:0]c112_i_4_2;
  input [9:0]c112_i_4_3;
  input [9:0]c112_i_4_4;
  input [9:0]c112_i_4_5;
  input [9:0]c112_i_2;
  input [9:0]c112_i_2_0;
  input [9:0]c112_i_2_1;
  input [9:0]c112_i_2_2;
  input [9:0]c112_i_2_3;
  input [9:0]c112_i_2_4;
  input [9:0]c112_i_2_5;
  input [9:0]c112_i_2_6;
  input [0:0]\acc_reg[9] ;
  input [30:0]acc;
  input [0:0]\result_reg[12] ;

  wire [30:0]D;
  wire [9:0]Q;
  wire \Y[12]_i_2_n_0 ;
  wire \Y[12]_i_3_n_0 ;
  wire \Y[12]_i_4_n_0 ;
  wire \Y[12]_i_5_n_0 ;
  wire \Y[16]_i_2_n_0 ;
  wire \Y[16]_i_3_n_0 ;
  wire \Y[16]_i_4_n_0 ;
  wire \Y[16]_i_5_n_0 ;
  wire \Y[20]_i_2_n_0 ;
  wire \Y[20]_i_3_n_0 ;
  wire \Y[20]_i_4_n_0 ;
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
  wire \Y_reg_n_0_[30] ;
  wire \Y_reg_n_0_[31] ;
  wire \Y_reg_n_0_[9] ;
  wire [15:15]a;
  wire [30:0]acc;
  wire [0:0]\acc_reg[9] ;
  wire [9:0]b0;
  wire [9:0]c112_i_2;
  wire [9:0]c112_i_2_0;
  wire [9:0]c112_i_2_1;
  wire [9:0]c112_i_2_2;
  wire [9:0]c112_i_2_3;
  wire [9:0]c112_i_2_4;
  wire [9:0]c112_i_2_5;
  wire [9:0]c112_i_2_6;
  wire [9:0]c112_i_4;
  wire [9:0]c112_i_4_0;
  wire [9:0]c112_i_4_1;
  wire [9:0]c112_i_4_2;
  wire [9:0]c112_i_4_3;
  wire [9:0]c112_i_4_4;
  wire [9:0]c112_i_4_5;
  wire clk;
  wire [4:0]index_reg;
  wire index_reg_4_sn_1;
  wire issue;
  wire [19:9]p;
  wire \result[12]_i_2_n_0 ;
  wire \result[12]_i_3_n_0 ;
  wire \result[12]_i_4_n_0 ;
  wire \result[12]_i_5_n_0 ;
  wire \result[16]_i_2_n_0 ;
  wire \result[16]_i_3_n_0 ;
  wire \result[16]_i_4_n_0 ;
  wire \result[16]_i_5_n_0 ;
  wire \result[20]_i_2_n_0 ;
  wire \result[20]_i_3_n_0 ;
  wire \result[20]_i_4_n_0 ;
  wire \result[20]_i_5_n_0 ;
  wire \result[24]_i_2_n_0 ;
  wire \result[24]_i_3_n_0 ;
  wire \result[24]_i_4_n_0 ;
  wire \result[24]_i_5_n_0 ;
  wire \result[28]_i_2_n_0 ;
  wire \result[28]_i_3_n_0 ;
  wire \result[28]_i_4_n_0 ;
  wire \result[28]_i_5_n_0 ;
  wire \result[32]_i_2_n_0 ;
  wire \result[32]_i_3_n_0 ;
  wire \result[32]_i_4_n_0 ;
  wire \result[32]_i_5_n_0 ;
  wire \result[32]_i_6_n_0 ;
  wire \result[36]_i_2_n_0 ;
  wire \result[36]_i_3_n_0 ;
  wire \result[36]_i_4_n_0 ;
  wire \result[36]_i_5_n_0 ;
  wire \result[36]_i_6_n_0 ;
  wire \result[36]_i_7_n_0 ;
  wire \result[36]_i_8_n_0 ;
  wire \result[36]_i_9_n_0 ;
  wire \result[39]_i_3_n_0 ;
  wire \result[39]_i_4_n_0 ;
  wire \result[39]_i_5_n_0 ;
  wire \result[39]_i_6_n_0 ;
  wire \result[39]_i_7_n_0 ;
  wire [0:0]\result_reg[12] ;
  wire \result_reg[12]_i_1_n_0 ;
  wire \result_reg[16]_i_1_n_0 ;
  wire \result_reg[20]_i_1_n_0 ;
  wire \result_reg[24]_i_1_n_0 ;
  wire \result_reg[28]_i_1_n_0 ;
  wire \result_reg[32]_i_1_n_0 ;
  wire \result_reg[36]_i_1_n_0 ;
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
  wire u_n_3;
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
  wire \vpipe_reg[2]_4 ;
  wire \vpipe_reg[2]_5 ;
  wire \vpipe_reg[2]_6 ;
  wire \vpipe_reg[2]_7 ;
  wire \vpipe_reg[2]_8 ;
  wire \vpipe_reg[2]_9 ;
  wire [2:0]\NLW_result_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[24]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[28]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[32]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[36]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[39]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_result_reg[39]_i_2_O_UNCONNECTED ;

  assign index_reg_4_sn_1 = index_reg_4_sp_1;
  LUT2 #(
    .INIT(4'h6)) 
    \Y[12]_i_2 
       (.I0(s2),
        .I1(p[12]),
        .O(\Y[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[12]_i_3 
       (.I0(s2),
        .I1(p[11]),
        .O(\Y[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[12]_i_4 
       (.I0(s2),
        .I1(p[10]),
        .O(\Y[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[12]_i_5 
       (.I0(s2),
        .I1(p[9]),
        .O(\Y[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[16]_i_2 
       (.I0(s2),
        .I1(p[16]),
        .O(\Y[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[16]_i_3 
       (.I0(s2),
        .I1(p[15]),
        .O(\Y[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[16]_i_4 
       (.I0(s2),
        .I1(p[14]),
        .O(\Y[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[16]_i_5 
       (.I0(s2),
        .I1(p[13]),
        .O(\Y[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[20]_i_2 
       (.I0(s2),
        .I1(p[19]),
        .O(\Y[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[20]_i_3 
       (.I0(s2),
        .I1(p[18]),
        .O(\Y[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \Y[20]_i_4 
       (.I0(s2),
        .I1(p[17]),
        .O(\Y[20]_i_4_n_0 ));
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
  FDRE \Y_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(u_n_24),
        .Q(\Y_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[10]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[1]),
        .O(\vpipe_reg[2]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[11]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[2]),
        .O(\vpipe_reg[2]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[12]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[3]),
        .O(\vpipe_reg[2]_2 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[13]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[4]),
        .O(\vpipe_reg[2]_3 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[14]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[5]),
        .O(\vpipe_reg[2]_4 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[15]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[6]),
        .O(\vpipe_reg[2]_5 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[16]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[7]),
        .O(\vpipe_reg[2]_6 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[17]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[8]),
        .O(\vpipe_reg[2]_7 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[18]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[9]),
        .O(\vpipe_reg[2]_8 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[19]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[10]),
        .O(\vpipe_reg[2]_9 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[20]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[11]),
        .O(\vpipe_reg[2]_10 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[21]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[12]),
        .O(\vpipe_reg[2]_11 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[22]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[13]),
        .O(\vpipe_reg[2]_12 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[23]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[14]),
        .O(\vpipe_reg[2]_13 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[24]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[15]),
        .O(\vpipe_reg[2]_14 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[25]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[16]),
        .O(\vpipe_reg[2]_15 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[26]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[17]),
        .O(\vpipe_reg[2]_16 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[27]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[18]),
        .O(\vpipe_reg[2]_17 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[28]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[19]),
        .O(\vpipe_reg[2]_18 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[29]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[20]),
        .O(\vpipe_reg[2]_19 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[30]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[21]),
        .O(\vpipe_reg[2]_20 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[31]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[22]),
        .O(\vpipe_reg[2]_21 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[32]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[23]),
        .O(\vpipe_reg[2]_22 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[33]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[24]),
        .O(\vpipe_reg[2]_23 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[34]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[25]),
        .O(\vpipe_reg[2]_24 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[35]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[26]),
        .O(\vpipe_reg[2]_25 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[36]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[27]),
        .O(\vpipe_reg[2]_26 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[37]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[28]),
        .O(\vpipe_reg[2]_27 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[38]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[29]),
        .O(\vpipe_reg[2]_28 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[39]_i_2 
       (.I0(\acc_reg[9] ),
        .I1(D[30]),
        .O(\vpipe_reg[2]_29 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \acc[9]_i_1 
       (.I0(\acc_reg[9] ),
        .I1(D[0]),
        .O(\vpipe_reg[2] ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[12]_i_2 
       (.I0(\result_reg[12] ),
        .I1(acc[3]),
        .I2(\Y_reg_n_0_[12] ),
        .O(\result[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[12]_i_3 
       (.I0(\result_reg[12] ),
        .I1(acc[2]),
        .I2(\Y_reg_n_0_[11] ),
        .O(\result[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[12]_i_4 
       (.I0(\result_reg[12] ),
        .I1(acc[1]),
        .I2(\Y_reg_n_0_[10] ),
        .O(\result[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[12]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[0]),
        .I2(\Y_reg_n_0_[9] ),
        .O(\result[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[16]_i_2 
       (.I0(\result_reg[12] ),
        .I1(acc[7]),
        .I2(\Y_reg_n_0_[16] ),
        .O(\result[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[16]_i_3 
       (.I0(\result_reg[12] ),
        .I1(acc[6]),
        .I2(\Y_reg_n_0_[15] ),
        .O(\result[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[16]_i_4 
       (.I0(\result_reg[12] ),
        .I1(acc[5]),
        .I2(\Y_reg_n_0_[14] ),
        .O(\result[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[16]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[4]),
        .I2(\Y_reg_n_0_[13] ),
        .O(\result[16]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[20]_i_2 
       (.I0(\result_reg[12] ),
        .I1(acc[11]),
        .I2(\Y_reg_n_0_[20] ),
        .O(\result[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[20]_i_3 
       (.I0(\result_reg[12] ),
        .I1(acc[10]),
        .I2(\Y_reg_n_0_[19] ),
        .O(\result[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[20]_i_4 
       (.I0(\result_reg[12] ),
        .I1(acc[9]),
        .I2(\Y_reg_n_0_[18] ),
        .O(\result[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[20]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[8]),
        .I2(\Y_reg_n_0_[17] ),
        .O(\result[20]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[24]_i_2 
       (.I0(\result_reg[12] ),
        .I1(acc[15]),
        .I2(\Y_reg_n_0_[24] ),
        .O(\result[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[24]_i_3 
       (.I0(\result_reg[12] ),
        .I1(acc[14]),
        .I2(\Y_reg_n_0_[23] ),
        .O(\result[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[24]_i_4 
       (.I0(\result_reg[12] ),
        .I1(acc[13]),
        .I2(\Y_reg_n_0_[22] ),
        .O(\result[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[24]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[12]),
        .I2(\Y_reg_n_0_[21] ),
        .O(\result[24]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[28]_i_2 
       (.I0(\result_reg[12] ),
        .I1(acc[19]),
        .I2(\Y_reg_n_0_[28] ),
        .O(\result[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[28]_i_3 
       (.I0(\result_reg[12] ),
        .I1(acc[18]),
        .I2(\Y_reg_n_0_[27] ),
        .O(\result[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[28]_i_4 
       (.I0(\result_reg[12] ),
        .I1(acc[17]),
        .I2(\Y_reg_n_0_[26] ),
        .O(\result[28]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[28]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[16]),
        .I2(\Y_reg_n_0_[25] ),
        .O(\result[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[32]_i_2 
       (.I0(\Y_reg_n_0_[31] ),
        .O(\result[32]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[32]_i_3 
       (.I0(\Y_reg_n_0_[31] ),
        .I1(\result_reg[12] ),
        .I2(acc[23]),
        .O(\result[32]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h9A)) 
    \result[32]_i_4 
       (.I0(\Y_reg_n_0_[31] ),
        .I1(\result_reg[12] ),
        .I2(acc[22]),
        .O(\result[32]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[32]_i_5 
       (.I0(\result_reg[12] ),
        .I1(acc[21]),
        .I2(\Y_reg_n_0_[30] ),
        .O(\result[32]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB4)) 
    \result[32]_i_6 
       (.I0(\result_reg[12] ),
        .I1(acc[20]),
        .I2(\Y_reg_n_0_[29] ),
        .O(\result[32]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[36]_i_2 
       (.I0(acc[26]),
        .I1(\result_reg[12] ),
        .O(\result[36]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[36]_i_3 
       (.I0(acc[25]),
        .I1(\result_reg[12] ),
        .O(\result[36]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[36]_i_4 
       (.I0(acc[24]),
        .I1(\result_reg[12] ),
        .O(\result[36]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[36]_i_5 
       (.I0(acc[23]),
        .I1(\result_reg[12] ),
        .O(\result[36]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[36]_i_6 
       (.I0(acc[26]),
        .I1(\result_reg[12] ),
        .I2(acc[27]),
        .O(\result[36]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[36]_i_7 
       (.I0(acc[25]),
        .I1(\result_reg[12] ),
        .I2(acc[26]),
        .O(\result[36]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[36]_i_8 
       (.I0(acc[24]),
        .I1(\result_reg[12] ),
        .I2(acc[25]),
        .O(\result[36]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[36]_i_9 
       (.I0(acc[23]),
        .I1(\result_reg[12] ),
        .I2(acc[24]),
        .O(\result[36]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_3 
       (.I0(acc[28]),
        .I1(\result_reg[12] ),
        .O(\result[39]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[39]_i_4 
       (.I0(acc[27]),
        .I1(\result_reg[12] ),
        .O(\result[39]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_5 
       (.I0(acc[29]),
        .I1(\result_reg[12] ),
        .I2(acc[30]),
        .O(\result[39]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_6 
       (.I0(acc[28]),
        .I1(\result_reg[12] ),
        .I2(acc[29]),
        .O(\result[39]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hED)) 
    \result[39]_i_7 
       (.I0(acc[27]),
        .I1(\result_reg[12] ),
        .I2(acc[28]),
        .O(\result[39]_i_7_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[12]_i_1 
       (.CI(1'b0),
        .CO({\result_reg[12]_i_1_n_0 ,\NLW_result_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[12] ,\Y_reg_n_0_[11] ,\Y_reg_n_0_[10] ,\Y_reg_n_0_[9] }),
        .O(D[3:0]),
        .S({\result[12]_i_2_n_0 ,\result[12]_i_3_n_0 ,\result[12]_i_4_n_0 ,\result[12]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[16]_i_1 
       (.CI(\result_reg[12]_i_1_n_0 ),
        .CO({\result_reg[16]_i_1_n_0 ,\NLW_result_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[16] ,\Y_reg_n_0_[15] ,\Y_reg_n_0_[14] ,\Y_reg_n_0_[13] }),
        .O(D[7:4]),
        .S({\result[16]_i_2_n_0 ,\result[16]_i_3_n_0 ,\result[16]_i_4_n_0 ,\result[16]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[20]_i_1 
       (.CI(\result_reg[16]_i_1_n_0 ),
        .CO({\result_reg[20]_i_1_n_0 ,\NLW_result_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[20] ,\Y_reg_n_0_[19] ,\Y_reg_n_0_[18] ,\Y_reg_n_0_[17] }),
        .O(D[11:8]),
        .S({\result[20]_i_2_n_0 ,\result[20]_i_3_n_0 ,\result[20]_i_4_n_0 ,\result[20]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[24]_i_1 
       (.CI(\result_reg[20]_i_1_n_0 ),
        .CO({\result_reg[24]_i_1_n_0 ,\NLW_result_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[24] ,\Y_reg_n_0_[23] ,\Y_reg_n_0_[22] ,\Y_reg_n_0_[21] }),
        .O(D[15:12]),
        .S({\result[24]_i_2_n_0 ,\result[24]_i_3_n_0 ,\result[24]_i_4_n_0 ,\result[24]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[28]_i_1 
       (.CI(\result_reg[24]_i_1_n_0 ),
        .CO({\result_reg[28]_i_1_n_0 ,\NLW_result_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\Y_reg_n_0_[28] ,\Y_reg_n_0_[27] ,\Y_reg_n_0_[26] ,\Y_reg_n_0_[25] }),
        .O(D[19:16]),
        .S({\result[28]_i_2_n_0 ,\result[28]_i_3_n_0 ,\result[28]_i_4_n_0 ,\result[28]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[32]_i_1 
       (.CI(\result_reg[28]_i_1_n_0 ),
        .CO({\result_reg[32]_i_1_n_0 ,\NLW_result_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[32]_i_2_n_0 ,\Y_reg_n_0_[31] ,\Y_reg_n_0_[30] ,\Y_reg_n_0_[29] }),
        .O(D[23:20]),
        .S({\result[32]_i_3_n_0 ,\result[32]_i_4_n_0 ,\result[32]_i_5_n_0 ,\result[32]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[36]_i_1 
       (.CI(\result_reg[32]_i_1_n_0 ),
        .CO({\result_reg[36]_i_1_n_0 ,\NLW_result_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[36]_i_2_n_0 ,\result[36]_i_3_n_0 ,\result[36]_i_4_n_0 ,\result[36]_i_5_n_0 }),
        .O(D[27:24]),
        .S({\result[36]_i_6_n_0 ,\result[36]_i_7_n_0 ,\result[36]_i_8_n_0 ,\result[36]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[39]_i_2 
       (.CI(\result_reg[36]_i_1_n_0 ),
        .CO(\NLW_result_reg[39]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\result[39]_i_3_n_0 ,\result[39]_i_4_n_0 }),
        .O({\NLW_result_reg[39]_i_2_O_UNCONNECTED [3],D[30:28]}),
        .S({1'b0,\result[39]_i_5_n_0 ,\result[39]_i_6_n_0 ,\result[39]_i_7_n_0 }));
  LUT4 #(
    .INIT(16'hF708)) 
    s1_i_1
       (.I0(b0[9]),
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
  r21_mac10_add4_b4096_column_mse_serial_then_quadol u
       (.D({u_n_2,u_n_3,u_n_4,u_n_5,u_n_6,u_n_7,u_n_8,u_n_9,u_n_10,u_n_11,u_n_12,u_n_13,u_n_14,u_n_15,u_n_16,u_n_17,u_n_18,u_n_19,u_n_20,u_n_21,u_n_22,u_n_23,u_n_24}),
        .Q(Q),
        .S({\Y[12]_i_2_n_0 ,\Y[12]_i_3_n_0 ,\Y[12]_i_4_n_0 ,\Y[12]_i_5_n_0 }),
        .Y(p),
        .\Y_reg[16] ({\Y[16]_i_2_n_0 ,\Y[16]_i_3_n_0 ,\Y[16]_i_4_n_0 ,\Y[16]_i_5_n_0 }),
        .\Y_reg[20] ({\Y[20]_i_2_n_0 ,\Y[20]_i_3_n_0 ,\Y[20]_i_4_n_0 }),
        .a(a),
        .b0(b0),
        .busy_reg(issue),
        .c112_i_2_0(c112_i_2),
        .c112_i_2_1(c112_i_2_0),
        .c112_i_2_2(c112_i_2_1),
        .c112_i_2_3(c112_i_2_2),
        .c112_i_2_4(c112_i_2_3),
        .c112_i_2_5(c112_i_2_4),
        .c112_i_2_6(c112_i_2_5),
        .c112_i_2_7(c112_i_2_6),
        .c112_i_4_0(c112_i_4),
        .c112_i_4_1(c112_i_4_0),
        .c112_i_4_2(c112_i_4_1),
        .c112_i_4_3(c112_i_4_2),
        .c112_i_4_4(c112_i_4_3),
        .c112_i_4_5(c112_i_4_4),
        .c112_i_4_6(c112_i_4_5),
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
