`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 11:08:25 AM
// Design Name: 
// Module Name: stopbit_check
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


module stopbit_check(in,checkstp,stperror);
input in,checkstp; 
output reg stperror;   
always@(checkstp)
 begin 
 if(checkstp) begin 
 if(in) 
  stperror=0; 
  else
  stperror=1'b1; 
  end
  end
endmodule