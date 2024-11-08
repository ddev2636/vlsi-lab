`timescale 1ns / 1ps

module three_input_xor_mux_tb;

    reg a, b, c;
    wire y;

    three_input_xor_mux uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);

        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        $finish;
    end

endmodule
