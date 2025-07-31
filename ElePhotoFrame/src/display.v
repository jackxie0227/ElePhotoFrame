module display
// #(
//     parameter W = 200,
//     parameter H = 150,
//     parameter STARTROW = 0,
//     parameter STARTCOL = 0
// )
(
    input wire [7:0] W,
    input wire [7:0] H,
    input wire [9:0] STARTROW,
    input wire [9:0] STARTCOL,
    input clk,
    input [11:0] xpos,
    input [11:0] ypos,
    input [7:0] state,          // 当前系统状态
    input [11:0] pixel_data,    // 来自RAM的像素数据
    output wire display_valid,   // 1-当前为有效区域
    output reg [11:0] VGA_RGB   // 输出到VGA显示器的RGB数据
); 
    // 显示逻辑
    always @(posedge clk) begin
        if (state == 8'h03 && display_valid) begin
            // 在状态3（显示状态）下有效显示区域内，显示RAM中的像素数据
            VGA_RGB <= pixel_data;
        end 
        else begin
            // 其他状态显示黑色
            VGA_RGB <= 12'h000;  // 黑色
        end
    end

    assign display_valid = xpos >= STARTCOL && xpos < STARTCOL + W && ypos >= STARTROW && ypos < STARTROW + H && state == 8'h03;
endmodule
