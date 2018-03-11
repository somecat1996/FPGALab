`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:05 03/11/2018 
// Design Name: 
// Module Name:    clock_div 
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
module clock_div(
	output reg clk_100Hz, // 100 Hz ʱ������ź�
	input clk // ϵͳʱ�������ź�
	);
	parameter PULSESCOUNT = 18'h3_D090, // = 11_1101_0000_1001_0000(bin) (16bits)
				 RESETZERO = 18'h0;
	reg [17:0] counter; // ������, 18 bits (11_1101_0000_1001_0000(bin))
	// ���ڶ�ϵͳʱ��������м���, �Բ��� 100Hz ���ʱ���ź�
	always @(posedge clk) begin // -- �� clock �źŵ������ش���
		if ( counter < PULSESCOUNT ) // -- 18'h3_D090 ��ϵͳʱ��������� 1/200(s)
			counter <= counter + 1'b1;
		else begin
			clk_100Hz <= ~clk_100Hz;
			counter <= RESETZERO;
		end
	end
endmodule
