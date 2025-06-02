module counter_10bit(
 input wire clk, rst,en,
 output co,
 output [9:0] count_10
 );

reg [9:0] counter_10_up=10'b0;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter_10_up <= 0;
        else if (en)
            counter_10_up <= counter_10_up + 1'b1;
    end

    assign co = (counter_10_up == 10'b1111111111) ? 1'b1 : 1'b0;
    assign count_10 = counter_10_up;

endmodule



