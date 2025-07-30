module uart_tx
#(
   parameter CLK_FRE = 50,         //时钟频率，默认时钟频率为50MHz
   parameter DATA_WIDTH = 8,       //有效数据位，缺省为8位
   parameter PARITY_ON = 0,        //校验位，1为有校验位，0为无校验位，缺省为0
   parameter PARITY_TYPE = 0,      //校验类型，1为奇校验，0为偶校验，缺省为偶校验
   parameter BAUD_RATE = 9600      //波特率，缺省为9600
)
(   
    output reg [2:0]            o_state,        // 测试
    output reg                  o_baud_pulse,   // 测试
    output reg [7:0]            o_data_tx,      // 测试

    input                       i_clk_sys,      //系统时钟
    input                       i_rst_n,        //全局异步复位
    input [DATA_WIDTH-1 : 0]    i_data_tx,      //传输数据输入
    input                       i_data_valid,   //传输数据有效
    output reg                  o_uart_tx       //UART输出
);


reg [2:0] r_current_state;  //当前状态
reg [2:0] r_next_state;     //次态
    
localparam STATE_IDLE = 3'b000;         //空闲状态
localparam STATE_START = 3'b001;        //开始状态
localparam STATE_DATA = 3'b011;         //数据发送状态
localparam STATE_PARITY = 3'b100;       //数据校验计算和发送
localparam STATE_END = 3'b101;          //结束状态


localparam CYCLE = CLK_FRE * 1000000 / BAUD_RATE;   // 时钟周期/每bit

reg baud_valid;                         //波特计数有效位
reg [15:0] baud_cnt;                    //波特率计数器 
reg baud_pulse;                         //波特率采样脉冲

reg [3:0]   r_tx_cnt;      //接收数据位计数

initial begin
    baud_valid = 0;
    baud_cnt = 0;
    r_tx_cnt = 0;
    r_current_state = STATE_IDLE;
    o_baud_pulse = 0;
    o_uart_tx = 1;
end

/****************波特率计数器****************/
// baud_cnt 时钟周期数计数器
// baud_cnt == CYCLE - 1 
// - baud_cnt 重置为零 重新开始计数
/*******************************************/
always@(posedge i_clk_sys or negedge i_rst_n)
    begin
        if(!i_rst_n)
            baud_cnt <= 16'h0000;
        else if(!baud_valid)
            baud_cnt <= 16'h0000;

        else if(baud_cnt == CYCLE - 1)
            baud_cnt <= 16'h0000;
        else
            baud_cnt <= baud_cnt + 1'b1;
    end
    
/****************波特采样脉冲****************/
// baud_pulse 在每个波特周期中间产生
/*******************************************/
always@(posedge i_clk_sys or negedge i_rst_n)
    begin
        if(!i_rst_n)
            baud_pulse <= 1'b0;
        else if(baud_cnt == CYCLE/2-1) 
            baud_pulse <= 1'b1; // 在每个波特周期的 1/2 处产生脉冲信号
        else
            baud_pulse <= 1'b0;
//        o_baud_pulse <= baud_pulse; 
    end


