module seg (
    input [23:0] i_data,   // 修改为24位输入数据
    input i_rst_n,
    input i_clk,
    output reg [7:0] SEG,
    output reg [5:0] DIG
);

reg [2:0] wei;  // 修改为3位以支持3个数码管

reg [23:0] data1;

initial begin
    wei = 0;
    data1 = 0;
    SEG = 0;
    DIG = 0;
end

always@(posedge i_clk or negedge i_rst_n)
begin
    if(!i_rst_n) begin
        wei <= 0;
        data1 <= 0;
        SEG <= 0;
        DIG <= 0;
    end
    else begin
        // 处理第一个数码管的数据 (最低4位)
        case(i_data[3:0])
            4'h0 : data1[7:0]=~8'b11000000;
            4'h1 : data1[7:0]=~8'b11111001;
            4'h2 : data1[7:0]=~8'b10100100;
            4'h3 : data1[7:0]=~8'b10110000;
            4'h4 : data1[7:0]=~8'b10011001;
            4'h5 : data1[7:0]=~8'b10010010;
            4'h6 : data1[7:0]=~8'b10000010;
            4'h7 : data1[7:0]=~8'b11111000;
            4'h8 : data1[7:0]=~8'b10000000;
            4'h9 : data1[7:0]=~8'b10010000;
            4'ha : data1[7:0]=~8'b10001000;
            4'hb : data1[7:0]=~8'b10000011;
            4'hc : data1[7:0]=~8'b11000110;
            4'hd : data1[7:0]=~8'b10100001;
            4'he : data1[7:0]=~8'b10000110;
            4'hf : data1[7:0]=~8'b10001110;
            default : data1[7:0]=~8'b11000000;
        endcase
        
        // 处理第二个数码管的数据 (中间4位)
        case(i_data[7:4])
            4'h0 : data1[15:8]=~8'b11000000;
            4'h1 : data1[15:8]=~8'b11111001;
            4'h2 : data1[15:8]=~8'b10100100;
            4'h3 : data1[15:8]=~8'b10110000;
            4'h4 : data1[15:8]=~8'b10011001;
            4'h5 : data1[15:8]=~8'b10010010;
            4'h6 : data1[15:8]=~8'b10000010;
            4'h7 : data1[15:8]=~8'b11111000;
            4'h8 : data1[15:8]=~8'b10000000;
            4'h9 : data1[15:8]=~8'b10010000;
            4'ha : data1[15:8]=~8'b10001000;
            4'hb : data1[15:8]=~8'b10000011;
            4'hc : data1[15:8]=~8'b11000110;
            4'hd : data1[15:8]=~8'b10100001;
            4'he : data1[15:8]=~8'b10000110;
            4'hf : data1[15:8]=~8'b10001110;
            default : data1[15:8]=~8'b11000000;
        endcase
        
        // 处理第三个数码管的数据 (最高4位)
        case(i_data[11:8])
            4'h0 : data1[23:16]=~8'b11000000;
            4'h1 : data1[23:16]=~8'b11111001;
            4'h2 : data1[23:16]=~8'b10100100;
            4'h3 : data1[23:16]=~8'b10110000;
            4'h4 : data1[23:16]=~8'b10011001;
            4'h5 : data1[23:16]=~8'b10010010;
            4'h6 : data1[23:16]=~8'b10000010;
            4'h7 : data1[23:16]=~8'b11111000;
            4'h8 : data1[23:16]=~8'b10000000;
            4'h9 : data1[23:16]=~8'b10010000;
            4'ha : data1[23:16]=~8'b10001000;
            4'hb : data1[23:16]=~8'b10000011;
            4'hc : data1[23:16]=~8'b11000110;
            4'hd : data1[23:16]=~8'b10100001;
            4'he : data1[23:16]=~8'b10000110;
            4'hf : data1[23:16]=~8'b10001110;
            default : data1[23:16]=~8'b11000000;
        endcase

        // 选择显示哪个数码管
        case(wei)
            3'b000: begin DIG=6'b111110; SEG = data1[7:0]; end      // 最右侧数码管，显示最低4位
            3'b001: begin DIG=6'b111101; SEG = data1[15:8]; end     // 中间数码管，显示中间4位
            3'b010: begin DIG=6'b111011; SEG = data1[23:16]; end    // 最左侧数码管，显示最高4位
            default: begin DIG=6'b111111; wei = 0; end              // 全部关闭，重置位置
        endcase
        
        // 移动到下一个数码管位置
        wei = (wei + 1) % 3;
    end
end

endmodule