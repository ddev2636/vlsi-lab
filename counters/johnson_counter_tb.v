`timescale 1ns / 1ps

module johnson_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    johnson_counter #(4) uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end

    always #5 clk = ~clk; // 10ns clock period

    initial begin
        $monitor("Time = %0t, Count = %b", $time, count);
    end

endmodule
