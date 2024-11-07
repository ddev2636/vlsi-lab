`timescale 1ns / 1ps

module t_latch_tb;

    reg t, enable;
    wire q, q_bar;

    t_latch uut (
        .t(t),
        .enable(enable),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        $monitor("t = %b, enable = %b, q = %b, q_bar = %b", t, enable, q, q_bar);
        t = 0; enable = 0; #10;
        t = 1; enable = 1; #10;
        t = 1; enable = 1; #10;
        t = 0; enable = 1; #10;
        $finish;
    end

endmodule
