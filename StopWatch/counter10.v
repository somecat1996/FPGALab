`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:28 03/14/2018 
// Design Name: 
// Module Name:    counter10 
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
`include "clk_div.v"

module counter10(
    input clk,
	 input reset,
    output reg [3:0] c10
    );
	 
	 always @ (negedge clk, posedge reset) begin
		if(reset) c10 <= 4'b0000;
		else begin
			if(c10 >= 4'b1001) c10 <= 4'b0000;
			else c10 <= c10+1;
			end
		end


endmodule
