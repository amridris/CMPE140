`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2019 12:47:56 AM
// Design Name: 
// Module Name: CU_testbench
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


module CU_testbench;

reg clk_tb, go_tb, gt_fact_tb, gt_input_tb;
wire sel_tb, load_reg_tb, load_cnt_tb, oe_tb, en_tb, done_tb, error_tb;

factorial_CU DUT(
.go(go_tb), .clk(clk_tb), .GT_fact(gt_fact_tb), .GT_input(gt_input_tb),
.sel(sel_tb), .load_reg(load_reg_tb), .load_cnt(load_cnt_tb),.oe(oe_tb),
.en(en_tb),.done(done_tb), .error(error_tb)
);

task clk_tick;
    begin
        clk_tb <= 1;
        #5
        clk_tb <= 0;
        #5;
    end
endtask


initial begin
$display("Starting CU test");

go_tb = 1'b1;
gt_fact_tb = 1'b0;
gt_input_tb = 1'b0;

    clk_tick;
    clk_tick;
    clk_tick;
    clk_tick;
    clk_tick;
    gt_input_tb = 1'b1;
    clk_tick;
    clk_tick;
    clk_tick;
    clk_tick;

$display("Completed the CU test");
$finish;
end


endmodule
