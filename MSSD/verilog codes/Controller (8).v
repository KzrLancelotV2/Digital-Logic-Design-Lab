module Controller (
    input wire clk, SerIn, rst, clk_en, Co1, Co2, CoD,
    output reg cnt1, cnt2, cntD,
    output reg Sh_en, Sh_enD, LdcntD,
    output reg SerOut_Valid, done
);

    localparam A = 2'b00;  
    localparam B = 2'b01;  
    localparam C = 2'b10;  
    localparam D = 2'b11;  

    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            A: next_state = (SerIn == 0) ? B : A;
            B: next_state = (Co1) ? C : B;
            C: next_state = (Co2) ? D : C;
            D: next_state = (CoD) ? A : D;
            default: next_state = A;
        endcase
    end


    always @(posedge clk_en or posedge rst) begin
        if (rst)
            state <= A;
        else
            state <= next_state;
    end


    always @(*) begin
        cnt1 = 0;
        cnt2 = 0;
        cntD = 0;
        Sh_en = 0;
        Sh_enD = 0;
        LdcntD = 0;
        SerOut_Valid = 0;
        done = 0;

        case (state)
            B: begin
                cnt1 = 1;
                Sh_en = 1;
            end
            C: begin
                cnt2 = 1;
                Sh_enD = 1;
                if (Co2)
                    LdcntD = 1;
            end
            D: begin
                cntD = 1;
                if (CoD)
                    done = 1;
                else
                    SerOut_Valid = 1;
            end
				default: begin
           
				end
        endcase
    end

endmodule
