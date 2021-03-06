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
    output reg [2:0] c6
    );
	 
	 always @ (negedge clk, posedge reset) begin
		if(reset) c6 <= 3'b000;
		else begin
			if(c6 >= 3'b101) c6 <= 3'b000;
			else c6 <= c6+1;
			end
		end


endmodule
