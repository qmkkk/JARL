`timescale 1ns/1ps
module tb;
reg clk=0;always #7.5 clk=~clk;
reg reset=1,coeff_we=0,sample_valid=0;
reg [3:0] coeff_addr=0;
reg signed [9:0] coeff_data=0,sample_data=0;
wire sample_ready,result_valid;wire signed [39:0] result;
r23_fir10_quadol_wce dut(.*);
reg [9:0] coeffs[0:95];reg [9:0] samples[0:6143];reg [39:0] gold[0:6143];
integer block_no,i,j,n,checks=0;
initial begin
$readmemh("D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/inputs/w10_coeff.hex",coeffs);$readmemh("D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/inputs/w10_samples.hex",samples);$readmemh("D:/paper_project_5/project_3/autonomous_campaign_20261014/round23/inputs/r23_fir10_quadol_wce_gold.hex",gold);
#500;
for(block_no=0;block_no<6;block_no=block_no+1)begin
@(negedge clk);reset=1;coeff_we=0;sample_valid=0;
repeat(4)@(posedge clk);
@(negedge clk);reset=0;
for(j=0;j<16;j=j+1)begin coeff_we=1;coeff_addr=j;coeff_data=coeffs[block_no*16+j];@(negedge clk);end
coeff_we=0;#1;
for(i=0;i<1024;i=i+1)begin
if(!sample_ready)$fatal(1,"not ready");
sample_valid=1;sample_data=samples[block_no*1024+i];
@(posedge clk);#1;
@(negedge clk);sample_valid=0;
repeat(19)@(posedge clk);#1;
n=block_no*1024+i;
if(!result_valid || !sample_ready || result!==gold[n])$fatal(1,"mismatch n=%0d got=%0d expected=%0d valid=%0b",n,$signed(result),$signed(gold[n]),result_valid);
checks=checks+1;
@(negedge clk);
end
end
$display("R23_FIR_PASS checks=%0d latency=19 II=20",checks);$finish;
end
initial begin #3000000;$fatal(1,"timeout");end
endmodule
