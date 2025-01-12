`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 10:56:51 AM
// Design Name: 
// Module Name: SIPO
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


module SIPO(enbl,in,clk,out);
input enbl,clk,in; 
output reg [7:0] out; 
always@(posedge clk) 
 begin 
  if(enbl) 
   begin 
    out<={in,out[7:1]};
   end
  end  
endmodule