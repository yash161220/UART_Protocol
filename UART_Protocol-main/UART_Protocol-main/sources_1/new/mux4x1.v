`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 11:01:12 AM
// Design Name: 
// Module Name: mux4x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4x1(in0,in1,in2,in3,sel,out);
input in0,in1,in2,in3; 
output  out; 
input [1:0] sel; 
assign out=sel[1]?(sel[0]?in3:in2):(sel[0]?in1:in0); 
endmodule