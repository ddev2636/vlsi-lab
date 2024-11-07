`timescale 1ns / 1ps

module twos_complement (
    input wire [3:0] in,
    output wire [3:0] out
);
    assign out = ~in + 1;
endmodule
