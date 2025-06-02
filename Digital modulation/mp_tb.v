`timescale 1ns/1ns

module msg_process_tb;

  // ورودی‌ها
  reg clk, rst, send;
  reg [4:0] msg;

  // خروجی
  wire serOut;

  // نمونه‌سازی DUT (ماژول مورد تست)
  msg_process uut (
    .clk(clk),
    .rst(rst),
    .send(send),
    .msg(msg),
    .serOut(serOut)
  );

  // تولید سیگنال کلاک
  always #5 clk = ~clk;

  initial begin
    // مقداردهی اولیه
    clk = 0;
    rst = 1;
    send = 0;
    msg = 5'b10101;

    // ریست اولیه
    #10 rst = 0;

    // ارسال پیام با فعال کردن send
    #10 send = 1;
    //#10 send = 0;

    // منتظر بمانیم تا فرایند ارسال تمام شود
    #100;


    #100000;

    // پایان شبیه‌سازی
    $finish;
  end

  // مانیتور کردن مقادیر
  initial begin
    $monitor("Time=%0t | rst=%b | send=%b | msg=%b | serOut=%b", 
             $time, rst, send, msg, serOut);
  end

endmodule
