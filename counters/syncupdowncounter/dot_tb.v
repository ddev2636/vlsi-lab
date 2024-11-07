`timescale 1ns / 1ps

module sync_updown_counter_tb;

    reg clk;
    reg reset;
    reg enable;
    reg up;
    wire [3:0] count;

    sync_updown_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .up(up),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        enable = 0;
        up = 1;
        #10 reset = 0;
        #10 enable = 1;
        #50 up = 0;
        #50 up = 1;
        #50 enable = 0;
        #10 reset = 1;
        #10 reset = 0;
        #50 $finish;
    end

    always @(reset or enable or up or count) begin
        $display("Time = %0dns, reset = %b, enable = %b, up = %b, count = %b", 
                 $time, reset, enable, up, count);
    end

endmodule
