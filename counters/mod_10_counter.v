`timescale 1ns / 1ps

module mod_10_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000;
        else if (count == 4'b1001)  // When count reaches 9, reset to 0
            count <= 4'b0000;
        else
            count <= count + 1;
    end
endmodule
