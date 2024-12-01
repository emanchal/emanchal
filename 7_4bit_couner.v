/*
a 4 bit counter count values from 4'b0000 to 4'b111 and rolls over back to 4'b000.
it will keep counting as long as it is provided the running clock and reset is held high
*/
// roll-over concept
//using sync active low reset

module counter( input rstn,
                input clk,
               output reg [3:0] out );

  always @ (posedge clk) begin
    if(!rstn) out <= 0;
    else out <= out + 1;
  end

endmodule
//-------------------------------------------------------------------
module tb_counter;
  reg clk;
  reg rstn;
  wire [3:0] out;

  //instantiate the design
  counter c0 ( .clk(clk),
              .rstn(rstn),
              .out(out) );
  //generate clock
  always #5 clk = ~clk;

  //stimulus
  initial begin
    clk <= 0;
    rstn <= 0;

    //drive rest of the stimulus
    #20 rstn <= 1;
    #80 rstn <= 0;
    #50 rstn <= 1;
  end
  //finish the stimulus after 200ns
  initial begin
    #200 $finish;
  end

endmodule
