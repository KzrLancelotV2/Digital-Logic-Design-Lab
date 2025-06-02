module msg_cntr (
    input clk,
    input reset,
    input send,
    input Co2,
    output reg Ld,
    output reg En
);

    parameter A = 1'b0, B = 1'b1;
    reg state, next_state;

    // Next state logic
    always @(*) begin
        case (state)
            A: begin
                if (send)
                    next_state = B;
                else
                    next_state = A;
            end
            B: begin
                if (Co2)
                    next_state = A;
                else
                    next_state = B;
            end
            default: next_state = A;
        endcase
    end

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    // Output logic
    always @(*) begin
        case (state)
            A: begin
                Ld = 1;
                En = 0;
            end
            B: begin
                Ld = 0;
                En = 1;
            end
            default: begin
                Ld = 0;
                En = 0;
            end
        endcase
    end

endmodule
