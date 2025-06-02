module sine_rom (
    input wire [5:0] address,
    output wire [7:0] data
);

// Declare the ROM array and apply synthesis attributes
(* romstyle = "M9K" *) (* ram_init_file = "sine.mif" *) reg [7:0] LUT[0:63];

assign data = LUT[address];

endmodule
