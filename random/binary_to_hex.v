`timescale 1ns / 1ps

module binary_to_hex (
    input wire [3:0] binary,
    output wire [3:0] hex
);
    assign hex = binary; // Direct mapping for 4-bit binary to 4-bit hex (0-15)
endmodule
