`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2019 10:24:38 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter Data_Width = 4)(
    input [Data_Width-1:0] input_data,
    input load_value, en, clk,
    output reg [Data_Width - 1:0] out
    );
    
    always@(posedge clk)
    begin
        if(en)
            begin
                if(load_value)
                begin
                    out <= input_data;
                end
                else 
                begin
                    out <= out - 1'b1;
                end
           end
     end               
endmodule
