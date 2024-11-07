`timescale 1ns/1ps
module async_counter_tb;

    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    async_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        enable = 0;
        #10 reset = 0;
        #10 enable = 1;
        #100 enable = 0;
        #10 reset = 1;
        #10 reset = 0;
        #50 $finish;
    end

    always @(reset or enable or count) begin
        $display("Time = %0dns, reset = %b, enable = %b, count = %b", 
                 $time, reset, enable, count);
    end

endmodule
