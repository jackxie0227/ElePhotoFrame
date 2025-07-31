module rcv (
    input                 i_clk_sys,        // 系统时钟
    input                 i_rst_n,          // 全局异步复位
    input [7:0]           i_rx_data,        // 接收到的UART数据
    input                 i_rx_done,        // 接收完成标志
    input [7:0]           i_state,          // 当前状态
    input                 image_receiving,  // 接受图片标志位
    
    output reg            image_ready2accept,   // 是否可以开始接收图片 (图像宽高是否接收)
    output reg [7:0]      o_width,
    output reg [7:0]      o_height,
    // output reg [1:0]      o_whvalid,            // 0-空闲 1-widhtvalid 2-heightvalid
    output reg [3:0]      o_rcv_state,          // 输出当前接收状态 1 / 2
    output reg [11:0]     o_pix,                // 输出像素数据：第一个字节全部8位 + 第二个字节高4位
    output reg            o_pix_valid,          // 像素数据有效标志
    output reg [7:0]      o_check_code,         // 校验码
    output reg            o_check_valid         // 校验码有效标志
);

    // 状态定义
    localparam STATE_WAIT_FIRST  = 2'b01;   // 等待第一个字节
    localparam STATE_WAIT_SECOND = 2'b10;   // 等待第二个字节

    // reg [3:0] r_current_state;              // 当前状态
    reg [7:0] r_first_byte;                 // 存储第一个字节

    reg        wh_rcv_flag;    // 0-width 1-height
    localparam STATE_WAIT_WIDTH  = 0;
    localparam STATE_WAIT_HEIGHT = 1;


    initial begin
        o_rcv_state = STATE_WAIT_FIRST;
        o_pix = 12'd0;
        o_pix_valid = 1'b0;
        o_check_code = 8'd0;
        o_check_valid = 1'b0;
        r_first_byte = 8'd0;
        image_ready2accept = 0;
        wh_rcv_flag = 0;
        o_width = 8'h00;
        o_height = 8'h00;
    end

    always @(posedge i_clk_sys or negedge i_rst_n) begin
        if(!i_rst_n) begin
            o_rcv_state <= STATE_WAIT_FIRST;
            o_pix <= 12'd0;
            o_pix_valid <= 1'b0;
            o_check_code <= 8'd0;
            o_check_valid <= 1'b0;
            r_first_byte <= 8'd0;
        end
        else begin
            // 默认复位输出有效信号，只在输出状态保持一个时钟周期
            o_pix_valid <= 1'b0;
            o_check_valid <= 1'b0;
            
            if (image_receiving) begin // 正在接收图片时
                case(o_rcv_state)
                    // 等待第一个字节状态
                    STATE_WAIT_FIRST: begin
                        if(i_rx_done) begin
                            r_first_byte <= i_rx_data;              // 存储第一个字节
                            o_rcv_state <= STATE_WAIT_SECOND;   // 转到等待第二个字节
                        end
                    end
                    
                    // 等待第二个字节状态
                    STATE_WAIT_SECOND: begin
                        if(i_rx_done) begin
                            // 组合像素数据: 第一个字节全部8位 + 第二个字节高4位
                            o_pix <= {r_first_byte, i_rx_data[7:4]};
                            
                            // 生成校验码: 第一个字节的7,4,3,0位 + 第二个字节的7,4,3,0位
                            o_check_code <= {r_first_byte[7], r_first_byte[4], r_first_byte[3], r_first_byte[0], 
                                            i_rx_data[7], i_rx_data[4], i_rx_data[3], i_rx_data[0]};
                            
                            // 设置输出有效标志
                            o_pix_valid <= 1'b1;
                            o_check_valid <= 1'b1;
                            
                            // 返回等待第一个字节状态，准备下一次接收
                            o_rcv_state <= STATE_WAIT_FIRST;
                        end
                    end
                    
                    default: o_rcv_state <= STATE_WAIT_FIRST;
                endcase
            end
            
        end
    end


    // 接收图像宽高信息
    always @(posedge i_clk_sys) begin
        if (i_state == 8'h01) begin
            image_ready2accept <= 0; // state01 03 默认未准备
            wh_rcv_flag <= 0;
            o_width   <= 200;
            o_height  <= 185;
            // o_whvalid <= 0;
        end
        else if (i_state == 8'h02) begin
            if (!image_ready2accept && i_rx_done) begin // 开始接收 width height
                case (wh_rcv_flag)
                    STATE_WAIT_WIDTH : begin // 接收width
                        o_width <= i_rx_data;
                        wh_rcv_flag <= 1;
                    end

                    STATE_WAIT_HEIGHT: begin // 接收height
                        o_height <= i_rx_data;
                        wh_rcv_flag <= 0;
                        image_ready2accept <= 1; // 已经接收到图像宽高信息，可以接收图像数据
                    end
                endcase
            end
        end
    end
endmodule