`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:19 06/13/2023 
// Design Name: 
// Module Name:    data_path 
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
module DP(
    input [5:0] B,
    input [5:0] N,
    input [5:0] C,
    input load_n,
    input load_c,
    input load_r,
    input load_b,
	 input s,
	 input rst,
	 input clk,
	 input preset,
	 output[5:0] result,
	 output done
	 );

	wire [5:0] b_out , n_out , c_out, mod, in2;
	wire [11:0] mult;
	
	
	mux2x1 mux ( .x(b_out),
					 .y(mod),
					 .sel(s),
					 .out(in2)
					 );
				
	register reg_b (.clk(clk),
						 .rst(rst),
						 .load(load_b),
						 .d(B),
						 .q(b_out)
						 );
						 
	register reg_n(.clk(clk),
						.rst(rst),
						.load(load_n),
						.d(N),
						.q(n_out)
						);
						
	register reg_c(.clk(clk),
						.rst(rst),
						.load(load_c),
						.d(C),
						.q(c_out)
						);
						
	multiplier multiplier(.in1(b_out),
						       .in2(in2),
						       .out(mult)
						       );
	
	BRAM bram_mod (.clk(clk),
				  .func_in(mult),
				  .div(n_out),
				  .func_out(mod)
				  );
				  
	register reg_out(.clk(clk),
						  .rst(rst),
						  .load(load_r),
						  .d(mod),
					  	  .q(result)
						   );
							
	down_counter counter (.clk(clk),
								 .preset(preset),
								 .in(c_out),
								 .done(done)
								);
										
endmodule
