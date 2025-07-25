`timescale 10ns/1ns

module test_ram;
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

    reg [7:0] state = 8'h01;
    reg rx_valid = 0;
    reg [11:0] rx_data;
    wire [14:0] spram_addr;
    wire [11:0] spram_wr_data;
    wire        spram_wre;
    wire        spram_wr_req;
    wire        spram_rd_flag;
    wire        image_receiving;
    wire        image_preparing;
    wire        image_complete;
    wire [14:0] pix_cnt;
    wire [7:0]  buffer_cnt;
    ram u_ram(
        .clk(i_clk_sys),
        .state(state),
        .rx_valid(rx_valid),
        .rx_data(rx_data),
        .spram_wr_req(spram_wr_req),
        .spram_addr(spram_addr),
        .spram_wr_data(spram_wr_data),
        .spram_wre(spram_wre),
        .spram_rd_flag(spram_rd_flag),
        .pix_cnt(pix_cnt),
        .buffer_cnt(buffer_cnt),
        .image_complete(image_complete),
        .image_preparing(image_preparing),
        .image_receiving(image_receiving)
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

    //* 上升沿clk触发
    initial begin
        #5;
        state = 8'h02;
        #2;
        rx_byte(12'h375);
        #2;
        rx_byte(12'h535);
        #2;
        rx_byte(12'h299);
        #2;
        rx_byte(12'h315);
        #2;
        rx_byte(12'h395);
        #2;
        rx_byte(12'h635);
        #2;
        rx_byte(12'h725);
        #2;
        rx_byte(12'h645);
    end



    initial begin
        #200;
        $stop;
    end
    
endmodule