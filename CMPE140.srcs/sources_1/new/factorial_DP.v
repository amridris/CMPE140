`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2019 08:41:34 PM
// Design Name: 
// Module Name: factorial_DP
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


module factorial_DP #(parameter Data_Width = 32)(
    input [3:0] n,
    input clk, en, sel, load_reg, load_cnt, oe,
    output [Data_Width - 1:0] nf,
    output gt_input, gt_fact
    );
    
    wire [3:0] cnt_out;
    wire [Data_Width - 1:0] mux_out, reg_out, mul_out;
    
    comparator_GT #(4) comparator_input (.A(n), .B(4'd12), .GT(gt_input));
    comparator_GT # (4) comparator_fact (.A(cnt_out), .B(4'b1), .GT(gt_fact));
    counter #(4) COUNTER (.input_data(n), .out(cnt_out), .load_value(load_cnt), .en(en), .clk(clk));
    multiply #(32) MUL (.x({28'b0,cnt_out}),.y(reg_out), .result(mul_out));
    MUX2 #(32) MUX (.input2(32'b1), .input1(mul_out), .sel(sel), .out(mux_out));
    MUX2 #(32) Out_buffer (.input1(32'b0), .input2(reg_out), .sel(oe), .out(nf));
    register #(32) REG (.data(mux_out), .out(reg_out), .load_reg(load_reg), .clk(clk));
     
endmodule
