`timescale 1ns / 1ps

module insertion_sort #(parameter N = 4) (
    input wire clk,
    input wire start,
    input wire [N*8-1:0] data_in,
    output reg [N*8-1:0] data_out,
    output reg done
);
    reg [7:0] arr [N-1:0];
    reg [3:0] i, j;
    reg [7:0] key;

    always @(posedge clk) begin
        if (start) begin
            done <= 0;
            for (i = 0; i < N; i = i + 1) begin
                arr[i] <= data_in[i*8 +: 8];
            end
            i <= 1;
        end else if (!done) begin
            if (i < N) begin
                key = arr[i];
                j = i - 1;
                while (j >= 0 && arr[j] > key) begin
                    arr[j + 1] <= arr[j];
                    j = j - 1;
                end
                arr[j + 1] <= key;
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
