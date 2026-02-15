`timescale 1ns / 1ps
///////////////////////////////////////
//FULL SUBTRACTOR - DATA FLOW
//////////////////////////////////////////

module full_subtractor_df(
input a,b,bin,
output diff,bout
    );
 
 assign diff = a^b^bin;
 assign bout = ((~a)&b)|(b&bin)|((~a)&bin);
    
endmodule

///////////////////////////////////////
//FULL SUBTRACTOR - BEHAVIORAL
//////////////////////////////////////////

module full_subtractor_beh(
input a,b,bin,
output reg diff,bout
    );
 always@(*)begin  
 
 diff = a^b^bin;
 bout = ((~a)&b)|(b&bin)|((~a)&bin);
 
  end
endmodule


///////////////////////////////////////
//FULL SUBTRACTOR - STRUCTURAL
//////////////////////////////////////////

module full_subtractor_str(
    input a, b, bin,
    output diff, bout
);
//This is NOT a full subtractor built using two half subtractors.
//Structural modeling = connecting modules or primitives
// Gate-level modeling = using primitive gates (and, or, xor, not)

//Gate-level modeling is a type of structural modeling.
// This is a direct gate-level implementation from Boolean equation.
    wire w1, w2, w3,w4,nota;

    xor x1(w1, a, b);
    xor x2(diff, w1, bin);

    not n1(nota, a);

    and a1(w2, nota, b);
    and a2(w3, b, bin);
    and a3(w4, nota, bin);
    or  o1(bout, w2, w3,w4);

endmodule
// if we have to the same thing using twi half subtractor then follow the lower and top module approach in structural


