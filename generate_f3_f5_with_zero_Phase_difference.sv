 // generate \(f/3\) and \(f/5\) clocks with zero phase difference

`timescale 1ns/1ps

module clk_divider_odd;
    
    reg clk_1 = 1'b0;
    reg clk_f3 = 1'b0;
    reg clk_f5 = 1'b0;
    
    integer count3 = 0;
    integer count5 = 0;

// Generate 1MHz Clock (1000 ns)
always #500 clk_1 = ~clk_1;

// Generate F3 Clock
always @(posedge clk_1) begin
    if (count3 == 2) begin
        count3 <= 0;
        clk_f3 <= ~clk_f3;
    end
    else begin
        count3 <= count3 + 1;
    end
end

// Generate F5 Clock
always @(posedge clk_1) begin
    if (count5 == 4) begin
        count5 <= 0;
        clk_f5 <= ~clk_f5;
    end
    else begin
        count5 <= count5 + 1;
    end
end

endmodule


// // generate 1 MHZ clock and generate f/3 and f/5 clock from it with zero phase difference

// always #500: toggles clk_1 every 500 ns, producing a 1 MHz clock.
// count3: counts three input-clock rising edges before toggling clk_f3.
// count5: counts five input-clock rising edges before toggling clk_f5.
// Both divided clocks change only on rising edges of clk_1.
