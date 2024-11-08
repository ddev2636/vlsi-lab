`timescale 1ns / 1ps

module three_input_xor_mux (
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    wire [3:0] mux_inputs;
    
    assign mux_inputs[0] = 0;   // 000 -> 0
    assign mux_inputs[1] = 1;   // 001 -> 1
    assign mux_inputs[2] = 1;   // 010 -> 1
    assign mux_inputs[3] = 0;   // 011 -> 0
    assign mux_inputs[4] = 1;   // 100 -> 1
    assign mux_inputs[5] = 0;   // 101 -> 0
    assign mux_inputs[6] = 0;   // 110 -> 0
    assign mux_inputs[7] = 1;   // 111 -> 1

    assign y = mux_inputs[{a, b, c}];
endmodule
