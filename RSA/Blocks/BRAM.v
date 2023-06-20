`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:23 05/05/2023 
// Design Name: 
// Module Name:    BRAM 
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
(* bram_map = "yes" *)
module BRAM(
    input clk,
    input [11:0] func_in,
    input [5:0] div,
    output reg [5:0] func_out
    );

	reg [5:0] BRAM [0:(2**18)-1];
	////////////////////////////////////////////////
	reg [12 : 0] i;
	reg [6 : 0] j;

	initial begin
		for(i = 0; i < 2**12; i = i + 1)
		begin
			for(j = 0; j < 2**6; j = j + 1)
			begin
				if(j==0) 
				BRAM[{i[11:0],j[5:0]}] = 0;
				else
				BRAM[{i[11:0],j[5:0]}] = i[11:0] % j[5:0];
			end
		end
	end
	/////////////////////////////////////////////////
	always @(posedge clk) begin
	func_out <= BRAM[{func_in,div}];
	end

endmodule
