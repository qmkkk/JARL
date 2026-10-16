module isqrt16_source(input clk,input [15:0] A,B,output reg [31:0] Y);
reg [15:0] ar;
function [7:0] isqrt; input [15:0] v; integer i; reg [15:0] rr,trial; reg [31:0] square; begin rr=0; for(i=7;i>=0;i=i-1) begin trial=rr | (16'b1 << i); square=trial*trial; if(square<=v) rr=trial; end isqrt=rr[7:0]; end endfunction
wire [31:0] q=isqrt(ar);
always @(posedge clk) begin ar<=A[15:0];Y<=q;end
endmodule
