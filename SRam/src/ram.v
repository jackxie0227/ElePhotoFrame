module ram (
    input wire clk,
    input wire [7:0] state,

    input wire rx_valid,
    input wire [11:0] rx_data,
    input wire [9:0]  x_addr,
    input wire [9:0]  y_addr,
    output reg [11:0] pixel_data,
    output reg image_complete,
    output reg image_receiving,

    // input wire [11:0] spram_rd_data,
    output reg        spram_wr_req,
    output reg [14:0] spram_addr,
    output reg [11:0] spram_wr_data,
    output reg        spram_wre      // 写使能 1-写入 0-读出
);
    parameter W = 50;
    parameter H = 40;
    parameter PIX_TOTAL = W * H;
    reg [14:0] pix_cnt;
    // reg spram_wr_req;
    reg [11:0] tmp_spram_wr_data;  // 临时像素数据存储寄存器

    initial begin
        pix_cnt         = 0;
        image_receiving = 0;
        image_complete  = 0;

        spram_wr_req    = 0;

        tmp_spram_wr_data = 12'h000;
        spram_addr        = 14'h0000;
        spram_wr_data     = 12'h000;
        spram_wre         = 0;
    end

    // 主控制逻辑 - 接收和处理图像数据
    always @(posedge clk) begin
        case(state)
            // 等待状态: 重置所有控制标志
            8'h01: begin
                image_receiving <= 0;        // 不处于接收图像状态
                image_complete <= 0;         // 清除图像完成标志
                pix_cnt <= 0;                // 重置像素计数

                tmp_spram_wr_data <= 0;      // 临时寄存器清零
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
                    if (rx_valid) begin //! 接收到串口像素数据
                        if (pix_cnt < PIX_TOTAL) begin
                            // 存储接收到的像素数据
                            // img[pix_cnt] <= rx_data;
                            tmp_spram_wr_data <= rx_data;
                            spram_wr_req      <= 1;
                            
                            // // 更新像素计数
                            // pix_cnt <= pix_cnt + 1;
                            
                            // // 检查是否接收完成
                            // if (pix_cnt == PIX_TOTAL - 1) begin
                            //     image_complete <= 1;     // 设置图像完成标志
                            //     image_receiving <= 0;    // 结束接收状态
                            // end
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

    always @(negedge clk) begin
        case (state)
            8'h02: begin
                if (spram_wr_req) begin //! 写入 BSRAM
                    spram_wre     <= 1'b1;
                    spram_wr_data <= tmp_spram_wr_data;
                    spram_addr    <= pix_cnt; // 地址直接等于 pix_cnt
                    spram_wr_req  <= 1'b0;

                    // 计数检查
                    pix_cnt <= pix_cnt + 1;
                    if (pix_cnt == PIX_TOTAL - 1) begin
                        image_complete <= 1;
                        image_receiving <= 0;
                    end
                end
            end
            8'h03: begin
                if (x_addr < W && y_addr < H) begin //! 读取 BSRAM
                    //TODO 完善读取逻辑 
                end
            end
            default: begin
                spram_wre <= 1'b0;
            end
        endcase
    end

endmodule