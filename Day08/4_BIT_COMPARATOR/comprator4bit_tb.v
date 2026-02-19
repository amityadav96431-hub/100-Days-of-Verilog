`timescale 1ns/1ps

module comparator_4bit_test;

reg [3:0] A, B;

wire G_df, L_df, E_df;
wire G_beh, L_beh, E_beh;
wire G_str, L_str, E_str;

// Instantiate Dataflow
comparator_4bit_df dut1 (
    .A(A),
    .B(B),
    .G(G_df),
    .L(L_df),
    .E(E_df)
);

// Instantiate Behavioral
comparator_4bit_beh dut2 (
    .A(A),
    .B(B),
    .G(G_beh),
    .L(L_beh),
    .E(E_beh)
);

// Instantiate Structural (using 2-bit blocks)
comparator_4bit_using_2bit dut3 (
    .A(A),
    .B(B),
    .G(G_str),
    .L(L_str),
    .E(E_str)
);

initial begin

$monitor("A=%d B=%d | DF:(%b %b %b) | BEH:(%b %b %b) | STR:(%b %b %b)",
          A,B,
          G_df,L_df,E_df,
          G_beh,L_beh,E_beh,
          G_str,L_str,E_str);

// Some test cases
A=4'd0;  B=4'd0;  #10;
A=4'd3;  B=4'd5;  #10;
A=4'd8;  B=4'd2;  #10;
A=4'd7;  B=4'd7;  #10;
A=4'd15; B=4'd1;  #10;
A=4'd4;  B=4'd9;  #10;
A=4'd10; B=4'd10; #10;
A=4'd12; B=4'd14; #10;

$finish;

end

endmodule
