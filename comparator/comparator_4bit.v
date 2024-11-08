`timescale 1ns / 1ps

module comparator_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire eq,
    output wire lt,
    output wire gt
);
    assign eq = (a == b);
    assign lt = (a < b);
    assign gt = (a > b);
endmodule
