//dff is the name of the module

module dff (input d, //input to the design should start with "input"
                  rstn,
                  clk,
            output q); // Outputs of the design should start with "output"

  reg q;  // declare a variable ti store output values

  always (posedge clk) begin  // this block is executed at the posedge of clk 0->1
    if (!rstn) q <= 1'b0;     //at the posedge, if rstn is 0 then q should get 0
    else q <= d;    // at the posedge, if rstn is 1 then q should get d
  end

endmodule // end of module
