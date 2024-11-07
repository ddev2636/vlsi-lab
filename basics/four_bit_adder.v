`timescale 1ns / 1ps

module four_bit_adder (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [3:0] sum,
    output wire carry
);
    assign {carry, sum} = a + b;  // Basic 4-bit addition
endmodule
