`timescale 1ns / 1ps

module full_adder_common_tb;

    reg a, b, cin;

    wire sum_df, cout_df;
    wire sum_beh, cout_beh;
    wire sum_str, cout_str;

    // Instantiate Dataflow
    full_adder_df U1 (
        .a(a), .b(b), .cin(cin),
        .sum(sum_df), .cout(cout_df)
    );

    // Instantiate Behavioral
    full_adder_beh U2 (
        .a(a), .b(b), .cin(cin),
        .sum(sum_beh), .cout(cout_beh)
    );

    // Instantiate Structural
    full_adder U3 (
        .a(a), .b(b), .cin(cin),
        .sum(sum_str), .cout(cout_str)
    );

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0,full_adder_common_tb);


        $display(" a b cin | DF_sum DF_cout | BEH_sum BEH_cout | STR_sum STR_cout");
        $monitor(" %b %b  %b  |    %b      %b   |    %b       %b    |    %b       %b",
                  a, b, cin,
                  sum_df, cout_df,
                  sum_beh, cout_beh,
                  sum_str, cout_str);

        // Test all 8 combinations
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;

        $finish;
    end

endmodule
