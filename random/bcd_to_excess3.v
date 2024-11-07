`timescale 1ns / 1ps

module bcd_to_excess3 (
    input wire [3:0] bcd,
    output reg [3:0] excess3
);
    always @(*) begin
        case (bcd)
            4'b0000: excess3 = 4'b0011;
            4'b0001: excess3 = 4'b0100;
            4'b0010: excess3 = 4'b0101;
            4'b0011: excess3 = 4'b0110;
            4'b0100: excess3 = 4'b0111;
            4'b0101: excess3 = 4'b1000;
            4'b0110: excess3 = 4'b1001;
            4'b0111: excess3 = 4'b1010;
            4'b1000: excess3 = 4'b1011;
            4'b1001: excess3 = 4'b1100;
            default: excess3 = 4'b0000; // Default for invalid input
        endcase
    end
endmodule
