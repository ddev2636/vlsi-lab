timescale 1ns / 1ps
module t_flip_flop_tb;

    reg clk, reset, t;
    wire q;

    t_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    initial begin
        clk = 0;
        reset = 1;
        t = 0;
        #10 reset = 0;
        #10 t = 1;
        #10 t = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;
    
    initial begin
        $monitor("Time = %0dns, reset = %b, t = %b, q = %b", $time, reset, t, q);
    end

endmodule