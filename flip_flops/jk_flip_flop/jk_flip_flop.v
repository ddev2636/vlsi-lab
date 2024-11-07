`timescale 1ns / 1ps
module jk_flip_flop (
    input wire clk,
    input wire reset,
    input wire j,
    input wire k,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 0;
    end else begin
        case ({j,k})
            2'b00: q <= q;  // No change
            2'b01: q <= 0;  // Reset
            2'b10: q <= 1;  // Set
            2'b11: q <= ~q; // Toggle
        endcase
    end
end
endmodule