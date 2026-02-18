`timescale 1ns/1ps

module comparator_2bit_test;

reg [1:0] A, B;

wire G_df, L_df, E_df;
wire G_beh, L_beh, E_beh;
wire G_str, L_str, E_str;

// Instantiate Dataflow
comparator_2bit_DF dut1 (
    .A(A),
    .B(B),
    .G(G_df),
    .L(L_df),
    .E(E_df)
);

// Instantiate Behavioral
comparator_2bit_beh dut2 (
    .A(A),
    .B(B),
    .G(G_beh),
    .L(L_beh),
    .E(E_beh)
);

// Instantiate Structural
comparator_2bit_using_1bit_str dut3 (
    .A(A),
    .B(B),
    .G(G_str),
    .L(L_str),
    .E(E_str)
);

initial begin

$monitor("A=%b B=%b | DF:(%b %b %b) | BEH:(%b %b %b) | STR:(%b %b %b)",
          A,B,
          G_df,L_df,E_df,
          G_beh,L_beh,E_beh,
          G_str,L_str,E_str);

// Test all possible combinations (0 to 3)

A=2'b00; B=2'b00; #10;
A=2'b00; B=2'b01; #10;
A=2'b00; B=2'b10; #10;
A=2'b00; B=2'b11; #10;

A=2'b01; B=2'b00; #10;
A=2'b01; B=2'b01; #10;
A=2'b01; B=2'b10; #10;
A=2'b01; B=2'b11; #10;

A=2'b10; B=2'b00; #10;
A=2'b10; B=2'b01; #10;
A=2'b10; B=2'b10; #10;
A=2'b10; B=2'b11; #10;

A=2'b11; B=2'b00; #10;
A=2'b11; B=2'b01; #10;
A=2'b11; B=2'b10; #10;
A=2'b11; B=2'b11; #10;

$finish;

end

endmodule
