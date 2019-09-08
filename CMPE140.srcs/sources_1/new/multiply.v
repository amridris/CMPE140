`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2019 12:20:05 PM
// Design Name: 
// Module Name: multiply
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


module multiply #(parameter Data_Width = 32)(
    input [Data_Width - 1:0] x, y,
    output reg [Data_Width - 1:0] result
    );
    
    always@(x or y)
        begin
            result <= x * y;
        end
        
endmodule
