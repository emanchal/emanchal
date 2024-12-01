/*
testbench code: verilog container module that allows us to drive the design with the 
different inputs and monotor its outputs for expected behaviour
*/

module tb;

  //1. Declare input/output variables to drive to the design 
  reg tb_clk;
  reg tb_d;
  reg tb_rstn;
  wire tb_q;

  //2.create an instance of the design  this is called design instantiation
  dff dff0 (.clk(tb_clk), // connect clock input with TB signal
            .d(tb_d), //connect data input with TB signal
            .rstn(tb_rstn), //connect reset input with TB signal
            .q(tb_q) ); // connect output q with TB signal
  //3. the following is an example of stimulus here we drive the signals tb_* 
  //with certain values since these signals are connected to the design inputs,
  //the design will be driven with the values in tb_*
  initial begin
    tb_rstn <= 1'b0;
    tb_clk <= 1'b0;
    tb_d <= 1'b0;
  end

endmodule
