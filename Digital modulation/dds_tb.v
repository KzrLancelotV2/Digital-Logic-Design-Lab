`timescale 1ns / 1ns

// Testbench for the dds module
module tb_dds;
    // Inputs
    reg clk=0;
    reg rst=0;

    wire [7:0] dds_out;

    dds uut (
        .clk(clk),
        .rst(rst),
        .dds_out(dds_out)
    );

        always #5 clk = ~clk;


    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;


        // Hold reset for a few cycles
        #40;
        rst = 0;

    
        #10000;
        $display("Simulation complete. Final dds_out = %h", dds_out);
        $stop;
    end

endmodule
