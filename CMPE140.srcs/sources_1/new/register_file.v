`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2019 10:35:03 PM
// Design Name: 
// Module Name: register_file
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


module register_file #(parameter Data_Width = 32)(
    input [Data_Width - 1:0] data,
    input clk, load_value,
    output reg [Data_Width - 1:0] out
    );
    
    always@(posedge clk)
    begin
        if(load_value)
        begin
            out <= data;
        end
    end
endmodule
