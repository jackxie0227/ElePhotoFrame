module ram(
    input wire clk,                    // 时钟信号
    input wire [7:0] state,            // 当前系统状态
    input wire rx_valid,               // 像素数据有效标志
    input wire [11:0] rx_data,         // 接收到的像素数据(12位RGB444)
    input wire [9:0] x_addr,           // 当前显示的X地址
    input wire [9:0] y_addr,           // 当前显示的Y地址
    output reg [14:0] pix_cnt,         
    output reg [11:0] pixel_data,      // 输出像素数据
    output reg image_complete,         // 图像接收完成标志
    output reg image_receiving         // 正在接收图像标志
);
    parameter W = 50;                  // 图像宽度
    parameter H = 40;                  // 图像高度
    parameter PIX_TOTAL = W * H;       // 总像素数
    
    // 图像存储区
	reg [11:0] img [0:PIX_TOTAL-1];
    
    
    // 像素计数器
    // reg [14:0] pix_cnt;
    
    // 初始化
    initial begin
        pix_cnt = 0;
        image_receiving = 0;
        image_complete = 0;
    end
    
    // 主控制逻辑 - 接收和处理图像数据
    always @(posedge clk) begin
        case(state)
            // 等待状态: 重置所有控制标志
            8'h01: begin
                image_receiving <= 0;        // 不处于接收图像状态
                image_complete <= 0;         // 清除图像完成标志
                pix_cnt <= 0;                // 重置像素计数
            end
            
            // 传输状态: 接收图像数据
            8'h02: begin
                if (!image_receiving && !image_complete) begin
                    // 进入传输状态时，设置标记并重置计数器
                    image_receiving <= 1;    // 标记开始接收图像
                    pix_cnt <= 0;            // 重置像素计数器
                    // image_complete <= 0;     // 清除图像完成标志
                end
                else begin
                    // 正在接收图像数据
                    if (rx_valid) begin
                        if (pix_cnt < PIX_TOTAL) begin
                            // 存储接收到的像素数据
                            img[pix_cnt] <= rx_data;
                            
                            // 更新像素计数
                            pix_cnt <= pix_cnt + 1;
                            
                            // 检查是否接收完成
                            if (pix_cnt == PIX_TOTAL - 1) begin
                                image_complete <= 1;     // 设置图像完成标志
                                image_receiving <= 0;    // 结束接收状态
                            end
                        end
                    end
                end
            end

            8'h03: begin
                image_receiving <= 0;        // 不处于接收图
                image_complete <= 0;         // 清除图像完成
                pix_cnt <= 0;                // 重置像素计数
            end
            
            // 其他状态：保持当前状态
            default: begin
                // 不做任何特殊处理
            end
        endcase
    end
    
    // 读取像素数据供显示模块使用
    always @(posedge clk) begin
        if (state == 8'h03 && x_addr < W && y_addr < H) begin
            // 在状态3（显示状态）下，输出对应位置的像素
            pixel_data <= img[y_addr * W + x_addr];
        end
        else begin
            pixel_data <= 12'h000;  // 黑色
        end
    end

endmodule