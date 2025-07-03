module top(
	// 测试
    // input        i_test_rcv,
    // output       o_test_rcv_flag,
    // output [7:0] o_test_rcv_data,
    // output [7:0] o_test_scd_data,
    // output       o_test_scd_flag,
    // output [11:0]o_test_pix_data

    // UART
    input i_uart_rx,
    output o_uart_tx,

    // FPGA 基础参数
    input i_clk_sys,                  
    input i_rst_n,
    
    // WIFI 模块
    input i_wifi_txd,
    output o_wifi_rxd,
    output o_wifi_cnt,
    output o_wifi_boot,
    output o_wifi_reset,

    // 数码管模块
    output [7:0] SEG,
    output [5:0] DIG,
    output [7:0] LED
);

/********************** 时钟模块 **********************/
// input   clk_50m: 系统 50mhz 时钟信号
// output clk_uart: 串口通信 9600bps(153.6khz) 时钟信号
// output clk_100k: 数码管时钟信号
/*****************************************************/
wire clk_25m; 
wire clk_100k;
clkdiv u_clkdiv(
    .clk_50m(i_clk_sys),
    .clk_25m(clk_25m),
    .clk_100k(clk_100k)
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
// assign w_rx = i_test_rcv;
// assign o_test_rcv_data = w_rx_data;
// assign o_test_rcv_flag = w_rx_done;
// assign o_test_scd_data = w_tx_data;
// assign o_test_scd_flag = w_tx_valid;


/********************接收处理模块********************/
/***************************************************/
wire [11:0] w_pix;
wire w_pix_valid;
wire [7:0] w_check_code;
wire w_check_valid;
rcv u_rcv(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_rx_data(w_rx_data),
    .i_rx_done(w_rx_done),
    .o_pix(w_pix),
    .o_pix_valid(w_pix_valid),
    .o_check_code(w_check_code),
    .o_check_valid(w_check_valid)
);
assign w_tx_data = w_check_code;
assign w_tx_valid = w_check_valid;
// assign o_test_pix_data = w_pix;

/************************* WIFI模块 *************************/
// output   CNT: WIFI模块电源信号 低电平供电             SET->0
// output  BOOT: 程序加载选择信号 高电平时从内部Flash加载 SET->1
// output RESET: 复位信号 低电平复位                     SET->1
/************************************************************/
wifi u_wifi(
    .CNT(o_wifi_cnt),
    .BOOT(o_wifi_boot),
    .RESET(o_wifi_reset)
);
// WIFI 串口连接
assign o_wifi_rxd = w_tx;
assign w_rx = i_wifi_txd;


/************************* 数码管模块 *************************/
/*************************************************************/
wire [23:0] seg_data;  // 修改为24位以显示三个数码管

// 将12位的像素数据扩展为24位，分成三个4位的十六进制数显示
assign seg_data = {12'h000, w_pix};  // 高12位填充0，低12位为像素数据

seg u_seg(
    .i_data(seg_data),
    .i_clk(clk_100k),
    .i_rst_n(i_rst_n),
    .SEG(SEG),
    .DIG(DIG)
);

endmodule