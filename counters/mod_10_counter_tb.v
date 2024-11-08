`timescale 1ns / 1ps

module mod_10_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the mod_10_counter module
    mod_10_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation (period of 10ns)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $monitor("Time = %0dns, Reset = %b, Count = %b", $time, reset, count);

        // Initial conditions
        reset = 1; #10;
        reset = 0; #10;

        // Allow counter to count up to 10 cycles
        #100;

        // Assert reset
        reset = 1; #10;
        reset = 0; #10;

        #50 $finish;  // End simulation
    end
endmodule
