`timescale 10ns/1ns

module test_ram_saveimg;
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
    reg        i_test_rx;
    wire       o_test_tx;
    wire [7:0] o_test_rcv_data;
    wire       o_test_rcv_done;
    wire [7:0] o_test_scd_data;
    wire       o_test_scd_valid;
    wire [7:0] o_test_state;

    wire [11:0] o_test_ram_din;
    wire        o_test_ram_rdsig;
    wire [14:0] o_test_ram_addr;
    wire        o_test_ram_wre;
    wire        o_test_ram_rdflag;

    wire        o_test_image_receiving;
    wire        o_test_image_complete;
    wire        o_test_image_reading;

    wire [11:0] o_test_ypos;
    wire [11:0] o_test_xpos;

    wire [14:0] o_test_pixcnt;
    wire [7:0]  o_test_pixelcount;
    wire [7:0]  o_test_buffercnt;

    wire        o_test_dispvalid;

    top u_top(
        .i_test_rx(i_test_rx),
        .o_test_tx(o_test_tx),
        .o_test_rcv_data(o_test_rcv_data),
        .o_test_rcv_done(o_test_rcv_done),
        .o_test_scd_data(o_test_scd_data),
        .o_test_scd_valid(o_test_scd_valid),
        .o_test_state(o_test_state),
        .o_test_ram_din(o_test_ram_din),
        .o_test_ram_rdsig(o_test_ram_rdsig),
        .o_test_ram_addr(o_test_ram_addr),
        .o_test_ram_wre(o_test_ram_wre),
        .o_test_ram_rdflag(o_test_ram_rdflag),

        .o_test_image_receiving(o_test_image_receiving),
        .o_test_image_complete(o_test_image_complete),
        .o_test_image_reading(o_test_image_reading),

        .o_test_xpos(o_test_xpos),
        .o_test_ypos(o_test_ypos),
        .o_test_pixcnt(o_test_pixcnt),
        .o_test_pixelcount(o_test_pixelcount),
        .o_test_buffercnt(o_test_buffercnt),

        .o_test_dispvalid(o_test_dispvalid),

        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n)
    );

    parameter CLK_FREQ = 50_000_000;
    parameter BAUD_RATE = 9600;
    parameter BIT_TIME_SIM = (CLK_FREQ*2) / BAUD_RATE;
    task send_byte;
        input [7:0] data;
        begin
            // 先保持高电平
            i_test_rx = 1;
            #BIT_TIME_SIM;

            // 起始位低电平
            i_test_rx = 0;
            #BIT_TIME_SIM;

            // 数据位8位
            i_test_rx = data[0];
            #BIT_TIME_SIM;
            i_test_rx = data[1];
            #BIT_TIME_SIM;
            i_test_rx = data[2];
            #BIT_TIME_SIM;
            i_test_rx = data[3];
            #BIT_TIME_SIM;
            i_test_rx = data[4];
            #BIT_TIME_SIM;
            i_test_rx = data[5];
            #BIT_TIME_SIM;
            i_test_rx = data[6];
            #BIT_TIME_SIM;
            i_test_rx = data[7];
            #BIT_TIME_SIM;

            // 回到高电平 防止持续发送
            i_test_rx = 1;

        end
    endtask

    task send_pix;
        input [11:0] data;
        begin
            send_byte({data[11:4]});
            send_byte({data[3:0], 4'b0});
        end
    endtask

    // 小图像模拟
    localparam WIDTH = 100;
    localparam HEIGHT = 80;
    localparam STARTROW = 0;
    localparam STARTCOL = 0;

    reg [14:0] i;

    task send_img;
        input [14:0] pix_total;
        for (i = 0; i < pix_total; i = i + 1) begin
            send_pix($random);
        end
    endtask

    initial begin
        #BIT_TIME_SIM;
        send_byte(8'h5a);
        send_img(WIDTH*HEIGHT);
        send_byte(8'h5a);
    end


endmodule