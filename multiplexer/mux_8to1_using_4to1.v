`timescale 1ns / 1ps

// 2-to-1 multiplexer definition
module mux_2to1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    assign y = (sel) ? b : a;
endmodule

// 4-to-1 multiplexer using 2-to-1 multiplexers
module mux_4to1_using_2to1 (
    input wire [3:0] a,
    input wire [1:0] sel,
    output wire y
);

wire mux1_out, mux2_out;

mux_2to1 mux1 (
    .a(a[0]),
    .b(a[1]),
    .sel(sel[0]),
    .y(mux1_out)
);

mux_2to1 mux2 (
    .a(a[2]),
    .b(a[3]),
    .sel(sel[0]),
    .y(mux2_out)
);

mux_2to1 mux3 (
    .a(mux1_out),
    .b(mux2_out),
    .sel(sel[1]),
    .y(y)
);

endmodule

// 8-to-1 multiplexer using 4-to-1 multiplexers
module mux_8to1_using_4to1 (
    input wire [7:0] a,
    input wire [2:0] sel,
    output wire y
);

wire mux1_out, mux2_out;

mux_4to1_using_2to1 mux1 (
    .a(a[3:0]),
    .sel(sel[1:0]),
    .y(mux1_out)
);

mux_4to1_using_2to1 mux2 (
    .a(a[7:4]),
    .sel(sel[1:0]),
    .y(mux2_out)
);

mux_2to1 mux3 (
    .a(mux1_out),
    .b(mux2_out),
    .sel(sel[2]),
    .y(y)
);

endmodule
