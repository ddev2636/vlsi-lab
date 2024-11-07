`timescale 1ns / 1ps

module full_subtractor_using_full_subtractor (
    input wire a,
    input wire b,
    input wire bin,
    output wire diff,
    output wire bout
);

    wire diff1, borrow1, borrow2;

    full_subtractor fs1 (.a(a), .b(b), .bin(1'b0), .diff(diff1), .bout(borrow1));
    full_subtractor fs2 (.a(diff1), .b(bin), .bin(1'b0), .diff(diff), .bout(borrow2));

    assign bout = borrow1 | borrow2;

endmodule

module full_subtractor (
    input wire a,
    input wire b,
    input wire bin,
    output wire diff,
    output wire bout
);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | ((~a | b) & bin);
endmodule
