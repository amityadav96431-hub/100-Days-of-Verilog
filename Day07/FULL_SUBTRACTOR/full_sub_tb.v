module full_subtractor_test;
reg a,b,bin;
wire diff_df,bout_df;
wire diff_beh,bout_beh;
wire diff_str,bout_str;

//INSTANTIAON
full_subtractor_df dut1(.a(a),.b(b),.bin(bin),.diff(diff_df),.bout(bout_df));
full_subtractor_beh dut2(.a(a),.b(b),.bin(bin),.diff(diff_beh),.bout(bout_beh));
full_subtractor_str dut3(.a(a),.b(b),.bin(bin),.diff(diff_str),.bout(bout_str));

initial begin

$dumpfile("full_subtractor.vcd");
$dumpvars(0,full_subtractor_test);

$monitor("time = %0t a=%0b b=%0b bin=%0b | DF=%0b %0b | BEH=%0b %0b | STR=%0b %0b",
         $time,a,b,bin,
         diff_df,bout_df,
         diff_beh,bout_beh,
         diff_str,bout_str);

 a=0; b=0; bin=0; #10;
 a=0; b=0; bin=1; #10;
 a=0; b=1; bin=0; #10;
 a=0; b=1; bin=1; #10;
 a=1; b=0; bin=0; #10;
 a=1; b=0; bin=1; #10;
 a=1; b=1; bin=0; #10;
 a=1; b=1; bin=1; #10;

 $finish;
end

endmodule