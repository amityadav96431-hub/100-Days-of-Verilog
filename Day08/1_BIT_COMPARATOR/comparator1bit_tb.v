////////////////////////////
// COMPARATOR - DATA FLOW
//////////////////////////


module comparator_1bit_DF(A,B,G,L,E);
input A,B;
output G,L,E;

//A > B : AB'
assign G = A & (~B);

//A < B : A'B
assign L = (~A) & B;

//A = B : AB
assign E = ~(A ^ B);

endmodule


////////////////////////////
// COMPARATOR - BEHAVIORAL
//////////////////////////


module comparator_1bit_beh(A,B,G,L,E);
input A,B;
output reg G,L,E;

always@(*)begin

//A > B : AB'
 G = A & (~B);

//A < B : A'B
 L = (~A) & B;

//A = B : AB
 E = ~(A ^ B);
 
 end 

endmodule


////////////////////////////
// COMPARATOR - STRUCTURAL
//////////////////////////


module comparator_1bit_str(A,B,G,L,E);
input A,B;
output G,L,E;

    wire notA, notB;
    wire xor_AB;

    // Inverters
    not n1(notA, A);
    not n2(notB, B);

    // a > b
    and g1(G, A, notB);

    // a < b
    and g2(L, notA, B);

    // a == b
    //note - here if we use and gate ,as used in above for at A=0,B=0 give 0 output instead of 1
    // we want at A=1.B=1 or A=0,B=0 output should be 1
    //so we  use xnor = A'B'+AB   and we conot directly use xnor thefore we use xor
    xor g3(xor_AB, A, B);
    not n3(E, xor_AB);

endmodule

