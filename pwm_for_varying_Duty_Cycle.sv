// PWM Signal with Varying Duty Cycle

`timescale 1ns/1ps

module pwm (
    input clk, rst,
    output [3:0] duty,
    output reg pwm_out
    );
    
    reg [3:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            pwm_out <= 0;
        end
        else begin
            count <= count + 1;

            if (count < duty)
                pwm_out <= 1;
            else
                pwm_out <= 0;
        end
    end

endmodule

// - clk: Input clock signal.
// - rst: Resets the counter and PWM output.
// - count: A 4-bit counter that counts from 0 to 15.
// - duty: Controls the pulse width.
// - pwm_out: Output PWM signal.
// The counter continuously counts, and the output is HIGH while count < duty; otherwise, it is LOW.

// The PWM period is 16 clock cycles.
