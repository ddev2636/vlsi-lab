`timescale 1ns / 1ps

module ripple_carry_counter (
    input wire clk,
    input wire reset,
    output wire [3:0] count
);

    wire carry;
    ripple_carry_adder adder(
        .a(count), 
        .b(4'b0001), 
        .sum(count), 
        .carry(carry)
    );

endmodule
