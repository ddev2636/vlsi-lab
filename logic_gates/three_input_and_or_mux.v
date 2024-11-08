`timescale 1ns / 1ps

module three_input_and_or_mux (
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    wire [3:0] mux_inputs;

    assign mux_inputs[0] = 0;  // 000 -> 0
    assign mux_inputs[1] = 0;  // 001 -> 0
    assign mux_inputs[2] = 0;  // 010 -> 0
    assign mux_inputs[3] = 1;  // 011 -> 1
    assign mux_inputs[4] = 0;  // 100 -> 0
    assign mux_inputs[5] = 1;  // 101 -> 1
    assign mux_inputs[6] = 1;  // 110 -> 1
    assign mux_inputs[7] = 1;  // 111 -> 1

    assign y = mux_inputs[{a, b, c}];
endmodule
