`timescale 1ns / 1ps

module hex_to_bcd (
    input wire [3:0] hex,
    output wire [3:0] bcd
);
    assign bcd = hex; // Direct mapping (HEX to BCD in the range 0-9)
endmodule
