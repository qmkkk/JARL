"""Programmable FIR harness with explicit history, control and accumulation.

No experiment is started by importing this file. Bind a frozen multiplication
core and register a complete system matrix before use. No novelty claim is made
for the standard FIR architecture or its compositional error bound.
"""
def fir_rtl(top,coretop,taps=16,core_latency=2):
 assert taps in (16,32) and core_latency>=2
 addr=4 if taps==16 else 5
 return f'''module {top}(
 input wire clk, reset,
 input wire coeff_we, input wire [{addr-1}:0] coeff_addr,
 input wire signed [15:0] coeff_data,
 input wire sample_valid, input wire signed [15:0] sample_data,
 output wire sample_ready,
 output reg result_valid, output reg signed [39:0] result
);
localparam integer TAPS={taps};
localparam integer LAT={core_latency};
reg signed [15:0] history[0:TAPS-1];
reg signed [15:0] coeff[0:TAPS-1];
reg busy;
reg [{addr}:0] index;
wire issue=busy && index<TAPS;
wire [15:0] a=issue?history[index[{addr-1}:0]]:16'b0;
wire [15:0] b=issue?coeff[index[{addr-1}:0]]:16'b0;
wire [31:0] p_bits;
wire signed [39:0] product={{{{8{{p_bits[31]}}}},p_bits}};
{coretop} core(.clk(clk),.A(a),.B(b),.Y(p_bits));
reg [LAT-1:0] vpipe,firstpipe,lastpipe;
reg signed [39:0] acc;
wire signed [39:0] next_acc=firstpipe[LAT-1]?product:acc+product;
assign sample_ready=!busy && !coeff_we;
integer j;
always @(posedge clk) begin
 if(reset)begin
  busy<=0;index<=0;vpipe<=0;firstpipe<=0;lastpipe<=0;
  acc<=0;result<=0;result_valid<=0;
  for(j=0;j<TAPS;j=j+1)history[j]<=0;
 end else begin
  result_valid<=0;
  if(coeff_we && !busy)coeff[coeff_addr]<=coeff_data;
  vpipe<={{vpipe[LAT-2:0],issue}};
  firstpipe<={{firstpipe[LAT-2:0],issue && index==0}};
  lastpipe<={{lastpipe[LAT-2:0],issue && index==TAPS-1}};
  if(sample_valid && sample_ready)begin
   for(j=TAPS-1;j>0;j=j-1)history[j]<=history[j-1];
   history[0]<=sample_data;busy<=1;index<=0;acc<=0;
  end
  if(issue)index<=index+1'b1;
  if(vpipe[LAT-1])begin
   acc<=next_acc;
   if(lastpipe[LAT-1])begin result<=next_acc;result_valid<=1;busy<=0;end
  end
 end
end
endmodule
'''

def signed16_tiled_rtl(top,tiletop):
 """Four unsigned8 tiles; exact signed correction and40-bit intermediate.

 If each tile satisfies |error|<=B, the signed16 product error is at most
 B*(1+256+256+65536). This is composition, not monolithic32-input synthesis.
 The bound must also keep the result inside signed32 range before using Y.
 Latency is three register stages; all compared variants must share it.
 """
 return f'''module {top}(input wire clk,input wire [15:0] A,B,output reg [31:0] Y);
wire [31:0] p00,p01,p10,p11;
{tiletop} t00(.clk(clk),.A({{8'b0,A[7:0]}}),.B({{8'b0,B[7:0]}}),.Y(p00));
{tiletop} t01(.clk(clk),.A({{8'b0,A[7:0]}}),.B({{8'b0,B[15:8]}}),.Y(p01));
{tiletop} t10(.clk(clk),.A({{8'b0,A[15:8]}}),.B({{8'b0,B[7:0]}}),.Y(p10));
{tiletop} t11(.clk(clk),.A({{8'b0,A[15:8]}}),.B({{8'b0,B[15:8]}}),.Y(p11));
reg [15:0] a1,a2,b1,b2;
wire signed [39:0] unsigned_product=$signed({{8'b0,p00}})+($signed({{8'b0,p01}})<<<8)+($signed({{8'b0,p10}})<<<8)+($signed({{8'b0,p11}})<<<16);
wire signed [39:0] signed_product=unsigned_product
 -(a2[15]?$signed({{8'b0,b2,16'b0}}):40'sd0)
 -(b2[15]?$signed({{8'b0,a2,16'b0}}):40'sd0)
 +((a2[15] && b2[15])?40'sd4294967296:40'sd0);
always @(posedge clk)begin a1<=A;a2<=a1;b1<=B;b2<=b1;Y<=signed_product[31:0];end
endmodule
'''
