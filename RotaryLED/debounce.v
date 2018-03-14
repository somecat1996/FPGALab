`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:36 03/11/2018 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
	output reg pb, // �����������źź�İ��������ź����
	input keydown, // ���������ź�����
	input clk_100Hz // ʱ���·��100Hz ʱ���ź�����
	);
	reg [3:0] shift_pb;
	always @( posedge clk_100Hz ) begin
		shift_pb[2:0] <= shift_pb[3:1];
		shift_pb[3] <= keydown;
		if ( shift_pb == 4'b0000 ) pb <= 1'b0;
		else pb <= 1'b1;
	end
endmodule