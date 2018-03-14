`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:29 03/14/2018 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(
    input clk,
    output reg clk_100ms
    );
	 reg [27:0] q;
	 
	 always @ (posedge clk) begin
		if(q >= 2500000) begin
			clk_100ms <= ~clk_100ms;
			q <= 0;
			end
		else q <= q+1;
		end


endmodule
