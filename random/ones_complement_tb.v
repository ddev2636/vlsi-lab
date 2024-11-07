`timescale 1ns / 1ps

module ones_complement_tb;

    reg [3:0] in;
    wire [3:0] out;

    ones_complement uut (
        .in(in),
        .out(out)
    );

    initial begin
        $monitor("in = %b, out = %b", in, out);
        in = 4'b0000; #10;
        in = 4'b1111; #10;
        in = 4'b1010; #10;
        in = 4'b0101; #10;
        $finish;
    end

endmodule
