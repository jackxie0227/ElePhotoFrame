module display(
    input clk,
    input [9:0] xpos,
    input [9:0] ypos,
    input [7:0] state,          // 当前系统状态
    input [11:0] pixel_data,    // 来自RAM的像素数据
    output reg [11:0] VGA_RGB   // 输出到VGA显示器的RGB数据
); 
    // 显示逻辑
    always @(posedge clk) begin
        if (state == 8'h03) begin
            // 在状态3（显示状态）下，显示RAM中的像素数据
            VGA_RGB <= pixel_data;
        end else begin
            // 其他状态显示黑色
            VGA_RGB <= 12'h000;  // 黑色
        end
    end
endmodule
