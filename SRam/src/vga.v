module vga
#(
    parameter W = 200,
    parameter H = 150,
    parameter STARTROW = 0,
    parameter STARTCOL = 0
)
(
    input  wire        clk,           // 像素时钟输入 (应为40MHz用于800x600@60Hz)
    input  wire [7:0]  state,         // 输入状态 1-初始等待  2-传输&存储图像  3-读取&显示图像
    output reg         spram_rd_sig,  // 读信号 (END开始时产生)
    output wire [11:0]  xpos,          // 当前像素X坐标 (0~799，有效显示区域)
    output wire [11:0]  ypos,          // 当前像素Y坐标 (0~599，有效显示区域)  
    output reg  [11:0] x_counter,
    output reg  [11:0] y_counter,
    output wire        VGA_HS,        // 水平同步信号 (负极性)
    output wire        VGA_VS         // 垂直同步信号 (负极性)
);


localparam H_TOTAL  = 1040;     // 水平总周期 = 120+64+800+56
localparam H_SYNC   = 120;      // 水平同步脉冲宽度
localparam H_BACK   = 64;       // 水平后沿时间  
localparam H_DISP   = 800;      // 水平显示时间
localparam H_FRONT  = 56;       // 水平前沿时间

localparam V_TOTAL  = 660;      // 垂直总周期 = 6+23+600+37  
localparam V_SYNC   = 6;        // 垂直同步脉冲宽度
localparam V_BACK   = 23;       // 垂直后沿时间
localparam V_DISP   = 600;      // 垂直显示时间
localparam V_FRONT  = 37;       // 垂直前沿时间

localparam H_START  = H_SYNC + H_BACK;         // 水平显示区域起始位置 = 184
localparam H_END    = H_START + H_DISP;        // 水平显示区域结束位置 = 984
localparam V_START  = V_SYNC + V_BACK;         // 垂直显示区域起始位置 = 29  
localparam V_END    = V_START + V_DISP;        // 垂直显示区域结束位置 = 629

// reg [11:0] x_counter;           // 水平扫描计数器 (12位，最大值1039)
// reg [11:0] y_counter;           // 垂直扫描计数器 (12位，最大值659)           

initial begin
    // 计数初始化为0
    x_counter = 12'd0;
    y_counter = 12'd0;
    spram_rd_sig = 0;
end

//* 计数器自增
always @(posedge clk) begin
    if (state == 8'h01 || state == 8'h02) begin // 在状态1和状态2时计数器保持为0
        x_counter <= 12'd0;
        y_counter <= 12'd0;
    end
    else if (state == 8'h03) begin
        if (x_counter == H_TOTAL - 1) begin
            x_counter <= 12'd0; // 水平计数器清零，开始新行
            if (y_counter == V_TOTAL - 1) begin
                y_counter <= 12'd0; // 垂直计数器清零，开始新帧
            end
            else begin
                y_counter <= y_counter + 1'b1; // 垂直计数器递增，下一行
            end
        end
        else begin
            x_counter <= x_counter + 1'b1; // 水平计数器递增，下一像素
        end
    end
end

//* 读取信号
always @(posedge clk) begin
    //TODO 完善行读取信号功能 - 自适应起始位置
    if (x_counter == H_START + H_DISP - 1)
        spram_rd_sig <= 1;
    else 
        spram_rd_sig <= 0;
end

assign VGA_HS = ~(x_counter < H_SYNC);     // 水平同步信号（负极性）
assign VGA_VS = ~(y_counter < V_SYNC);     // 垂直同步信号（负极性）

assign xpos = x_counter - H_START;         // X坐标偏移到显示区域
assign ypos = y_counter - V_START;         // Y坐标偏移到显示区域

endmodule
