`timescale 1ns / 1ps

module selection_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j, min_idx;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 0;
        end else if (!done) begin
            if (i < N-1) begin
                min_idx = i;
                for (j = i + 1; j < N; j = j + 1) begin
                    if (arr[j] < arr[min_idx])
                        min_idx = j;
                end
                if (min_idx != i) begin
                    {arr[i], arr[min_idx]} <= {arr[min_idx], arr[i]};
                end
                i <= i + 1;
            end else begin
                done <= 1;
                for (i = 0; i < N; i = i + 1) begin
                    data_out[i*8 +: 8] <= arr[i];
                end
            end
        end
    end
endmodule
