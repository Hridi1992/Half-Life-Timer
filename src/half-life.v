module tt_um_halflife(clk, rst, up, down, load, in, out, cs) ;
parameter n = 4 ;
input clk, rst, up ; 
  input [2:0] down ;
  input [7:0] load ;
input [n-1:0] in ;
output [n-1:0] out ;
wire [n-1:0] out ;
  reg [n-1:0] next ;
  input wire [12:0] cs ;

  DFF #(n) count(next, clk, out) ;

always@(rst, up, down, load, in, out) begin
casex({rst, up, down, load})
cs: out = 4'b0001;
//4'bl000: next = {4{1'b0}} ;
//4'b0100: next = out + 1'bl ;
//4'b0010: next = out - 1'b1 ;
//4,b0001: next = in ;
default: next = out ;
endcase
end
endmodule

