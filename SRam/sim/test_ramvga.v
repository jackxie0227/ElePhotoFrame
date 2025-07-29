`timescale 10ns/1ns

module test_ramvga;
    reg i_clk_sys;
    reg i_rst_n;
    initial begin
        i_rst_n   = 1;
        i_clk_sys = 0;
        forever begin
            #1;
            i_clk_sys = ~i_clk_sys;
        end
    end

    /* 变量定义 */
    reg [7:0] state = 8'h01;
    reg rx_valid = 0;
    reg [11:0] rx_data;
    wire        display_valid;
    wire [14:0] pixel_count;
    wire [14:0] spram_addr;
    wire [11:0] spram_wr_data;
    wire        spram_wre;
    wire        spram_wr_req;
    wire        spram_rd_flag;
    wire        spram_rd_sig;
    wire        spram_rd_req;
    wire        image_receiving;
    wire        image_complete;
    wire        image_reading;
    wire [14:0] pix_cnt;
    wire [7:0]  buffer_cnt;
    wire [11:0] pixel_data;
    
    wire [11:0] x_addr;
    wire [11:0] y_addr;
    wire [11:0] x_counter;
    wire [11:0] y_counter;
    // wire VGA_HS;
    // wire VGA_VS;
    wire [11:0] VGA_RGB;

    parameter WIDTH = 50;
    parameter HEIGHT = 40;
    parameter STARTROW = 0;
    parameter STARTCOL = 0;

    /* 模块定义 */
    ram 
    #(
        .W(WIDTH),
        .H(HEIGHT),
        .STARTROW(STARTROW),
        .STARTCOL(STARTCOL)
    ) u_ram(
        .clk(i_clk_sys),
        .state(state),
        .rx_valid(rx_valid),
        .rx_data(rx_data),
        .display_valid(display_valid),
        .x_addr(x_addr),
        .y_addr(y_addr),
        .spram_wr_req(spram_wr_req),
        .spram_rd_req(spram_rd_req),
        .spram_addr(spram_addr),
        .spram_wr_data(spram_wr_data),
        .spram_wre(spram_wre),
        .spram_rd_sig(spram_rd_sig),
        .spram_rd_flag(spram_rd_flag),
        .pix_cnt(pix_cnt),
        .buffer_cnt(buffer_cnt),
        .pixel_data(pixel_data),
        .pixel_count(pixel_count),
        .image_complete(image_complete),
        .image_reading(image_reading),
        .image_receiving(image_receiving)
    );

    vga
    #(
        .W(WIDTH),
        .H(HEIGHT),
        .STARTROW(STARTROW),
        .STARTCOL(STARTCOL)
    ) u_vga(
        .clk(i_clk_sys),
        .state(state),
        .spram_rd_sig(spram_rd_sig),
        .xpos(x_addr),
        .ypos(y_addr),
        .x_counter(x_counter),
        .y_counter(y_counter)
        // .VGA_HS(VGA_HS),
        // .VGA_VS(VGA_VS)
    );

    display
    #(
        .W(WIDTH),
        .H(HEIGHT),
        .STARTROW(STARTROW),
        .STARTCOL(STARTCOL)
    ) u_display(
        .clk(i_clk_sys),
        .xpos(x_addr),
        .ypos(y_addr),
        .state(state),
        .pixel_data(pixel_data),
        .display_valid(display_valid),
        .VGA_RGB(VGA_RGB)
    );

    task rx_byte;
        input [11:0] data;
        begin
            rx_valid <= 1;
            rx_data  <= data;
            #2;
            rx_valid <= 0;
            rx_data  <= 12'h000;
        end
    endtask

    reg [14:0] send_cnt = 0;
    reg        send_flag = 0; // 图像发送标志位 1-开始发送
    always @(posedge i_clk_sys) begin
        if (send_flag) begin
            #2;
            rx_byte($random);
            
            if (send_cnt == WIDTH*HEIGHT - 1) begin
                send_flag = 0;
                send_cnt  = 0;
            end
            else begin
                send_cnt = send_cnt + 1;
            end
        end
    end

    /* 状态2 spram 存储测试 */
    // initial begin
    //     #10;
    //     state = 8'h02;

    //     #3;
    //     send_flag = 1;
    // end

    /* 状态3 vga 显示测试 */
    initial begin
        #10;
        state = 8'h03;
    end

    initial begin
        #5000000;
        $stop;
    end

endmodule