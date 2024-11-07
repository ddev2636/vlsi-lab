`timescale 1ns / 1ps

module ripple_carry_adder_tb;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    ripple_carry_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        a = 4'b0001; b = 4'b0010; #10;
        a = 4'b1111; b = 4'b0001; #10;
        a = 4'b1100; b = 4'b1010; #10;
        a = 4'b1011; b = 4'b0101; #10;
        $finish;
    end

    initial begin
        $monitor("a = %b, b = %b, sum = %b, carry = %b", a, b, sum, carry);
    end

endmodule
