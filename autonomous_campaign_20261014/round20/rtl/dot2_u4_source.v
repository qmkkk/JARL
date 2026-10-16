module dot2_u4_source(input clk,input [15:0] A,B,output reg [31:0] Y);
reg [7:0] ar;
reg [7:0] br;
wire [31:0] q={24'b0,ar[3:0]} * {24'b0,br[3:0]} + {24'b0,ar[7:4]} * {24'b0,br[7:4]};
always @(posedge clk) begin ar<=A[7:0];br<=B[7:0];Y<=q;end
endmodule
