`timescale 10ns/1ns

module test;
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
    reg  [7:0] i_test_data;
    wire [7:0] o_test_rcv_data;
    wire       o_test_rcv_done;
    wire [7:0] o_test_scd_data;
    wire       o_test_scd_valid;
    wire [7:0] o_test_state;
    wire       o_test_image_receiving;
    wire [7:0] o_test_curr_state;
    wire [7:0] o_test_prev_state;
    wire [7:0] o_test_next_state;
    top u_top(
        .i_test_rx(i_test_rx),
        .o_test_rcv_data(o_test_rcv_data),
        .o_test_rcv_done(o_test_rcv_done),
        .o_test_scd_data(o_test_scd_data),
        .o_test_scd_valid(o_test_scd_valid),
        .o_test_state(o_test_state),
        .o_test_image_receiving(o_test_image_receiving),
        .o_test_curr_state(o_test_curr_state),
        .o_test_prev_state(o_test_prev_state),
        .o_test_next_state(o_test_next_state),
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

    initial begin
        #BIT_TIME_SIM;
        send_byte(8'h5a);
        
    end

    initial begin
        #(BIT_TIME_SIM*100);
        $stop;
    end

endmodule