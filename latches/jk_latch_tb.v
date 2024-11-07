`timescale 1ns / 1ps

module jk_latch_tb;

    reg j, k, enable;
    wire q, q_bar;

    jk_latch uut (
        .j(j),
        .k(k),
        .enable(enable),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        $monitor("j = %b, k = %b, enable = %b, q = %b, q_bar = %b", j, k, enable, q, q_bar);
        j = 0; k = 0; enable = 0; #10;
        j = 1; k = 0; enable = 1; #10;
        j = 0; k = 1; enable = 1; #10;
        j = 1; k = 1; enable = 1; #10;
        $finish;
    end

endmodule
