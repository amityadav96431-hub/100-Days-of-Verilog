`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2026 11:04:21 PM
// Design Name: 
// Module Name: nand_gate_tb
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


module nand_gate_tb;
reg a,b;
wire y;
     nand_gate dut(.a(a),.b(b),.y(y));
     initial begin
     $monitor("time =%0t  a =%b b =%b y =%b",$time,a,b,y);
     
     a=1; b=1;
     a=0;b=1;#10;
     a=1;b=0;#10;
     a= 0;b=0;
     end
     
     
endmodule
