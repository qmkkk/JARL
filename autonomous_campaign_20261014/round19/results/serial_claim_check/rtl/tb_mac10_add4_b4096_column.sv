`timescale 1ns/1ps
module tb_mac10_add4_b4096_column;
reg clk=0; always #5 clk=~clk;
reg [15:0] A=0,B=0;
wire [31:0] Y[0:0];
reg [31:0] expected[0:0];
reg [31:0] aa,bb; integer fd,rc,line_no=0,k;
s19_mac10_add4_b4096_column_quadol_wce u0(.clk(clk),.A(A),.B(B),.Y(Y[0]));
initial begin #200;
fd=$fopen("mac10_add4_b4096_column_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");
while(!$feof(fd)) begin
rc=$fscanf(fd,"%h %h %h\n",aa,bb,expected[0]);
if(rc==3) begin
@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;
for(k=0;k<1;k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);
line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");
end
$display("SERIAL_PASS case=mac10_add4_b4096_column vectors=%0d designs=1",line_no); $finish;
end
endmodule
