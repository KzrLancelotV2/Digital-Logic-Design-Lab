module twos_comp_6bit (
input [5:0] in,
output [5:0] out
);
assign out = ~in + 1'b1;

endmodule