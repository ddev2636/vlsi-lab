`timescale 1ns / 1ps

module multiplier_repetitive_addition_tb;

    reg [3:0] multiplicand;
    reg [3:0] multiplier;
    wire [7:0] product;

    multiplier_repetitive_addition uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
        $monitor("Time = %0dns, multiplicand = %d, multiplier = %d, product = %d", 
                  $time, multiplicand, multiplier, product);
        
        multiplicand = 4; multiplier = 3; #10;
        multiplicand = 2; multiplier = 5; #10;
        multiplicand = 7; multiplier = 2; #10;
        multiplicand = 8; multiplier = 4; #10;

        $finish;
    end
endmodule
