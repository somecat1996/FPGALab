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

module counter(
    output [11:0] MSB12,
	 output [ 3:0] cnt4b,
    input clock,
    input rst_n,
    input dir
    );
	 reg [31:0] temp;
	 
	 always @ (rst_n, clk_div7) begin
		if(rst_n==1'b0) begin
			temp <= (dir) ? 32'hFFFF_FFFF : 32'b0;
			end
		else
			case(dir)
			1'b0: temp <= temp+1'b1;
			1'b1: temp <= temp-1'b1;
			default: begin
				if(dir==1'b0) temp <= 6'b0;
				else if(dir==1'b1) temp <= 6'b11_1111;
				end
			endcase
		 end
	 
	 assign MSB12 = temp[31:20],
			  cnt4b = temp[3:0];


endmodule
