`timescale 1ns / 1ps
module sipo_shift_register (
    input wire clk,
    input wire reset,
    input wire serial_in,
    input wire shift,
    output reg [7:0] data_out
);

reg [7:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 8'b0;
        data_out <= 8'b0;
    end else if (shift) begin
        shift_reg <= {shift_reg[6:0], serial_in};
        data_out <= shift_reg;
    end
end
endmodule