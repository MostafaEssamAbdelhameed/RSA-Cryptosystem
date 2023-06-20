`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:17 06/14/2023 
// Design Name: 
// Module Name:    controller 
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
module controller(
    input done,
	 input rst,
	 input clk,
	 input start,
	 output reg load_n,
    output reg load_c,
    output reg load_r,
    output reg load_b,
	 output reg s,
	 output reg preset
    );
	parameter state_reg_width = 3 ;
	parameter [state_reg_width -1 : 0]  start_state = 0 ,
												   read_state = 1,
											      calc_state=2,
													mult_state=3,
												   done_state=4,
													end_state=5;
	reg [state_reg_width -1 : 0] curr_state , next_state ;

//state register
	always @(posedge clk)begin
		if(rst)
			begin
			curr_state <= start_state;
			end
		else 
			begin
			curr_state <= next_state;
			end
	end
	
//state_logic
	always@(*) begin
		load_n=0;
		load_c=0;
		load_r=0;
		load_b=0;
		s=0;
		preset=0; 
		
	case(curr_state)
		start_state:
			begin
				if (start) next_state = read_state;
				else next_state = start_state;
			end
		read_state:
			begin
				load_n=1;
				load_c=1;
				load_r=0;
				load_b=1;
				s=0;
				preset=0;
				if (done) next_state = done_state;
				else next_state = calc_state;	
			end
		calc_state:
			begin
				load_n=0;
				load_c=0;
				load_r=0;
				load_b=0;
				s=0;
				preset=1;
				if (done) next_state = done_state;
				else next_state = mult_state;	
			end
		mult_state:
			begin
				load_n=0;
				load_c=0;
				load_r=0;
				load_b=0;
				s=1;
				preset=0;
				if (done) next_state = done_state;
				else next_state = mult_state;	
			end
		done_state:
			begin
				load_r=1;
				next_state= end_state;
			end
		end_state:
			begin
				load_r=0;
				if (rst) next_state = start_state;
				else next_state = end_state;
			end
	endcase			
	end
endmodule


