`timescale 1ns/1ps
module tb_mac10_add4_b4096_column;
reg clk=0; always #5 clk=~clk;
reg [15:0] A=0,B=0;
wire [31:0] Y[0:5];
reg [31:0] expected[0:5];
reg [31:0] aa,bb; integer fd,rc,line_no=0,k;
r19_mac10_add4_b4096_column_seed u0(.clk(clk),.A(A),.B(B),.Y(Y[0]));
r19_mac10_add4_b4096_column_quadol_wce u1(.clk(clk),.A(A),.B(B),.Y(Y[1]));
r19_mac10_add4_b4096_column_static_full u2(.clk(clk),.A(A),.B(B),.Y(Y[2]));
r19_mac10_add4_b4096_column_state_const5 u3(.clk(clk),.A(A),.B(B),.Y(Y[3]));
r19_mac10_add4_b4096_column_state_exact u4(.clk(clk),.A(A),.B(B),.Y(Y[4]));
r19_mac10_add4_b4096_column_state_window u5(.clk(clk),.A(A),.B(B),.Y(Y[5]));
initial begin #200;
fd=$fopen("mac10_add4_b4096_column_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");
while(!$feof(fd)) begin
rc=$fscanf(fd,"%h %h %h %h %h %h %h %h\n",aa,bb,expected[0],expected[1],expected[2],expected[3],expected[4],expected[5]);
if(rc==8) begin
@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;
for(k=0;k<6;k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);
line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");
end
$display("R19_PASS case=mac10_add4_b4096_column vectors=%0d designs=6",line_no); $finish;
end
endmodule
