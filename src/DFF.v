module DFF (d, clk, q);
  //width = 1?
  parameter WIDTH = 1;
  input clk;
  input [WIDTH-1:0] d;
  output [WIDTH-1:0] q;
  reg [WIDTH-1:0] q;
//output and reg same?
  always@ (posedge clk)
    q <= d;
endmodule
