`timescale 1ns / 1ps
module d_flip_flop_tb;

    reg clk, reset, d;
    wire q;

    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        reset = 1;
        d = 0;
        #10 reset = 0;
        #10 d = 1;
        #10 d = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0dns, reset = %b, d = %b, q = %b", $time, reset, d, q);
    end

endmodule