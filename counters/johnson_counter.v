`timescale 1ns / 1ps

module johnson_counter #(parameter N = 4) (
    input wire clk,
    input wire reset,
    output reg [N-1:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= {N{1'b0}};
    end else begin
        count <= {count[N-2:0], ~count[N-1]};
    end
end

endmodule
