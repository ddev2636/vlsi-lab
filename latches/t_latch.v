`timescale 1ns / 1ps

module t_latch (
    input wire t,
    input wire enable,
    output reg q,
    output reg q_bar
);
    always @(*) begin
        if (enable) begin
            if (t) begin
                q = ~q;
                q_bar = ~q_bar;
            end
        end
    end
endmodule
