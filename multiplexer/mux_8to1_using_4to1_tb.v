`timescale 1ns / 1ps

module mux_8to1_using_4to1_tb;
    reg [7:0] a;
    reg [2:0] sel;
    wire y;

    mux_8to1_using_4to1 uut (
        .a(a),
        .sel(sel),
        .y(y)
    );

    initial begin
        a = 8'b00000000; sel = 3'b000;
        #10 a = 8'b11110000; sel = 3'b001;
        #10 a = 8'b10101010; sel = 3'b010;
        #10 a = 8'b11001100; sel = 3'b011;
        #10 a = 8'b11111111; sel = 3'b100;
        #10 a = 8'b00001111; sel = 3'b101;
        #10 a = 8'b01010101; sel = 3'b110;
        #10 a = 8'b10101010; sel = 3'b111;
        #10 $finish;
    end

    initial begin
        $monitor("Time = %0dns, a = %b, sel = %b, y = %b", $time, a, sel, y);
    end
endmodule
