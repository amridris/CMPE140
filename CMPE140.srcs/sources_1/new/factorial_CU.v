`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2019 12:28:29 PM
// Design Name: 
// Module Name: factorial_CU
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


module factorial_CU(
    input go, clk,
    input GT_fact, GT_input,
    output reg sel, load_reg, load_cnt, oe, en,
    output done, error
    );
    
    //current and next state registers to keep track of the state transitions
    reg[2:0] current_state = 0, next_state;
    reg error_internal = 0, done_internal = 0;
  
    assign err = GT_input;
    assign done = done_internal;
    
    //encode states
    parameter Idle = 3'd0,
              load_cnt_and_reg = 3'd1,
              Wait = 3'd2,
              oe_and_done = 3'd3,
              multiply_and_decrement = 3'd4;
              
    //Next state logic (State transitions)
    always@(current_state, go)
        begin
            case(current_state)
                Idle:
                    case({go, GT_input})
                        2'b11: {next_state, error_internal} <= {Idle,1'b1};
                        2'b10: {next_state, error_internal} <= {load_cnt_and_reg, 1'b0};
                        2'b0?: {next_state, error_internal} <= {Idle, 1'b0};
                        default: next_state = Idle;
                    endcase
                load_cnt_and_reg:           next_state <= Wait;
                Wait:                       next_state <= GT_fact ? multiply_and_decrement: oe_and_done;
                oe_and_done:                next_state <= Idle;
                multiply_and_decrement:      next_state <= Wait;
            endcase
         end
     
     //Sequential state register current_state = Next_state
     always@(posedge clk)
        current_state = next_state;
     
     //output logic
     always@(current_state)
        begin
            case(current_state)
                Idle: //(S1)
                    begin
                        {sel, load_cnt, en, load_reg, oe, done_internal} <= 6'b1_1_1_0_0_0;
                    end
                load_cnt_and_reg: //(S2)
                    begin
                        {sel, load_cnt, en, load_reg, oe, done_internal} <= 6'b1_1_1_1_0_0;
                    end
                Wait: //(S3)
                    begin
                        {sel, load_cnt, en, load_reg, oe, done_internal} <= 6'b0_0_0_0_0_0;
                    end
                oe_and_done:  //(S4)
                    begin
                        {sel, load_cnt, en, load_reg, oe, done_internal} <= 6'b0_0_0_0_1_1;
                    end
                multiply_and_decrement:  //(S5)
                    begin
                        {sel, load_cnt, en, load_reg, oe, done_internal} <= 6'b0_0_1_1_0_0;
                    end
            endcase
      end
endmodule
