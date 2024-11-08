`timescale 1ns / 1ps

module mealy_machine (
    input clk,
    input reset,
    input in,
    output reg [3:0] out
);
 reg [1:0] current_state, next_state;
 parameter S0 = 2'b00, 
             S1 = 2'b01, 
             S2 = 2'b10, 
             S3 = 2'b11;     
    always @(*) begin
        case (current_state)
            S0: begin next_state = in ? S1 : S0; out = in ? 4'b1001 : 4'b0000; end
            S1: begin next_state = in ? S1 : S2; out = in ? 4'b1001 : 4'b1100; end
            S2: begin next_state = in ? S3 : S2; out = in ? 4'b1111 : 4'b1100; end
            S3: begin next_state = in ? S3 : S0; out = in ? 4'b1111 : 4'b0000; end
            default: begin next_state = S0; out = 4'b0000; end
        endcase
    end
    always @(posedge clk or posedge reset) begin
        if (reset) current_state <= S0;
        else current_state <= next_state;
    end
endmodule
