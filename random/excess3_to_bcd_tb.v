`timescale 1ns / 1ps

module excess3_to_bcd_tb;

    reg [3:0] excess3;
    wire [3:0] bcd;

    excess3_to_bcd uut (
        .excess3(excess3),
        .bcd(bcd)
    );

    initial begin
        excess3 = 4'b0000;
        #10 excess3 = 4'b0001;
        #10 excess3 = 4'b0010;
        #10 excess3 = 4'b0011;
        #10 excess3 = 4'b0100;
        #10 excess3 = 4'b0101;
        #10 excess3 = 4'b0110;
        #10 excess3 = 4'b0111;
        #10 excess3 = 4'b1000;
        #10 excess3 = 4'b1001;
        #10 excess3 = 4'b1010; // Invalid input, should default
        #10 $finish;
    end

    initial begin
        $monitor("Excess-3 = %b => BCD = %b", excess3, bcd);
    end

endmodule
