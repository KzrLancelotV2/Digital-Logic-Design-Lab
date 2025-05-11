`timescale 1ns / 1ns

module mssd_tb;

    reg clk;
    reg rst;
    reg SerIn;
    reg clkPB;

    wire done;
    wire SerOut_Valid;
    wire [3:0] P;
    wire [6:0] SSD_up;
    wire [6:0] SSD_low;

    mssd uut (
        .clk(clk),
        .rst(rst),
        .SerIn(SerIn),
        .clkPB(clkPB),
        .done(done),
        .SerOut_Valid(SerOut_Valid),
        .P(P),
        .SSD_up(SSD_up),
        .SSD_low(SSD_low)
    );


    always #10 clk = ~clk;
	integer k,l,m;

    initial begin
        initial_task();
        reset_task();
        serial_task();
        stop_task();
    end
    task initial_task();
        begin
            $display("initial started at = %t", $time);
	        k=1;
            l=0;
            m=0;
            clk = 0;
            rst = 1;
            SerIn = 0;
            clkPB = 0;
            $display("initial finished at = %t", $time);
        end
    endtask
    task reset_task();
        begin
            $display("reset task started at = %t", $time);
            #50 
            rst = 1;
            #300 rst =0;
            $display("reset task finished at = %t", $time);
        end
    endtask
    task serial_task();
        begin
            $display("serial task started at = %t", $time);
        #20 clkPB = 1; SerIn = 1;
        #20 clkPB = 0; SerIn = 0;
        #40 l=0;
        repeat (40) begin
		if (k % 2 == 0) begin
            #20 clkPB = 1; SerIn =1; l =l +1;
            #20 clkPB = 0; SerIn = 0; end
		else if (k % 2 == 1) begin
	 #20 clkPB = 1; SerIn = 0; m = m+1;
            #20 clkPB = 0; SerIn = 1;
	end
	#40 k = k + 1;
            //#40 SerIn = 1;
            //#40 SerIn = 0;
        end
            $display("serial task finished at = %t", $time);
        end
    endtask
    task stop_task();
        begin
            $display("stop task started at = %t", $time);
        #1000 $stop;
            $display("stop task finished at = %t", $time);
        end
    endtask


endmodule

