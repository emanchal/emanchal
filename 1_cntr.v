Author: chipverify.com
/*
implement a counter that counts up if up_down signal is 1 and down if if its value is 0
it also resets the counter if the signal rstn become 0 making it an active-low reset.
*/

module cntr(input up_down, clk,rstn,
	output reg [2:0] out);

always @(posedge clk) begin
	if (!rstn) out <= 1'b0;
	else begin
		if(up_down) out <= out + 1'b1;
		else out <= out - 1'b1;
	end
end

endmodule
