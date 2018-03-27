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
	 reg ROT_Q1;
	 reg ROT_Q2;
	 reg ROT_E;
	 reg ROT_L;
	 reg [1:0] ROT_I;
	 reg delay_ROT_Q1;
	 
	 always @( posedge clk )	begin
		ROT_I <= {ROT_B, ROT_A};
		case (ROT_I)
			2'b00: ROT_Q1 <= 1'b0;
			2'b01: ROT_Q2 <= 1'b0;
			2'b10: ROT_Q2 <= 1'b1;
			2'b11: ROT_Q1 <= 1'b1;
			default: begin
				ROT_Q1 <= 1'b0;
				ROT_Q2 <= 1'b0;
			end
		endcase
	 end
	 
	 always @(posedge clk )	begin
		delay_ROT_Q1 <= ROT_Q1;
		if ( ROT_Q1 && (!delay_ROT_Q1)) begin
			ROT_E <= 1'b1;
			ROT_L <= ROT_Q2;
		end
		else ROT_E <= 1'b0;
	 end
	 
	 always @ (posedge clk) begin
		if(|q == 1'b0) begin
			case(ROT_L)
			2'b0:q <= 8'b1000_0000;
			default:q <= 8'b0000_0001;
			endcase
		end
		else begin
			if(ROT_E) begin
				if(ROT_L) q <= {q[6:0], q[7]};
				else q <= {q[0], q[7:1]};
			end
		end
	 end
	 
	 assign LEDOut = Switch?~q:q;
endmodule
