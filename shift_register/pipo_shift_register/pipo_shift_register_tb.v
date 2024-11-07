timescale 1ns / 1ps
module pipo_shift_register_tb;

    reg clk, reset, load;
    reg [7:0] data_in;
    wire [7:0] data_out;

    pipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        data_in = 8'b10101010;
        #10 reset = 0;
        #10 load = 1;
        #10 load = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0dns, reset = %b, load = %b, data_in = %b, data_out = %b", $time, reset, load, data_in, data_out);
    end

endmodule