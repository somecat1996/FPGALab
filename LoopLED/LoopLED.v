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
`include "clock_div.v"

module LoopLED(
    input clk,
    output reg [7:0] LEDOut
    );

	 wire clk_500ms;
	 
	 clock_div cd(.clk(clk), .clk_500ms(clk_500ms));
	 
	 always @ (posedge clk_500ms) begin
		if(LEDOut[7] == 1'b1) LEDOut <= 8'b0;
		else LEDOut <= {LEDOut[6:0], 1'b1};
	end

endmodule
