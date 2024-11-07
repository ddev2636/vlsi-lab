`timescale 1ns / 1ps

module logical_operations_example (
    input wire a,
    input wire b,
    output wire and_result,
    output wire or_result,
    output wire not_result
);
    assign and_result = a & b;  // AND operation
    assign or_result = a | b;   // OR operation
    assign not_result = ~a;     // NOT operation
endmodule
