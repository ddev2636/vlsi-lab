import os

# Create the counters directory if it doesn't exist
os.makedirs("counters", exist_ok=True)

# Define Verilog code for the MOD-10 counter
mod_10_counter_code = """`timescale 1ns / 1ps

module mod_10_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (count == 4'b1001)  // When count reaches 9, reset to 0
            count <= 4'b0000;
        else
            count <= count + 1;
    end
endmodule
"""

# Define Verilog testbench code for the MOD-10 counter
mod_10_counter_tb = """`timescale 1ns / 1ps

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
"""

# Write the Verilog code to a file in the counters directory
with open("counters/mod_10_counter.v", "w") as f:
    f.write(mod_10_counter_code)

# Write the Verilog testbench to a file in the counters directory
with open("counters/mod_10_counter_tb.v", "w") as f:
    f.write(mod_10_counter_tb)

print("MOD-10 counter Verilog module and testbench created in the counters folder.")
