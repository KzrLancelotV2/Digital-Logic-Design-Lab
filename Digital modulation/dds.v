module dds(
input wire clk, rst,
output [7:0] dds_out 
);

wire S, P, cout;

dds_dp dp(
    .clk(clk),
    .rst(rst),
    .S(S),
    .P(P),
    .co6(cout),
    .dds_out(dds_out)
);
dds_ctrl ctrl(
    .clk(clk),
    .cout(cout),
    .S(S),
    .P(P)
);

endmodule