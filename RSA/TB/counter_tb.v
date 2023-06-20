`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:59:33 05/06/2023 
// Design Name: 
// Module Name:    counter_tb 
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
module counter_tb();

	parameter clk_period = 10;
	reg clk = 0;
	
	always#(clk_period/2) clk = ~clk;
	
	reg preset_tb;
	reg [5:0] in_tb;
	wire done_tb;
	
	down_counter dut(.clk(clk),
						  .preset(preset_tb),
						  .in(in_tb),
						  .done(done_tb)
						 );
						 
	initial begin 
		in_tb = 5 ;
		preset_tb = 1;
		#(clk_period);
		preset_tb = 0;
	end
	
	initial begin
	$monitor("done = %d", done_tb
				); 
	end
	
endmodule

