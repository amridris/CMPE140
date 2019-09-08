`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2019 10:34:06 PM
// Design Name: 
// Module Name: bin32_to_8hex
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



module bin32_to_8hex( 
    input wire [31:0] value, 
    output wire [3:0] dig0, 
    output wire [3:0] dig1, 
    output wire [3:0] dig2, 
    output wire [3:0] dig3, 
    output wire [3:0] dig4, 
    output wire [3:0] dig5, 
    output wire [3:0] dig6, 
    output wire [3:0] dig7 
    ); 

    assign {dig7, dig6, dig5, dig4, dig3, dig2, dig1, dig0} = value;
endmodule