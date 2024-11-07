`timescale 1ns / 1ps

module encoder_4to2 (
    input wire [3:0] in,
    output wire [1:0] out,
    output wire valid
);
    assign out = (in[3]) ? 2'b11 :
                 (in[2]) ? 2'b10 :
                 (in[1]) ? 2'b01 :
                 (in[0]) ? 2'b00 : 2'b00;
                 
    assign valid = |in;  // valid signal is high if any input is high
endmodule
