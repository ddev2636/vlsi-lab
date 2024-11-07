`timescale 1ns / 1ps

module conditional_assignment_example (
    input wire a,
    input wire b,
    output wire result
);
    assign result = (a == b) ? 1'b1 : 1'b0;  // Conditional assignment (ternary operator)
endmodule
