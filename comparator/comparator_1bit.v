`timescale 1ns / 1ps

module comparator_1bit (
    input wire a,
    input wire b,
    output wire eq,
    output wire lt,
    output wire gt
);
    assign eq = (a == b);
    assign lt = (a < b);
    assign gt = (a > b);
endmodule
