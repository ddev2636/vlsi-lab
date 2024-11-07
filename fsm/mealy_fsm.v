`timescale 1ns / 1ps

module mealy_fsm (
    input wire clk,
    input wire reset,
    input wire in,
    output reg out
);

    reg [1:0] state, next_state;

    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S2 : S0;
            S2: next_state = in ? S2 : S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: out = 0;
            S1: out = in ? 1 : 0;
            S2: out = in ? 1 : 0;
            default: out = 0;
        endcase
    end
endmodule
