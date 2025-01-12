`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 10:58:55 AM
// Design Name: 
// Module Name: baud_rate
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


module baud_rate(baud_clk,sel,clk,rst);
output reg baud_clk;
input clk,rst; 
input [1:0] sel; 
reg [26:0] count; 
reg [14:0] modulus; 

always @(posedge clk or negedge rst) 
 begin 
  if(!rst) 
   begin 
     count<=0; 
     baud_clk<=0; 
   end 
  else 
 begin 
   if(count==modulus-1)
     begin 
      baud_clk<=~baud_clk; 
      count<=0;
      end
   else 
     begin
       baud_clk<=baud_clk;
       count<=count+1;
      end 
   end
 end
always@(*) 
begin 
  case(sel)
  2'b00: modulus=15'd10416; 
  2'b01: modulus=13'd2604;
  2'b10: modulus=3'd5;
  2'b11: modulus=11'd656;
  endcase
  end 
 endmodule