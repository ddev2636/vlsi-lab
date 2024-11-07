timescale 1ns / 1ps
module piso_shift_register_tb;

    reg clk, reset, shift, load;
    reg [7:0] data_in;
    wire serial_out;

    piso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .shift(shift),
        .load(load),
        .data_in(data_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        shift = 0;
        load = 0;
        data_in = 8'b11010101;
        #10 reset = 0;
        #10 load = 1;
        #10 load = 0; shift = 1;
        #10 shift = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, reset = %b, shift = %b, load = %b, data_in = %b, serial_out = %b", $time, reset, shift, load, data_in, serial_out);
    end

endmodule