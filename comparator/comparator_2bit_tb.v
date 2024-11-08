`timescale 1ns / 1ps

module comparator_2bit_tb;

    reg [1:0] a, b;
    wire eq, lt, gt;

    comparator_2bit uut (
        .a(a),
        .b(b),
        .eq(eq),
        .lt(lt),
        .gt(gt)
    );

    initial begin
        $monitor("Time = %0dns, a = %b, b = %b, eq = %b, lt = %b, gt = %b", $time, a, b, eq, lt, gt);
        
        a = 2'b00; b = 2'b00; #10;
        a = 2'b01; b = 2'b10; #10;
        a = 2'b11; b = 2'b10; #10;
        a = 2'b01; b = 2'b01; #10;

        $finish;
    end

endmodule
