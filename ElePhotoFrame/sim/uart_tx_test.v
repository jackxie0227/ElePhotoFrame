`timescale 10ns/1ns

module uart_tx_test;
    reg i_clk_sys;
    reg i_rst_n = 1;       // 改为reg类型
    
    // 50MHz时钟生成 (周期20ns)
    initial begin
        i_clk_sys = 0;
        forever #1 i_clk_sys = ~i_clk_sys; // 每10ns翻转一次，周期为20ns
    end

    // 输入信号声明 - 使用reg类型
    reg [7:0] i_data_tx;
    reg i_data_valid;

    // 输出信号声明 - 使用wire类型
    wire o_uart_tx;
    wire [2:0] o_state;
    wire o_baud_pulse;
    wire [7:0] o_data_tx;
    
    // 实例化被测模块
    uart_tx u (
        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n),
        .i_data_tx(i_data_tx),
        .i_data_valid(i_data_valid),
        .o_uart_tx(o_uart_tx),
        .o_state(o_state),
        .o_baud_pulse(o_baud_pulse),
        .o_data_tx(o_data_tx)
    );

    // 波特率相关参数
    parameter CLK_FREQ = 50_000_000;
    parameter BAUD_RATE = 9600;
    parameter BIT_TIME_SIM = (CLK_FREQ*2) / BAUD_RATE;
    
    // 测试数据发送
    initial begin
        // 初始化输入信号
        i_data_tx = 8'b01011010;
        i_data_valid = 0;
        
        // 等待复位完成
        #BIT_TIME_SIM;
        
        // 触发数据发送
        i_data_valid = 1;
        #BIT_TIME_SIM;  // 保持有效一个时钟周期
        i_data_valid = 0;
        
    end

    // 仿真时间设置
    initial begin
        #(BIT_TIME_SIM*100);
        $stop;
    end
endmodule