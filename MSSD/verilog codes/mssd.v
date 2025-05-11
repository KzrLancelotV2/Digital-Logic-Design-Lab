module mssd(input clk, rst , SerIn, clkPB, output done, SerOut_Valid,
output [3:0] P, output [6:0] SSD_up, output [6:0]SSD_low);


wire clk_en, cnt1, cnt2, cntD, Sh_en, Sh_enD, LdcntD, Co1, Co2, CoD;

one_pulser op(
    .clk(clk),
    .clkPB(clkPB),
    .clk_en(clk_en)
);
datapath dp(
    .clk(clk),
    .rst(rst),
    .SerIn(SerIn),
    .clk_en(clk_en),
    .cnt1(cnt1),
    .cnt2(cnt2),
    .cntD(cntD),
    .Sh_en(Sh_en),
    .Sh_enD(Sh_enD),
    .LdcntD(LdcntD),
    .Co1(Co1),
    .Co2(Co2),
    .CoD(CoD),
    .P(P),
    .Up(SSD_up),
    .Low(SSD_low)
);

Controller ctrl(
    .clk(clk),
    .rst(rst),
    .SerIn(SerIn),
    .clk_en(clk_en),
    .Co1(Co1),
    .Co2(Co2),
    .CoD(CoD),
    .cnt1(cnt1),
    .cnt2(cnt2),
    .cntD(cntD),
    .Sh_en(Sh_en),
    .Sh_enD(Sh_enD),
    .LdcntD(LdcntD),
    .done(done),
    .SerOut_Valid(SerOut_Valid)
);



endmodule