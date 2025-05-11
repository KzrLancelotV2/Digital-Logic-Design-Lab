module DataNum_cnt(input wire clk, rst, cnt2, output Co2,
output wire [2:0] count_datanum);

reg [2:0] datanum_counter_up;

    always @(posedge clk or posedge rst) begin
        if (rst)
            datanum_counter_up <= 3'b000;  
        else
            if (cnt2 == 1)
                datanum_counter_up <= datanum_counter_up + 1'b1;
    end

    assign Co2 = (datanum_counter_up == 3'b101) ? 1'b1 : 1'b0;
    assign count_datanum = datanum_counter_up;

endmodule
