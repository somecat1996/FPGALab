`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:24 03/08/2018 
// Design Name: 
// Module Name:    clock_div7 
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
module clock_div7(
    output clk_div7,
    input clock,
    input rst_n
    );
	 reg [6:0] q;
	 
	 always @ * begin
		if(rst_n==1'b0) begin
			q <= 7'b000_0001;
			end
		else begin
			if(|q==0) begin
				q <= 7'b000_0001;
				end
			else begin
				q <= {q[5:0], q[6]};
				end
			end
		end
	 
	 assign clk_div7 = q[6];


endmodule
