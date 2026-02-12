`timescale 1ns / 1ps

module half_subtractor_tb;
reg a,b;
wire sum_df,cout_df;
wire sum_beh,cout_beh;
wire sum_str,cout_str;

  //instantiating all three model   
half_subtractor_df h1(a,b,sum_df,cout_df);
half_subtractor_beh h2(a,b, sum_beh,cout_beh);
half_subtractor_str h3(a,b, sum_str,cout_str);   

initial begin

$dumpfile("half_subtractor.vcd");
$dumpvars(0,half_subtractor_tb);

a=0;b=0;
#10 a=0;b=1; 
#10 a=1;b=0;   
#10 a=1;b=1; 
#10$finish;
end
endmodule
