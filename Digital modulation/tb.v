module TB();
    reg clk = 0, rst = 0, mode = 0, send = 0, init = 0;
    reg [2:0] cnt = 0;
    reg [4:0] msg = 0;

    wire [7:0] pwm_in;

    top_module uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .send(send),
        .init(init),
        .cnt(cnt),
        .msg(msg),
        .pwm_in(pwm_in)
    );

    always #2 clk = ~clk;

    initial begin
        $monitor("Time=%0t | clk=%b rst=%b init=%b send=%b mode=%b cnt=%b msg=%b | pwm_in=%h",
                  $time, clk, rst, init, send, mode, cnt, msg, pwm_in);
    end

    initial begin
        rst = 1;
        #20;
        rst = 0;


        msg = 5'b11011;     
        cnt = 3'b101;     
        mode = 0;           
        #100;

        init = 1;
        #30;
        init = 0;

        #1000;
        send = 1;


        #10000000;
        $stop;
    end
endmodule
