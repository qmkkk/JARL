module r19_dot16_mac9_add6_b1024_column_state_window(input wire clk,input wire reset,input wire valid,input wire start,input wire last,input wire[15:0] A,B,output reg[31:0] Y,output reg done);
wire[31:0] product;
r19_mac9_add6_b1024_column_state_window core(.clk(clk),.A(A),.B({7'b0,B[8:0]}),.Y(product));
reg v0,v1,s0,s1,l0,l1;reg[31:0] acc;
always @(posedge clk) begin
 if(reset)begin v0<=0;v1<=0;s0<=0;s1<=0;l0<=0;l1<=0;acc<=0;Y<=0;done<=0;end
 else begin
  v0<=valid;v1<=v0;s0<=start;s1<=s0;l0<=last;l1<=l0;done<=0;
  if(v1)begin acc<=s1?product:acc+product;if(l1)begin Y<=s1?product:acc+product;done<=1;end end
 end
end
endmodule
