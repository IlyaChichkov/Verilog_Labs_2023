module kuznechik_cipher_apb_wrapper (

    // Clock
    input logic pclk_i,

    // Reset
    input logic presetn_i,

    // Address
    input logic [31:0] paddr_i,

    // Control-status
    input logic psel_i,
    input logic penable_i,
    input logic pwrite_i,

    // Write
    input logic [3:0][7:0] pwdata_i,
    input logic [3:0]      pstrb_i,

    // Slave
    output logic        pready_o,
    output logic [31:0] prdata_o,
    output logic        pslverr_o

);

  localparam ADDRESS_LENGTH = 31;

  ////////////////////
  // Design package //
  ////////////////////

  import kuznechik_cipher_apb_wrapper_pkg::*;

  //////////////////////////
  // Cipher instantiation //
  //////////////////////////

  // Input signals
  logic         cipher_reset;
  logic         cipher_req_i;
  logic         cipher_ack_i;
  logic [127:0] cipher_data_i;
  // Output signals
  logic         cipher_busy_o;
  logic         cipher_valid_o;
  logic [127:0] cipher_data_o;

  // Instantiation
  kuznechik_cipher cipher (
      .clk_i    (pclk_i),
      .resetn_i (cipher_reset),
      .request_i(cipher_req_i),
      .ack_i    (cipher_ack_i),
      .data_i   (cipher_data_i),
      .busy_o   (cipher_busy_o),
      .valid_o  (cipher_valid_o),
      .data_o   (cipher_data_o)
  );

  ///////////////////
  // Wrapper Logic //
  ///////////////////

  // APB Registers
  logic [              31:0] reg_data_in         [0:3];
  logic [              31:0] reg_data_out        [0:3];
  // APB data IN/OUT address
  logic                      has_data_in_addr;
  logic                      has_data_out_addr;
  logic [ADDRESS_LENGTH-3:0] data_in_addr;
  logic [ADDRESS_LENGTH-3:0] data_out_addr;
  // Wrapper reset signals
  logic [7:0]                wrapper_rst;
  logic                      has_rst_addr;
  // Wrapper acknowledged signals
  logic [7:0]                wrapper_req_ack;
  logic                      has_ack_addr;

  // ASSIGN Wrapper reset
  assign has_rst_addr            = (paddr_i[ADDRESS_LENGTH:2] == '0) && pstrb_i[0];
  assign has_ack_addr            = (paddr_i[ADDRESS_LENGTH:2] == '0) && pstrb_i[1];
  // ASSIGN DATA_IN signals
  assign has_data_in_addr        = (paddr_i[ADDRESS_LENGTH:0] >= DATA_IN)  && (paddr_i[ADDRESS_LENGTH:0] < DATA_OUT);
  assign data_in_addr            = (paddr_i[ADDRESS_LENGTH:0] -  DATA_IN)  >> 2;
  // ASSIGN DATA_OUT signals
  assign has_data_out_addr       = (paddr_i[ADDRESS_LENGTH:0] >= DATA_OUT);
  assign data_out_addr           = (paddr_i[ADDRESS_LENGTH:0] -  DATA_OUT) >> 2;

  // Transform in/out data from/to packed array
  generate
    for (genvar i = 0; i < 4; i++) begin
      assign cipher_data_i[i*32+31:i*32] = reg_data_in[i];
      assign reg_data_out[i] = cipher_data_o[i*32+31:i*32];
    end
  endgenerate

  // APB Reading
  always_ff @(posedge pclk_i) begin
    if (!presetn_i) begin
      prdata_o <= '0;
    end else if (psel_i && !pwrite_i) begin
      if (paddr_i[ADDRESS_LENGTH:2] == '0) begin
        prdata_o <= {
          7'b0, cipher_busy_o, 7'b0, cipher_valid_o, wrapper_req_ack, wrapper_rst
        };  // CONTROL
      end else if (has_data_in_addr) begin
        prdata_o <= reg_data_in[data_in_addr];  // DATA_IN
      end else if (has_data_out_addr) begin
        prdata_o <= reg_data_out[data_out_addr];  // DATA_OUT
      end
    end
  end

  // APB Write
  generate
    for (genvar i = 0; i < 4; i++)
      always_ff @(posedge pclk_i) begin
          if (presetn_i && pwrite_i && psel_i && !penable_i && has_data_in_addr) begin
              if (pstrb_i[i]) reg_data_in[data_in_addr][8*i+7:8*i] <= pwdata_i[i];
          end
      end
  endgenerate

  // Cipher set request and acknowledgement
  always_ff @(posedge pclk_i) begin
    if (presetn_i && psel_i && !penable_i && pwrite_i && has_ack_addr)
    begin
      wrapper_req_ack <= pwdata_i[REQ_ACK];
      
      if (pwdata_i[REQ_ACK][0]) begin
        if (cipher_valid_o) begin
            cipher_ack_i <= 1'b1;
        end else begin
            cipher_req_i <= 1'b1;
        end
      end
    end else begin
      wrapper_req_ack <= '0;
      cipher_req_i <= 1'b0;
      cipher_ack_i <= 1'b0;
    end
  end

  // APB Error
  always_comb begin
    if (psel_i && pready_o && penable_i) begin
      if (!(paddr_i[ADDRESS_LENGTH:2] == '0) && !has_data_in_addr && !has_data_out_addr)
        // Wrong address
        pslverr_o = 1'b1;
      if (pwrite_i && ((paddr_i[ADDRESS_LENGTH:2]=='0) && (pstrb_i[VALID] || pstrb_i[BUSY]) || has_data_out_addr))
        // Writing in read-only registers (busy, valid, output data)
        pslverr_o = 1'b1;  
      if ((pwrite_i && has_ack_addr && pwdata_i[REQ_ACK][0]) && (!cipher_valid_o && cipher_busy_o))
        // Writing in request-ack registers, when cipher is busy
        pslverr_o = 1'b1;  
    end else begin
      pslverr_o <= 1'b0;
    end
  end

  // Wrapper reset assign
  always_ff @(posedge pclk_i) begin
    if (!presetn_i) begin
      wrapper_rst <= '1;
    end else if (psel_i && has_rst_addr) begin
      wrapper_rst <= pwdata_i[RST];
    end
  end

  assign cipher_reset = presetn_i && wrapper_rst[0];

  // Wrapper ready assign
  always_ff @(posedge pclk_i) begin
    pready_o <= psel_i && !penable_i;
  end
endmodule
