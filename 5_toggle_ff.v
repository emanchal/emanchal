// toggle flip-flop
//if t is high the q will be toggled otherwide q should be stable

module tff( input clk,
            input rstn,
            input t,
           output reg q );

  always @ (posedge clk) begin
    if (!rstn) q <= 0;
    else begin
      if(t) q <= ~q;
      else q <= q;
    end
  end

endmodule
---------------------------------------
//testbench
module tb_tff;
  reg clk;
  reg rstn;
  reg t;

  //design instantiation
  tff tff0(.clk(clk),
           .rstn(rstn),
           .t(t),
           .q(q) );

  //clock generation
  always #5 clk = ~clk;

  //testcase
  initial begin
    {rstn,clk,t} <= 0;

    $monitor ("T=%0t rstn=%0b t=%0d q=%0d", $time,rstn,t,q);
    repeat(2) @(posedge clk);
    rstn <= 1;

    for (integer i = 0; i < 20; i =i+1) begin
      reg [4:0] dly = $random;
      #(dly) t <= $random;
    end
  end
endmodule
