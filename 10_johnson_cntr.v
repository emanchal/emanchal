/*
johnson counter: last ~output is feedback to first ff input d, And output of ff0 goes to input to the next ff1 input and so on..
for an n-bit couner it counts upto 2n
*/

module johnson_cntr #(parameter WIDTH=4)
  (
    input clk,
    input rstn,
    output reg [WIDTH-1:0] out
  );

  always @ (posedge clk) begin
    if (!rstn) out <= 1;
    else begin
      out[WIDTH-1] <= ~out[0];
      for (int i = 0; i < WIDTH-1; i=i+1) begin
        out[i] <= out[i+1];
      end
    end
  end
endmodule

---------------------------------------------------------------------
//testbench
module tb_johnson_cntr;
  parameter WIDTH = 4;

  reg clk;
  reg rstn;
  wire [WIDTH-1:0] out;

  ring_cntr rc0(.clk(clk),
                .rstn(rstn),
                .out(out) );

  always #5 clk = ~clk;

  initial begin
    {clk,rstn} <= 0;

    $monitor ("T=%0t out=%b",$time,out);
    repeat (2) @ (posedge clk);
    rstn <= 1;
    repeat(15) @ (posedge clk);
    $finish;
  end
endmodule
