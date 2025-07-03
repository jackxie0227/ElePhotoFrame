`timescale 10ns/1ns

module state_test;
    reg i_clk_sys = 1;
    wire i_rst_n = 1;
    initial begin
        i_clk_sys = 0;
        forever #1 i_clk_sys = ~i_clk_sys; // 每10ns翻转一次，周期为20ns
    end

    wire [7:0] i_data = 8'h5A;
    reg i_rx_done = 0;
    wire [7:0] o_state;
    state u_state(
        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n),
        .i_data(i_data),
        .i_rx_done(i_rx_done),
        .o_state(o_state)
    );

    initial begin
        #3
        i_rx_done = 1;  
        #2
        i_rx_done = 0;      
    end

endmodule