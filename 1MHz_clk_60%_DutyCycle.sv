// 1 MHz Clock with 60% Duty Cycle
// - Frequency: 1 MHz
// - Time period: \(T = \frac{1}{f} = 1\,\mu s = 1000\,ns\)
// - Duty cycle: 60%
// - HIGH time: \(1000 \times 60\% = 600\,ns\)
// - LOW time: \(1000 - 600 = 400\,ns\)
// below code: to achieve 60% duty cycle, use 600 ns HIGH and 400 ns LOW

`timescale 1ns/1ps

module clk_1Mhz(
    output reg clk
    );
    
    initial begin
        clk <= 1'b0;
        forever begin
            #600 clk = 1'b1;
            #400 clk = 1'b0;
        end
    end
endmodule
