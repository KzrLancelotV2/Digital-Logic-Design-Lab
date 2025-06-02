module mux_2_to_1_9bit (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire sel,
    output wire [7:0] y
);
    assign y = sel ? b : a;
endmodule