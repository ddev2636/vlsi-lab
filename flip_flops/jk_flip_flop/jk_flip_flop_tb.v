`timescale 1ns / 1ps
module jk_flip_flop_tb;

    reg clk, reset, j, k;
    wire q;

    jk_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .j(j),
        .k(k),
        .q(q)
    );

    initial begin
        clk = 0;
        reset = 1;
        j = 0;
        k = 0;
        #10 reset = 0;
        #10 j = 1; k = 0;
        #10 j = 0; k = 1;
        #10 j = 1; k = 1;
        #20 $finish;
    end

    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0dns, reset = %b, j = %b, k = %b, q = %b", $time, reset, j, k, q);
    end

endmodule