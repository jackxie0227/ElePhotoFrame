`timescale 10ns/1ns

module img_test;
// 系统
reg             i_clk_sys;
wire            i_rst_n = 1;

// 测试
reg             i_test_rcv;
wire    [7:0]   o_test_rcv_data;
wire            o_test_rcv_flag;
wire    [7:0]   o_test_scd_data;
wire            o_test_scd_flag;
wire    [11:0]  o_test_pix_data;
wire            o_test_pix_valid;
wire            o_test_receiving;
wire    [7:0]   o_test_state;
wire    [3:0]   o_test_rcv_state;
wire    [14:0]  o_test_pix_cnt;

top u_top(
    .i_clk_sys(i_clk_sys),
    .i_rst_n(i_rst_n),
    .i_test_rcv(i_test_rcv),
    .o_test_rcv_flag(o_test_rcv_flag),
    .o_test_rcv_data(o_test_rcv_data),
    .o_test_scd_flag(o_test_scd_flag),
    .o_test_scd_data(o_test_scd_data),
    .o_test_pix_data(o_test_pix_data),
    .o_test_pix_valid(o_test_pix_valid),
    .o_test_receiving(o_test_receiving),
    .o_test_state(o_test_state),
    .o_test_rcv_state(o_test_rcv_state),
    .o_test_pix_cnt(o_test_pix_cnt)
);

initial begin
    i_clk_sys = 0;
    forever begin
        #1
        i_clk_sys = ~i_clk_sys;
    end
end

parameter CLK_FREQ = 50_000_000;
parameter BAUD_RATE = 9600;
parameter BIT_TIME_SIM = (CLK_FREQ*2) / BAUD_RATE;

// 字节发送函数
task send_byte;
  input [7:0] data;
  input integer bit_time;
  begin
    // 发送起始位(低电平)
    i_test_rcv = 0;
    #bit_time;
    
    // 发送8位数据(从LSB到MSB)
    i_test_rcv = data[0];
    #bit_time;
    i_test_rcv = data[1];
    #bit_time;
    i_test_rcv = data[2];
    #bit_time;
    i_test_rcv = data[3];
    #bit_time;
    i_test_rcv = data[4];
    #bit_time;
    i_test_rcv = data[5];
    #bit_time;
    i_test_rcv = data[6];
    #bit_time;
    i_test_rcv = data[7];
    #bit_time;
    
    // 发送停止位(高电平)
    i_test_rcv = 1;
    #bit_time;
  end
endtask

reg [14:0] cnt = 0;
task send_img;
  input [10:0] max;
  forever begin
    if (cnt < (max - 1)) begin
      send_byte(8'h73, BIT_TIME_SIM);
      send_byte(8'h28, BIT_TIME_SIM);
      cnt <= cnt + 1;
    end
    else
      disable send_img;
  end
endtask

initial begin
    i_test_rcv = 1;
    #BIT_TIME_SIM;

    // 转移至状态2
    send_byte(8'h5A, BIT_TIME_SIM);
    
    send_img(6);

    // 转移至状态3
    send_byte(8'h5A, BIT_TIME_SIM);

    // 开始发送图像数据
    // send_img();
    // send_byte(8'h73, BIT_TIME_SIM);
    // #BIT_TIME_SIM;
    // send_byte(8'h28, BIT_TIME_SIM);

    // 转移至状态3
    // #BIT_TIME_SIM;
    // send_byte(8'h5A, BIT_TIME_SIM);

    #BIT_TIME_SIM;
    $stop;
end
endmodule