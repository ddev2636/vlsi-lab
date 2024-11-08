`timescale 1ns / 1ps

module comparator_4bit_tb;

    reg [3:0] a, b;
    wire eq, lt, gt;

    comparator_4bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 4'b0000; b = 4'b0001; #10;
        a = 4'b1000; b = 4'b0111; #10;
        a = 4'b1111; b = 4'b1111; #10;
        a = 4'b0101; b = 4'b1010; #10;

        $finish;
    end

endmodule
