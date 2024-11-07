timescale 1ns / 1ps
module sipo_shift_register_tb;

    reg clk, reset, serial_in, shift;
    wire [7:0] data_out;

    sipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift(shift),
        .data_out(data_out)
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
        $monitor("Time = %0dns, reset = %b, serial_in = %b, shift = %b, data_out = %b", $time, reset, serial_in, shift, data_out);
    end

endmodule