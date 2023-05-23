`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 11:30:24 AM
// Design Name: 
// Module Name: apb_sp2_i
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


module apb_sp2#(
    parameter APB_ADDR_WIDTH = 12,  //APB slaves are 4KB by default
    parameter APB_DATA_WIDTH = 32
)
(
    input  logic                      clk_i,
    input  logic                      rstn_i,
    input  logic [APB_ADDR_WIDTH-1:0] apb_paddr_i,
    input  logic [APB_DATA_WIDTH-1:0] apb_pwdata_i,
    input  logic                      apb_pwrite_i,
    input  logic                      apb_psel_i,
    input  logic                      apb_penable_i,
    output logic [APB_DATA_WIDTH-1:0] apb_prdata_o,
    output logic                      apb_pready_o,
    output logic                      apb_pslverr_o,
    output logic [15:0]               leds,
    input  logic                      ps2_clk,
    input  logic                      ps2_data       
);

  assign apb_pslverr_o = 0;
  // Local declarations

  localparam ADDR_RST    = 12'h0;
  localparam ADDR_REQ    = 12'h4;
  localparam ADDR_ACK    = 12'h8;

  localparam ADDR_VALID   = 12'hc;
  localparam ADDR_BUSY    = 12'h10;

  localparam ADDR_DATA_OUT = 12'h14;
  
  logic                      apb_write;
  logic                      apb_read;

  logic                      apb_sel_rst;
  logic                      apb_sel_req;
  logic                      apb_sel_ack;

  logic                      apb_sel_busy;

  logic                      apb_sel_data_out;
  /////////////////
  // PS/2 Module //
  /////////////////

  logic [15:0]  keyboard_data; 
  logic         data_valid_flag;
  logic [7:0]   DATA_OUT;
  logic         data_await_en;
  
  PS2 PS2(
      .clk_i            ( clk_i             ),
      .resetn_i         ( rstn_i            ),
      .kclk             ( ps2_clk           ),
      .kdata            ( ps2_data          ),
      .data_out         ( DATA_OUT          ),
      .data_valid_flag  ( data_valid_flag   )    
  );
  
  always @ (posedge data_valid_flag or negedge rstn_i)
  begin
      if(!rstn_i) begin
          keyboard_data <= 16'b0;
      end
      else begin
          keyboard_data <= { keyboard_data[7:0], DATA_OUT };
      end
  end
  
  //////////////////////////
  // KEYBOARD HANDLER     //
  //////////////////////////
  always @ (posedge clk_i or negedge rstn_i)
  begin
      if(!rstn_i) begin
      
      end
      else if(data_valid_flag == 1'b1)
      begin
          case(keyboard_data[7:0])
          8'h1A:begin
          
          end
          8'h1B:begin
          
          end
          default: begin
          
          end
          endcase
      end
  end
  
  //////////////////////////
  // APB decoding         //
  //////////////////////////

  assign apb_write          = apb_psel_i & apb_pwrite_i;
  assign apb_read           = apb_psel_i & ~apb_pwrite_i;

  assign apb_sel_rst        = (apb_paddr_i == ADDR_RST);
  assign apb_sel_req        = (apb_paddr_i == ADDR_REQ);
  assign apb_sel_ack        = (apb_paddr_i == ADDR_ACK);
  
  assign apb_sel_busy        = (apb_paddr_i == ADDR_BUSY);

  assign apb_sel_data_out = (apb_paddr_i == ADDR_DATA_OUT);

  // From cipher to APB regs
  logic                      ctrl_rst_ff;
  logic                      ctrl_rst_en;
  logic                      ctrl_rst_next;

  logic                      ctrl_req_ff;
  logic                      ctrl_req_en;
  logic                      ctrl_req_next;
  
  logic                      apb_ready_ff;
  logic                      apb_ready_next;
  logic                      apb_ready_en;

  logic [APB_DATA_WIDTH-1:0] apb_dout_ff;
  logic [APB_DATA_WIDTH-1:0] apb_dout_next;
  logic                      apb_dout_en;
  
  //////////////////////////
  // APB data out         //
  //////////////////////////

  assign apb_dout_next = apb_sel_rst        ? APB_DATA_WIDTH'( ctrl_rst_ff   )
                       : apb_sel_req        ? APB_DATA_WIDTH'( ctrl_req_ff   )
                       : apb_sel_busy       ? APB_DATA_WIDTH'( data_await_en )
                       : apb_sel_data_out   ? APB_DATA_WIDTH'( { 16'b0, keyboard_data } )
                       :                      '0;
 


  assign apb_dout_en = apb_read;

  always_ff @(posedge clk_i or negedge rstn_i)
  if (~rstn_i)
    apb_dout_ff <= '0;
  else if (apb_dout_en)
    apb_dout_ff <= apb_dout_next;

  assign apb_prdata_o  = apb_dout_ff;
    
  logic [15:0] leds_val;
  assign leds = leds_val;
  // REQ bit

  assign ctrl_req_en = (apb_write & apb_sel_req)
                     | ctrl_req_ff;

  assign ctrl_req_next = (apb_write & apb_sel_req) ? apb_pwdata_i[0]
                       :                             '0;

  always_ff @(posedge clk_i or negedge rstn_i)
  if (~rstn_i)
    ctrl_req_ff <= '0;
  else if (ctrl_req_en)
    ctrl_req_ff <= ctrl_req_next;

  // RST bit

  assign ctrl_rst_en = (apb_write & apb_sel_rst);

  assign ctrl_rst_next = apb_pwdata_i[0];

  always_ff @(posedge clk_i or negedge rstn_i)
  if (~rstn_i)
    ctrl_rst_ff <= '0;
  else if (ctrl_rst_en)
    ctrl_rst_ff <= ctrl_rst_next;
    
  //////////////////////////
  // APB ready            //
  //////////////////////////

  assign apb_ready_next = ( apb_psel_i & apb_penable_i ) & ~apb_ready_ff;

  assign apb_ready_en = (apb_psel_i & apb_penable_i)
                      | apb_ready_ff;

  always_ff @(posedge clk_i or negedge rstn_i)
  if (~rstn_i)
    apb_ready_ff <= '0;
  else if (apb_ready_en)
    apb_ready_ff <= apb_ready_next;

  assign apb_pready_o  = apb_ready_ff;
  
  
  always_ff @(posedge clk_i or negedge rstn_i)
  if (~rstn_i) begin
    data_await_en <= '0;
    leds_val <= '0;
  end
  else if (ctrl_req_ff)
    data_await_en <= 1;
  else if ( data_await_en && data_valid_flag) begin
    data_await_en <= 0;
    leds_val <= keyboard_data;
  end
    
endmodule
