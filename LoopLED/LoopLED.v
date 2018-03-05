`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:13 03/01/2018 
// Design Name: 
// Module Name:    LoopLED 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LoopLED(
    input clk,
    output reg [7:0] LEDOut
    );
	 
	 reg [31:0] q;
	 
	 always @ (posedge clk) begin
		if(q >= 50000000) begin
			if(LEDOut[7] == 1'b1) LEDOut <= 8'b0;
			else LEDOut <= {LEDOut[6:0], 1'b1};
			q <= 31'b0;
		end
		else q <= q + 1;
	end

endmodule
