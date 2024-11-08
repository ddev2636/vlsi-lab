`timescale 1ns / 1ps

module moore_machine (input clk, input reset,input in,output reg [3:0] out
); 
 reg [2:0] current_state, next_state;
 parameter S0 = 3'b000, 
             S1 = 3'b001, 
             S2 = 3'b010, 
             S3 = 3'b011,
             S4 = 3'b100;     
    always @(*) begin
        case (current_state)
            S0: next_state = in ? S1 : S0;
            S1: next_state = in ? S1 : S2;
            S2: next_state = in ? S2 : S4; 
            S3: next_state = in ? S4 : S0; 
            S4: next_state = in ? S0 : S1; 
            default: next_state = S0;
        endcase
    end
    always @(*) begin
            case (current_state)
                S0: 
                S1: out = 4'b1010;
                S2: out = 4'b1101;
                S3: out = 4'b1010;
                S4: out = 4'b1111;
                default: out = 4'b0000;
            endcase
        end
    always @(posedge clk or posedge reset) begin
        if (reset) current_state <= S0;
        else current_state <= next_state;
    end
endmodule