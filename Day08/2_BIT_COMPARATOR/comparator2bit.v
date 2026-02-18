
//////////////////////////////////
//COMPARATOR - DATA FLOW
////////////////////////////////

module comparator_2bit_DF(
    input  [1:0] A,
    input  [1:0] B,
    output G,
    output L,
    output E
);

// Equality
assign E = ~(A[1]^B[1]) & ~(A[0]^B[0]);

// Greater
assign G = (A[1] & ~B[1]) |
           ( ~(A[1]^B[1]) & (A[0] & ~B[0]) );

// Less
assign L = (~A[1] & B[1]) |
           ( ~(A[1]^B[1]) & (~A[0] & B[0]) );

endmodule

//////////////////////////////////
// COMPARATOR - BEHAVIORAL
////////////////////////////
module comparator_2bit_beh(
    input  [1:0] A,
    input  [1:0] B,
    output reg G,
    output reg L,
    output reg E
);

always @(*) begin

    if (A > B) begin
        G = 1; L = 0; E = 0;
    end
    else if (A < B) begin
        G = 0; L = 1; E = 0;
    end
    else begin
        G = 0; L = 0; E = 1;
    end

end

endmodule

/////////////////////////////////////
//COMPARATOR - STUCTURAL
///////////////////////////

module comparator_1bit(
    input A,
    input B,
    output G,
    output L,
    output E
);

assign G = A & ~B;
assign L = ~A & B;
assign E = ~(A ^ B);

endmodule


module comparator_2bit_using_1bit_str(
    input  [1:0] A,
    input  [1:0] B,
    output G,
    output L,
    output E
);

wire G1, L1, E1;
wire G0, L0, E0;

// MSB comparison
comparator_1bit MSB (A[1], B[1], G1, L1, E1);

// LSB comparison
comparator_1bit LSB (A[0], B[0], G0, L0, E0);

// Final logic
assign G = G1 | (E1 & G0);
assign L = L1 | (E1 & L0);
assign E = E1 & E0;

endmodule
