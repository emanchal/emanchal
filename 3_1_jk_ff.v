/*
write a verilog code for jk flip-flop
truth table follows as 
rst j k q
------------------
0   0 0 0
1   0 0 q
1   0 1 0
1   1 0 1
1   1 1 q
----------------
*/

module jk_ff (input clk,
                    j,
                    k,
                    rstn,
              output reg q);

  always @ (posedge clk) begin
    case({j,k})
      2'b00 : q <= q;
      2'b01 : q <= 1'b0;
      2'b10 : q <= 1'b1;
      2'b11 : q <= ~q;
      default : q <= 1'b0;
    endcase
  end
  
endmodule
      
