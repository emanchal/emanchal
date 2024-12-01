/*
a latch has two i/p's clk and d
            one o/p's q
clk =1 d flows through to q
clk =0 the latch holds its previous q even if d changes
*/

module d_latch(input d,
               input en,
               input rstn,
               output reg q );

  //this always block is always triggered whenever en/rstn/d changes
  //if reset is asserted then output will be zero
  //else as long as enable is high output q follows input d
  always @ (en or rstn or d) begin
    if(!rstn) q <= 0;
    else 
      if(en) q <= d;
  end

endmodule
// observe the sensitivity list in the always block
//+ve latch 
-------------------------------------
//testbench
module tb_latch;
  reg d,en,rstn;
  reg [2:0] delay, delay2;
  integer i;

  //instantiate the design and connect the design ports with the tb ports
  d_latch dl0 (.rstn(rstn),
               .d(d),
               .en(en),
               .q(q) );

  //!no clock generation in the latch
  
  //testcase
  initial begin
    d <= 0;
    en <= 0;
    rstn <= 0;

    //release the reset
    #10 rstn <= 1;

    //randomly change the d and en
    for (i = 0; i <5; i = i + 1) begin
      delay = $random;
      delay2 = $random;
      #(delay2) en = ~en;
      #(delay) d <= i;
    end

  end

endmodule

    
