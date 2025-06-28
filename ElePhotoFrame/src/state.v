/********************************************************************************
 * 模块名称: state
 * 功能描述: 三状态状态机模块，根据接收到的串口数据进行状态切换
 *          STATE_WAIT      (8'h01) - 等待状态，等待接收图片传输命令
 *          STATE_TRANSPORT (8'h02) - 传输状态，正在接收图片数据
 *          STATE_DISPLAY   (8'h03) - 显示状态，显示接收到的图片
 * 
 * 状态转换逻辑:
 *   WAIT -> TRANSPORT: 接收到0x5A命令
 *   TRANSPORT -> DISPLAY: 再次接收到0x5A命令  
 *   DISPLAY -> WAIT: 再次接收到0x5A命令
 ********************************************************************************/
module state(
    input   wire         i_clk_sys,     //系统时钟
    input   wire         i_rst_n,       //全局异步复位，低电平有效
    input   wire [7:0]   i_data,        //串口接收到的8位数据
    input   wire         i_rx_done,     //串口数据接收完成标志位
    output  reg  [7:0]   o_state        //当前状态输出(01:等待 02:传输 03:显示)
);

/************************状态定义************************/
// 使用独热码编码方式定义三个工作状态
// STATE_WAIT      - 等待接收图片传输命令的空闲状态
// STATE_TRANSPORT - 正在接收图片数据的传输状态  
// STATE_DISPLAY   - 显示接收完成图片的显示状态
/********************************************************/
localparam STATE_WAIT      = 4'b0001;   //等待状态
localparam STATE_TRANSPORT = 4'b0010;   //传输状态
localparam STATE_DISPLAY   = 4'b0100;   //显示状态

/************************状态机相关寄存器************************/
// i_data_r      - 串口接收数据的寄存器缓存，用于时序对齐
// curr_state    - 当前状态寄存器，保存状态机的当前状态
// next_state    - 下一状态寄存器，保存状态机的目标状态
/***************************************************************/
reg [7:0] i_data_r;         //串口数据寄存器
reg [3:0] curr_state;       //当前状态
reg [3:0] next_state;       //次态

/************************寄存器初始化************************/
// 系统上电时对关键寄存器进行初始化
// - i_data_r    数据寄存器置零
// - curr_state  当前状态设置为等待状态
// - next_state  下一状态设置为等待状态
/***********************************************************/
initial begin
    i_data_r = 0;
    curr_state = STATE_WAIT;
    next_state = STATE_WAIT;
end

/************************串口数据同步寄存************************/
// posedge i_clk_sys    在每个系统时钟上升沿
// - i_data_r <= i_data 将串口数据锁存到寄存器中
// 目的：确保数据与时钟同步，避免组合逻辑的时序问题
/***************************************************************/
always @(posedge i_clk_sys) begin
    i_data_r <= i_data;
end

/************************状态机当前状态更新************************/
// posedge i_clk_sys or negedge i_rst_n  时钟上升沿或复位下降沿
// 复位(!i_rst_n)时:
// - curr_state <= STATE_WAIT  当前状态强制设置为等待状态
// 正常工作时:
// - curr_state <= next_state   当前状态更新为计算出的下一状态
/*****************************************************************/
always @(posedge i_clk_sys or negedge i_rst_n) begin
    if (!i_rst_n)
        curr_state <= STATE_WAIT;
    else
        curr_state <= next_state;
end

/************************状态机转移逻辑************************/
// always @(*) 组合逻辑，任何输入信号变化时立即重新计算
// 
// 状态转移条件说明：
// 1. 必须同时满足两个条件才能状态转移：
//    - i_data_r == 8'h5A  接收到的数据为0x5A命令
//    - i_rx_done          串口数据接收完成标志有效
// 
// 2. 状态转移路径：
//    STATE_WAIT -> STATE_TRANSPORT      接收0x5A开始图片传输
//    STATE_TRANSPORT -> STATE_DISPLAY   接收0x5A完成传输进入显示
//    STATE_DISPLAY -> STATE_WAIT        接收0x5A结束显示回到等待
// 
// 3. 默认保持策略：
//    - next_state = STATE_WAIT 作为默认值防止未定义状态
//    - 不满足转移条件时保持当前状态
/*************************************************************/
always @(*) begin
    next_state = STATE_WAIT;    //默认下一状态为等待状态，防止锁存器
    case(curr_state)
        //****************等待状态*****************/
        // 系统默认工作状态，等待接收图片传输命令
        // 转移条件：接收到0x5A命令且数据接收完成
        // - next_state = STATE_TRANSPORT 进入传输状态
        // 保持条件：未收到有效命令
        // - next_state = STATE_WAIT      保持等待状态
        /******************************************/
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
        // 正在接收图片数据的工作状态
        // 转移条件：接收到0x5A命令且数据接收完成
        // - next_state = STATE_DISPLAY  数据传输完成，进入显示状态
        // 保持条件：传输过程中未收到结束命令
        // - next_state = STATE_TRANSPORT 保持传输状态继续接收
        /******************************************/
        STATE_TRANSPORT:
            begin
                if (i_data_r == 8'h5A && i_rx_done) begin
                    next_state = STATE_DISPLAY;
                end
                else begin
                    next_state = STATE_TRANSPORT;
                end
            end
        
        //****************显示状态*****************/
        // 显示接收完成图片的工作状态
        // 转移条件：接收到0x5A命令且数据接收完成  
        // - next_state = STATE_WAIT     显示结束，返回等待状态
        // 保持条件：显示过程中未收到切换命令
        // - next_state = STATE_DISPLAY  保持显示状态继续显示
        /******************************************/
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

/************************状态机输出逻辑************************/
// posedge i_clk_sys or negedge i_rst_n  时钟上升沿或复位下降沿
// 
// 复位时(!i_rst_n):
// - o_state <= 8'h01  输出状态强制设置为等待状态编码
//
// 正常工作时根据当前状态输出对应的状态编码：
// - STATE_WAIT      输出 8'h01 (十进制1)  - 等待状态
// - STATE_TRANSPORT 输出 8'h02 (十进制2)  - 传输状态  
// - STATE_DISPLAY   输出 8'h03 (十进制3)  - 显示状态
// 
// 目的：为外部模块(如数码管显示、LED指示等)提供当前状态信息
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