
//////////////////////////////////////////////
// COM[PARATOR -DATAFLOW
///////////////////////////


module comparator_4bit_df(
    input  [3:0] A,
    input  [3:0] B,
    output G,
    output L,
    output E
);

// Equality
assign E = ~(A[3]^B[3]) &
           ~(A[2]^B[2]) &
           ~(A[1]^B[1]) &
           ~(A[0]^B[0]);

// Greater
assign G = (A[3] & ~B[3]) |
           (~(A[3]^B[3]) & A[2] & ~B[2]) |
           (~(A[3]^B[3]) & ~(A[2]^B[2]) & A[1] & ~B[1]) |
           (~(A[3]^B[3]) & ~(A[2]^B[2]) & ~(A[1]^B[1]) & A[0] & ~B[0]);

// Less
assign L = (~A[3] & B[3]) |
           (~(A[3]^B[3]) & ~A[2] & B[2]) |
           (~(A[3]^B[3]) & ~(A[2]^B[2]) & ~A[1] & B[1]) |
           (~(A[3]^B[3]) & ~(A[2]^B[2]) & ~(A[1]^B[1]) & ~A[0] & B[0]);

endmodule



//////////////////////////////////////////////
// COM[PARATOR - BHEHAVIORAL
///////////////////////////

module comparator_4bit_beh(
    input  [3:0] A,
    input  [3:0] B,
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

//////////////////////////
// COMPARATOR - STRUCTURAL
///////////////////////////////

module comparator_2bit(
    input  [1:0] A,
    input  [1:0] B,
    output G,
    output L,
    output E
);

assign E = ~(A[1]^B[1]) & ~(A[0]^B[0]);

assign G = (A[1] & ~B[1]) |
           (~(A[1]^B[1]) & (A[0] & ~B[0]));

assign L = (~A[1] & B[1]) |
           (~(A[1]^B[1]) & (~A[0] & B[0]));

endmodule

module comparator_4bit_using_2bit(
    input  [3:0] A,
    input  [3:0] B,
    output G,
    output L,
    output E
);

wire G1, L1, E1;  // Upper 2-bit results
wire G0, L0, E0;  // Lower 2-bit results

// Compare upper 2 bits (A3 A2)
comparator_2bit upper (
    A[3:2],
    B[3:2],
    G1,
    L1,
    E1
);

// Compare lower 2 bits (A1 A0)
comparator_2bit lower (
    A[1:0],
    B[1:0],
    G0,
    L0,
    E0
);

// Final logic
assign G = G1 | (E1 & G0);
assign L = L1 | (E1 & L0);
assign E = E1 & E0;

endmodule

