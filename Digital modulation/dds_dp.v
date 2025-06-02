module dds_dp(input clk, rst, P, S,output co6, output [7:0] dds_out);


wire [5:0] addr;
counter_6bit counter_6bit (
    .clk(clk),
    .rst(rst),
    .co6(co6),
    .count_6(addr)
);

wire [5:0] twos_comp6_out;
twos_comp_6bit twos_comp_6bit(
    .in(addr),
    .out(twos_comp6_out)
);

wire [5:0] mux6_out;
mux_2_to_1_6bit mux_2_to_1_6bit(
    .a(addr),
    .b(twos_comp6_out),
    .sel(P),
    .y(mux6_out)
);

wire [7:0] rom_out;
sine_rom sine_rom(
    .address(mux6_out),
    .data(rom_out)
);

wire  addr_nor;
assign addr_nor = ~(|addr);


wire addr_nor_and_P;
assign addr_nor_and_P = addr_nor & P;

wire [7:0] mux8_out;
mux_2_to_1_8bit mux_2_to_1_8bit(
    .a(rom_out),
    .b(8'b11111111),
    .sel(addr_nor_and_P),
    .y(mux8_out)
);

twos_comp_8bit twos_comp_8bit(
    .sign(S),
    .in(mux8_out),
    .out(dds_out)
);


endmodule