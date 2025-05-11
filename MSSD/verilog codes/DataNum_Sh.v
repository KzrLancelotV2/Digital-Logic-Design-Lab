module DataNum_Sh(input clk, rst, SerIn, Sh_enD, output reg [4:0]DataNum);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        DataNum <= 5'b00000;
    end 
    else if (Sh_enD) begin
        DataNum <= {DataNum[3:0], SerIn};
    end
end
endmodule