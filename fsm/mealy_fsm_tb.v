`timescale 1ns / 1ps

module mealy_fsm_tb;

    reg clk, reset, in;
    wire out;

    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; in = 0;
        #10 reset = 0; in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 $finish;
    end

    initial begin
        $monitor("Time = %0dns, reset = %b, in = %b, out = %b", $time, reset, in, out);
    end
endmodule
