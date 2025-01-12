`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 11:04:14 AM
// Design Name: 
// Module Name: receiver
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


module receiver(rx_in,clk,pb_error,sb_error,rx_dataout,rst);
input rx_in,clk,rst; 
output pb_error,sb_error; 
output  [7:0] rx_dataout;
reg [1:0]pstate,nstate; 
reg shift,par_ld,chk_stp; // the load signals for shift,parity checka and stop detect
wire sb_det; //start bit detect
parameter idle=2'b00, data=2'b01 ,p_bit=2'b10, stp_bit=2'b11;
reg [3:0] count=0;


det_start d1(rx_in,sb_det,clk); 
SIPO s1(shift,rx_in,clk,rx_dataout); 
parity_check p1(rx_dataout,rx_in,pb_error,par_ld); 
stopbit_check c1(rx_in,chk_stp,sb_error); 

always@(pstate,rx_in,count)
 case(pstate)
   idle: #1 begin par_ld=1'b0; chk_stp=1'b0;shift=1'b0;
         if(sb_det)  // as it takes time to evaluate start_bit and then change state so we give delay
         nstate<=data;
         else
         nstate<=idle; 
         end 
   data: begin  if(count<9 && count>0) begin shift<=1'b1; nstate<=data;end
                else if(count==9)  begin 
                        shift<=1'b0; nstate<=p_bit; count=0; 
                        end 
         end 
   p_bit: begin shift=1'b0; par_ld=1'b1; 
                if(pb_error==1'b1) begin nstate=idle; end
                 else  nstate=stp_bit;                     
            end 
   stp_bit: begin   chk_stp=1'b1;   
                       nstate=idle; 
             end  
      endcase
    
      
  always@(posedge clk,negedge rst) 
   begin 
     if(!rst) 
      pstate=idle; 
     else
     begin 
      pstate=nstate; 
      if(pstate==data) 
      count<=count+1;
      end
       end 
endmodule