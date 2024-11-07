`timescale 1ns / 1ps

module decoder_2to4_tb;

    reg [1:0] sel;
    wire y0, y1, y2, y3;

    decoder_2to4 uut (
        .sel(sel),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $monitor("sel = %b, y0 = %b, y1 = %b, y2 = %b, y3 = %b", sel, y0, y1, y2, y3);
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;
        $finish;
    end

endmodule
