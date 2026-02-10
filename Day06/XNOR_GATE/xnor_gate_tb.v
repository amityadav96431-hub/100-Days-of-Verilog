module xnor_gate_tb;
reg a,b;
wire y;

xnor_gate dut(.a(a),.b(b),.y(y));
initial begin
$monitor("time = %0t a=%b b=%b y=%b",$time ,a,b,y);
a=0;b=0;
#10;
a=0;b=1;
#10;
a=1;b=0;
#10;
a=1;b=1;
$stop;
end
endmodule