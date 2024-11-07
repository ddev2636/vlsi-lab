`timescale 1ns / 1ps

module binary_to_hex_tb;

    reg [3:0] binary;
    wire [3:0] hex;

    binary_to_hex uut (
        .binary(binary),
        .hex(hex)
    );

    initial begin
        $monitor("binary = %b, hex = %b", binary, hex);
        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0010; #10;
        binary = 4'b0101; #10;
        binary = 4'b1001; #10;
        binary = 4'b1111; #10;
        $finish;
    end

endmodule
