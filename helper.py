import os

# Create the logic_gates directory if it doesn't exist
os.makedirs("logic_gates", exist_ok=True)

# Define Verilog code templates for XOR and AND-OR using multiplexers
modules = {
    "three_input_xor_mux": {
        "code": """`timescale 1ns / 1ps

module three_input_xor_mux (
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    wire [3:0] mux_inputs;
    
    assign mux_inputs[0] = 0;   // 000 -> 0
    assign mux_inputs[1] = 1;   // 001 -> 1
    assign mux_inputs[2] = 1;   // 010 -> 1
    assign mux_inputs[3] = 0;   // 011 -> 0
    assign mux_inputs[4] = 1;   // 100 -> 1
    assign mux_inputs[5] = 0;   // 101 -> 0
    assign mux_inputs[6] = 0;   // 110 -> 0
    assign mux_inputs[7] = 1;   // 111 -> 1

    assign y = mux_inputs[{a, b, c}];
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module three_input_xor_mux_tb;

    reg a, b, c;
    wire y;

    three_input_xor_mux uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);

        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        $finish;
    end

endmodule
"""
    },
    "three_input_and_or_mux": {
        "code": """`timescale 1ns / 1ps

module three_input_and_or_mux (
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    wire [3:0] mux_inputs;

    assign mux_inputs[0] = 0;  // 000 -> 0
    assign mux_inputs[1] = 0;  // 001 -> 0
    assign mux_inputs[2] = 0;  // 010 -> 0
    assign mux_inputs[3] = 1;  // 011 -> 1
    assign mux_inputs[4] = 0;  // 100 -> 0
    assign mux_inputs[5] = 1;  // 101 -> 1
    assign mux_inputs[6] = 1;  // 110 -> 1
    assign mux_inputs[7] = 1;  // 111 -> 1

    assign y = mux_inputs[{a, b, c}];
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module three_input_and_or_mux_tb;

    reg a, b, c;
    wire y;

    three_input_and_or_mux uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);

        a = 0; b = 0; c = 0; #10;
        a = 0; b = 0; c = 1; #10;
        a = 0; b = 1; c = 0; #10;
        a = 0; b = 1; c = 1; #10;
        a = 1; b = 0; c = 0; #10;
        a = 1; b = 0; c = 1; #10;
        a = 1; b = 1; c = 0; #10;
        a = 1; b = 1; c = 1; #10;

        $finish;
    end

endmodule
"""
    }
}

# Generate Verilog code and testbench files for each module
for module_name, module_data in modules.items():
    with open(f"logic_gates/{module_name}.v", "w") as f:
        f.write(module_data["code"])
    with open(f"logic_gates/{module_name}_tb.v", "w") as f:
        f.write(module_data["tb"])

print("Standalone Verilog files and testbenches for three-input XOR and AND-OR logic using multiplexers created in the logic_gates folder.")
