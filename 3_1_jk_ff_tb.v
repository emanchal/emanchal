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

    
