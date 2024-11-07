`timescale 1ns / 1ps

module demux_1to2_tb;

    reg d, sel;
    wire y0, y1;

    demux_1to2 uut (
        .d(d),
        .sel(sel),
        .y0(y0),
        .y1(y1)
    );

    initial begin
        $monitor("d = %b, sel = %b, y0 = %b, y1 = %b", d, sel, y0, y1);
        d = 0; sel = 0; #10;
        d = 1; sel = 0; #10;
        d = 0; sel = 1; #10;
        d = 1; sel = 1; #10;
        $finish;
    end

endmodule
