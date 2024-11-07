`timescale 1ns/1ps
module updown_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire up_down, 
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;
    else if (enable) begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;
    end
end

endmodule
