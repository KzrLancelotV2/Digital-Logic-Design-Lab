module msg_process (input clk,rst, send, input [4:0] msg, output serOut);

wire En,Ld,Co2;
msg_cntr ctrl(
    .clk(clk),
    .reset(rst),
    .send(send),
    .Co2(Co2),
    .Ld(Ld),
    .En(En)
);
msg_process_dp dp(.clk(clk), .rst(rst),.Ld(Ld),.En(En)
, .msg(msg), .serOut(serOut), .Co2(Co2) );

endmodule
