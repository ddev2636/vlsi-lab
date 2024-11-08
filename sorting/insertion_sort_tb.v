`timescale 1ns / 1ps

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
