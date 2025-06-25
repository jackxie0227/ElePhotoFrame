module top(
    // UART_RX 测试
    // input        i_test_rx,
    // output       o_test_rcv_flag,
    // output [7:0] o_test_data,

    // UART_TX 测试
    // input  [7:0] i_test_scd_data,
    // input        i_test_scd_flag,
    // output       o_test_tx,

    // FPGA 基础参数
    input i_clk_sys,                  
    input i_rst_n,
    
    // WIFI 模块
    input wifi_txd,
    output wifi_rxd,
    output wifi_cnt,
    output wifi_boot,
    output wifi_reset,

    // 数码管模块
    output [7:0] SEG,
    output [5:0] DIG,
    output [7:0] LED,

    // VGA 模块
    output VGA_HS,
    output VGA_VS,
    output wire [11:0] VGA_RGB
);

/********************** 时钟模块 **********************/
// input   clk_50m: 系统 50mhz 时钟信号
// output clk_uart: 串口通信 9600bps(153.6khz) 时钟信号
// output clk_100k: 数码管时钟信号
/*****************************************************/
wire clk_uart; 
wire clk_100k;
clkdiv u_clkdiv(
    .clk_50m(i_clk_sys),
    .clk_uart(clk_uart),
    .clk_100k(clk_100k)
);

/************************* WIFI模块 *************************/
// output   CNT: WIFI模块电源信号 低电平供电             SET->0
// output  BOOT: 程序加载选择信号 高电平时从内部Flash加载 SET->1
// output RESET: 复位信号 低电平复位                     SET->1
/************************************************************/
wifi u_wifi(
    .CNT(wifi_cnt),
    .BOOT(wifi_boot),
    .RESET(wifi_reset)
);

/************************* 串口通信模块 *************************/
// param CLK_FRE    : 系统时钟频率        默认50m
// param DATA_WIDTH : 有效数据位          默认8位
// param BAUD_RATE  : 波特率             默认9600
// param PARITY_ON  : 校验位             默认0 无校验位
/***************************************************************/
// wire  w_tx       : 发送数据线      
// wire  w_rx       : 接收数据线  
// wire  w_tx_data  : 发送数据        
// wire  w_rx_data  : 接收数据        
// wire  w_tx_valid : 发送数据有效标志位  高电平有效
// wire  w_tx_done  : 发送数据有效标志位  高电平有效
/***************************************************************/
localparam CLK_FRE = 50;
localparam DATA_WIDTH = 8;
localparam BAUD_RATE = 9600;
localparam PARITY_ON = 0;
wire [DATA_WIDTH-1 : 0] w_tx_data;
wire [DATA_WIDTH-1 : 0] w_rx_data;
wire w_tx_valid;
wire w_rx_done;
wire w_tx; 
wire w_rx;
uart_tx 
#(
    .CLK_FRE(CLK_FRE),
    .DATA_WIDTH(DATA_WIDTH),
    .PARITY_ON(PARITY_ON),
    .BAUD_RATE(BAUD_RATE)
) u_uart_tx
(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_data_tx(w_tx_data),
    .i_data_valid(w_tx_valid),
    .o_uart_tx(w_tx)
);
uart_rx
#(
    .CLK_FRE(CLK_FRE),
    .DATA_WIDTH(DATA_WIDTH),
    .PARITY_ON(PARITY_ON),
    .BAUD_RATE(BAUD_RATE)
) u_uart_rx
(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_uart_rx(w_rx),
    .o_uart_data(w_rx_data),
    .o_rx_done(w_rx_done)
);

// WIFI 串口连接
assign wifi_rxd = w_tx;
assign wifi_txd = w_rx;

// 测试 UART_RX
// assign w_rx            = i_test_rx;
// assign o_test_rcv_flag = w_rx_done;
// assign o_test_data     = w_rx_data;

// 测试 UART_TX
// assign w_tx_data  = i_test_scd_data;
// assign w_tx_valid = i_test_scd_flag;
// assign o_test_tx  = w_tx;

/************************* 状态机模块 *************************/
/*************************************************************/

endmodule