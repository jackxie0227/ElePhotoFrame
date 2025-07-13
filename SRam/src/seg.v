/********************************************************************************
 * 模块名称: seg
 * 功能描述: 6位数码管显示控制模块，使用状态机架构
 *           - 支持6个数码管动态扫描显示
 *           - 每个数码管显示一个4位数字(十六进制)
 *           - 使用FSM状态机实现扫描控制
 ********************************************************************************/
module seg (
    input wire [23:0] i_data,    // 输入数据，6个十六进制数字(每个4位)
    input wire i_rst_n,          // 复位信号，低电平有效
    input wire i_clk,            // 时钟信号(建议使用100kHz时钟)
    output reg [7:0] SEG,        // 段选信号
    output reg [5:0] DIG         // 位选信号，低电平有效
);

// 数码管显示状态机状态定义
localparam SCAN_DIG0 = 3'd0;  // 扫描第0位数码管
localparam SCAN_DIG1 = 3'd1;  // 扫描第1位数码管
localparam SCAN_DIG2 = 3'd2;  // 扫描第2位数码管
localparam SCAN_DIG3 = 3'd3;  // 扫描第3位数码管
localparam SCAN_DIG4 = 3'd4;  // 扫描第4位数码管
localparam SCAN_DIG5 = 3'd5;  // 扫描第5位数码管

// 寄存器定义
reg [2:0] current_state;      // 当前状态
reg [2:0] next_state;         // 下一状态
reg [7:0] segment_data;       // 当前数码管段码

// 状态机状态转换 - 时序逻辑
always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n)
        current_state <= SCAN_DIG0;
    else
        current_state <= next_state;
end

// 状态机下一状态逻辑 - 组合逻辑
always @(*) begin
    case (current_state)
        SCAN_DIG0: next_state = SCAN_DIG1;
        SCAN_DIG1: next_state = SCAN_DIG2;
        SCAN_DIG2: next_state = SCAN_DIG3;
        SCAN_DIG3: next_state = SCAN_DIG4;
        SCAN_DIG4: next_state = SCAN_DIG5;
        SCAN_DIG5: next_state = SCAN_DIG0;
        default:   next_state = SCAN_DIG0;
    endcase
end

// 数码管位选输出逻辑 - 时序逻辑
always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        DIG <= 6'b000000;  // 复位时关闭所有数码管
    end else begin
        case (current_state)
            SCAN_DIG0: DIG <= 6'b000001;  // 点亮第0位数码管
            SCAN_DIG1: DIG <= 6'b000010;  // 点亮第1位数码管
            SCAN_DIG2: DIG <= 6'b000100;  // 点亮第2位数码管
            SCAN_DIG3: DIG <= 6'b001000;  // 点亮第3位数码管
            SCAN_DIG4: DIG <= 6'b010000;  // 点亮第4位数码管
            SCAN_DIG5: DIG <= 6'b100000;  // 点亮第5位数码管
            default:   DIG <= 6'b000000;  // 默认关闭所有数码管
        endcase
    end
end

// 数码管段码编码 - 组合逻辑
function [7:0] hex_to_segment;
    input [3:0] hex_digit;
    begin
        case (hex_digit)
            4'h0: hex_to_segment = ~8'b11000000;  // 0
            4'h1: hex_to_segment = ~8'b11111001;  // 1
            4'h2: hex_to_segment = ~8'b10100100;  // 2
            4'h3: hex_to_segment = ~8'b10110000;  // 3
            4'h4: hex_to_segment = ~8'b10011001;  // 4
            4'h5: hex_to_segment = ~8'b10010010;  // 5
            4'h6: hex_to_segment = ~8'b10000010;  // 6
            4'h7: hex_to_segment = ~8'b11111000;  // 7
            4'h8: hex_to_segment = ~8'b10000000;  // 8
            4'h9: hex_to_segment = ~8'b10010000;  // 9
            4'ha: hex_to_segment = ~8'b10001000;  // A
            4'hb: hex_to_segment = ~8'b10000011;  // b
            4'hc: hex_to_segment = ~8'b11000110;  // C
            4'hd: hex_to_segment = ~8'b10100001;  // d
            4'he: hex_to_segment = ~8'b10000110;  // E
            4'hf: hex_to_segment = ~8'b10001110;  // F
            default: hex_to_segment = ~8'b11000000;  // 默认显示0
        endcase
    end
endfunction

// 数码管段选输出逻辑 - 时序逻辑
always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        SEG <= 8'b00000000;  // 复位时关闭所有段
    end else begin
        case (current_state)
            SCAN_DIG0: SEG <= hex_to_segment(i_data[3:0]);     // 显示第0个数字
            SCAN_DIG1: SEG <= hex_to_segment(i_data[7:4]);     // 显示第1个数字
            SCAN_DIG2: SEG <= hex_to_segment(i_data[11:8]);    // 显示第2个数字
            SCAN_DIG3: SEG <= hex_to_segment(i_data[15:12]);   // 显示第3个数字
            SCAN_DIG4: SEG <= hex_to_segment(i_data[19:16]);   // 显示第4个数字
            SCAN_DIG5: SEG <= hex_to_segment(i_data[23:20]);   // 显示第5个数字
            default:   SEG <= 8'b00000000;                    // 默认关闭所有段
        endcase
    end
end

endmodule