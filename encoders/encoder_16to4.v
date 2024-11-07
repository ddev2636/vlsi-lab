`timescale 1ns / 1ps

module encoder_16to4 (
    input wire [15:0] in,
    output wire [3:0] out,
    output wire valid
);
    assign out = (in[15]) ? 4'b1111 :
                 (in[14]) ? 4'b1110 :
                 (in[13]) ? 4'b1101 :
                 (in[12]) ? 4'b1100 :
                 (in[11]) ? 4'b1011 :
                 (in[10]) ? 4'b1010 :
                 (in[9])  ? 4'b1001 :
                 (in[8])  ? 4'b1000 :
                 (in[7])  ? 4'b0111 :
                 (in[6])  ? 4'b0110 :
                 (in[5])  ? 4'b0101 :
                 (in[4])  ? 4'b0100 :
                 (in[3])  ? 4'b0011 :
                 (in[2])  ? 4'b0010 :
                 (in[1])  ? 4'b0001 :
                 (in[0])  ? 4'b0000 : 4'b0000;
                 
    assign valid = |in;  // valid signal is high if any input is high
endmodule
