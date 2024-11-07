`timescale 1ns / 1ps

module sr_latch_tb;

    reg s, r;
    wire q, q_bar;

    sr_latch uut (
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        $monitor("s = %b, r = %b, q = %b, q_bar = %b", s, r, q, q_bar);
        s = 0; r = 0; #10;
        s = 1; r = 0; #10;
        s = 0; r = 1; #10;
        s = 1; r = 1; #10;
        $finish;
    end

endmodule
