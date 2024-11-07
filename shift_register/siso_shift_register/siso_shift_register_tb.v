timescale 1ns / 1ps
module siso_shift_register_tb;

    reg clk, reset, serial_in, shift;
    wire serial_out;

    siso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift(shift),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        shift = 0;
        serial_in = 0;
        #10 reset = 0;
        #10 shift = 1; serial_in = 1;
        #10 shift = 1; serial_in = 0;
        #10 shift = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, reset = %b, serial_in = %b, shift = %b, serial_out = %b", $time, reset, serial_in, shift, serial_out);
    end

endmodule