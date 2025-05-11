module one_pulser (input wire clk, input wire clkPB, output reg clk_en);
    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;

    reg [1:0] next_state;
    reg [1:0] state;

    always @(clkPB, state) begin
        case (state)
            A: next_state = clkPB ? B : A;
            B: next_state = C;
            C: next_state = clkPB ? C : A;
            default: next_state = A;
        endcase
    end

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(state) begin
        clk_en <= (state == B);
    end

endmodule
