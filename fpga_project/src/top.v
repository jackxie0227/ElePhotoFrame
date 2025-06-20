module top (
    input RX,                // 串口接收信号
    input CLK_50MHZ,         // 50MHz系统时钟
    input RST,               // 系统复位信号
    output reg TX,           // 串口发送信号
    output wifi_cnt,         // WiFi模块控制信号
    output wifi_boot,        // WiFi模块启动控制
    output wifi_reset,       // WiFi模块复位信号
    input wifi_txd,          // WiFi模块串口发送数据
    output wifi_rxd,         // WiFi模块串口接收数据
    output [7:0]SEG,         // 7段数码管段选信号
    output [5:0]DIG,         // 7段数码管位选信号
    output [7:0]LED
);
// nihao
wire clk;          // UART时钟信号 153.6KHz
wire CLK_100KHz;   // 数码管时钟信号 100KHz
clkdiv U1(
    .clk_50m(CLK_50MHZ),
    .clk_out(clk),            
    .CLK_100KHz (CLK_100KHz)  
);

// UART 发送
wire [7:0]data;
wire WS;        
wire tx_r;
always @(posedge clk)
    begin
        TX <= tx_r;
    end
uarttx U3(
    .clk(clk),       // input UART时钟信号 153.6KHz
    .rst_n(RST),     // input 复位信号
    .datain(data),   // input[7:0] 发送数据
    .wrsig(WS),      // input 发送命令 上升沿有效
    .tx(tx_r)        // output 发送数据信号
);

// WIFI控制模块
wifi U4(
    .CNT(wifi_cnt),          
    .BOOT(wifi_boot),
    .wifi_reset(wifi_reset)
);

// WIFI数据转发 —— UART发送的数据直连至WIFI模块的接收引脚
assign wifi_rxd=tx_r;    

// UART接收模块 —— 接收来自WIFI模块的串口数据wifi_txd
wire [7:0]DATA_OUT;
wire WS_0;
wire ReadSignal;
uartrx U5(
    .clock(clk),             // input UART时钟信号 153.6KHz
    .reset_n(RST),           // input 复位信号
    .DATAout(DATA_OUT),      // output[7:0] 接收数据
    .rx(wifi_txd),           // input 接收字节位电平信号
    .ReadSignal(ReadSignal)  // output 接收字节 低电平 —— 正在接收
); 

// 状态机及显示
wire [7:0] current_state;    // 声明为wire类型，接收state模块的输出

state U8(
    .clk(clk),
    .data_in(DATA_OUT),
    .rx_valid(ReadSignal),
    .state(current_state)    // 连接到wire
);

seg U7(
    .data(current_state),
    .clk(CLK_100KHz),
    .SEG(SEG),
    .DIG(DIG)
);

endmodule