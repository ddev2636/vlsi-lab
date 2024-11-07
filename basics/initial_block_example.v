`timescale 1ns / 1ps

module initial_block_example (
    output reg [3:0] counter
);
    initial begin
        counter = 4'b0000;
        #10 counter = 4'b0001;
        #10 counter = 4'b0010;
        #10 counter = 4'b0011;
        #10 $finish;
    end
endmodule
