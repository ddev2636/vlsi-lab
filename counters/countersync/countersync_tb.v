`timescale 1ns / 1ps

module countersync_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    // Instantiate the counter module
    sync_up_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // Toggle clock every 5ns (10ns period)

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        enable = 0;

        // Apply reset
        #10 reset = 0; // Deassert reset after 10ns
        #10 enable = 1; // Enable counting

        // Run for some time
        #100 enable = 0; // Disable counting
        #10 reset = 1;   // Assert reset
        #10 reset = 0;   // Deassert reset

        #50 $finish; // End simulation
    end

    // Continuous monitoring of output
    always @(reset or enable or count) begin
        $display("Time = %0dns, reset = %b, enable = %b, count = %b", 
                 $time, reset, enable, count);
    end

endmodule
