`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:45 03/11/2018 
// Design Name: 
// Module Name:    Control_LED 
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
`include "clock_div.v"
`include "debounce.v"
module Control_LED(
	output [7:0] LEDOut,
	input [3:0] button, slide,
	input clock );
	parameter NBTN = 4;
	wire p_clk100Hz;
	wire [NBTN-1 :0] p_toggle;
	reg [NBTN-1 :0] state_toggle; // ���� 4 ��ƹ�ҿ��ص�״̬�Ĵ���
	// 100Hz ʱ���źŲ���ģ�����ʵ��
	clock_div m_clkgen( .clk_100Hz(p_clk100Hz), .clk(clock) );
	// ʹ��ѭ���������
	genvar k;
	generate for ( k = 0; k < NBTN; k = k + 1 ) begin: CTRL_LEDS
		// �������ؽӴ������������������·ģ�����ʵ��
		debounce m_deb ( .pb(p_toggle[k]),
							.keydown(button[k]),
							.clk_100Hz(p_clk100Hz) );
		// ���ټ�����ת����ƹ�ҿ���
		always @( posedge p_toggle[k] )
			state_toggle[k] <= state_toggle[k] + 1'b1;
		// ʹ��4 ���������� LED4��LED7
		assign LEDOut[k+NBTN] = state_toggle[k];
	end
	endgenerate
	// ʹ��4 �����˿��ؿ��� LED0��LED3
	assign LEDOut[NBTN-1:0] = slide;
endmodule
