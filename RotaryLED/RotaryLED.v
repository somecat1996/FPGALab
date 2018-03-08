`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:49:53 03/02/2018 
// Design Name: 
// Module Name:    RotaryLED 
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
module RotaryLED(
	 input clk,
    input ROT_A,
    input ROT_B,
    input Switch,
    output [7:0] LEDOut
    );
	 reg [7:0] q;
	 reg [31:0] count;
	 reg clk_500ms;
	 
	 always @ (clk) begin
		if(count>=25000000) begin
			count <= 0;
			clk_500ms <= ~clk_500ms;
		end
		else count <= count + 1;
	 end
	 
	 always @ (clk_500ms) begin
		if(|q == 1'b0) begin
			case({ROT_A, ROT_B})
			2'b01:q <= 8'b1000_0000;
			default:q <= 8'b0000_0001;
			endcase
		end
		else
			case({ROT_A, ROT_B})
			2'b00:q <= q;
			2'b10:q <= {q[6:0], q[7]};
			2'b01:q <= {q[0], q[7:1]};
			default:q <= 8'b0000_0001;
			endcase
	 end
	 
	 assign LEDOut = Switch?~q:q;
	 
//	 always @ (Switch) begin
//		case(Switch)
//		1'b0:LEDOut <= q;
//		1'b1:LEDOut <= ~q;
//		default:LEDOut <= 8'b0000_0001;
//		endcase
//	 end
endmodule
