module top (
    /* 测试 */
    // input  wire       i_test_rx,
    // output wire       o_test_tx,
    // output wire       o_test_rcv_done,
    // output wire [7:0] o_test_rcv_data,
    // output wire [7:0] o_test_scd_data,
    // output wire       o_test_scd_valid,
    // output wire [7:0] o_test_state,
    // output wire [11:0] o_test_ram_din,
    // output wire        o_test_ram_rdsig,
    // output wire [14:0] o_test_ram_addr,
    // output wire        o_test_ram_wre,
    // output wire [11:0] o_test_xpos,
    // output wire [11:0] o_test_ypos,
    // output wire [14:0] o_test_pixcnt,
    // output wire [7:0]  o_test_pixelcount,
    // output wire [7:0]  o_test_buffercnt,
    // output wire        o_test_ram_rdflag,
    
    // output wire       o_test_image_receiving,
    // output wire       o_test_image_complete,
    // output wire       o_test_image_reading,
    
    // output wire [7:0] o_test_curr_state,
    // output wire [7:0] o_test_next_state,
    // output wire [7:0] o_test_prev_state,

    // output wire       o_test_dispvalid,

    // output wire       o_test_image_ready2accept,
    // output wire [7:0] o_test_width,
    // output wire [7:0] o_test_height,
    // output wire [9:0] o_test_startcol,
    // output wire [9:0] o_test_startrow,

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

/********************** 宏参数定义 **********************/
localparam CLK_FRE = 50;
localparam DATA_WIDTH = 8;
localparam BAUD_RATE = 9600;
localparam PARITY_ON = 0;

localparam SCREEN_WIDTH = 800;
localparam SCREEN_HEIGHT = 600;

/********************** 内部信号参数定义 **********************/
// 图像显示信号 - 初始最大 200*185
wire [7:0] width;
wire [7:0] height;
wire [9:0] startcol;
wire [9:0] startrow;

// 时钟信号
wire clk_5m;                         // 25MHz时钟
wire clk_100k;                        // 100KHz时钟

// 数码管相关信号
wire [23:0] seg_data;                  // 数码管显示数据

// 串口通信信号
wire [DATA_WIDTH-1 : 0] w_tx_data;    // 串口发送数据
wire [DATA_WIDTH-1 : 0] w_rx_data;    // 串口接收数据
wire                    w_tx_valid;   // 发送数据有效标志
wire                    w_rx_done;    // 接收数据完成标志
wire                    w_tx;         // 串口发送信号线
wire                    w_rx;         // 串口接收信号线

// 像素处理信号
wire [11:0] pix_data;
wire        pix_valid;
wire [7:0]  check_code;
wire        check_valid;
wire        image_receiving;
wire        image_complete;
wire        image_reading;
wire        image_ready2accept;
wire [3:0]  w_rcv_state;
wire [15:0] pix_cnt;
wire [7:0]  buffer_cnt;

// SPRAM 接口信号
wire        spram_oce;
wire        spram_ce;
wire        spram_rst;
wire        spram_wre;
wire [15:0] spram_addr;
wire [11:0] spram_din;
wire [11:0] spram_dout;
wire        spram_rd_sig;
wire        spram_rd_flag;

// 状态机控制信号
wire [7:0] i_data;
wire [7:0] w_state;
wire [7:0] reply_data;
wire       reply_valid;

// VGA显示相关信号
wire [11:0] xpos;                      // 显示X坐标
wire [11:0] ypos;                      // 显示Y坐标
wire [11:0] pixel_data;               // 像素显示数据
wire [7:0]  pixel_count;
wire        display_valid;            // 1-当前为有效显示区域


/********************** 信号连接和赋值 **********************/
assign startcol = SCREEN_WIDTH / 2 - width / 2;
assign startrow = SCREEN_HEIGHT / 2 - height / 2;

// WIFI 串口连接
assign o_wifi_rxd = w_tx;
assign w_rx = i_wifi_txd;

// 状态机输入连接
assign i_data = w_rx_data;

assign w_tx_data  = image_receiving ? check_code : reply_data;
assign w_tx_valid = image_receiving ? check_valid: reply_valid;

// 数码管显示内容 24bit
assign seg_data = {w_state, pix_cnt};

// Bypass 模式默认 oce 无效
assign spram_oce = 0;

// 测试状态跳转
// assign o_test_rcv_data = w_rx_data;
// assign o_test_rcv_done = w_rx_done;
// assign w_rx = i_test_rx;
// assign o_test_tx = w_tx;
// assign o_test_scd_data = w_tx_data;
// assign o_test_scd_valid = w_tx_valid;
// assign o_test_state = w_state;

// assign o_test_image_receiving = image_receiving;
// assign o_test_image_complete  = image_complete;
// assign o_test_image_reading   = image_reading;

// assign o_test_ram_din = spram_din;
// assign o_test_ram_addr = spram_addr;
// assign o_test_ram_rdsig = spram_rd_sig;
// assign o_test_ram_wre = spram_wre;

// assign o_test_xpos = xpos;
// assign o_test_ypos = ypos;
// assign o_test_pixcnt = pix_cnt;
// assign o_test_pixelcount = pixel_count;
// assign o_test_buffercnt = buffer_cnt;
// assign o_test_ram_rdflag = spram_rd_flag;

// assign o_test_dispvalid = display_valid;

// assign o_test_image_ready2accept = image_ready2accept;
// assign o_test_width = width;
// assign o_test_height = height;
// assign o_test_startcol = startcol;
// assign o_test_startrow = startrow;

/********************** 模块实例化 **********************/
// 系统时钟模块
clkdiv u_clkdiv(
    .clk_50m(i_clk_sys),
    .clk_5m(clk_5m),
    .clk_100k(clk_100k)
);

// 数码管显示模块
seg u_seg(
    .i_data(seg_data),
    .i_clk(clk_100k),
    .i_rst_n(i_rst_n),
    .SEG(SEG),
    .DIG(DIG)
);

// 串口通信模块
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

// 串口数据接收模块
rcv u_rcv(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_rx_data(w_rx_data),
    .i_rx_done(w_rx_done),
    .i_state(w_state),
    .image_receiving(image_receiving),

    .image_ready2accept(image_ready2accept),
    .o_width(width),
    .o_height(height),
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
    .i_data(w_rx_data),
    .i_rx_done(w_rx_done),
    .image_receiving(image_receiving),
    .curr_state(o_test_curr_state),
    .prev_state(o_test_prev_state),
    .next_state(o_test_next_state),
    .o_state(w_state),
    .o_data(reply_data),
    .o_valid(reply_valid)
);

// VGA控制模块
vga u_vga
(
    .W(width),
    .H(height),
    .STARTROW(startrow),
    .STARTCOL(startcol),

    .clk(i_clk_sys),
    .state(w_state),
    .spram_rd_sig(spram_rd_sig),
    .xpos(xpos),
    .ypos(ypos),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS)
);

