`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2019 08:57:01 PM
// Design Name: 
// Module Name: factorial_top_level
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


module factorial_top_level(
    input Go, clk,
    input [3:0] n,
    output Done, error,
    output [31:0] nf
    );
    
    wire sel, load_reg, load_cnt, oe, en, gt_input, gt_fact;
    
    factorial_DP datapath(.clk(clk), .en(en), .n(n), .sel(sel), .load_reg(load_reg), .load_cnt(load_cnt), .oe(oe), .gt_fact(gt_fact), .gt_input(gt_input), .nf(nf));
    factorial_CU control_unit(.en(en), .go(Go), .clk(clk),.sel(sel), .load_reg(load_reg), .load_cnt(load_cnt), .oe(oe), .GT_fact(gt_fact), .GT_input(gt_input), .done(Done), .error(error));
    
    
endmodule
