`timescale 1ns / 1ps

module decoder_2to4 (
    input wire [1:0] sel,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3
);
    assign y0 = (sel == 2'b00);
    assign y1 = (sel == 2'b01);
    assign y2 = (sel == 2'b10);
    assign y3 = (sel == 2'b11);
endmodule
