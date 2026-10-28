
`timescale 1ns/1ps

module clock_divider (
    input clk_100,
    input rst,
    output reg clk_50,
    output reg clk_25,
    output reg clk_1
);

    reg [5:0] count_1; // Counter for 1 MHz clock

    // Generate 50 MHz clock
    always @(posedge clk_100 or posedge rst) begin
        if (rst)
            clk_50 <= 1'b0;
        else
            clk_50 <= ~clk_50;
    end

    // Generate 25 MHz clock
    always @(posedge clk_100 or posedge rst) begin
        if (rst)
            clk_25 <= 1'b0;
        else if (clk_50)
            clk_25 <= ~clk_25;
    end

    // Generate 1 MHz clock
    always @(posedge clk_100 or posedge rst) begin
        if (rst) begin
            count_1 <= 6'd0;
            clk_1   <= 1'b0;
        end
        else if (count_1 == 6'd49) begin
            count_1 <= 6'd0;
            clk_1   <= ~clk_1;
        end
        else begin
            count_1 <= count_1 + 1'b1;
        end
    end

endmodule
