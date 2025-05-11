module Demux (
    input wire SerIn,
    input wire [1:0] Port_num,
    output reg [3:0] P
);
    always @(Port_num, SerIn) begin
        P = 4'b0000;

        case (Port_num)
            2'b00: P[0] = SerIn;
            2'b01: P[1] = SerIn;
            2'b10: P[2] = SerIn;
            2'b11: P[3] = SerIn;
            default: P = 4'b0000;
        endcase
    end
endmodule



