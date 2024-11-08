`timescale 1ns / 1ps

module encoder_16to4_tb;

    reg [15:0] in;
    wire [3:0] out;
    wire valid;

    encoder_16to4 uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        $monitor("in = %b, out = %b, valid = %b", in, out, valid);
        in = 16'b0000000000000000; #10;
        in = 16'b0000000000000001; #10;
        in = 16'b0000000000000010; #10;
        in = 16'b0000000000000100; #10;
        in = 16'b0000000000001000; #10;
        in = 16'b0000000000010000; #10;
        in = 16'b0000000000100000; #10;
        in = 16'b0000000001000000; #10;
        in = 16'b0000000010000000; #10;
        in = 16'b0000000100000000; #10;
        in = 16'b0000001000000000; #10;
        in = 16'b0000010000000000; #10;
        in = 16'b0000100000000000; #10;
        in = 16'b0001000000000000; #10;
        in = 16'b0010000000000000; #10;
        in = 16'b0100000000000000; #10;
        in = 16'b1000000000000000; #10;
        $finish;
    end

endmodule
