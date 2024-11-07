`timescale 1ns / 1ps

module bcd_to_hex_tb;

    reg [3:0] bcd;
    wire [3:0] hex;

    bcd_to_hex uut (
        .bcd(bcd),
        .hex(hex)
    );

    initial begin
        $monitor("bcd = %b, hex = %b", bcd, hex);
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b1001; #10;
        $finish;
    end

endmodule
