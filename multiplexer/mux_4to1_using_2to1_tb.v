`timescale 1ns / 1ps

module mux_4to1_using_2to1_tb;
    reg [3:0] a;
    reg [1:0] sel;
    wire y;

    mux_4to1_using_2to1 uut (
        .a(a),
        .sel(sel),
        .y(y)
    );

    initial begin
        a = 4'b0000; sel = 2'b00;
        #10 a = 4'b1010; sel = 2'b01;
        #10 a = 4'b1111; sel = 2'b10;
        #10 a = 4'b1100; sel = 2'b11;
        #10 $finish;
    end

    initial begin
        $monitor("Time = %0dns, a = %b, sel = %b, y = %b", $time, a, sel, y);
    end
endmodule
