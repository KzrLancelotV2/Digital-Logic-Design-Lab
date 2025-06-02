module shift_reg(
    input clk,
    input rst,
    input Ld,
    input Shift,                
    input [4:0] MSG,             
    output wire SerOut            
);

reg [8:0] ShiftReg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        ShiftReg <= 9'b000000000;
    end
    else if (Ld) begin
        ShiftReg <= {4'b0101, MSG};        
    end
    else if (Shift) begin 
        ShiftReg <= {ShiftReg[7:0], 1'b0}; 
    end
end

	assign SerOut = ShiftReg[8];
endmodule
