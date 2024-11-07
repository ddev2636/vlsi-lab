`timescale 1ns / 1ps

module d_latch (
    input wire d,
    input wire enable,
    output reg q,
    output reg q_bar
);
    always @(*) begin
        if (enable) begin
            q = d;
            q_bar = ~d;
        end
    end
endmodule
