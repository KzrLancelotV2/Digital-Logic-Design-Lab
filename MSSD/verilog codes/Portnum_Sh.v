module PortNum_Sh(input clk, rst, SerIn, Sh_en, output reg [1:0] Port_num);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        Port_num <= 2'b00;
    end 
    else if (Sh_en) begin
        Port_num <= {Port_num[0], SerIn};
    end
end
endmodule