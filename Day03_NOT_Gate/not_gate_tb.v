module tb_not_gate;

  reg a;
  wire y;

  // DUT instantiation
  not_gate_behavioral dut (
    .a(a),
    .y(y)
  );
  // If you want to test structural version, replace above with:
  // not_gate_structural dut (.a(a), .y(y));

  initial begin
    // Waveform dump
    $dumpfile("not_gate.vcd");
    $dumpvars(0, tb_not_gate);

    $monitor("time=%0t a=%b y=%b", $time, a, y);

    // Test cases
    a = 0; #10;
    a = 1; #10;

    #10 $finish;
  end

endmodule
