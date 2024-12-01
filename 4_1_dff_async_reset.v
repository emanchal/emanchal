/*
dff is a sequential element that follows the input pin d at a given edge of a clock
*/
//design with active low reset
module dff ( input d,
             input rstn,
             input clk,
            output reg q);

  always @ (posedge clk or negedge rstn) begin
    if (!rstn) q <= 0;
    else q <= d;
  end

endmodule

//observe the always block sensitivity list
---------------------------------------------------------------------------------
//testbench 

module tb_dff;
  reg d;
  reg rstn;
  reg clk;
  reg [2:0] delay;

  //design instantiation
  dff dff0(.d(d),
           .clk(clk),
           .rstn(rstn),
           .q(q) );

  //generte clock
  always #10 clk = ~clk;

  //testcase
  initial begin
    clk <= 0;
    d <= 0;
    rstn <= 0;

    #15 d <= 1;
    #10 rstn <= 1;
    for (int i = 0; i <5; i=i+1) begin
      delay = $random;
      #(delay) d <= i;
    end
  end
endmodule




  
