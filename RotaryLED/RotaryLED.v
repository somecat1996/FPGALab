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
    input ROT_A,
    input ROT_B,
    output reg [7:0] LEDOut,
    input Switch
    );
	 reg [7:0] q;
	 
	 always @ (ROT_A, ROT_B) begin
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
	 
	 always @ (Switch) begin
		case(Switch)
		1'b0:LEDOut <= q;
		1'b1:LEDOut <= ~q;
		default:begin
			LEDOut <= 8'b0000_0001;
		end
		endcase
	 end
endmodule
