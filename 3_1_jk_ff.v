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
-----------------------------------------------------------------

module jk_ff_tb;

  //declaret the test bench signals
  reg clk;
  reg j;
  reg k;
//  wire q;

  //instantiate the design 
  jk_ff jk_ff0 (.clk(clk),
                .j(j),
                .k(k),
                .q(q) );

  // clock generator using always block
  always @(posedge clk) #5 clk <= ~clk;
  
  //drive the stimuli
  initial begin
    {j,k} <= 0;

    #5 j <= 0;
       k <= 1;
    #20 j <= 1;
        k <= 0;
    #20 j <= 1;
        k <= 1;
    #20 $finish;
  end

  initial $monitor("[T]=%0d, [j]=%0d, [k]=%0d, q=%0d", $time,j,k,q);

endmodule

    
      
