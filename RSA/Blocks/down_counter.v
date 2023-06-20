`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:36 05/05/2023 
// Design Name: 
// Module Name:    down_counter 
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
module down_counter(
    input clk,
    input preset,
	 input [5:0] in,
	 output done
    );
	 reg [5:0] out;
	 always@(posedge clk) begin
		if (preset) out <= in;
		else out <= out - 1 ;
	 end
		assign done = (out==1)? 1:0;
endmodule
