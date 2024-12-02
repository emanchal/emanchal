/*
Mod N counter counts upto value N
*/
module modN_cntr #(parameter N=10,
                   parameter WIDTH=4)
  (
    input clk,
    input rstn,
    output reg[WIDTH-1:0] out
  );

  always @(posedge clk) begin 
    if(!rstn) out <= 0;
    else begin
      if(out == N-1) out <= 0;
      else out <= out + 1;
    end
  end
endmodule

//--------------------------------------------------------------------------------
//testbench
module tb_modN_cntr;
  parameter N=10;
  parameter WIDTH=4;

  reg clk;
  reg rstn;
  wire [WIDTH-1:0] out;

  modN_cntr mod0(.clk(clk),
                 .rstn(rstn),
                 .out(out) );

  always #5 clk = ~clk;

  initial begin
    {clk, rstn} <= 0;

    $monitor ("T=%0t rstn=%b out=%b",$time, rstn, out);
    repeat(2) @ (posedge clk);
    rstn <= 1;

    repeat(20) @ (posedge clk);
    $finish;
  end
endmodule
