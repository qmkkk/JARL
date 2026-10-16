"""Generate a sequential WCE miter using the existing Yosys Xilinx models.

Preparation only; a caller must register cases/time limits and execute the SAT
tool, classify SUCCESS/FAIL/TIMEOUT, and preserve logs. A tool timeout is not a
counterexample. No separately checked proof certificate is implied.
"""
def unsigned_wce_miter(top,dut,gold,budget):
 assert budget>=0
 return f'''module {top}(input clk,input [15:0] A,B,output good,output [31:0] actual,reference);
{dut} d(.clk(clk),.A(A),.B(B),.Y(actual));
{gold} g(.clk(clk),.A(A),.B(B),.Y(reference));
wire [32:0] delta=actual>=reference?{{1'b0,actual}}-{{1'b0,reference}}:{{1'b0,reference}}-{{1'b0,actual}};
assign good=delta<=33'd{budget};
endmodule
'''

def yosys_script(model_path,source_paths,miter_path,top,latency=2,timeout_s=120):
 assert latency>=1 and timeout_s>0
 def quote(p):return '"'+str(p).replace('\\','/')+'"'
 return '\n'.join([
  'read_verilog '+quote(model_path),
  *['read_verilog -sv '+quote(p) for p in source_paths],
  'read_verilog -sv '+quote(miter_path),
  'prep -flatten -top '+top,
  'memory_map','opt',
  f'sat -seq {latency+1} -prove-skip {latency} -prove good 1 -set-def-inputs -timeout {timeout_s} -show A,B,actual,reference -verify',
 ])+'\n'
