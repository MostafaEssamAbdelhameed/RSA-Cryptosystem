`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:51:49 06/14/2023 
// Design Name: 
// Module Name:    tb 
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
module tb;
  parameter clk_period = 10;
  reg clk_tb = 0;
  always #(clk_period/2) clk_tb = ~clk_tb;
  
  reg[5:0] B_tb , N_tb, C_tb;
  reg start_tb ,rst_tb;
  wire [5:0] result_tb;
  
	
	top_module DUT (	.start(start_tb),
							.clk(clk_tb),
							.rst(rst_tb),
							.N(N_tb),
							.B(B_tb),
							.C(C_tb),
							.result(result_tb)
							);
	
				  
   initial begin
    $monitor(
		 "@ %t\n",$time,
		 "result = %d \n",result_tb
		);
	end
	
	initial begin
		rst_tb=1;
		#(clk_period);
		rst_tb=0;
		start_tb=1;
		N_tb=3;
		B_tb=8;
		C_tb=5;
		#(clk_period);
		start_tb=0;



	end
endmodule
