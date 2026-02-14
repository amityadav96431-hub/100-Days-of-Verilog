`timescale 1ns / 1ps

//==========================================
// FULL ADDER - DATA FLOW
//============================



module full_adder_df(
input a,b,cin,
output sum,cout
    );
    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(a&cin);
    
endmodule

//==========================================
// FULL ADDER - BEHAVIORAL
//============================

module full_adder_beh(
input a,b,cin,
output reg sum,cout
    );
    
    always@(*)begin
    
     sum = a^b^cin;
     cout = (a&b)|(b&cin)|(a&cin);
    end
endmodule

//==========================================
// FULL ADDER - STRUCTURAL
//============================

  module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    wire w1, w2, w3;

    // First XOR
    xor (w1, a, b);

    // Second XOR for SUM
    xor (sum, w1, cin);

    // AND gates
    and (w2, a, b);
    and (w3, w1, cin);

    // OR gate for COUT
    or  (cout, w2, w3);


endmodule




