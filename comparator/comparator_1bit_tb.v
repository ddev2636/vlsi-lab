`timescale 1ns / 1ps

module comparator_1bit_tb;

    reg a, b;
    wire eq, lt, gt;

    comparator_1bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
