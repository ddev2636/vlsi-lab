`timescale 1ns / 1ps
module sr_flip_flop_tb;

    reg clk, reset, s, r;
    wire q;

    sr_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .r(r),
        .q(q)
    );

    initial begin
        clk = 0;
        reset = 1;
        s = 0;
        r = 0;
        #10 reset = 0;
        #10 s = 1; r = 0;
        #10 s = 0; r = 1;
        #10 s = 1; r = 1;
        #20 $finish;
    end

    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0dns, reset = %b, s = %b, r = %b, q = %b", $time, reset, s, r, q);
    end

endmodule