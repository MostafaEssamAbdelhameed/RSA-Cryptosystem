`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:21:53 06/16/2023 
// Design Name: 
// Module Name:    bram_TB 
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
module bram_TB();
  parameter clk_period = 10;
  reg clk_tb = 0;
  always #(clk_period/2) clk_tb = ~clk_tb;
  
//  reg[7:0] B_tb , N_tb, C_tb;
//  reg start_tb ,rst_tb;
//  wire [7:0] result_tb;
  

	reg [5:0] div_tb;
	reg [11:0] func_in_tb;
	wire [5:0] func_out_tb;
	
//	top_module DUT (	.start(start_tb),
//							.clk(clk_tb),
//							.rst(rst_tb),
//							.N(N_tb),
//							.B(B_tb),
//							.C(C_tb),
//							.result(result_tb)
//							);
	
	BRAM bram_dut (.clk(clk_tb),
						.func_in(func_in_tb),
						.div(div_tb),
						.func_out(func_out_tb)
						);
				  
   initial begin
    $monitor(
		 "@ %t\n",$time,
		 "div = %d \n",div_tb,
//		 "result = %d \n",result_tb,
		 "func_in = %d \n",func_in_tb,
		 "func_out = %d\n",func_out_tb
		);
	end
	
	initial begin
		#(clk_period);
//		rst_tb=1;
//		#(clk_period);
//		rst_tb=0;
//		start_tb=1;
//		N_tb=3;
//		B_tb=5;
//		C_tb=3;
		div_tb=3;
		func_in_tb=5;
		#(clk_period);
	end
endmodule

