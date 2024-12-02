/*
gray counter : used this counter for a single bit change between each value
let say 3bit counter

binary  gray
b2b1b0  g2g1g0
0 0 0   0 0 0  0
0 0 1   0 0 1  1
0 1 0   0 1 1  3
0 1 1   0 1 0  2
1 0 0   1 1 0  6
1 0 1   1 1 1  7
1 1 0   1 0 1  5
1 1 1   1 0 0  4
Binary-gray

g = {b2, b2^b1, b1^b0}
use for loop to exor (^)
*/

module gray_cntr #(parameter N=4)
  (input clk,
   input rstn,
   output reg [N-1:0] out );

  reg [N-1:0] q;

  always @ (posedge clk) begin
    if(!rstn) begin
      q <= 0;
      out <= 0;
    end
    else begin
      q <= q + 1;
`ifdef FOR_LOOP
    for (int i = 0; i < N-1; i = i + 1) begin
      out[i] <= q[i+1] ^ q[i];
    end
    out[N-1] <= q[N-1];
`else
    out <= {q[N-1], q[N-1:1] ^ q[N-2:0]};
`endif
    end
  end
endmodule
//----------------------------------------------------------------------
//testbench
module tb_gray_cntr;
  parameter N=4;

  reg clk,
  reg rstn;
  wire [N-1:0] out;

  //design instantiation
  gray_cntr gcntr0(.clk(clk),
                   .rstn(rstn),
                   .out(out) );

  always #1o clk = ~clk;

  initial begin
    {clk,rstn} <= 0;

    $monitor ("T=%0t rstn=%0b out=%0h",$time, rstn,out);

    repeat (2) @ (posedge clk);
    rstn <=1;
    repeat (20) @ (posedge clk);
    $finish;
  end
endmodule
