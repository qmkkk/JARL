module mac9_add6_b1024_column_mse_source(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);
reg[8:0]a_q;reg[14:0]b_q;
wire[17:0]row0 = {9'b0,(a_q[8] & b_q[0]),1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} << 0;
wire[17:0]row1 = {9'b0,(a_q[8] & b_q[1]),(a_q[7] & b_q[1]),1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} << 1;
wire[17:0]row2 = {9'b0,(a_q[8] & b_q[2]),(a_q[7] & b_q[2]),(a_q[6] & b_q[2]),1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} << 2;
wire[17:0]row3 = {9'b0,(a_q[8] & b_q[3]),(a_q[7] & b_q[3]),(a_q[6] & b_q[3]),(a_q[5] & b_q[3]),1'b0,1'b0,1'b0,1'b0,1'b0} << 3;
wire[17:0]row4 = {9'b0,(a_q[8] & b_q[4]),(a_q[7] & b_q[4]),(a_q[6] & b_q[4]),(a_q[5] & b_q[4]),(a_q[4] & b_q[4]),1'b0,1'b0,1'b0,1'b0} << 4;
wire[17:0]row5 = {9'b0,(a_q[8] & b_q[5]),(a_q[7] & b_q[5]),(a_q[6] & b_q[5]),(a_q[5] & b_q[5]),(a_q[4] & b_q[5]),(a_q[3] & b_q[5]),1'b0,1'b0,1'b0} << 5;
wire[17:0]row6 = {9'b0,(a_q[8] & b_q[6]),(a_q[7] & b_q[6]),(a_q[6] & b_q[6]),(a_q[5] & b_q[6]),(a_q[4] & b_q[6]),(a_q[3] & b_q[6]),(a_q[2] & b_q[6]),1'b0,1'b0} << 6;
wire[17:0]row7 = {9'b0,(a_q[8] & b_q[7]),(a_q[7] & b_q[7]),(a_q[6] & b_q[7]),(a_q[5] & b_q[7]),(a_q[4] & b_q[7]),(a_q[3] & b_q[7]),(a_q[2] & b_q[7]),(a_q[1] & b_q[7]),1'b0} << 7;
wire[17:0]row8 = {9'b0,(a_q[8] & b_q[8]),(a_q[7] & b_q[8]),(a_q[6] & b_q[8]),(a_q[5] & b_q[8]),(a_q[4] & b_q[8]),(a_q[3] & b_q[8]),(a_q[2] & b_q[8]),(a_q[1] & b_q[8]),(a_q[0] & b_q[8])} << 8;
wire[17:0]sum0_0=row0+row1;
wire[17:0]sum0_1=row2+row3;
wire[17:0]sum0_2=row4+row5;
wire[17:0]sum0_3=row6+row7;
wire[17:0]sum1_0=sum0_0+sum0_1;
wire[17:0]sum1_1=sum0_2+sum0_3;
wire[17:0]sum2_0=sum1_0+sum1_1;
wire[17:0]sum3_0=sum2_0+row8;
wire[17:0]q=sum3_0+18'd769+b_q[14:9];
always @(posedge clk) begin a_q<=A[8:0];b_q<=B[14:0];Y<=q;end
endmodule
