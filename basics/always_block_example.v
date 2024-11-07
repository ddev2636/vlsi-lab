`timescale 1ns / 1ps

module always_block_example (
    input wire clk,
    input wire reset,
    input wire a,
    output reg b
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            b <= 0;
        else
            b <= a;
    end
endmodule
