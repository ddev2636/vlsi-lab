`timescale 1ns / 1ps

module hex_to_bcd_tb;

    reg [3:0] hex;
    wire [3:0] bcd;

    hex_to_bcd uut (
        .hex(hex),
        .bcd(bcd)
    );

    initial begin
        $monitor("hex = %b, bcd = %b", hex, bcd);
        hex = 4'b0000; #10;
        hex = 4'b0001; #10;
        hex = 4'b0010; #10;
        hex = 4'b0101; #10;
        hex = 4'b1001; #10;
        $finish;
    end

endmodule
