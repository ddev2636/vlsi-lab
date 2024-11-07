`timescale 1ns / 1ps

module d_latch_tb;

    reg d, enable;
    wire q, q_bar;

    d_latch uut (
        .d(d),
        .enable(enable),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        $monitor("d = %b, enable = %b, q = %b, q_bar = %b", d, enable, q, q_bar);
        d = 0; enable = 0; #10;
        d = 1; enable = 1; #10;
        d = 0; enable = 1; #10;
        d = 1; enable = 0; #10;
        $finish;
    end

endmodule
