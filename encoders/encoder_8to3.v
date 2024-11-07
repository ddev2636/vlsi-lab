`timescale 1ns / 1ps

module encoder_8to3 (
    input wire [7:0] in,
    output wire [2:0] out,
    output wire valid
);
    assign out = (in[7]) ? 3'b111 :
                 (in[6]) ? 3'b110 :
                 (in[5]) ? 3'b101 :
                 (in[4]) ? 3'b100 :
                 (in[3]) ? 3'b011 :
                 (in[2]) ? 3'b010 :
                 (in[1]) ? 3'b001 :
                 (in[0]) ? 3'b000 : 3'b000;
                 
    assign valid = |in;  // valid signal is high if any input is high
endmodule
