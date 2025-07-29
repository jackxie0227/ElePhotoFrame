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

    reg [7:0] i_test_uart_data;
    reg       i_test_uart_valid;
    wire [7:0] o_test_uart_data;
    wire       o_test_uart_valid;
    top u_top(
        .i_test_uart_data(i_test_uart_data),
        .i_test_uart_valid(i_test_uart_valid),
        .o_test_uart_data(o_test_uart_data),
        .o_test_uart_valid(o_test_uart_valid),

        .i_clk_sys(i_clk_sys),
        .i_rst_n(i_rst_n)
    );

    task send_byte;
        input [7:0] data;
        begin
            i_test_uart_valid <= 1;
            i_test_uart_data  <= data;
            #2;
            i_test_uart_valid <= 0;
            i_test_uart_data  <= 8'h00;
        end
    endtask

    initial begin
        #2;
        send_byte(8'h5a);
        
    end

endmodule