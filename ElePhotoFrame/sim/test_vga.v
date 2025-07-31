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

    wire [7:0] width = 5;
    wire [7:0] height = 4;
    wire [9:0] startcol = 20;
    wire [9:0] startrow = 20;
    reg  [7:0] state;
    wire       spram_rd_sig;
    wire [11:0] xpos;
    wire [11:0] ypos;
    wire       VGA_HS;
    wire       VGA_VS;
    vga u_vga(
        .W(width),
        .H(height),
        .STARTCOL(startcol),
        .STARTROW(startrow),

        .clk(i_clk_sys),
        .state(state),
        .spram_rd_sig(spram_rd_sig),
        .xpos(xpos),
        .ypos(ypos),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    initial begin
        #3;
        state = 8'h03;
    end


endmodule