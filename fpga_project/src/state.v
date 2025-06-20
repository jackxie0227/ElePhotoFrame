module state(
    input clk,                   // UART时钟信号 153.6KHz
    input [7:0] data_in,         // UART字节数据
    input rx_valid,              // 接收数据有效-低电平有效
    output reg [7:0] state             // 状态数  0 - 等待图片 & 显示图片   1 - 图片传输   
);

// 检测字节传输结束信号 UART的ReadSignal 0 => 1
reg rx_valid_prev;
wire rx_valid_rise;
always @(posedge clk) begin
    rx_valid_prev <= rx_valid;
end
assign rx_valid_rise = (~rx_valid_prev) & rx_valid;

// 状态机更新逻辑
reg [7:0] current_state = 8'h00; // 初始为状态0
localparam STATE_0 = 0;    // 状态0 - 等待图片传输 & 图片显示
localparam STATE_1 = 1;    // 状态1 - 传输图片

// 状态转换逻辑
always @(*) begin
    if (rx_valid_rise) begin
        case (current_state)
            STATE_0: begin
                if (data_in == 8'h5A) begin
                    current_state = STATE_1;
                end
            end
            STATE_1: begin
                if (data_in == 8'hA5) begin
                    current_state = STATE_0;
                end
            end
        endcase
    end
    state <= current_state; // 输出当前状态
end


endmodule