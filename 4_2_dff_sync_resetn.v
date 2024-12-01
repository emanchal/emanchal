//sync active low reset

module dff (input d,
            input clk,
            input rstn,
            output reg q);

  always @(posedge clk) begin
    if(!rstn) q <= 0;
    else q <= d;
  end

endmodule

------------------------------------------
//test bench
module tb_dff;
  reg d;
  reg clk;
  reg rstn;
  reg [2:0] delay;

  //design instantiation
  dff dff0 (.d(d),
            .clk(clk),
            .rstn(rstn),
            .q(q) );

  //generate clock
  always #5 clk = ~clk;

  //testcase
  initial begin
    clk <= 0;
    d <= 0;
    rstn <=0 ;

    #15 d <= 1;
    #10 rstn <= 1;
    for(int i = 0; i < 5; i = i+1) begin
      delay = $random;
      #(delay) d <= i;
    end
  end
endmodule













  
