`timescale 1ns / 1ps

module bcd_to_seven_segment (
    input wire [3:0] bcd,
    output reg [6:0] segment
);

always @(*) begin
    case (bcd)
        4'b0000: segment = 7'b0111111;
        4'b0001: segment = 7'b0000110;
        4'b0010: segment = 7'b1011011;
        4'b0011: segment = 7'b1001111;
        4'b0100: segment = 7'b1100110;
        4'b0101: segment = 7'b1101101;
        4'b0110: segment = 7'b1111101;
        4'b0111: segment = 7'b0000111;
        4'b1000: segment = 7'b1111111;
        4'b1001: segment = 7'b1101111;
        default: segment = 7'b0000000;
    endcase
end

endmodule
