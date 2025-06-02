module twos_comp_8bit (
input wire sign,
input [7:0] in,
output [7:0] out
);

assign out = sign ? (~in + 1'b1) : in;

endmodule