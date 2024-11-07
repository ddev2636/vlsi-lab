`timescale 1ns / 1ps

module sync_updown_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire up,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'b0000;
    else if (enable) begin
        if (up)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule
