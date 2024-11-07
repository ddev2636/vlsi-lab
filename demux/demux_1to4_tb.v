`timescale 1ns / 1ps

module demux_1to4_tb;

    reg d;
    reg [1:0] sel;
    wire y0, y1, y2, y3;

    demux_1to4 uut (
        .d(d),
        .sel(sel),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        $monitor("d = %b, sel = %b, y0 = %b, y1 = %b, y2 = %b, y3 = %b", d, sel, y0, y1, y2, y3);
        d = 1; sel = 2'b00; #10;
        d = 1; sel = 2'b01; #10;
        d = 1; sel = 2'b10; #10;
        d = 1; sel = 2'b11; #10;
        $finish;
    end

endmodule
