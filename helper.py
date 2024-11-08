import os

# Create the sorting directory if it doesn't exist
os.makedirs("sorting", exist_ok=True)

# Define Verilog code templates for different sorting algorithms
sorting_algorithms = {
    "bubble_sort": {
        "code": """`timescale 1ns / 1ps

module bubble_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j;
    reg swapped;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 0;
            j <= 0;
            swapped <= 1;
        end else if (!done) begin
            if (swapped) begin
                swapped <= 0;
                if (arr[j] > arr[j + 1]) begin
                    {arr[j], arr[j + 1]} <= {arr[j + 1], arr[j]};
                    swapped <= 1;
                end
                if (j < N-2) j <= j + 1;
                else begin
                    j <= 0;
                    if (i < N-1) i <= i + 1;
                    else done <= 1;
                end
            end else begin
                done <= 1;
            end
        end else begin
            for (i = 0; i < N; i = i + 1) begin
                data_out[i*8 +: 8] <= arr[i];
            end
        end
    end
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module bubble_sort_tb;

    reg clk;
    reg start;
    reg [31:0] data_in;
    wire [31:0] data_out;
    wire done;

    bubble_sort #(.N(4)) uut (
        .clk(clk),
        .start(start),
        .data_in(data_in),
        .data_out(data_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, data_in = %h, data_out = %h, done = %b", $time, data_in, data_out, done);
        
        data_in = 32'h1234_7856; start = 1; #10;
        start = 0;
        wait(done);
        
        $finish;
    end

endmodule
"""
    },
    "selection_sort": {
        "code": """`timescale 1ns / 1ps

module selection_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j, min_idx;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 0;
        end else if (!done) begin
            if (i < N-1) begin
                min_idx = i;
                for (j = i + 1; j < N; j = j + 1) begin
                    if (arr[j] < arr[min_idx])
                        min_idx = j;
                end
                if (min_idx != i) begin
                    {arr[i], arr[min_idx]} <= {arr[min_idx], arr[i]};
                end
                i <= i + 1;
            end else begin
                done <= 1;
                for (i = 0; i < N; i = i + 1) begin
                    data_out[i*8 +: 8] <= arr[i];
                end
            end
        end
    end
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module selection_sort_tb;

    reg clk;
    reg start;
    reg [31:0] data_in;
    wire [31:0] data_out;
    wire done;

    selection_sort #(.N(4)) uut (
        .clk(clk),
        .start(start),
        .data_in(data_in),
        .data_out(data_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, data_in = %h, data_out = %h, done = %b", $time, data_in, data_out, done);
        
        data_in = 32'h1234_7856; start = 1; #10;
        start = 0;
        wait(done);
        
        $finish;
    end

endmodule
"""
    },
    "insertion_sort": {
        "code": """`timescale 1ns / 1ps

module insertion_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j;
    reg [7:0] key;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 1;
        end else if (!done) begin
            if (i < N) begin
                key = arr[i];
                j = i - 1;
                while (j >= 0 && arr[j] > key) begin
                    arr[j + 1] <= arr[j];
                    j = j - 1;
                end
                arr[j + 1] <= key;
                i <= i + 1;
            end else begin
                done <= 1;
                for (i = 0; i < N; i = i + 1) begin
                    data_out[i*8 +: 8] <= arr[i];
                end
            end
        end
    end
endmodule
""",
        "tb": """`timescale 1ns / 1ps

module insertion_sort_tb;

    reg clk;
    reg start;
    reg [31:0] data_in;
    wire [31:0] data_out;
    wire done;

    insertion_sort #(.N(4)) uut (
        .clk(clk),
        .start(start),
        .data_in(data_in),
        .data_out(data_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, data_in = %h, data_out = %h, done = %b", $time, data_in, data_out, done);
        
        data_in = 32'h1234_7856; start = 1; #10;
        start = 0;
        wait(done);
        
        $finish;
    end

endmodule
"""
    }
}

# Generate Verilog code and testbench files for each sorting algorithm
for algorithm_name, algorithm_data in sorting_algorithms.items():
    with open(f"sorting/{algorithm_name}.v", "w") as f:
        f.write(algorithm_data["code"])
    with open(f"sorting/{algorithm_name}_tb.v", "w") as f:
        f.write(algorithm_data["tb"])

print("Standalone Verilog files and testbenches for Bubble Sort, Selection Sort, and Insertion Sort created in the sorting folder.")
