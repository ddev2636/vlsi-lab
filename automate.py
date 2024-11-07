import os

# Create the directory for random modules if it doesn't exist
os.makedirs("random", exist_ok=True)

# Binary to Hex Verilog Code
binary_to_hex_code = """`timescale 1ns / 1ps

module binary_to_hex (
    input wire [3:0] binary,
    output wire [3:0] hex
);
    assign hex = binary; // Direct mapping for 4-bit binary to 4-bit hex (0-15)
endmodule
"""

# Binary to Hex Testbench
binary_to_hex_tb_code = """`timescale 1ns / 1ps

module binary_to_hex_tb;

    reg [3:0] binary;
    wire [3:0] hex;

    binary_to_hex uut (
        .binary(binary),
        .hex(hex)
    );

    initial begin
        $monitor("binary = %b, hex = %b", binary, hex);
        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0010; #10;
        binary = 4'b0101; #10;
        binary = 4'b1001; #10;
        binary = 4'b1111; #10;
        $finish;
    end

endmodule
"""

# Write Verilog code and testbench to files in the random directory
with open("random/binary_to_hex.v", "w") as file:
    file.write(binary_to_hex_code)

with open("random/binary_to_hex_tb.v", "w") as file:
    file.write(binary_to_hex_tb_code)

print("Standalone Verilog files and testbench for Binary to Hex created successfully.")
