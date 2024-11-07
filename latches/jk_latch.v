`timescale 1ns / 1ps

module jk_latch (
    input wire j,
    input wire k,
    input wire enable,
    output reg q,
    output reg q_bar
);
    always @(*) begin
        if (enable) begin
            case ({j, k})
                2'b00: begin end
                2'b01: begin q = 0; q_bar = 1; end
                2'b10: begin q = 1; q_bar = 0; end
                2'b11: begin q = ~q; q_bar = ~q_bar; end
            endcase
        end
    end
endmodule
