

 module tt_um_halflife(clk, rst, up, down, load, in, out) ;  
 parameter n = 4 ;  
 input clk, rst, up, down, load ;  
 input [n-1:0] in ;  
 output wire [n-1:0] out ;  
 //wire [n-1:0] out ;  
 reg [n-1:0] next ;  
 
 DFF #(n) count(clk, next, out) ;  
 
 always@(*) begin  
  if (rst)  
   next = 0; 
  else if (load) 
   next = in; 
  else if (up) 
   next = out + 1’b1; 
  else if (down) 
   next = out – 1’b1; 
  else 
   next = out;  
 end  
endmodule 
