module PortNum_cnt(input wire clk, rst, cnt1, output Co1,
 output [1:0] count_portnum);

reg [1:0] portnum_counter_up;

    always @(posedge clk or posedge rst) begin
        if (rst)
            portnum_counter_up <= 0;
        else
            if (cnt1 == 1)
                portnum_counter_up <= portnum_counter_up + 1'b1;
    end

    assign Co1 = (portnum_counter_up == 2'b01) ? 1'b1 : 1'b0;
    assign count_portnum = portnum_counter_up;

endmodule




