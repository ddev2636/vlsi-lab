`timescale 1ns / 1ps

module bcd_adder_tb;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    bcd_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10 A = 4'b0101; B = 4'b0110; Cin = 0;
        #10 A = 4'b1001; B = 4'b1001; Cin = 1;
        #10 A = 4'b0011; B = 4'b0100; Cin = 0;
        #10 $finish;
    end

    initial begin
        $monitor("A = %b, B = %b, Cin = %b => Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
    end

endmodule
