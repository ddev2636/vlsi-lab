timescale 1ns / 1ps
module piso_shift_register (
    input wire clk,
    input wire reset,
    input wire shift,
    input wire load,
    input wire [7:0] data_in,
    output reg serial_out
);

reg [7:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 8'b0;
        serial_out <= 0;
    end else if (load) begin
        shift_reg <= data_in;
    end else if (shift) begin
        shift_reg <= {shift_reg[6:0], 1'b0};
        serial_out <= shift_reg[7];
    end
end
endmodule