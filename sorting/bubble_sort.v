`timescale 1ns / 1ps

module bubble_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j;
    reg swapped;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 0;
            j <= 0;
            swapped <= 1;
        end else if (!done) begin
            if (swapped) begin
                swapped <= 0;
                if (arr[j] > arr[j + 1]) begin
                    {arr[j], arr[j + 1]} <= {arr[j + 1], arr[j]};
                    swapped <= 1;
                end
                if (j < N-2) j <= j + 1;
                else begin
                    j <= 0;
                    if (i < N-1) i <= i + 1;
                    else done <= 1;
                end
            end else begin
                done <= 1;
            end
        end else begin
            for (i = 0; i < N; i = i + 1) begin
                data_out[i*8 +: 8] <= arr[i];
            end
        end
    end
endmodule
