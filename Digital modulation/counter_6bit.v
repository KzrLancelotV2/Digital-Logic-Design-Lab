module counter_6bit(
 input wire clk, rst,
 output co6,
 output [5:0] count_6
 );

reg [5:0] counter_6_up;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter_6_up <= 0;
        else
            counter_6_up <= counter_6_up + 1'b1;
    end

    assign co6 = (counter_6_up == 6'b111111) ? 1'b1 : 1'b0;
    assign count_6 = counter_6_up;

endmodule