/*********************状态机状态更新********************/
// 复位(!i_rst_n) or 波特计数无效(!baud_valid)
// - 当前状态为空闲状态
// 波特计数有效(baud_valid) && 波特周期开始(baud_cnt==0)
// - 当前状态更新至次态 r_current_state <= r_next_state
/******************************************************/
always@(posedge i_clk_sys or negedge i_rst_n)
    begin
        if(!i_rst_n)
            r_current_state <= STATE_IDLE;
        else if(!baud_valid)
            r_current_state <= STATE_IDLE;

        else if(baud_valid && baud_cnt == 16'h0000)
            r_current_state <= r_next_state;
//        o_state <= r_current_state;
    end

/************************状态机次态更新************************/
// 当前状态 r_current_state: 下个状态   r_next_state        
// 空闲状态 STATE_IDLE     : 起始位状态 STATE_START
// 起始位状态 STATE_START  : 数据位状态 STATE_DATA
// 数据位状态 STATE_DATA   : 传输完毕时进入停止位状态 STATE_END(无校验位)
//                        : 传输未完毕保持数据位状态 STATE_DATA
// 停止位状态 STATE_IDLE   : 空闲状态   STATE_IDLE
//? 采用 always@(*) 即时更新次态 确保当前状态更新时次态正确
/*************************************************************/
always@(*)
    begin
        case(r_current_state)
            STATE_IDLE:     r_next_state <= STATE_START;
            STATE_START:    r_next_state <= STATE_DATA;
            STATE_DATA:
                if(r_tx_cnt == DATA_WIDTH)
                    begin
                        if(PARITY_ON == 0)
                            r_next_state <= STATE_END;
                        else
                            r_next_state <= STATE_PARITY;       
                    end
                else
                    begin
                            r_next_state <= STATE_DATA;
                    end
            STATE_PARITY:   r_next_state <= STATE_END;
            STATE_END:      r_next_state <= STATE_IDLE;
            default:;
        endcase
    end
   
   
reg [DATA_WIDTH-1 : 0]      r_data_tx;
reg                         r_parity_check;
always@(posedge i_clk_sys or negedge i_rst_n)
    begin
        if(!i_rst_n) 
            begin
                baud_valid  <= 1'b0;
                r_data_tx   <= 'd0;
                o_uart_tx   <= 1'b1;
                r_tx_cnt    <= 4'd0;
                r_parity_check <= 1'b0;
            end
        else
            
            case(r_current_state)
                //**************空闲状态***************/
                // o_uart_tx    数据输出线路保持高电平
                // r_tx_cnt     数据输出位数保持为零
                // i_data_valid 接收到有效发送数据时
                // - baud_valid 波特计数器有效位高电平
                // - r_data_tx  所存输入字节流发送数据
                /**************************************/
                STATE_IDLE:begin 
                        o_uart_tx   <= 1'b1; 
                        r_tx_cnt    <= 4'd0;
                        r_parity_check <= 4'd0;
                        if(i_data_valid) 
                            begin
                                baud_valid <= 1'b1;     
                                r_data_tx <= i_data_tx; 
                            end
                    end

                //**************起始位状态***************/
                // baud_pulse     波特脉冲时刻有效
                // - o_uart_tx    发送低电平起始位
                /***************************************/
                STATE_START:begin 
                        if(baud_pulse)  
                            o_uart_tx <= 1'b0; 
                    end
                
                //**************数据位状态***************/
                // baud_pulse     波特脉冲时刻有效
                // - r_tx_cnt     发送数据位每个波特周期加一
                // - o_uart_tx    发送最低位数据
                // - r_data_tx    所存数据整体右移一位
                //                加载下一位最低位
                /***************************************/
                STATE_DATA:begin 
                        if(baud_pulse)
                            begin
                                r_tx_cnt <= r_tx_cnt + 1'b1; 
                                o_uart_tx <= r_data_tx[0];  
                                r_parity_check <= r_parity_check + r_data_tx[0];
                                o_data_tx <= r_data_tx;
                                r_data_tx <= {1'b0 ,r_data_tx[DATA_WIDTH-1:1]}; 
                                
                            end
                    end

                //**************校验位状态***************/
                // baud_pulse     波特脉冲时刻有效
                /***************************************/
                STATE_PARITY:begin 
                        if(baud_pulse)
                            begin
                                if(PARITY_TYPE == 1)
                                    o_uart_tx <= r_parity_check;
                                else
                                    o_uart_tx <= r_parity_check + 1'b1;
                            end
                    end

                //**************停止位状态***************/
                // baud_pulse     波特脉冲时刻有效
                // - o_uart_tx    重置输出线路为高电平
                // - baud_valid   波特计数器置为无效状态
                //                停止波特计数
                /***************************************/
                STATE_END:begin 
                        if(baud_pulse)
                            begin
                                o_uart_tx <= 1'b1;  
                                baud_valid <= 1'b0; 
                            end
                    end
                default:;
            endcase
            
    end
endmodule
