`timescale 1ns / 1ps

module mux_8to1 (
    input wire [7:0] a,
    input wire [2:0] sel,
    output wire y
);

    assign y = (sel == 3'b000) ? a[0] :
               (sel == 3'b001) ? a[1] :
               (sel == 3'b010) ? a[2] :
               (sel == 3'b011) ? a[3] :
               (sel == 3'b100) ? a[4] :
               (sel == 3'b101) ? a[5] :
               (sel == 3'b110) ? a[6] : a[7];

endmodule
