`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:46 05/05/2023 
// Design Name: 
// Module Name:    register 
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
module register(
    input clk,
    input rst,
    input load,
    input [5:0] d,
    output reg [5:0] q
    );
	 	
	always @(posedge clk) begin
		if (rst)
		begin
			q <= 0;
		end
		else 
		begin
			if(load) q <= d;
			else q <= q ;
		end
	end
endmodule
