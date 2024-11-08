`timescale 1ns / 1ps

module multiplier_repetitive_addition (
    input wire [3:0] multiplicand,
    input wire [3:0] multiplier,
    output reg [7:0] product
);
    integer i;
    
    always @(*) begin
        product = 0;
        for (i = 0; i < multiplier; i = i + 1) begin
            product = product + multiplicand;
        end
    end
endmodule
