//===================================================
//HALF SUBTRACTOR- DATA FLOW
//=============================================
module half_subtractor_df(
input a,b,
output sum,cout
);

assign sum = a^b;
assign cout = (~a)&b;

endmodule



//===================================================
//HALF SUBTRACTOR- BEHAVIORAL
//================================

module half_subtractor_beh(
input a,b,
output reg sum,cout
);
always@(*) begin
sum = a^b; 
cout = (~a)&b;
end
endmodule


//===================================================
//HALF SUBTRACTOR- STRUCTURAL
//================================

module half_subtractor_str(
input a,b,
output  sum,cout
);
wire nota;
not (nota,a);
xor(sum,a,b);
and(cout,nota,b);
endmodule

