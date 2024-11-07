`timescale 1ns / 1ps

module excess3_to_bcd (
    input wire [3:0] excess3,
    output reg [3:0] bcd
);
    always @(*) begin
        case (excess3)
            4'b0000: bcd = 4'b0000;
            4'b0001: bcd = 4'b0001;
            4'b0010: bcd = 4'b0010;
            4'b0011: bcd = 4'b0011;
            4'b0100: bcd = 4'b0100;
            4'b0101: bcd = 4'b0101;
            4'b0110: bcd = 4'b0110;
            4'b0111: bcd = 4'b0111;
            4'b1000: bcd = 4'b1000;
            4'b1001: bcd = 4'b1001;
            default: bcd = 4'b0000; // Default for invalid input
        endcase
    end
endmodule
