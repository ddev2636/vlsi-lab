timescale 1ns / 1ps
module t_flip_flop (
    input wire clk,
    input wire reset,
    input wire t,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 0;
    end else if (t) begin
        q <= ~q;
    end
end
endmodule