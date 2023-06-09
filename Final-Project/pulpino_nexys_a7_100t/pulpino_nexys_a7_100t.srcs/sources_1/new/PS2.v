`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Thomas Kappenman
// 
// Create Date: 03/03/2015 09:33:36 PM
// Design Name: 
// Module Name: PS2Receiver
// Project Name: Nexys4DDR Keyboard Demo
// Target Devices: Nexys4DDR
// Tool Versions: 
// Description: PS2 Receiver module used to shift in keycodes from a keyboard plugged into the PS2 port
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PS2(
    input clk_i,
    input resetn_i,
    input kclk,
    input kdata,
    output [7:0] data_out,
    output data_valid_flag
  );
    
  wire kclkf, kdataf;
  reg [7:0] datacur;
  reg [7:0] dataprev;
  reg [3:0] cnt;
  reg flag;
    
  debouncer debounce(
    .clk ( clk_i   ),
    .I0  ( kclk    ),
    .I1  ( kdata   ),
    .O0  ( kclkf   ),
    .O1  ( kdataf  )
  );
    
  always@(negedge kclkf or negedge resetn_i)begin
    if (~resetn_i)begin
      datacur = 8'b0;
      cnt = 4'b0;
      flag = 0;
    end
    else
    begin
      case(cnt)
      0:;//Start bit
      1:  datacur[0] <= kdataf;
      2:  datacur[1] <= kdataf;
      3:  datacur[2] <= kdataf;
      4:  datacur[3] <= kdataf;
      5:  datacur[4] <= kdataf;
      6:  datacur[5] <= kdataf;
      7:  datacur[6] <= kdataf;
      8:  datacur[7] <= kdataf;
      9:  flag <= 1'b1;
      10: flag <= 1'b0;
      endcase
      if( cnt<=9 ) cnt <= cnt + 1;
      else if( cnt==10 ) cnt <= 0;
    end
  end
      
  always @(posedge flag or negedge resetn_i)begin
    if (~resetn_i)
    begin
      dataprev = 8'b0;
    end
    else begin
    if (dataprev != datacur)
      dataprev <= datacur;
    end
  end
  
  assign data_out         =  datacur;
  assign data_valid_flag  =  flag;
    
endmodule
