`timescale 1ns / 1ps

module demux_1to8 (
    input wire d,
    input wire [2:0] sel,
    output wire y0,
    output wire y1,
    output wire y2,
    output wire y3,
    output wire y4,
    output wire y5,
    output wire y6,
    output wire y7
);
    assign y0 = (sel == 3'b000) ? d : 0;
    assign y1 = (sel == 3'b001) ? d : 0;
    assign y2 = (sel == 3'b010) ? d : 0;
    assign y3 = (sel == 3'b011) ? d : 0;
    assign y4 = (sel == 3'b100) ? d : 0;
    assign y5 = (sel == 3'b101) ? d : 0;
    assign y6 = (sel == 3'b110) ? d : 0;
    assign y7 = (sel == 3'b111) ? d : 0;
endmodule
