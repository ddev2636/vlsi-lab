`timescale 1ns / 1ps

module bcd_adder (
    input wire [3:0] A, 
    input wire [3:0] B, 
    input wire Cin, 
    output wire [3:0] Sum, 
    output wire Cout
);

    wire [3:0] sum_temp;
    wire carry_temp;

    full_adder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(sum_temp[0]), .Cout(carry_temp));
    full_adder FA1 (.A(A[1]), .B(B[1]), .Cin(carry_temp), .Sum(sum_temp[1]), .Cout(carry_temp));
    full_adder FA2 (.A(A[2]), .B(B[2]), .Cin(carry_temp), .Sum(sum_temp[2]), .Cout(carry_temp));
    full_adder FA3 (.A(A[3]), .B(B[3]), .Cin(carry_temp), .Sum(sum_temp[3]), .Cout(carry_temp));

    assign Cout = carry_temp;

    always @(*) begin
        if (sum_temp > 9)
            Sum = sum_temp + 6;
        else
            Sum = sum_temp;
    end

endmodule

module full_adder (
    input A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (Cin & A);
endmodule
