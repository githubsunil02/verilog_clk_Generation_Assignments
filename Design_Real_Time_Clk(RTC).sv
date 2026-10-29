
`timescale 1ns/1ps

// Design a Real Time Clock (RTC)
module rtc(
    input clk, rst,
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours
);

// Update the clock on every rising edge
always @(posedge clk or posedge rst) begin
    if (rst) begin
        seconds <= 0;
        minutes <= 0;
        hours   <= 0;
    end
    else begin
        if (seconds == 59) begin
            seconds <= 0;

            if (minutes == 59) begin
                minutes <= 0;

                if (hours == 23)
                    hours <= 0;
                else
                    hours <= hours + 1;
            end
            else begin
                minutes <= minutes + 1;
            end
        end
        else begin
            seconds <= seconds + 1;
        end
    end
end

endmodule
