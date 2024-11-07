`timescale 1ns / 1ps

module simple_module (
    input wire a,
    input wire b,
    output wire c
);
    assign c = a & b; // Simple AND operation
endmodule
