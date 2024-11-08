`timescale 1ns / 1ps

module traffic_light_controller (
    input wire clk,
    input wire reset,
    output reg [2:0] main_road, // 3-bit output for Main road lights: Red-Yellow-Green
    output reg [2:0] side_road  // 3-bit output for Side road lights: Red-Yellow-Green
);

    typedef enum reg [1:0] {
        GREEN = 2'b00,
        YELLOW = 2'b01,
        RED = 2'b10
    } state_t;

    state_t state_main, state_side;
    integer timer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state_main <= GREEN;
            state_side <= RED;
            timer <= 0;
        end else begin
            timer <= timer + 1;

            case (state_main)
                GREEN: if (timer >= 10) begin
                    state_main <= YELLOW;
                    timer <= 0;
                end
                YELLOW: if (timer >= 2) begin
                    state_main <= RED;
                    state_side <= GREEN;
                    timer <= 0;
                end
                RED: if (timer >= 10) begin
                    state_main <= GREEN;
                    state_side <= RED;
                    timer <= 0;
                end
            endcase
        end
    end

    always @(*) begin
        case (state_main)
            GREEN: main_road = 3'b001;
            YELLOW: main_road = 3'b010;
            RED: main_road = 3'b100;
            default: main_road = 3'b000;
        endcase

        case (state_side)
            GREEN: side_road = 3'b001;
            YELLOW: side_road = 3'b010;
            RED: side_road = 3'b100;
            default: side_road = 3'b000;
        endcase
    end

endmodule
