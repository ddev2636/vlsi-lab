`timescale 1ns / 1ps

module divider_repetitive_subtraction (
    input wire [7:0] dividend,
    input wire [7:0] divisor,
    output reg [7:0] quotient,
    output reg [7:0] remainder
);
    reg [7:0] temp_dividend;
    
    always @(*) begin
        quotient = 0;
        remainder = dividend;
        while (remainder >= divisor) begin
            remainder = remainder - divisor;
            quotient = quotient + 1;
        end
    end
endmodule
