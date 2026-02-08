`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2026 09:46:40 PM
// Design Name: 
// Module Name: nor_gate_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nor_gate_tb;
reg a,b;
wire y;

nor_gate dut(.a(a),.b(b),.y(y));
initial begin
$monitor("time=%b a=%b b=%b y=%b",$time ,a,b,y);
a=1;b=1;
#10;
a=1;b=0;
#10;
a=0;b=0;
#10;
a=0;b=1;
#10;
$finish;
end
endmodule
