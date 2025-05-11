module DataTrans_cnt(input wire clk, rst, cntD,LdcntD,input [4:0]DataNum
, output CoD, output [4:0] count_datatrans);

reg [4:0] datatrans_counter_up;

    always @(posedge clk or posedge rst) begin
        if (rst)
            datatrans_counter_up <= 0;
        else if (LdcntD)
            datatrans_counter_up <= DataNum;
        else
            if (cntD == 1)
                datatrans_counter_up <= datatrans_counter_up - 1'b1;
    end

    assign CoD = (datatrans_counter_up == 5'b0) ? 1'b1 : 1'b0;
    assign count_datatrans = datatrans_counter_up;

endmodule