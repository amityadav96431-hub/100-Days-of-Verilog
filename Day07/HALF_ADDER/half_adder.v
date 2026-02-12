//===================================================
//HALF ADDER- DATA FLOW
//=============================================
module half_adder_df(
input a,b,
output sum,cout
);

assign sum = a^b;
assign cout = a&b;

endmodule



//===================================================
//HALF ADDER- BEHAVIORAL
//================================

module half_adder_beh(
input a,b,
output reg sum,cout
);
always@(*) begin
sum = a^b; 
cout = a&b;
end
endmodule


//===================================================
//HALF ADDER- STRUCTURAL
//================================

module half_adder_str(
input a,b,
output  sum,cout
);

xor(sum,a,b);
and(cout,a,b);
endmodule

