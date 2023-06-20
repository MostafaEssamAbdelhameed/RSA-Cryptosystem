`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:39 06/14/2023 
// Design Name: 
// Module Name:    top_module 
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
module top_module(
    input start,
    input clk,
    input rst,
    input [5:0] N,
    input [5:0] B,
    input [5:0] C,
    output [5:0] result
    );

	wire load_c ,load_b ,load_n ,s ,preset ,load_r ,done;
	
	 DP data_path(.B(B),
					  .N(N),
					  .C(C),
					  .load_n(load_n),
					  .load_c(load_c),
					  .load_r(load_r),
					  .load_b(load_b),
					  .s(s),
					  .rst(rst),
					  .clk(clk),
					  .preset(preset),
					  .result(result),
					  .done(done)
						);
	controller FSM (.done(done),
						 .rst(rst),
						 .clk(clk),
						 .start(start),
						 .load_n(load_n),
						 .load_c(load_c),
						 .load_r(load_r),
						 .load_b(load_b),
						 .s(s),
						 .preset(preset)
							);

endmodule
