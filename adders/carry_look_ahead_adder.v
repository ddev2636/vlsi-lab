`timescale 1ns / 1ps

module carry_look_ahead_adder (
    input wire [3:0] A, 
    input wire [3:0] B, 
    input wire Cin, 
    output wire [3:0] Sum, 
    output wire Cout
);

    wire [3:0] G, P, C;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);

    assign Cout = G[3] | (P[3] & C[3]);

    assign Sum = P ^ C;

endmodule
