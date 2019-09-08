`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2019 01:08:36 AM
// Design Name: 
// Module Name: factorial_tb
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


module factorial_tb;
// instantiating the wires
reg go_tb, clk_tb;
wire done_tb, error_tb;
reg [3:0] n_tb;
wire [31:0] nf_tb;
reg [31:0] nf_correct;

//Declaring the factorial design for testing
factorial_top_level DUT(
    .n(n_tb),
    .Go(go_tb),
    .clk(clk_tb),
    .Done(done_tb),
    .error(error_tb),
    .nf(nf_tb)
);

//pusedo clock function for testing
task automatic clk_tick;
    begin
        clk_tb <= 1'b0;
        #50;
        clk_tb <= 1'b1;
        #50;
    end
endtask


//functional to calculate factorial and test it against the FPGA result
function automatic [31:0] factorial;
    input [3:0] input_value;
    reg [31:0] loop_value, mul_value;
    begin
        loop_value = input_value;
        mul_value = 1;
        while(loop_value > 1)
            begin
                mul_value = mul_value * loop_value;
                loop_value = loop_value - 1;
            end
        factorial = mul_value;
    end
endfunction

initial begin
    $display("Factorial DP + CU test");
    clk_tb = 0;
    n_tb = 4'd1;
    clk_tick;
    while(n_tb < 15)
    begin  
        go_tb = 1;
        clk_tb = 0;
        clk_tick;
        while(!(done_tb || error_tb))
        begin
            clk_tick;
        end
        if(done_tb)
        begin
            $display("FPGA computed Factorial %0d = %0d", n_tb, nf_tb);
            nf_correct = factorial(n_tb);
            $display("Software computed Factorial %0d = %0d\n", n_tb, nf_correct);
        end
        else if(error_tb)
        begin
            $display("Error received, input = %0d", n_tb);
        end
        if((nf_tb != nf_correct) && (n_tb <= 12))
        begin
            $display("Error: got %0d, expected %0d for %0d!", nf_tb, nf_correct, n_tb);
            $stop;
        end
        n_tb = n_tb + 4'd1;
   end
   
   $display("Completed the factorial test");
   $finish;
end

endmodule
