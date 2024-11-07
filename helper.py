import os

# Create the 'random' folder if it doesn't exist
os.makedirs("random", exist_ok=True)

# --- Testbench for Excess-3 to BCD ---
excess3_to_bcd_tb_code = """`timescale 1ns / 1ps

module excess3_to_bcd_tb;

    reg [3:0] excess3;
    wire [3:0] bcd;

    excess3_to_bcd uut (
        .excess3(excess3),
        .bcd(bcd)
    );

    initial begin
        excess3 = 4'b0000;
        #10 excess3 = 4'b0001;
        #10 excess3 = 4'b0010;
        #10 excess3 = 4'b0011;
        #10 excess3 = 4'b0100;
        #10 excess3 = 4'b0101;
        #10 excess3 = 4'b0110;
        #10 excess3 = 4'b0111;
        #10 excess3 = 4'b1000;
        #10 excess3 = 4'b1001;
        #10 excess3 = 4'b1010; // Invalid input, should default
        #10 $finish;
    end

    initial begin
        $monitor("Excess-3 = %b => BCD = %b", excess3, bcd);
    end

endmodule
"""

# --- Testbench for BCD to Excess-3 ---
bcd_to_excess3_tb_code = """`timescale 1ns / 1ps

module bcd_to_excess3_tb;

    reg [3:0] bcd;
    wire [3:0] excess3;

    bcd_to_excess3 uut (
        .bcd(bcd),
        .excess3(excess3)
    );

    initial begin
        bcd = 4'b0000;
        #10 bcd = 4'b0001;
        #10 bcd = 4'b0010;
        #10 bcd = 4'b0011;
        #10 bcd = 4'b0100;
        #10 bcd = 4'b0101;
        #10 bcd = 4'b0110;
        #10 bcd = 4'b0111;
        #10 bcd = 4'b1000;
        #10 bcd = 4'b1001;
        #10 bcd = 4'b1010; // Invalid input, should default
        #10 $finish;
    end

    initial begin
        $monitor("BCD = %b => Excess-3 = %b", bcd, excess3);
    end

endmodule
"""

# Write the testbench code into files
with open("random/excess3_to_bcd_tb.v", "w") as file:
    file.write(excess3_to_bcd_tb_code)

with open("random/bcd_to_excess3_tb.v", "w") as file:
    file.write(bcd_to_excess3_tb_code)

print("Testbenches for Excess-3 to BCD and BCD to Excess-3 have been created in the 'random' folder.")
