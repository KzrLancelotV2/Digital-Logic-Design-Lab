module pwm(
    input wire clk,
    input wire [7:0] in,
    output reg out
);

    reg [7:0] counter = 8'd0;

    always @(posedge clk) begin
        counter <= counter + 1'b1;
        out <= (counter < in) ? 1'b1 : 1'b0;
    end

endmodule
