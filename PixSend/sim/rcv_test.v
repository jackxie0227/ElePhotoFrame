`timescale 10ns/1ns

module rcv_test;
    // 系统
    reg i_clk_sys;
    wire i_rst_n = 1;

    // 串口
    reg i_uart_rx;
    wire o_rx_done;
    wire [7:0] o_rx_data;
    wire o_tx_valid;
    wire [7:0] o_tx_data;

    // 图像
    wire [11:0] o_pix_data;

    top u_top (
        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n),
        .i_test_rcv(i_uart_rx),
        .o_test_rcv_flag(o_rx_done),
        .o_test_rcv_data(o_rx_data),
        .o_test_scd_flag(o_tx_valid),
        .o_test_scd_data(o_tx_data),
        .o_test_pix_data(o_pix_data)
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
    wire [7:0] send_data0 = 8'b01101010; // 8'h6a
    wire [7:0] send_data1 = 8'b10010101;
    // 发送8位数据
    initial begin
        i_uart_rx = 1;

        #BIT_TIME_SIM;

        // 发送data0
        i_uart_rx = 0;
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[0];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[1];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[2];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[3];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[4];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[5];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[6];
        #BIT_TIME_SIM;
        i_uart_rx = send_data0[7];
        #BIT_TIME_SIM;
        i_uart_rx = 1;
        #BIT_TIME_SIM;

        // 发送data1
        i_uart_rx = 0;
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[0];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[1];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[2];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[3];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[4];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[5];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[6];
        #BIT_TIME_SIM;
        i_uart_rx = send_data1[7];
        #BIT_TIME_SIM;
    end

    // 仿真时间设置
    initial begin
        #(BIT_TIME_SIM*30);          
        $stop;           // 停止仿真
    end
endmodule