`timescale 1ns/1ps
module updown_counter_tb;

    reg clk;
    reg reset;
    reg enable;
    reg up_down;
    wire [3:0] count;

    updown_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1;
        enable = 0;
        up_down = 1;
        #10 reset = 0;
        #10 enable = 1;
        #50 up_down = 0;
        #50 up_down = 1;
        #50 enable = 0;
        #10 reset = 1;
        #10 reset = 0;
        #50 $finish;
    end

    always @(reset or enable or up_down or count) begin
        $display("Time = %0dns, reset = %b, enable = %b, up_down = %b, count = %b", 
                 $time, reset, enable, up_down, count);
    end

endmodule
