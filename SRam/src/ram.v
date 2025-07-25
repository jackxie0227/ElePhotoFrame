module ram (
    input wire clk,
    input wire [7:0] state,

    input wire rx_valid,
    input wire [11:0] rx_data,
    input wire [9:0]  x_addr,
    input wire [9:0]  y_addr,
    output reg [11:0] pixel_data,
    output reg image_complete,       // 图像存储&缓存完成标志位 
    output reg image_receiving,      // 图像正在缓存标志位
    output reg image_preparing,      // 首行缓存标志位

    output reg        spram_wr_req, 
    output reg        spram_rd_req,
    output reg        spram_rd_flag, // 读状态 0-待发送地址 1-待读取
    output reg [14:0] spram_addr,
    output reg [11:0] spram_wr_data,
    input  reg [11:0] spram_rd_data,
    output reg        spram_wre,      // 写使能 1-写入 0-读出
    output reg [14:0] pix_cnt,      // 像素计数 —— 用作地址
    output reg [7:0]  buffer_cnt    // 行缓存计数器
);
    parameter W = 4;
    parameter H = 2;
    parameter PIX_TOTAL = W * H;

    // reg [14:0] pix_cnt;                
    reg [11:0] tmp_spram_wr_data;      // 临时像素数据存储寄存器

    reg [11:0] pix_buffer[0:W-1];      // 行缓存
    // reg [7:0]  buffer_cnt;             // 行缓存计数器


    initial begin
        pix_cnt         = 0;
        image_receiving = 0;
        image_complete  = 0;
        image_preparing = 0;

        spram_wr_req    = 0;

        tmp_spram_wr_data = 12'h000;
        spram_addr        = 14'h0000;
        spram_wr_data     = 12'h000;
        spram_wre         = 0;
        spram_rd_flag     = 0;
        buffer_cnt        = 0;
    end

    // 主控制逻辑 - 接收和处理图像数据
    always @(posedge clk) begin
        case(state)
            // 等待状态: 重置所有控制标志
            8'h01: begin
                image_receiving <= 0;        // 不处于接收图像状态
                image_complete <= 0;         // 清除图像完成标志
                image_preparing <= 0;
                pix_cnt <= 0;                // 重置像素计数
                spram_rd_flag <= 0;
                tmp_spram_wr_data <= 0;      // 临时寄存器清零
                buffer_cnt <= 0;             // 缓存计数器清零
            end
            
            // 传输状态: 接收图像数据
            8'h02: begin
                if (!image_receiving && !image_complete && !image_preparing) begin
                    // 进入传输状态时，设置标记并重置计数器
                    image_receiving <= 1;    // 标记开始接收图像
                    pix_cnt <= 0;            // 重置像素计数器
                    // image_complete <= 0;     // 清除图像完成标志
                end
                else begin
                    if (rx_valid) begin // pix_data pix_valid
                        if (pix_cnt < PIX_TOTAL) begin
                            tmp_spram_wr_data <= rx_data;
                            spram_wr_req      <= 1;
                        end
                    end
                    // if (image_preparing) begin
                    //     spram_rd_req <= 1;   // 进入读取状态
                    //     spram_wr_req <= 0;   // 防止进入读取状态
                    //     pix_cnt <= 0;        // 地址重置为0
                    // end
                end
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

                    // 计数检查 读取完成后修改标志位
                    pix_cnt <= pix_cnt + 1;
                    if (pix_cnt == PIX_TOTAL - 1) begin 
                        image_preparing <= 1; // 进入首行读取状态
                        image_receiving <= 0;
                        pix_cnt <= 0;
                        spram_rd_req <= 1;
                        spram_wr_req <= 0;
                    end
                end
                else if (spram_rd_req) begin
                    spram_wre  <= 1'b0;

                    // 发送地址 spram_rd_flag = 0
                    if (!spram_rd_flag) begin 
                        spram_rd_flag <= 1'b1; 
                        spram_addr <= pix_cnt; 
                        pix_cnt <= pix_cnt + 1;
                    end

                    // 读取数据 spram_rd_flag = 1
                    else begin
                        spram_rd_flag <= 1'b0;
                        pix_buffer[buffer_cnt] <= spram_rd_data;
                        buffer_cnt <= buffer_cnt + 1;

                        if (buffer_cnt == W - 1) begin
                            image_preparing <= 0;
                            image_complete <= 1;
                            spram_rd_req <= 0;
                        end
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