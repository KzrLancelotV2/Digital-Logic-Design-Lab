module msg_process_dp(input clk, rst,Ld,En,input [4:0] msg, output serOut, Co2);
wire [9:0] out10Bit;
wire [3:0] out4Bit;
wire co1;
counter_10bit counter_10bit(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .co(co1),
    .count_10(out10Bit)
    );
    
counter_4bit counter_4bit(
    .clk(clk),
    .rst(rst),
    .en(co1),
    .co(Co2),
    .count_4(out4Bit)
    );
shift_reg shift_reg(
    .clk(clk),
    .rst(rst),
    .Ld(Ld),
    .Shift(co1),
    .MSG(msg),
    .SerOut(serOut)
    );
endmodule