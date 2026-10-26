// Generate 100MHZ clk
// Time Unit : ns

`timescale 1ns/1ps

module clk_100Mhz;
    reg clk;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
endmodule



// A 100 MHz clock has a 10 ns period, so use #5 to toggle the clock and generate a 50% duty-cycle clock.
