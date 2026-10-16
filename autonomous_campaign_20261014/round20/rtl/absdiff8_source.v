module absdiff8_source(input clk,input [15:0] A,B,output reg [31:0] Y);
reg [7:0] ar;
reg [7:0] br;
wire [31:0] q=ar >= br ? ar-br : br-ar;
always @(posedge clk) begin ar<=A[7:0];br<=B[7:0];Y<=q;end
endmodule
