`timescale 1ns/1ps
module tb_jarl_quality_mac10_add4_b4096_column_mse;
reg clk=0;always #5 clk=~clk;
reg [15:0] A=0,B=0;
wire[31:0] Y[0:3];
reg[31:0] expected[0:3];
reg[31:0] aa,bb;integer fd,rc,line_no=0,k;
jarl_quality_mac10_add4_b4096_column_mse_quadol_wce u0(.clk(clk),.A(A),.B(B),.Y(Y[0]));
jarl_quality_mac10_add4_b4096_column_mse_serial_then_quadol u1(.clk(clk),.A(A),.B(B),.Y(Y[1]));
jarl_quality_mac10_add4_b4096_column_mse_state_window u2(.clk(clk),.A(A),.B(B),.Y(Y[2]));
jarl_quality_mac10_add4_b4096_column_mse_quality_window u3(.clk(clk),.A(A),.B(B),.Y(Y[3]));
initial begin #200;
fd=$fopen("mac10_add4_b4096_column_mse_golden.hex","r");if(fd==0)$fatal(1,"missing");
while(!$feof(fd))begin
rc=$fscanf(fd,"%h %h %h %h %h %h\n",aa,bb,expected[0],expected[1],expected[2],expected[3]);
if(rc==6)begin
@(negedge clk);A=aa[15:0];B=bb[15:0];repeat(2)@(posedge clk);#1;
for(k=0;k<4;k=k+1)if(Y[k]!==expected[k])$fatal(1,"line%0d method%0d",line_no,k);
line_no=line_no+1;end else if(rc!=-1)$fatal(1,"malformed");end
$display("jarl_quality_PASS family=mac10_add4_b4096_column_mse vectors=%0d designs=4",line_no);$finish;end
endmodule
