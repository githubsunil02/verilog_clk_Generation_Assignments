`timescale 1ns/1ps

module clk_3MHz;

reg clk_3;

initial begin
    clk_3 <= 1'b0;
    forever #166.66 clk_3 <= ~clk_3;
end
endmodule

// - timescale 1ns/1ps — time unit is 1 ns, precision is 1 ps.
// - reg clk_3 — declares the clock signal.
// - clk_3 = 1'b0 — initializes the clock to 0.
// - forever #166.667 — toggles the clock every 166.667 ns.
// Calculation:
// \[
// T=\frac{1}{3\,\text{MHz}}=333.333\text{ ns}
// \]

// \[
// T/2=166.667\text{ ns}
// \]

// So the clock period is approximately 333.333 ns, giving a frequency of approximately 3 MHz.
