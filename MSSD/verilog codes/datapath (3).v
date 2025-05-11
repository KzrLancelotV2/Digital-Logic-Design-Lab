module datapath(input clk, rst, SerIn, clk_en,
 cnt1, cnt2, cntD, Sh_en, Sh_enD, LdcntD,
 output Co1, Co2, CoD, output wire [3:0] P, output wire [6:0] Up,
 output wire [6:0] Low);

wire [1:0] portnum_sel;
wire [4:0] datanum_wire;
wire [4:0] datatrans_wire;

PortNum_Sh portnum_Sh (
    .clk(clk_en),
    .rst(rst),
    .Sh_en(Sh_en),
    .SerIn(SerIn),
    .Port_num(portnum_sel)
);

DataNum_Sh datanum_sh (
.clk(clk_en),
.rst(rst),
.SerIn(SerIn),
.Sh_enD(Sh_enD),
.DataNum(datanum_wire)
);

Demux demux (
    .Port_num(portnum_sel),
    .SerIn(SerIn),
    .P(P)
);

DataTrans_cnt datatrans_cnt (
    .clk(clk_en),
    .rst(rst),
    .cntD(cntD),
    .LdcntD(LdcntD),
    .DataNum(datanum_wire),
    .CoD(CoD),
    .count_datatrans(datatrans_wire)
);

DataNum_cnt datanum_cnt (
    .clk(clk_en),
    .rst(rst),
    .cnt2(cnt2),
    .Co2(Co2)
);
PortNum_cnt portnum_cnt (
    .clk(clk_en),
    .rst(rst),
    .cnt1(cnt1),
    .Co1(Co1)
);


Seven_Segment ssd1 (
    .count(datatrans_wire[3:0]),
    .SSD(Low)
);
 
Seven_Segment ssd2 (
    .count({3'b000, datatrans_wire[4]}),
    .SSD(Up)
);
 endmodule