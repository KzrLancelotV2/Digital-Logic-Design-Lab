module counter_4bit(
 input wire clk, rst,en,
 output co,
 output [3:0] count_4
 );

reg [3:0] counter_4_up=4'b0;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter_4_up <= 0;
        else if (en)
            counter_4_up <= counter_4_up + 1'b1;
    end

    assign co = (counter_4_up == 4'b1001) ? 1'b1 : 1'b0;
    assign count_4 = counter_4_up;

endmodule