module rcv (
    input                 i_clk_sys,     // 系统时钟
    input                 i_rst_n,       // 全局异步复位
    input [7:0]           i_rx_data,     // 接收到的UART数据
    input                 i_rx_done,     // 接收完成标志
    
    output reg [11:0]     o_pix,         // 输出像素数据：第一个字节全部8位 + 第二个字节高4位
    output reg            o_pix_valid,   // 像素数据有效标志
    output reg [7:0]      o_check_code,  // 校验码
    output reg            o_check_valid   // 校验码有效标志
);

    // 状态定义
    localparam STATE_WAIT_FIRST  = 2'b00;   // 等待第一个字节
    localparam STATE_WAIT_SECOND = 2'b01;   // 等待第二个字节
    localparam STATE_OUTPUT      = 2'b10;   // 输出数据

    reg [1:0] r_current_state;              // 当前状态
    reg [7:0] r_first_byte;                 // 存储第一个字节

    initial begin
        r_current_state = STATE_WAIT_FIRST;
        o_pix = 12'd0;
        o_pix_valid = 1'b0;
        o_check_code = 8'd0;
        o_check_valid = 1'b0;
        r_first_byte = 8'd0;
    end

    always @(posedge i_clk_sys or negedge i_rst_n) begin
        if(!i_rst_n) begin
            r_current_state <= STATE_WAIT_FIRST;
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
            
            case(r_current_state)
                // 等待第一个字节状态
                STATE_WAIT_FIRST: begin
                    if(i_rx_done) begin
                        r_first_byte <= i_rx_data;              // 存储第一个字节
                        r_current_state <= STATE_WAIT_SECOND;   // 转到等待第二个字节
                    end
                end
                
                // 等待第二个字节状态
                STATE_WAIT_SECOND: begin
                    if(i_rx_done) begin
                        // 组合像素数据: 第一个字节全部8位 + 第二个字节高4位
                        o_pix <= {r_first_byte, i_rx_data[7:4]};
                        
                        // 生成校验码: 第一个字节的7,4,3,1位 + 第二个字节的7,4,3,1位
                        o_check_code <= {r_first_byte[7], r_first_byte[4], r_first_byte[3], r_first_byte[0], 
                                         i_rx_data[7], i_rx_data[4], i_rx_data[3], i_rx_data[0]};
                        
                        // 设置输出有效标志
                        o_pix_valid <= 1'b1;
                        o_check_valid <= 1'b1;
                        
                        // 返回等待第一个字节状态，准备下一次接收
                        r_current_state <= STATE_WAIT_FIRST;
                    end
                end
                
                default: r_current_state <= STATE_WAIT_FIRST;
            endcase
        end
    end

endmodule