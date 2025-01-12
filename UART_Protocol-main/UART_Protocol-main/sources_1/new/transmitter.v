`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 11:09:30 AM
// Design Name: 
// Module Name: transmitter
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


module transmitter(txdata,txstart,clk,tx_dataout,tx_busy,rst);
input txstart,clk,rst; 
input [7:0] txdata; 
output   tx_dataout;
output reg tx_busy;
reg shift,lddata,start_b,stop_b;
wire  parity_b,data_b; //inputs to themux 
reg [1:0] sel;
reg [3:0] count=0;
 parameter idle=3'b000,startbit=3'b001,databit=3'b010,paritybit=3'b011,stopbit=3'b100; //these are the state and delay is clock period
 PISO p1(txdata,shift,lddata,clk,data_b);
 parity_gen p(lddata,txdata,parity_b);
 mux4x1 m1(start_b,data_b,parity_b,stop_b,sel,tx_dataout);   
 reg [2:0] pstate,nstate; 
  
  
  always @(pstate,txstart,txdata,count) 
   case(pstate) 
    idle: begin  
           stop_b=1'b1;start_b=1'b1;
           lddata=1'b0;shift=1'b0; 
           tx_busy=1'b0;
           if(txstart) 
            nstate=startbit; 
           else 
            nstate=idle; 
           end 
    startbit: begin start_b=0;sel=2'b00;tx_busy=1'b1;
              nstate=databit;
              lddata=1'b1; shift=1'b0;                
              end 
    databit: begin sel=2'b01; 
                 if(count!=0) 
                     begin
                     lddata=1'b0; shift=1'b1;     
                    end 
              if(count==4'd8)
              begin  
              shift=1'b0;
              count=0; 
              nstate=paritybit;
              end
             end 
    paritybit:begin sel=2'b10;
                    nstate=stopbit;
              end 
    stopbit: begin sel=2'b11; stop_b=1'b1;
                   nstate=idle; end 
     endcase  
      
   always@(posedge clk or negedge rst) 
     begin 
     if(!rst) 
      pstate=idle;
     else
     begin
      pstate=nstate;
      if(pstate==databit)
      begin 
        count<=count+1;
        end 
     end 
     end
 endmodule