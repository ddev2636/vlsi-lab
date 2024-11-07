`timescale 1ns / 1ps

module demux_1to2 (
    input wire d,
    input wire sel,
    output wire y0,
    output wire y1
);
    assign y0 = (~sel) ? d : 0;
    assign y1 = sel ? d : 0;
endmodule
