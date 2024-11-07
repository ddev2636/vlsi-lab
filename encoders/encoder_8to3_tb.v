`timescale 1ns / 1ps

module encoder_8to3_tb;

    reg [7:0] in;
    wire [2:0] out;
    wire valid;

    encoder_8to3 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        $monitor("in = %b, out = %b, valid = %b", in, out, valid);
        in = 8'b00000000; #10;
        in = 8'b00000001; #10;
        in = 8'b00000010; #10;
        in = 8'b00000100; #10;
        in = 8'b00001000; #10;
        in = 8'b00010000; #10;
        in = 8'b00100000; #10;
        in = 8'b01000000; #10;
        in = 8'b10000000; #10;
        in = 8'b11111111; #10;
        $finish;
    end

endmodule
