`define IDLE      0
`define KEY_PHASE 1
`define S_PHASE   2
`define L_PHASE   3
`define FINISH    4

module kuznechik_cipher(
    input               clk_i,      // ???????? ??????
                        resetn_i,   // ?????????? ?????? ?????? ? ???????? ??????? LOW
           reg          request_i,  // ?????? ??????? ?? ?????? ??????????
                        ack_i,      // ?????? ????????????? ?????? ????????????? ??????
                [127:0] data_i,     // ????????? ??????

    output reg          busy_o,     // ??????, ?????????? ? ????????????? ??????
                                    // ?????????? ??????? ?? ??????????, ?????????
                                    // ?????? ? ???????? ?????????? ???????????
                                    // ???????
           reg          valid_o,    // ?????? ?????????? ????????????? ??????
           reg  [127:0] data_o      // ????????????? ??????
);

reg [127:0] key_mem [0:9];
logic done;
reg [7:0] S_box_mem [0:255];

reg [7:0] L_mul_16_mem  [0:255];
reg [7:0] L_mul_32_mem  [0:255];
reg [7:0] L_mul_133_mem [0:255];
reg [7:0] L_mul_148_mem [0:255];
reg [7:0] L_mul_192_mem [0:255];
reg [7:0] L_mul_194_mem [0:255];
reg [7:0] L_mul_251_mem [0:255];

initial begin
    $readmemh("keys.mem",key_mem );
    $readmemh("S_box.mem",S_box_mem );

    $readmemh("L_16.mem", L_mul_16_mem );
    $readmemh("L_32.mem", L_mul_32_mem );
    $readmemh("L_133.mem",L_mul_133_mem);
    $readmemh("L_148.mem",L_mul_148_mem);
    $readmemh("L_192.mem",L_mul_192_mem);
    $readmemh("L_194.mem",L_mul_194_mem);
    $readmemh("L_251.mem",L_mul_251_mem);
end

  logic [4:0]   stage; //??????? ??????
  logic [3:0]   trial_num_ff; // ????? ???????? ?? 0 ?? 10
  logic [127:0] trial_input_mux;
  logic [127:0] current_data;
  logic [7:0] data_unlin    [15:0];


  logic [127:0] trial_output;

//
    logic       data_galua_shreg_en; // enable ??? ???????? data_galua_shreg_ff
    logic [127:0] data_key_result;
    logic [7:0] data_galua_shreg_ff   [15:0];
    logic       req_lin; // ??????-??????? ? ???????? ???????????????
    logic [7:0] data_linear_result    [15:0];
    logic [4:0] operate_counter; // ??????? ???????? ???????? ??????????????

  assign trial_input_mux = current_data;
  assign busy_o = stage != `IDLE;
                         
  always_ff @(posedge clk_i or negedge resetn_i) 
  begin
    if(~resetn_i)
        begin
           req_lin <= 1'b0;
           data_galua_shreg_en <= 1'b0;
           for(int i = 0; i < 16; i++)
               begin
                   data_unlin[i] <= 8'h00;
               end 
           stage <= `IDLE;
           valid_o <= 1'b0;
           //busy_o <= 1'b0;
           data_o <= 128'd0;
           current_data <= 128'd0;
           trial_num_ff <= 4'h0;
        end
    else
        begin
            if(valid_o)
                begin
                    if(ack_i)
                        begin
                            valid_o <= 1'b0;
                        end
                end
            else
                begin
                    case(stage)
                        `IDLE:
                             begin
                                
                                if(request_i && `FINISH)
                                    stage <= `KEY_PHASE;
                                    current_data = data_i;
                                    //busy_o <= 1'b1;
                                    data_galua_shreg_en <= 1'b0;
                             end
                         `KEY_PHASE:
                              begin
                                data_galua_shreg_en <= 1'b0;
                                if(trial_num_ff == 4'd9)
                                    begin
                                        stage <= `FINISH;
                                        current_data = data_key_result;
                                        data_o <= current_data;
                                        valid_o <= 1'b1;
                                    end
                                else
                                    stage <= `S_PHASE;
                                   // current_data = data_key_result;
                              end
                          `S_PHASE:
                               begin
                                stage <= `L_PHASE;
                                data_unlin = data_linear_result;
                                req_lin <= 1'b1;
                                data_galua_shreg_en <= 1'b1;
                                //current_data <= data_linear_result; ?????????? ??????
                               end
                          `L_PHASE:
                               begin
                                req_lin <= 1'b0;
                                if( operate_counter == 5'd15 )
                                    data_galua_shreg_en <= 1'b0;
                                if( done )
                                    begin
                                    stage <= `KEY_PHASE;
                                    current_data <= trial_output;
                                    trial_num_ff <= trial_num_ff + 1'b1;
                                    end
                               end
                          `FINISH:
                               begin
                                data_galua_shreg_en <= 1'b0;
                                trial_num_ff <= 4'b0;
                                //busy_o <= 1'b0;
                                //valid_o <= 1'b0;
                                if(request_i)
                                    stage <= `KEY_PHASE;
                                else
                                    stage <= `IDLE;                            
                               end
                           
                    endcase
               end
    end                       
 end                       

  // Key overlay
  logic [127:0] round_key;
  assign round_key = key_mem[trial_num_ff];


  assign data_key_result = trial_input_mux ^ round_key;

  // Linear overlay
  logic [7:0] data_key_result_bytes [15:0];

  generate;
    for (genvar i = 0; i < 16; i++) begin
      assign data_key_result_bytes[i] = data_key_result[((i+1)*8)-1:(i*8)];
      assign data_linear_result   [i] = S_box_mem[data_key_result_bytes[i]];
    end
  endgenerate


  // Galua overlay

  logic [7:0] data_galua_in [15:0];

  // Stub! Shift register should be added here
  assign data_galua_in = req_lin ? data_unlin : data_galua_shreg_ff;

  logic [7:0] data_galua_result [15:0];

  // 148, 32, 133, 16, 194, 192, 1, 251, 1, 192, 194, 16, 133, 32, 148, 1
  assign data_galua_result[15]  = L_mul_148_mem [data_galua_in[15]];
  assign data_galua_result[14]  = L_mul_32_mem  [data_galua_in[14]]; 
  assign data_galua_result[13]  = L_mul_133_mem [data_galua_in[13]]; 
  assign data_galua_result[12]  = L_mul_16_mem  [data_galua_in[12]]; 
  assign data_galua_result[11]  = L_mul_194_mem [data_galua_in[11]]; 
  assign data_galua_result[10]  = L_mul_192_mem [data_galua_in[10]]; 
  assign data_galua_result[9]   =                data_galua_in[9] ;
  assign data_galua_result[8]   = L_mul_251_mem [data_galua_in[8]]; 
  assign data_galua_result[7]   =                data_galua_in[7] ;
  assign data_galua_result[6]   = L_mul_192_mem [data_galua_in[6]]; 
  assign data_galua_result[5]   = L_mul_194_mem [data_galua_in[5]]; 
  assign data_galua_result[4]   = L_mul_16_mem  [data_galua_in[4]]; 
  assign data_galua_result[3]   = L_mul_133_mem [data_galua_in[3]]; 
  assign data_galua_result[2]   = L_mul_32_mem  [data_galua_in[2]]; 
  assign data_galua_result[1]   = L_mul_148_mem [data_galua_in[1]]; 
  assign data_galua_result[0]   =                data_galua_in[0] ;

  logic [7:0] galua_summ;

  logic [7:0] data_galua_shreg_next [15:0];

  generate;
// ?????????? ????? ????????????
   always_comb begin
      galua_summ = 8'h00;
      for (int i = 0; i < 16; i++)
        galua_summ = galua_summ ^ data_galua_result[i];
    end

// ???????????? ????????? ?????? ?????????? ????????
   always_comb begin
      data_galua_shreg_next[15] = galua_summ;
      for (int i = 14; i >= 0; i--)
        data_galua_shreg_next[i] = data_galua_shreg_ff[i+1];
    end  

// ??????????? ????????? ???????
    for (genvar i = 0; i < 16; i++) 
    begin
      always_ff @(posedge clk_i or negedge resetn_i) 
          begin
            if (~resetn_i)
              data_galua_shreg_ff[i] <= 8'h00;
            else 
                if (data_galua_shreg_en) 
                  begin
                    if(req_lin)
                        data_galua_shreg_ff[i] <= data_galua_in[i];
                    else
                        data_galua_shreg_ff[i] <= data_galua_shreg_next[i];
                  end
          end
    end

    for (genvar i = 0; i < 16; i++)
      assign trial_output[((i+1)*8)-1:(i*8)] = data_galua_shreg_next[i];

  endgenerate



 always_ff @(posedge clk_i) begin
  if(~resetn_i)
   begin
    operate_counter <= 5'b00000;
    done <= 1'b0;
   end
  else
    begin
        if(done)
            done <= 1'b0;
        else
            begin
                if(data_galua_shreg_en && operate_counter != 15)
                    begin
                        operate_counter <= operate_counter + 1'b1;
                        done <= 1'b0;
                    end
                else
                    if(operate_counter == 15)
                        begin
                            operate_counter <= 1'b0;
                            done <= 1'b1;
                        end
            end
    end
 end

endmodule
