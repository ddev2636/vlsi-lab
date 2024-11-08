`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;
    wire [2:0] main_road;
    wire [2:0] side_road;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .main_road(main_road),
        .side_road(side_road)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time = %0dns, main_road = %b, side_road = %b", $time, main_road, side_road);
        reset = 1; #10;
        reset = 0; #100;

        #200;
        $finish;
    end

endmodule
