module mux_2_to_1_6bit (
    input wire [5:0] a,
    input wire [5:0] b,
    input wire sel,
    output wire [5:0] y
);
    assign y = sel ? b : a;
endmodule