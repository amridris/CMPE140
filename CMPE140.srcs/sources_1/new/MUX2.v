`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2019 03:02:24 PM
// Design Name: 
// Module Name: MUX2
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


module MUX2 #(parameter Data_Width  = 32)(
    input [Data_Width - 1:0] input1, input2,
    input sel,
    output reg [Data_Width-1:0] out
    );
    
    always @(input1, input2, sel)
        begin 
            if(sel)
                out <= input2;
            else
                out <= input1;
        end
endmodule
