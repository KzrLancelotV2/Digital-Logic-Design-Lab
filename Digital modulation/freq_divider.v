module freq_divider (
    input wire clk_in,       
    input wire rst,        
    output wire clk_out      
);
    reg [8:0] counter;      

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 9'b0;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    assign clk_out = counter[8];

endmodule