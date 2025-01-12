`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 11:00:18 AM
// Design Name: 
// Module Name: det_start
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


module det_start(rx_in,sbitdet,clk);
input rx_in,clk; 
output reg sbitdet; 
always @(posedge clk,negedge rx_in) 
 if (rx_in==1'b0)
  sbitdet<=1'b1;
 else 
 sbitdet<=1'b0;
endmodule