// BSRAM模块
spram u_spram(
    .clk(i_clk_sys),
    .oce(spram_oce),
    .ce(spram_ce),
    .reset(spram_rst),
    .wre(spram_wre),
    .ad(spram_addr),
    .din(spram_din),
    .dout(spram_dout)
);

// RAM模块
ram u_ram
(
    .W(width),
    .H(height),
    .STARTROW(startrow),
    .STARTCOL(startcol),

    .clk(i_clk_sys),
    .state(w_state),
    .rx_valid(pix_valid),
    .rx_data(pix_data),
    .display_valid(display_valid),
    .x_addr(xpos),
    .y_addr(ypos),
    .pix_cnt(pix_cnt),
    .pixel_data(pixel_data),
    .pixel_count(pixel_count),
    .buffer_cnt(buffer_cnt),
    .image_ready2accept(image_ready2accept),
    .image_complete(image_complete),
    .image_receiving(image_receiving),
    .image_reading(image_reading),
    .spram_rd_sig(spram_rd_sig),
    .spram_rd_flag(spram_rd_flag),
    .spram_rd_data(spram_dout),
    .spram_addr(spram_addr),
    .spram_wr_data(spram_din),
    .spram_wre(spram_wre),
    .spram_ce(spram_ce)
);

// 显示控制模块
display u_display
(
    .W(width),
    .H(height),
    .STARTCOL(startcol),
    .STARTROW(startrow),

    .clk(i_clk_sys),
    .xpos(xpos),
    .ypos(ypos),
    .state(w_state),
    .pixel_data(pixel_data),
    .VGA_RGB(VGA_RGB),
    .display_valid(display_valid)
);

// WIFI模块
wifi u_wifi(
    .CNT(o_wifi_cnt),
    .BOOT(o_wifi_boot),
    .RESET(o_wifi_reset)
);
endmodule