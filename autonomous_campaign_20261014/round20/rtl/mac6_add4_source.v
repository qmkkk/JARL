module mac6_add4_source(input clk,input [15:0] A,B,output reg [31:0] Y);
reg [5:0] ar;
reg [9:0] br;
wire [31:0] q=ar * br[5:0] + br[9:6];
always @(posedge clk) begin ar<=A[5:0];br<=B[9:0];Y<=q;end
endmodule
