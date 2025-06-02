module dds_ctrl (
    input wire clk,
    input wire cout,
    output reg P, 
    output reg S   
);

    localparam A = 2'b00;
    localparam B = 2'b01;
    localparam C = 2'b10;
    localparam D = 2'b11;

    reg [1:0] next_state;
    reg [1:0] state;

    always @(cout, state) begin
        case (state)
            A: next_state = cout ? B : A;
            B: next_state = cout ? C : B;
            C: next_state = cout ? D : C;
            D: next_state = cout ? A : D;
            default: next_state = A;
        endcase
    end

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(state) begin
        case (state) 
            A: begin
                P = 1'b0;
                S = 1'b0;
            end
            B: begin
                P = 1'b1;
                S = 1'b0;
            end
            C: begin
                P = 1'b0;
                S = 1'b1;
            end
            D: begin
                P = 1'b1;
                S = 1'b1;
            end
            default: begin

            end
        endcase
    end

endmodule
