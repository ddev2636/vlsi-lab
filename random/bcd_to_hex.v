`timescale 1ns / 1ps

module bcd_to_hex (
    input wire [3:0] bcd,
    output wire [3:0] hex
);
    assign hex = bcd; // Direct mapping for simplicity (BCD to HEX in the range 0-9)
endmodule
