`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:43 03/14/2018 
// Design Name: 
// Module Name:    counter6 
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
module counter6(
    input clk,
	 input reset,
    output reg [3:0] c6
    );
	 
	 always @ (negedge clk, posedge reset) begin
		if(reset) c6 <= 3'b0000;
		else begin
			if(c6 >= 4'b0101) c6 <= 4'b0000;
			else c6 <= c10+1;
			end
		end


endmodule
