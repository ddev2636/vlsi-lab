`timescale 1ns / 1ps

module bcd_to_seven_segment_tb;

    reg [3:0] bcd;
    wire [6:0] segment;

    bcd_to_seven_segment uut (
        .bcd(bcd),
        .segment(segment)
    );

    initial begin
        bcd = 4'b0000;
        #10 bcd = 4'b0001;
        #10 bcd = 4'b0010;
        #10 bcd = 4'b0011;
        #10 bcd = 4'b0100;
        #10 bcd = 4'b0101;
        #10 bcd = 4'b0110;
        #10 bcd = 4'b0111;
        #10 bcd = 4'b1000;
        #10 bcd = 4'b1001;
        #10 bcd = 4'b1010;
        #10 $finish;
    end

    always @(bcd or segment) begin
        $display("Time = %0dns, BCD = %b, Segment = %b", $time, bcd, segment);
    end

endmodule
