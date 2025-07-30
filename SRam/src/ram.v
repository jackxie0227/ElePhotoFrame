module ram 
#(
    parameter W = 50,
    parameter H = 40,
    parameter STARTROW = 0,
    parameter STARTCOL = 0
)
(
    input wire clk,
    input wire [7:0] state,

    input wire rx_valid,
    input wire display_valid,        // 1-当前为显示有效区域
    input wire [11:0] rx_data,
    input wire [9:0]  x_addr,
    input wire [9:0]  y_addr,
    output wire [11:0] pixel_data,   // VGA_RGB
    output wire [14:0] pixel_count,  // 测试计数

    output reg image_complete,       // 图像存储&缓存完成标志位 
    output reg image_receiving,      // 图像正在缓存标志位
    output reg image_reading,        // 图像正在读取 (state=8'h03)

    output reg        spram_wr_req, 
    output reg [14:0] pix_cnt,      // 像素计数 —— 用作地址

    input wire        spram_rd_sig,  // 行读取指令
    output reg        spram_rd_req,
    output reg        spram_rd_flag, // 读状态 0-待发送地址 1-待读取
    output reg [7:0]  spram_rd_row,  // 当前读取行数 0~H
    output reg [7:0]  buffer_cnt,    // 行缓存计数器
    
    input wire [11:0] spram_rd_data,
    output reg [14:0] spram_addr,
    output reg [11:0] spram_wr_data,
    output reg        spram_wre,      // 写使能 1-写入 0-读出
    output reg        spram_ce       // 时钟使能设置 1-有效
);
    parameter PIX_TOTAL = W * H;

    reg [11:0] pix_buffer[0:W-1];     // 行缓存
    reg [11:0] tmp_spram_wr_data;     // 临时单像素缓存

    /* 测试SPRAM */
    // reg 

    // 防止 image_receiving 在下降沿更新
    reg receiving_update_flag = 0;

    initial begin
        pix_cnt         = 0;
        image_receiving = 0;
        image_complete  = 0;
        image_reading   = 0;

        spram_wr_req    = 0;
        tmp_spram_wr_data = 12'h000;
        spram_addr        = 14'h0000;
        spram_wr_data     = 12'h000;
        spram_wre         = 0;
        spram_rd_flag     = 0;
        buffer_cnt        = 0;
        spram_rd_row      = 0; 
    end
    
    always @(negedge clk) begin
        case (state)
            //* 等待状态 
            8'h01: begin
                // 图片标志位清零
                image_receiving <= 0;
                image_complete  <= 0;
                image_reading   <= 0;

                // 读模式寄存器状态标志位清零
                spram_rd_flag   <= 0;
                spram_rd_req    <= 0;
                pix_cnt         <= 0;
                buffer_cnt      <= 0;

                // 写模式寄存器状态标志位清零
                spram_wr_req    <= 0;
                
                // spram 输出重置
                spram_wr_data   <= 0;
                spram_wre       <= 0;
                spram_ce        <= 1; 
                spram_addr      <= 0;
            end

            //* 接收状态
            8'h02: begin
                if (!image_receiving && !image_complete) begin     // 状态2 首次进入
                    receiving_update_flag <= 1;
                    pix_cnt         <= 0;
                end
                else if (image_receiving && !image_complete) begin // 状态2 接收图像中
                    if (rx_valid) begin // 接收到像素数据
                        tmp_spram_wr_data <= rx_data;
                        spram_wr_req      <= 1;
                        spram_wre         <= 1;
                    end
                    else if (spram_wr_req) begin
                        spram_wr_data <= tmp_spram_wr_data;
                        spram_addr    <= pix_cnt;
                        spram_wr_req  <= 0;

                        pix_cnt <= pix_cnt + 1;
                        if (pix_cnt == PIX_TOTAL - 1) begin
                            receiving_update_flag <= 0;
                            image_complete  <= 1;
                            pix_cnt         <= 0;
                        end
                    end
                end
                else if (!image_receiving && image_complete) begin // 状态2 已存储图像
                    // 读取并显示首&末12位BGR数值

                end
            end

            //* 显示状态
            8'h03: begin
                if (spram_rd_sig && !spram_rd_req) begin // 状态3 接收到行读取信号
                    image_reading <= 1;
                    spram_rd_req  <= 1;
                    spram_rd_flag <= 0;
                    buffer_cnt    <= 0;
                    spram_wre     <= 0;
                end
                else if (spram_rd_req) begin
                    if (!spram_rd_flag) begin
                        spram_rd_flag <= 1;
                        spram_addr    <= pix_cnt;
                        pix_cnt       <= pix_cnt + 1;
                    end
                    else begin
                        pix_buffer[buffer_cnt] <= spram_rd_data;
                        buffer_cnt <= buffer_cnt + 1;
                        spram_rd_flag          <= 0;

                        if (buffer_cnt == W - 1) begin
                            image_reading <= 0;
                            spram_rd_req  <= 0;

                            if (pix_cnt == PIX_TOTAL - 1) begin
                                pix_cnt <= 0;
                            end
                        end
                    end
                end
            end
        endcase
    end

    always @(posedge clk) begin
        if (receiving_update_flag)
            image_receiving <= 1;
        else if (!receiving_update_flag)
            image_receiving <= 0;
    end

    assign pixel_count = display_valid ? x_addr - STARTCOL : 0;
    assign pixel_data  = display_valid ? pix_buffer[pixel_count] : 0;
endmodule