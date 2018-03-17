`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:00 03/16/2018 
// Design Name: 
// Module Name:    counter_scope 
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
`include "counter.v"
module counter_scope( output [5:0] counter,
							 input clock, rst_n, dir );
	wire clk_div7;
	clock_div7 m_clk_div(.clk_div7(clk_div7), .clock(clock), .rst_n(rst_n));
	
	counter m_cnt(.counter(counter), .clock(clk_div7),.rst_n(rst_n), .dir(dir) );
endmodule
