`timescale 10ns/1ns

module test_vga;
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

    wire [11:0] x_addr;
    wire [11:0] y_addr;
    wire [11:0] x_counter;
    wire [11:0] y_counter;
    wire VGA_HS;
    wire VGA_VS;
    reg  [7:0] state;
    wire spram_rd_sig;

    parameter WIDTH = 5;
    parameter HEIGHT = 4;
    parameter STARTROW = 0;
    parameter STARTCOL = 0;

    vga 
    #(
        .W(WIDTH),
        .H(HEIGHT),
        .STARTROW(STARTROW),
        .STARTCOL(STARTCOL)
    ) u_vga
    (
        .clk(i_clk_sys),
        .state(state),
        .spram_rd_sig(spram_rd_sig),
        .xpos(x_addr),
        .ypos(y_addr),
        .x_counter(x_counter),
        .y_counter(y_counter),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    initial begin
        #5;
        state = 8'h03;
    end

    initial begin
        #50000;
        $stop;
    end
endmodule