`timescale 1ns / 1ps

module blocking_assignment_example (
    input wire a,
    input wire b,
    output reg c
);
    always @(*) begin
        c = a;  // Blocking assignment, executes sequentially
        c = b;  // Will overwrite previous assignment
    end
endmodule
