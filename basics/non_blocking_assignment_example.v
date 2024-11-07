`timescale 1ns / 1ps

module non_blocking_assignment_example (
    input wire a,
    input wire b,
    output reg c
);
    always @(*) begin
        c <= a;  // Non-blocking assignment, executes concurrently
        c <= b;  // Will not overwrite previous assignment immediately
    end
endmodule
