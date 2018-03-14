`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:45 03/13/2018 
// Design Name: 
// Module Name:    clock_div 
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
module clock_div(
    input clk,
    output reg clk_500ms
    );
	 reg [31:0] q;
	 
	 always @ (posedge clk) begin
		if(q >= 25000000) begin
			clk_500ms <= ~clk_500ms;
			q <= 0;
			end
		else q <= q + 1;
		end


endmodule
