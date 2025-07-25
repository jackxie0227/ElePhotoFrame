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

    wire [9:0] x_addr;
    wire [9:0] y_addr;
    wire VGA_HS;
    wire VGA_VS;
    reg  [7:0] state;
    wire spram_rd_sig;

    vga u_vga(
        .clk(i_clk_sys),
        .state(state),
        .spram_rd_sig(spram_rd_sig),
        .xpos(x_addr),
        .ypos(y_addr),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );

    initial begin
        #5;
        state = 8'h03;
    end

    initial begin
        #2000;
        $stop;
    end
endmodule