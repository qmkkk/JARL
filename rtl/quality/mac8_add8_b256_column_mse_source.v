module mac8_add8_b256_column_mse_source(input wire clk,input wire[15:0] A,B,output reg[31:0] Y);
reg[7:0]a_q;reg[15:0]b_q;
wire[15:0]row0 = {8'b0,(a_q[7] & b_q[0]),(a_q[6] & b_q[0]),1'b0,1'b0,1'b0,1'b0,1'b0,1'b0} << 0;
wire[15:0]row1 = {8'b0,(a_q[7] & b_q[1]),(a_q[6] & b_q[1]),(a_q[5] & b_q[1]),1'b0,1'b0,1'b0,1'b0,1'b0} << 1;
wire[15:0]row2 = {8'b0,(a_q[7] & b_q[2]),(a_q[6] & b_q[2]),(a_q[5] & b_q[2]),(a_q[4] & b_q[2]),1'b0,1'b0,1'b0,1'b0} << 2;
wire[15:0]row3 = {8'b0,(a_q[7] & b_q[3]),(a_q[6] & b_q[3]),(a_q[5] & b_q[3]),(a_q[4] & b_q[3]),(a_q[3] & b_q[3]),1'b0,1'b0,1'b0} << 3;
wire[15:0]row4 = {8'b0,(a_q[7] & b_q[4]),(a_q[6] & b_q[4]),(a_q[5] & b_q[4]),(a_q[4] & b_q[4]),(a_q[3] & b_q[4]),(a_q[2] & b_q[4]),1'b0,1'b0} << 4;
wire[15:0]row5 = {8'b0,(a_q[7] & b_q[5]),(a_q[6] & b_q[5]),(a_q[5] & b_q[5]),(a_q[4] & b_q[5]),(a_q[3] & b_q[5]),(a_q[2] & b_q[5]),(a_q[1] & b_q[5]),1'b0} << 5;
wire[15:0]row6 = {8'b0,(a_q[7] & b_q[6]),(a_q[6] & b_q[6]),(a_q[5] & b_q[6]),(a_q[4] & b_q[6]),(a_q[3] & b_q[6]),(a_q[2] & b_q[6]),(a_q[1] & b_q[6]),(a_q[0] & b_q[6])} << 6;
wire[15:0]row7 = {8'b0,(a_q[7] & b_q[7]),(a_q[6] & b_q[7]),(a_q[5] & b_q[7]),(a_q[4] & b_q[7]),(a_q[3] & b_q[7]),(a_q[2] & b_q[7]),(a_q[1] & b_q[7]),(a_q[0] & b_q[7])} << 7;
wire[15:0]sum0_0=row0+row1;
wire[15:0]sum0_1=row2+row3;
wire[15:0]sum0_2=row4+row5;
wire[15:0]sum0_3=row6+row7;
wire[15:0]sum1_0=sum0_0+sum0_1;
wire[15:0]sum1_1=sum0_2+sum0_3;
wire[15:0]sum2_0=sum1_0+sum1_1;
wire[15:0]q=sum2_0+16'd80+b_q[15:8];
always @(posedge clk) begin a_q<=A[7:0];b_q<=B[15:0];Y<=q;end
endmodule
