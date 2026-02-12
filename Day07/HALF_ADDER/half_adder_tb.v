`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2026 05:37:17 PM
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb;
reg a,b;
wire sum_df,cout_df;
wire sum_beh,cout_beh;
wire sum_str,cout_str;

  //instantiating all three model   
half_adder_df h1(a,b,sum_df,cout_df);
half_adder_beh h2(a,b, sum_beh,cout_beh);
half_adder_str h3(a,b, sum_str,cout_str);   

initial begin

$dumpfile("half_adder.vcd");
$dumpvars(0,half_adder_tb);

a=0;b=0;
#10 a=0;b=1; 
#10 a=1;b=0;   
#10 a=1;b=1; 
#10$finish;
end
endmodule
