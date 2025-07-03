`timescale 10ns/1ns

module uart_rx_test;
    reg i_clk_sys;
    wire i_rst_n = 1;
    reg i_uart_rx;
    wire [7:0] o_uart_data;
    wire o_rx_done;
    wire [2:0] o_state;
    wire o_baud_pulse;
    uart_rx u (
        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n),
        .i_uart_rx(i_uart_rx),
        .o_uart_data(o_uart_data),
        .o_rx_done(o_rx_done),
        .o_state(o_state),
        .o_baud_pulse(o_baud_pulse)
    );

    // 50MHz时钟生成 (周期20ns)
    initial begin
        i_clk_sys = 0;
        forever #1 i_clk_sys = ~i_clk_sys; // 每10ns翻转一次，周期为20ns
    end

    // 字节数据发送
    // 一个仿真步长：10ns
    // 一个时钟周期：1/50_000_000 = 20ns
    // 比特时钟周期：1/9600       
    // 每个比特周期有多少时钟周期：50_000_000/9600
    // 每个比特周期有多少仿真步长：
    parameter CLK_FREQ = 50_000_000;
    parameter BAUD_RATE = 9600;
    parameter BIT_TIME_SIM = (CLK_FREQ*2) / BAUD_RATE;
    wire [7:0] send_data = 8'b01101010; // 8'h6a

    // 发送8位数据
    initial begin
        i_uart_rx = 1;

        #BIT_TIME_SIM;

        // 发送起始位
        i_uart_rx = 0;
        #BIT_TIME_SIM;

        i_uart_rx = send_data[0];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[1];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[2];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[3];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[4];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[5];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[6];
        #BIT_TIME_SIM;
        i_uart_rx = send_data[7];
        #BIT_TIME_SIM;

        // 发送停止位
        i_uart_rx = 1;
        #BIT_TIME_SIM;
    end

    // 仿真时间设置
    initial begin
        #(BIT_TIME_SIM*30);          
        $stop;           // 停止仿真
    end
endmodule