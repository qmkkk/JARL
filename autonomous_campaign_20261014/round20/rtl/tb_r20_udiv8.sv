`timescale 1ns/1ps
module tb_r20_udiv8;
reg clk=0; always #5 clk=~clk;
reg [15:0] A=0,B=0;
wire [31:0] Y[0:14];
reg [31:0] expected[0:14];
reg [31:0] aa,bb; integer fd,rc,line_no=0,k;
r20_udiv8_b1_quadol_wce u0(.clk(clk),.A(A),.B(B),.Y(Y[0]));
r20_udiv8_b1_serial_then_quadol u1(.clk(clk),.A(A),.B(B),.Y(Y[1]));
r20_udiv8_b1_state_window u2(.clk(clk),.A(A),.B(B),.Y(Y[2]));
r20_udiv8_b2_quadol_wce u3(.clk(clk),.A(A),.B(B),.Y(Y[3]));
r20_udiv8_b2_serial_then_quadol u4(.clk(clk),.A(A),.B(B),.Y(Y[4]));
r20_udiv8_b2_state_window u5(.clk(clk),.A(A),.B(B),.Y(Y[5]));
r20_udiv8_b4_quadol_wce u6(.clk(clk),.A(A),.B(B),.Y(Y[6]));
r20_udiv8_b4_serial_then_quadol u7(.clk(clk),.A(A),.B(B),.Y(Y[7]));
r20_udiv8_b4_state_window u8(.clk(clk),.A(A),.B(B),.Y(Y[8]));
r20_udiv8_b8_quadol_wce u9(.clk(clk),.A(A),.B(B),.Y(Y[9]));
r20_udiv8_b8_serial_then_quadol u10(.clk(clk),.A(A),.B(B),.Y(Y[10]));
r20_udiv8_b8_state_window u11(.clk(clk),.A(A),.B(B),.Y(Y[11]));
r20_udiv8_b16_quadol_wce u12(.clk(clk),.A(A),.B(B),.Y(Y[12]));
r20_udiv8_b16_serial_then_quadol u13(.clk(clk),.A(A),.B(B),.Y(Y[13]));
r20_udiv8_b16_state_window u14(.clk(clk),.A(A),.B(B),.Y(Y[14]));
initial begin #200;
fd=$fopen("udiv8_golden.hex","r"); if(fd==0) $fatal(1,"missing vectors");
while(!$feof(fd)) begin
rc=$fscanf(fd,"%h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h\n",aa,bb,expected[0],expected[1],expected[2],expected[3],expected[4],expected[5],expected[6],expected[7],expected[8],expected[9],expected[10],expected[11],expected[12],expected[13],expected[14]);
if(rc==17) begin
@(negedge clk); A=aa[15:0]; B=bb[15:0]; repeat(2) @(posedge clk); #1;
for(k=0;k<15;k=k+1) if(Y[k]!==expected[k]) $fatal(1,"Mismatch line=%0d design=%0d",line_no,k);
line_no=line_no+1; end else if(rc!=-1) $fatal(1,"Malformed vector");
end
$display("R20_PASS family=udiv8 vectors=%0d designs=15",line_no); $finish;
end
endmodule
