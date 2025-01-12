`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 10:53:53 AM
// Design Name: 
// Module Name: PISO
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


module PISO(data,shift,ld,clk,out);
input shift,ld,clk;
input [7:0] data;
output out;   
reg [7:0] temp;    //this is the output of the 8 FF
assign out=temp[0]; 
always @(posedge clk) 
 begin 
  if(ld) 
   temp[7:0]=data[7:0]; 
  else if(shift) 
   begin
   temp<={1'b0,temp[7:1]};
   end  
 end 
endmodule