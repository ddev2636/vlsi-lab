import os

# Create the comparator directory if it doesn't exist
os.makedirs("comparator", exist_ok=True)

# Define Verilog code templates for different comparators
comparators = {
    "comparator_1bit": {
        "code": """`timescale 1ns / 1ps

module comparator_1bit (
    input wire a,
    input wire b,
    output wire eq,
    output wire lt,
    output wire gt
);
    assign eq = (a == b);
    assign lt = (a < b);
    assign gt = (a > b);
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module comparator_1bit_tb;

    reg a, b;
    wire eq, lt, gt;

    comparator_1bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
"""
    },
    "comparator_2bit": {
        "code": """`timescale 1ns / 1ps

module comparator_2bit (
    input wire [1:0] a,
    input wire [1:0] b,
    output wire eq,
    output wire lt,
    output wire gt
);
    assign eq = (a == b);
    assign lt = (a < b);
    assign gt = (a > b);
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module comparator_2bit_tb;

    reg [1:0] a, b;
    wire eq, lt, gt;

    comparator_2bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 2'b00; b = 2'b00; #10;
        a = 2'b01; b = 2'b10; #10;
        a = 2'b11; b = 2'b10; #10;
        a = 2'b01; b = 2'b01; #10;

        $finish;
    end

endmodule
"""
    },
    "comparator_4bit": {
        "code": """`timescale 1ns / 1ps

module comparator_4bit (
    input wire [3:0] a,
    input wire [3:0] b,
    output wire eq,
    output wire lt,
    output wire gt
);
    assign eq = (a == b);
    assign lt = (a < b);
    assign gt = (a > b);
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module comparator_4bit_tb;

    reg [3:0] a, b;
    wire eq, lt, gt;

    comparator_4bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 4'b0000; b = 4'b0001; #10;
        a = 4'b1000; b = 4'b0111; #10;
        a = 4'b1111; b = 4'b1111; #10;
        a = 4'b0101; b = 4'b1010; #10;

        $finish;
    end

endmodule
"""
    }
}

# Generate Verilog code and testbench files for each comparator
for comp_name, comp_data in comparators.items():
    with open(f"comparator/{comp_name}.v", "w") as f:
        f.write(comp_data["code"])
    with open(f"comparator/{comp_name}_tb.v", "w") as f:
        f.write(comp_data["tb"])

print("Standalone Verilog files and testbenches for 1-bit, 2-bit, and 4-bit comparators created in the comparator folder.")
