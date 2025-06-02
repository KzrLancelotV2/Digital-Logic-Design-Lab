module top_module(
    input clk, rst, mode, send, init,
    input [2:0] cnt,
    input [4:0] msg,
    output pwm_out
);
    wire serOut;
    wire [8:0] inFreq0, inFreq1;
    assign inFreq0 = {1'b0, cnt, 5'b0};
    assign inFreq1 = {1'b1, cnt, 5'b0};

    wire freq_div_out_0, freq_div_out_1;
    wire dds_clk_in; 

    freq_div_9bit_0 freq_div0(
        .init(~init),
        .clk(clk),
        .rst(rst),
        .cnt_ext(inFreq0),
        .freq_div_out(freq_div_out_0)
    );

    freq_div_9bit_1 freq_div1(
        .init(~init),
        .clk(clk),
        .rst(rst),
        .cnt_ext(inFreq1),
        .freq_div_out(freq_div_out_1)
    );

    mux_2_to_1_1bit mux_2_to_1_1bit(
        .a(freq_div_out_0),
        .b(freq_div_out_1),
        .sel(serOut),
        .y(dds_clk_in)
    );

    msg_process msg_process(
        .clk(freq_div_out_1),
        .rst(rst),
        .msg(msg),
        .send(~send),
        .serOut(serOut)
    );

    wire [7:0] dds_output;
    dds dds(
        .clk(dds_clk_in),
        .rst(rst),
        .dds_out(dds_output)
    );

    wire serOut_or_mode;
    assign serOut_or_mode = serOut | mode;

    wire [7:0] pwm_temp;

    mux_2_to_1_9bit mux_2_to_1_9bit(
        .a(8'd128),
        .b(dds_output),
        .sel(serOut_or_mode),
        .y(pwm_temp)
    );

   // assign pwm_in = pwm_temp[7:0];
	pwm pwm (
	.clk(clk),
	.in(pwm_temp),
	.out(pwm_out));

endmodule
