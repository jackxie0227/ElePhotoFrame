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
    wire [14:0] spram_addr;
    wire [11:0] spram_wr_data;
    wire        spram_wre;
    wire        spram_wr_req;
    wire        spram_rd_flag;
    wire        spram_rd_sig;
    wire        image_receiving;
    wire        image_complete;
    wire        image_reading;
    wire [14:0] pix_cnt;
    wire [7:0]  buffer_cnt;
    
    wire [9:0] x_addr;
    wire [9:0] y_addr;
    wire VGA_HS;
    wire VGA_VS;

    /* 模块定义 */
    ram u_ram(
        .clk(i_clk_sys),
        .state(state),
        .rx_valid(rx_valid),
        .rx_data(rx_data),
        .x_addr(x_addr),
        .y_addr(y_addr),
        .spram_wr_req(spram_wr_req),
        .spram_addr(spram_addr),
        .spram_wr_data(spram_wr_data),
        .spram_wre(spram_wre),
        .spram_rd_sig(spram_rd_sig),
        .spram_rd_flag(spram_rd_flag),
        .pix_cnt(pix_cnt),
        .buffer_cnt(buffer_cnt),
        .image_complete(image_complete),
        .image_reading(image_reading),
        .image_receiving(image_receiving)
    );

    vga u_vga(
        .clk(i_clk_sys),
        .state(state),
        .spram_rd_sig(spram_rd_sig),
        .xpos(x_addr),
        .ypos(y_addr),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    task rx_byte;
        input [11:0] data;
        begin
            rx_valid = 1;
            rx_data  = data;
            #2;
            rx_valid = 0;
            rx_data  = 12'h000;
        end
    endtask

    initial begin
        #10;
        state = 8'h03;
    end

    initial begin
        #2000;
        $stop;
    end

endmodule