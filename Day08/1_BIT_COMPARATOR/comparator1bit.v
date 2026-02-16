`timescale 1ns/1ps

module comparator_1bit_test;

reg A, B;

wire G_df, L_df, E_df;
wire G_beh, L_beh, E_beh;
wire G_str, L_str, E_str;

// Instantiate Dataflow
comparator_1bit_DF dut1 (
    .A(A),
    .B(B),
    .G(G_df),
    .L(L_df),
    .E(E_df)
);

// Instantiate Behavioral
comparator_1bit_beh dut2 (
    .A(A),
    .B(B),
    .G(G_beh),
    .L(L_beh),
    .E(E_beh)
);

// Instantiate Structural
comparator_1bit_str dut3 (
    .A(A),
    .B(B),
    .G(G_str),
    .L(L_str),
    .E(E_str)
);

initial begin
$dumpfile("comparator_1bit.vcd");
$dumpvars(0,comparator_1bit_test);

    $monitor("A=%b B=%b | DF:(G=%b L=%b E=%b) | BEH:(G=%b L=%b E=%b) | STR:(G=%b L=%b E=%b)",
              A,B,
              G_df,L_df,E_df,
              G_beh,L_beh,E_beh,
              G_str,L_str,E_str);

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
end

endmodule
