/*
a ripple counter is an asynchronous counter in whicj all the flops except the first 
are clocked by the output of the preceding flop
*/


/*
--------------    --------------    -----------------     ------------     --------------- 
| d        q0|
|            |
|    ff0     |
|            |
|>clk     qn0|
|            |
---------------   ---------------    -----------------     -------------    ----------------
*/
module dff(input d,
           input clk,
           input rstn,
           output reg q,
           output qn);

  always @(posedge clk or negedge rstn) begin
    if (!rstn) q <= o;
    else q <= d;

    assign qn = ~q;
  end
endmodule

//ripple module using dff
module ripple (input clk,
               input rstn,
               output [3:0] out);
  wire q0;
  wire qn0;
  wire q1;
  wire qn1;
  wire q2;
  wire qn2;
  wire q3;
  wire qn3;

  dff dff0(.d(qn0),
           .clk(clk),
           .rstn(rstn),
           .q(q0),
           .qn(qn0));

  dff dff1(.d(qn1),
           .clk(q0),
           .rstn(rstn),
           .q(q1),
           .qn(qn1) );

  dff dff2(.d(qn2),
           .clk(q1),
           .rstn(rstn),
           .q(q2),
           .qn(qn2) );
  
  dff dff3(.d(qn3),
           .clk(q2),
           .rstn(rstn),
           .q(q3),
           .qn(qn3) );

  assign out = {qn3, qn2, qn1,qn0};

endmodule

-----------------------------------------------------------------------------------------------
//testbench
module tb_ripple;
  reg clk;
  reg rstn;
  wire [3:0] out;

  //design instantiation
  ripple r0(.clk(clk),
            .rstn(rstn),
            .out(out) );

  always #5 clk = ~clk;

  initial begin
    rstn <= 0;
    clk <= 0;

    repeat (4) @ (posedge clk);
    rstn <= 1;

    repeat (25) @ (posedge clk);
    $finish;
  end
endmodule
