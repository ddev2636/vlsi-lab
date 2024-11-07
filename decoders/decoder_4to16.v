`timescale 1ns / 1ps

module decoder_4to16 (
    input wire [3:0] sel,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3,
    output wire y4,
    output wire y5,
    output wire y6,
    output wire y7,
    output wire y8,
    output wire y9,
    output wire y10,
    output wire y11,
    output wire y12,
    output wire y13,
    output wire y14,
    output wire y15
);
    assign y0  = (sel == 4'b0000);
    assign y1  = (sel == 4'b0001);
    assign y2  = (sel == 4'b0010);
    assign y3  = (sel == 4'b0011);
    assign y4  = (sel == 4'b0100);
    assign y5  = (sel == 4'b0101);
    assign y6  = (sel == 4'b0110);
    assign y7  = (sel == 4'b0111);
    assign y8  = (sel == 4'b1000);
    assign y9  = (sel == 4'b1001);
    assign y10 = (sel == 4'b1010);
    assign y11 = (sel == 4'b1011);
    assign y12 = (sel == 4'b1100);
    assign y13 = (sel == 4'b1101);
    assign y14 = (sel == 4'b1110);
    assign y15 = (sel == 4'b1111);
endmodule
