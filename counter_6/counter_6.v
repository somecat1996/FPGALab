`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:28 03/08/2018 
// Design Name: 
// Module Name:    counter_6 
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

`include "clock_div7.v"

module counter_6(
    output reg [5:0] count,
    input clock,
    input rst_n,
    input dir
    );
	 wire clk_div7;
	 
	 clock_div7 div7(.clock(clock), .rst_n(rst_n), .clk_div7(clk_div7));
	 
	 always @ (rst_n, clk_div7) begin
		if(rst_n==1'b0) begin
			if(dir==1'b0) count <= 6'b0;
			else count <= 6'b11_1111;
			end
		else
			case(dir)
			1'b0: count <= count+1'b1;
			1'b1: count <= count-1'b1;
			default: begin
				if(dir==1'b0) count <= 6'b0;
				else if(dir==1'b1) count <= 6'b11_1111;
				end
			endcase
		 end


endmodule
