module freq_div_9bit_0(input init, clk, rst,input [8:0] cnt_ext, output reg freq_div_out);
    reg [8:0] counter;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 9'b000000000;
            freq_div_out <= 1'b0;
        end
        else if (init) begin
            counter <= cnt_ext;
            freq_div_out <= 1'b0;
        end else begin
            if (counter == 9'd511) begin
                counter <= cnt_ext;
                freq_div_out <= ~freq_div_out;
            end 
            else begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule

