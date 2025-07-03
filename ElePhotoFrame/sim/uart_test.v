`timescale 10ns/1ns

module uart_test;
    // 波特率相关参数
    parameter CLK_FREQ = 50_000_000;
    parameter BAUD_RATE = 9600;
    parameter BIT_TIME_SIM = (CLK_FREQ*2) / BAUD_RATE;

    reg i_clk_sys;
    reg i_rst_n = 1;       // 改为reg类型
    
    // 50MHz时钟生成 (周期20ns)
    initial begin
        i_clk_sys = 0;
        forever #1 i_clk_sys = ~i_clk_sys; // 每10ns翻转一次，周期为20ns
    end

    // 输入信号声明 - 使用reg类型
    reg [7:0] i_data_tx = 8'b01101010;
    wire i_test_rx;
    reg r_i_test_rx;
    assign i_test_rx = r_i_test_rx;
    wire o_test_rcv_flag;
    wire [7:0] o_test_data;
    
    wire o_test_tx;
    wire i_test_scd_flag;
    reg  r_i_test_scd_flag;
    assign i_test_scd_flag = r_i_test_scd_flag;
    wire [7:0] i_test_scd_data = 8'h5A;
    
    // 实例化被测模块
    top u(
        .i_rst_n(i_rst_n),
        .i_clk_sys(i_clk_sys),

        // RX
        .i_test_rx(i_test_rx),
        .o_test_rcv_flag(o_test_rcv_flag),
        .o_test_data(o_test_data),

        // TX
        // .o_test_tx(o_test_tx),
        // .i_test_scd_flag(i_test_scd_flag),
        // .i_test_scd_data(i_test_scd_data)
    );

    
    
    // 测试数据发送
    initial begin
        /* 给UART_RX发送字节 */
        r_i_test_rx = 1;
        #BIT_TIME_SIM;

        // 起始位低电平
        r_i_test_rx = 0;
        #BIT_TIME_SIM;

        
        r_i_test_rx = i_data_tx[0];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[1];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[2];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[3];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[4];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[5];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[6];
        #BIT_TIME_SIM;
        r_i_test_rx = i_data_tx[7];
        #BIT_TIME_SIM;

        /* 让UART_TX发送字节 */
        // r_i_test_scd_flag = 0;
        // #BIT_TIME_SIM;
        // r_i_test_scd_flag = 1;
        // #2;
        // r_i_test_scd_flag = 0;
    end

    // 仿真时间设置
    initial begin
        #(BIT_TIME_SIM*100);
        $stop;
    end
endmodule