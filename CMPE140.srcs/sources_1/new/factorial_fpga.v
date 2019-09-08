`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2019 12:17:23 AM
// Design Name: 
// Module Name: factorial_fpga
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


module factorial_fpga(
    input go, clk_100MHZ, main_clk,
    input [3:0] n,
    output [7:0] led_sel, led_out,
    output done, error,
    output [3:0] n_out
    );
    
    supply1 [7:0] vcc;
    wire DONT_USE, clk_5khz, debounced_clk, rst_dummy;
    wire [31:0] nf;
    assign rst_dummy = 0, n_out = n;
    
    wire[7:0] led[7:0];
    wire[3:0] hex[7:0];
    
    factorial_top_level top_level(
    .Go(go),
    .clk(debounced_clk),
    .Done(done),
    .error(error),
    .n(n),
    .nf(nf)
    );
    
    button_debouncer debouncer(
    .clk(clk_5khz),
    .button(main_clk),
    .debounced_button(debounced_clk)
    );
    
    led_mux LEDS(
    .clk(clk_5khz),
    .rst(rst_dummy),
    .LED0(led[0]),
    .LED1(led[1]),
    .LED2(led[2]),
    .LED3(led[3]),
    .LED4(led[4]),
    .LED5(led[5]),
    .LED6(led[6]),
    .LED7(led[7]),
    .LEDSEL(led_sel),
    .LEDOUT(led_out)
    );
    
    clk_gen clock_generation(
    .clk100MHZ(clk_100MHZ),
    .rst(rst_dummy),
    .clk_4sec(DONT_USE),
    .clk_5KHZ(clk_5khz)
    );
    
    bin32_to_8hex(
    .value(nf),
    .dig0(hex[0]),
    .dig1(hex[1]),
    .dig2(hex[2]),
    .dig3(hex[3]),
    .dig4(hex[4]),
    .dig5(hex[5]),
    .dig6(hex[6]),
    .dig7(hex[7])
    );
    
    hex_to_7seg LED0(
    .HEX(hex[0]),
    .s(led[0])
    );
    
    hex_to_7seg LED1(
    .HEX(hex[1]),
    .s(led[1])
    );
    
    hex_to_7seg LED2(
    .HEX(hex[2]),
    .s(led[2])
    );
    
    hex_to_7seg LED3(
    .HEX(hex[3]),
    .s(led[3])
    );
    
    hex_to_7seg LED4(
    .HEX(hex[4]),
    .s(led[4])
    );
    
    hex_to_7seg LED5(
    .HEX(hex[5]),
    .s(led[5])
    );
    
    hex_to_7seg LED6(
    .HEX(hex[6]),
    .s(led[6])
    );
    
    hex_to_7seg LED7(
    .HEX(hex[7]),
    .s(led[7])
    );
    
    
endmodule
