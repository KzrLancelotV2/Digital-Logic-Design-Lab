`timescale 1ns/1ps

module tb_freq_div_9bit_0;

    // Inputs
    reg init;
    reg clk;
    reg rst;
    reg [2:0] cnt;

    // Output
    wire freq_div_out;

    // Instantiate the DUT (Device Under Test)
    freq_div_9bit_0 uut (
        .init(init),
        .clk(clk),
        .rst(rst),
        .cnt(cnt),
        .freq_div_out(freq_div_out)
    );

    // Clock generation: 10 ns period (100 MHz)
    always begin
        #5 clk = ~clk;
    end

    // Test process
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        init = 0;
        cnt = 3'd0;

        $display("Starting testbench...");

        #10 rst = 0; // Release reset

        // Load cnt = 3'd4 (so divisor = 256 - {1'b1, 3'd4, 5'b0} = 256 - 9'd148 = 108)
        cnt = 3'd4;
        init = 1;
        #10 init = 0;

        // Let it run for a while
        #1000;

        // Change cnt to 3'd7 (test another divisor)
        cnt = 3'd7;
        init = 1;
        #10 init = 0;

        #1000;

        $display("Testbench completed.");
        $finish;
    end

    // Optional: monitor output
    initial begin
        $monitor("Time: %0t | freq_div_out = %b", $time, freq_div_out);
    end

endmodule