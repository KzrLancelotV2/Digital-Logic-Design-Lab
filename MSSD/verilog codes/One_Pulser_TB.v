`timescale 1ns / 1ns

module tb_one_pulser;

    reg clk;
    reg clkPB;
    wire clk_en;

    // Instantiate the Unit Under Test (UUT)
    one_pulser uut (
        .clk(clk),
        .clkPB(clkPB),
        .clk_en(clk_en)
    );

    // Clock generation: 50MHz clock (20ns period)
    initial clk = 0;
    always #10 clk = ~clk;

    // Stimulus
    initial begin
        $display("Time\tclkPB\tclk_en");
        $monitor("%4t\t%b\t%b", $time, clkPB, clk_en);

        // Initial state
        clkPB = 0;

        // Wait a few cycles
        #25;

        // Simulate clkPB pulse
        #5  clkPB = 1;
        #100 clkPB = 0;

        #40;

        // Another clkPB pulse
        #5  clkPB = 1;
        #100 clkPB = 0;

        #40;

        // Another clkPB pulse
        #5  clkPB = 1;
        #20 clkPB = 0;

        #40;

        // End simulation
        $finish;
    end

endmodule
