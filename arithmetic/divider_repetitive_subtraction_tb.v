`timescale 1ns / 1ps

module divider_repetitive_subtraction_tb;

    reg [7:0] dividend;
    reg [7:0] divisor;
    wire [7:0] quotient;
    wire [7:0] remainder;

    divider_repetitive_subtraction uut (
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        $monitor("Time = %0dns, dividend = %d, divisor = %d, quotient = %d, remainder = %d", 
                  $time, dividend, divisor, quotient, remainder);
        
        dividend = 20; divisor = 4; #10;
        dividend = 15; divisor = 6; #10;
        dividend = 25; divisor = 5; #10;
        dividend = 18; divisor = 3; #10;

        $finish;
    end
endmodule
