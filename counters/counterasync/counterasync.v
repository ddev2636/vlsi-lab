`timescale 1ns/1ps
module async_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'b0000;
    else if (enable)
        count <= (count==4'b1001) 0 :count + 1;
end

endmodule
