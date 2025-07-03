module top(
    // 测试
    // input         i_test_rcv,
    // output        o_test_rcv_flag,
    // output [7:0]  o_test_rcv_data,
    // output [7:0]  o_test_scd_data,
    // output        o_test_scd_flag,
    // output [11:0] o_test_pix_data,
    // output        o_test_pix_valid,
    // output        o_test_receiving,
    // output [7:0]  o_test_state,
    // output [3:0]  o_test_rcv_state,
    // output [14:0] o_test_pix_cnt,

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
    output [7:0] LED,

    // VGA 模块
    output VGA_HS,
    output VGA_VS,
    output [11:0] VGA_RGB
);

/********************** 参数定义 **********************/
// 串口通信参数
localparam CLK_FRE = 50;
localparam DATA_WIDTH = 8;
localparam BAUD_RATE = 9600;
localparam PARITY_ON = 0;

/********************** 内部信号定义 **********************/
// 时钟信号
wire clk_25m;                         // 25MHz时钟
wire clk_100k;                        // 100KHz时钟

// 串口通信信号
wire [DATA_WIDTH-1 : 0] w_tx_data;    // 串口发送数据
wire [DATA_WIDTH-1 : 0] w_rx_data;    // 串口接收数据
wire w_tx_valid;                      // 发送数据有效标志
wire w_rx_done;                       // 接收数据完成标志
wire w_tx;                            // 串口发送信号线
wire w_rx;                            // 串口接收信号线

// 像素数据处理相关信号
wire [11:0] pix_data;                 // 像素数据
wire        pix_valid;                // 像素有效标志
wire [7:0]  check_code;               // 校验码
wire        check_valid;              // 校验有效标志
wire        image_receiving;          // 正在接收图像标志
wire [3:0]  w_rcv_state;              // 当前接收字节状态 （首字节/第二个字节）
wire [14:0] pix_cnt;                  // 当前接收像素数量

// 状态机相关信号
wire [7:0] i_data;                    // 状态机输入数据
wire [7:0] w_state;                   // 当前系统状态 1 2 3
wire [7:0] reply_data;                // 回复数据
wire       reply_valid;               // 回复有效标志

// VGA显示相关信号
wire [9:0] xpos;                      // 显示X坐标
wire [9:0] ypos;                      // 显示Y坐标
wire [11:0] pixel_data;               // 像素显示数据

// 数码管相关信号
wire [7:0] seg_data;                  // 数码管显示数据

/********************** 信号连接和赋值 **********************/
// 测试信号连接
// assign w_rx = i_test_rcv;
// assign o_test_rcv_data = w_rx_data;
// assign o_test_rcv_flag = w_rx_done;
// assign o_test_scd_data = w_tx_data;
// assign o_test_scd_flag = w_tx_valid;
// assign o_test_pix_data = pix_data;
// assign o_test_pix_valid = pix_valid;
// assign o_test_receiving = image_receiving;
// assign o_test_state = w_state;
// assign o_test_rcv_state = w_rcv_state;
// assign o_test_pix_cnt = pix_cnt;

// WIFI串口连接
assign o_wifi_rxd = w_tx;
assign w_rx = i_wifi_txd;

// 状态机输入连接
assign i_data = w_rx_data;

// 数据发送逻辑 防止两个输入冲突
assign w_tx_data = ((image_receiving && w_state==2) ? check_code : reply_data);
assign w_tx_valid = ((image_receiving && w_state==2) ? check_valid : reply_valid);

// 数码管显示内容
assign seg_data = w_state;

/********************** 模块实例化 **********************/
// 时钟分频模块
clkdiv u_clkdiv(
    .clk_50m(i_clk_sys),
    .clk_25m(clk_25m),
    .clk_100k(clk_100k)
);

// 串口发送模块
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

// 串口接收模块
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

// WIFI模块
wifi u_wifi(
    .CNT(o_wifi_cnt),
    .BOOT(o_wifi_boot),
    .RESET(o_wifi_reset)
);

// 像素数据接收模块
rcv u_rcv(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_rx_data(w_rx_data),
    .i_rx_done(w_rx_done),
    .i_state(w_state),
    .image_receiving(image_receiving),
    .o_rcv_state(w_rcv_state),
    .o_pix(pix_data),
    .o_pix_valid(pix_valid),
    .o_check_code(check_code),
    .o_check_valid(check_valid)
);

// 状态机模块
state u_state(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_data(i_data),
    .i_rx_done(w_rx_done),
    .image_receiving(image_receiving),
    .o_state(w_state),
    .o_data(reply_data),
    .o_valid(reply_valid)
);

// VGA控制模块
vga u_vga(
    .clk(i_clk_sys),
    .xpos(xpos),
    .ypos(ypos),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS)
);

// 显示控制模块
display u_display(
    .clk(i_clk_sys),
    .xpos(xpos),
    .ypos(ypos),
    .state(w_state),
    .pixel_data(pixel_data),
    .VGA_RGB(VGA_RGB)
);

// RAM模块
ram u_ram(
    .clk(i_clk_sys),
    .state(w_state),
    .rx_valid(pix_valid),
    .rx_data(pix_data),
    .x_addr(xpos),
    .y_addr(ypos),
    .pix_cnt(pix_cnt),
    .pixel_data(pixel_data),
    .image_complete(image_complete),
    .image_receiving(image_receiving)
);

// 数码管模块
seg u_seg(
    .i_data(seg_data),
    .i_clk(clk_100k),
    .i_rst_n(i_rst_n),
    .SEG(SEG),
    .DIG(DIG)
);

endmodule