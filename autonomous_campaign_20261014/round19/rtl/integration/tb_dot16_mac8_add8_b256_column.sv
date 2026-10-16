`timescale 1ns/1ps
module tb_dot16_mac8_add8_b256_column;
reg clk=0;always #5 clk=~clk;reg reset=1,valid=0,start=0,last=0;reg[15:0] A=0,B=0;wire[31:0]Y[0:2];wire done[0:2];integer fd,rc,cy=0,j,v,s,l,a,b,ed;reg[31:0]e[0:2];
r19_dot16_mac8_add8_b256_column_seed u0(.clk(clk),.reset(reset),.valid(valid),.start(start),.last(last),.A(A),.B(B),.Y(Y[0]),.done(done[0]));
r19_dot16_mac8_add8_b256_column_quadol_wce u1(.clk(clk),.reset(reset),.valid(valid),.start(start),.last(last),.A(A),.B(B),.Y(Y[1]),.done(done[1]));
r19_dot16_mac8_add8_b256_column_state_window u2(.clk(clk),.reset(reset),.valid(valid),.start(start),.last(last),.A(A),.B(B),.Y(Y[2]),.done(done[2]));
initial begin #200;repeat(4)@(posedge clk);@(negedge clk);reset=0;
fd=$fopen("mac8_add8_b256_column_vectors.txt","r");if(fd==0)$fatal(1,"missing");
while(!$feof(fd))begin
rc=$fscanf(fd,"%d %d %d %d %d %d %d %d %d\n",v,s,l,a,b,ed,e[0],e[1],e[2]);
if(rc==9)begin valid=v;start=s;last=l;A=a;B=b;@(posedge clk);#1;
for(j=0;j<3;j=j+1)begin if(done[j]!==ed[0])$fatal(1,"done cycle %0d model %0d",cy,j);if(ed&&Y[j]!==e[j])$fatal(1,"sum cycle %0d model %0d",cy,j);end
cy=cy+1;@(negedge clk);end else if(rc!=-1)$fatal(1,"bad input");end
$display("DOT_PASS mac8_add8_b256_column cycles=%0d",cy);$finish;end endmodule
