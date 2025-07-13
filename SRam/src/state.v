/********************************************************************************
 * 模块名称: state
 * 功能描述: 三状态状态机模块，根据接收到的串口数据进行状态切换
 *          STATE_WAIT      (8'h01) - 等待状态，
 *          STATE_TRANSPORT (8'h02) - 传输状态，正在接收图片数据
 *          STATE_DISPLAY   (8'h03) - 显示状态，显示接收到的图片
 * 
 * 状态转换逻辑:
 *   WAIT -> TRANSPORT: 接收到0x5A命令
 *   TRANSPORT -> DISPLAY: 再次接收到0x5A命令  
 *   DISPLAY -> WAIT: 再次接收到0x5A命令
 ********************************************************************************/
module state(
    input   wire         i_clk_sys,        //系统时钟
    input   wire         i_rst_n,          //全局异步复位，低电平有效
    input   wire [7:0]   i_data,           //串口接收到的8位数据
    input   wire         i_rx_done,        //串口数据接收完成标志位
    input   wire         image_receiving,  //接收图像完成标志
    output  reg  [7:0]   o_state,          //当前状态输出(01:等待 02:传输 03:显示)
    output  reg  [7:0]   o_data,           //UART发送数据输出
    output  reg          o_valid           //UART发送数据有效标志位
);  

/************************状态定义************************/
/********************************************************/
localparam STATE_WAIT      = 4'b0001;   //等待状态
localparam STATE_TRANSPORT = 4'b0010;   //传输状态
localparam STATE_DISPLAY   = 4'b0011;   //显示状态

/************************状态机相关寄存器************************/
/***************************************************************/
reg [7:0] i_data_r;         //串口数据寄存器
reg [7:0] curr_state;       //当前状态
reg [7:0] next_state;       //次态
reg [3:0] prev_state;       //前一状态，用于检测状态变化

/************************寄存器初始化************************/
/***********************************************************/
initial begin
    i_data_r = 0;
    curr_state = STATE_WAIT;
    next_state = STATE_WAIT;
    prev_state = STATE_WAIT;
    o_data = 8'h00;
    o_valid = 1'b0;
end

/************************串口数据同步寄存************************/
// i_data 在每个时钟上升沿更新
// 使用 negeedge i_clk_sys 防止 i_data 还未更新
/***************************************************************/
always @(negedge i_clk_sys) begin
    i_data_r <= i_data;
end

/************************状态机当前状态更新************************/
/*****************************************************************/
always @(posedge i_clk_sys or negedge i_rst_n) begin
    if (!i_rst_n) begin
        curr_state <= STATE_WAIT;
        prev_state <= STATE_WAIT;
    end
    else begin
        prev_state <= curr_state;
        curr_state <= next_state;
    end
end

/************************状态机转移逻辑************************/
/*************************************************************/
always @(*) begin
    next_state = STATE_WAIT;    //默认下一状态为等待状态，防止锁存器
    case(curr_state)
        //****************等待状态*****************/
        STATE_WAIT:
            begin
                if (i_data_r == 8'h5A && i_rx_done) begin
                    next_state = STATE_TRANSPORT;
                end
                else begin
                    next_state = STATE_WAIT;
                end  
            end
        
        //****************传输状态*****************/
        STATE_TRANSPORT:
            begin
                // 只有在图像完成接收后，才能响应状态转换命令
                if (i_data_r == 8'h5A && i_rx_done && !image_receiving) begin
                    next_state = STATE_DISPLAY;
                end
                else begin
                    next_state = STATE_TRANSPORT;
                end
            end
        
        //****************显示状态*****************/
        STATE_DISPLAY:
            begin
                if (i_data_r == 8'h5A && i_rx_done) begin
                    next_state = STATE_WAIT;
                end
                else begin
                    next_state = STATE_DISPLAY;
                end    
            end
    endcase
end

/************************状态变化检测与UART发送触发逻辑************************/
/***************************************************************************/
always @(posedge i_clk_sys or negedge i_rst_n) begin
    if (!i_rst_n) begin
        o_data <= 8'h00;
        o_valid <= 1'b0;
    end
    else begin
        if (curr_state != prev_state) begin
            // 状态发生变化，触发UART发送
            o_data <= 8'hA5;  // 发送固定数据A5
            o_valid <= 1'b1;  // 发送有效标志置高
        end
        else begin
            // 状态未变化或已处理完一次变化，重置发送有效标志
            o_valid <= 1'b0;
        end
    end
end

/************************状态机输出逻辑************************/
/*************************************************************/
always @(posedge i_clk_sys or negedge i_rst_n) begin
    if (!i_rst_n)
        begin
            o_state <= 8'h01;          //复位时输出等待状态编码
        end
    else
        case (curr_state)
            //****************等待状态输出*****************/
            // 输出状态编码 8'h01 表示系统处于等待状态
            // 外部可通过此编码判断系统准备接收新的传输命令
            /*********************************************/
            STATE_WAIT: 
                begin
                    o_state <= 8'h01;
                end 
            
            //****************传输状态输出*****************/
            // 输出状态编码 8'h02 表示系统正在传输图片数据
            // 外部可通过此编码判断系统正忙于数据接收
            /*********************************************/
            STATE_TRANSPORT:
                begin
                    o_state <= 8'h02;
                end
            
            //****************显示状态输出*****************/
            // 输出状态编码 8'h03 表示系统正在显示图片
            // 外部可通过此编码判断系统进入显示模式
            /*********************************************/
            STATE_DISPLAY:
                begin
                    o_state <= 8'h03;
                end
            
            //****************默认状态输出*****************/
            // 防止未定义状态的情况，默认输出等待状态编码
            // 提高系统的鲁棒性和可靠性
            /*********************************************/
            default: 
                begin
                    o_state <= 8'h01;
                end
        endcase
end

endmodule