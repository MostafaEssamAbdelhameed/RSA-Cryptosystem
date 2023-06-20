`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:38 06/13/2023 
// Design Name: 
// Module Name:    multiplier 
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
(* use_dsp48 = "yes" *)
module multiplier(
    input [5:0] in1,
    input [5:0] in2,
    output reg [11:0] out
    );
	
	always@(*) begin
		out = in1*in2 ;
	end

endmodule
