//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.11.01 Education (64-bit)
//Part Number: GW1N-LV9LQ144C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Fri Jul 11 20:35:21 2025

module spram (dout, clk, oce, ce, reset, wre, ad, din);

output [11:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [14:0] ad;
input [11:0] din;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire lut_f_4;
wire lut_f_5;
wire lut_f_6;
wire lut_f_7;
wire lut_f_8;
wire lut_f_9;
wire lut_f_10;
wire lut_f_11;
wire lut_f_12;
wire lut_f_13;
wire lut_f_14;
wire [26:0] spx9_inst_0_dout_w;
wire [8:0] spx9_inst_0_dout;
wire [26:0] spx9_inst_1_dout_w;
wire [8:0] spx9_inst_1_dout;
wire [26:0] spx9_inst_2_dout_w;
wire [8:0] spx9_inst_2_dout;
wire [26:0] spx9_inst_3_dout_w;
wire [8:0] spx9_inst_3_dout;
wire [26:0] spx9_inst_4_dout_w;
wire [8:0] spx9_inst_4_dout;
wire [26:0] spx9_inst_5_dout_w;
wire [8:0] spx9_inst_5_dout;
wire [26:0] spx9_inst_6_dout_w;
wire [8:0] spx9_inst_6_dout;
wire [26:0] spx9_inst_7_dout_w;
wire [8:0] spx9_inst_7_dout;
wire [26:0] spx9_inst_8_dout_w;
wire [8:0] spx9_inst_8_dout;
wire [26:0] spx9_inst_9_dout_w;
wire [8:0] spx9_inst_9_dout;
wire [26:0] spx9_inst_10_dout_w;
wire [8:0] spx9_inst_10_dout;
wire [26:0] spx9_inst_11_dout_w;
wire [8:0] spx9_inst_11_dout;
wire [26:0] spx9_inst_12_dout_w;
wire [8:0] spx9_inst_12_dout;
wire [26:0] spx9_inst_13_dout_w;
wire [8:0] spx9_inst_13_dout;
wire [26:0] spx9_inst_14_dout_w;
wire [8:0] spx9_inst_14_dout;
wire [30:0] sp_inst_15_dout_w;
wire [9:9] sp_inst_15_dout;
wire [30:0] sp_inst_16_dout_w;
wire [9:9] sp_inst_16_dout;
wire [30:0] sp_inst_17_dout_w;
wire [10:10] sp_inst_17_dout;
wire [30:0] sp_inst_18_dout_w;
wire [10:10] sp_inst_18_dout;
wire [30:0] sp_inst_19_dout_w;
wire [11:11] sp_inst_19_dout;
wire [30:0] sp_inst_20_dout_w;
wire [11:11] sp_inst_20_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire mux_o_0;
wire mux_o_1;
wire mux_o_2;
wire mux_o_3;
wire mux_o_4;
wire mux_o_5;
wire mux_o_6;
wire mux_o_8;
wire mux_o_9;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_13;
wire mux_o_15;
wire mux_o_16;
wire mux_o_17;
wire mux_o_18;
wire mux_o_19;
wire mux_o_20;
wire mux_o_21;
wire mux_o_23;
wire mux_o_24;
wire mux_o_25;
wire mux_o_26;
wire mux_o_27;
wire mux_o_28;
wire mux_o_30;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_34;
wire mux_o_35;
wire mux_o_36;
wire mux_o_38;
wire mux_o_39;
wire mux_o_40;
wire mux_o_41;
wire mux_o_42;
wire mux_o_43;
wire mux_o_45;
wire mux_o_46;
wire mux_o_47;
wire mux_o_48;
wire mux_o_49;
wire mux_o_50;
wire mux_o_51;
wire mux_o_53;
wire mux_o_54;
wire mux_o_55;
wire mux_o_56;
wire mux_o_57;
wire mux_o_58;
wire mux_o_60;
wire mux_o_61;
wire mux_o_62;
wire mux_o_63;
wire mux_o_64;
wire mux_o_65;
wire mux_o_66;
wire mux_o_68;
wire mux_o_69;
wire mux_o_70;
wire mux_o_71;
wire mux_o_72;
wire mux_o_73;
wire mux_o_75;
wire mux_o_76;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_80;
wire mux_o_81;
wire mux_o_83;
wire mux_o_84;
wire mux_o_85;
wire mux_o_86;
wire mux_o_87;
wire mux_o_88;
wire mux_o_90;
wire mux_o_91;
wire mux_o_92;
wire mux_o_93;
wire mux_o_94;
wire mux_o_95;
wire mux_o_96;
wire mux_o_98;
wire mux_o_99;
wire mux_o_100;
wire mux_o_101;
wire mux_o_102;
wire mux_o_103;
wire mux_o_105;
wire mux_o_106;
wire mux_o_107;
wire mux_o_108;
wire mux_o_109;
wire mux_o_110;
wire mux_o_111;
wire mux_o_113;
wire mux_o_114;
wire mux_o_115;
wire mux_o_116;
wire mux_o_117;
wire mux_o_118;
wire mux_o_120;
wire mux_o_121;
wire mux_o_122;
wire mux_o_123;
wire mux_o_124;
wire mux_o_125;
wire mux_o_126;
wire mux_o_128;
wire mux_o_129;
wire mux_o_130;
wire mux_o_131;
wire mux_o_132;
wire mux_o_133;
wire ce_w;
wire gw_gnd;

assign ce_w = ~wre & ce;
assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_0.INIT = 16'h0001;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_1.INIT = 16'h0002;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_2.INIT = 16'h0004;
LUT4 lut_inst_3 (
  .F(lut_f_3),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_3.INIT = 16'h0008;
LUT4 lut_inst_4 (
  .F(lut_f_4),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_4.INIT = 16'h0010;
LUT4 lut_inst_5 (
  .F(lut_f_5),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_5.INIT = 16'h0020;
LUT4 lut_inst_6 (
  .F(lut_f_6),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_6.INIT = 16'h0040;
LUT4 lut_inst_7 (
  .F(lut_f_7),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_7.INIT = 16'h0080;
LUT4 lut_inst_8 (
  .F(lut_f_8),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_8.INIT = 16'h0100;
LUT4 lut_inst_9 (
  .F(lut_f_9),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_9.INIT = 16'h0200;
LUT4 lut_inst_10 (
  .F(lut_f_10),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_10.INIT = 16'h0400;
LUT4 lut_inst_11 (
  .F(lut_f_11),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_11.INIT = 16'h0800;
LUT4 lut_inst_12 (
  .F(lut_f_12),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_12.INIT = 16'h1000;
LUT4 lut_inst_13 (
  .F(lut_f_13),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_13.INIT = 16'h2000;
LUT4 lut_inst_14 (
  .F(lut_f_14),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14])
);
defparam lut_inst_14.INIT = 16'h4000;
SPX9 spx9_inst_0 (
    .DO({spx9_inst_0_dout_w[26:0],spx9_inst_0_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_0}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_0.READ_MODE = 1'b0;
defparam spx9_inst_0.WRITE_MODE = 2'b00;
defparam spx9_inst_0.BIT_WIDTH = 9;
defparam spx9_inst_0.BLK_SEL = 3'b001;
defparam spx9_inst_0.RESET_MODE = "SYNC";

SPX9 spx9_inst_1 (
    .DO({spx9_inst_1_dout_w[26:0],spx9_inst_1_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_1}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_1.READ_MODE = 1'b0;
defparam spx9_inst_1.WRITE_MODE = 2'b00;
defparam spx9_inst_1.BIT_WIDTH = 9;
defparam spx9_inst_1.BLK_SEL = 3'b001;
defparam spx9_inst_1.RESET_MODE = "SYNC";

SPX9 spx9_inst_2 (
    .DO({spx9_inst_2_dout_w[26:0],spx9_inst_2_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_2}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_2.READ_MODE = 1'b0;
defparam spx9_inst_2.WRITE_MODE = 2'b00;
defparam spx9_inst_2.BIT_WIDTH = 9;
defparam spx9_inst_2.BLK_SEL = 3'b001;
defparam spx9_inst_2.RESET_MODE = "SYNC";

SPX9 spx9_inst_3 (
    .DO({spx9_inst_3_dout_w[26:0],spx9_inst_3_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_3}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_3.READ_MODE = 1'b0;
defparam spx9_inst_3.WRITE_MODE = 2'b00;
defparam spx9_inst_3.BIT_WIDTH = 9;
defparam spx9_inst_3.BLK_SEL = 3'b001;
defparam spx9_inst_3.RESET_MODE = "SYNC";

SPX9 spx9_inst_4 (
    .DO({spx9_inst_4_dout_w[26:0],spx9_inst_4_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_4}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_4.READ_MODE = 1'b0;
defparam spx9_inst_4.WRITE_MODE = 2'b00;
defparam spx9_inst_4.BIT_WIDTH = 9;
defparam spx9_inst_4.BLK_SEL = 3'b001;
defparam spx9_inst_4.RESET_MODE = "SYNC";

SPX9 spx9_inst_5 (
    .DO({spx9_inst_5_dout_w[26:0],spx9_inst_5_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_5}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_5.READ_MODE = 1'b0;
defparam spx9_inst_5.WRITE_MODE = 2'b00;
defparam spx9_inst_5.BIT_WIDTH = 9;
defparam spx9_inst_5.BLK_SEL = 3'b001;
defparam spx9_inst_5.RESET_MODE = "SYNC";

SPX9 spx9_inst_6 (
    .DO({spx9_inst_6_dout_w[26:0],spx9_inst_6_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_6}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_6.READ_MODE = 1'b0;
defparam spx9_inst_6.WRITE_MODE = 2'b00;
defparam spx9_inst_6.BIT_WIDTH = 9;
defparam spx9_inst_6.BLK_SEL = 3'b001;
defparam spx9_inst_6.RESET_MODE = "SYNC";

SPX9 spx9_inst_7 (
    .DO({spx9_inst_7_dout_w[26:0],spx9_inst_7_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_7}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_7.READ_MODE = 1'b0;
defparam spx9_inst_7.WRITE_MODE = 2'b00;
defparam spx9_inst_7.BIT_WIDTH = 9;
defparam spx9_inst_7.BLK_SEL = 3'b001;
defparam spx9_inst_7.RESET_MODE = "SYNC";

SPX9 spx9_inst_8 (
    .DO({spx9_inst_8_dout_w[26:0],spx9_inst_8_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_8}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_8.READ_MODE = 1'b0;
defparam spx9_inst_8.WRITE_MODE = 2'b00;
defparam spx9_inst_8.BIT_WIDTH = 9;
defparam spx9_inst_8.BLK_SEL = 3'b001;
defparam spx9_inst_8.RESET_MODE = "SYNC";

SPX9 spx9_inst_9 (
    .DO({spx9_inst_9_dout_w[26:0],spx9_inst_9_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_9}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_9.READ_MODE = 1'b0;
defparam spx9_inst_9.WRITE_MODE = 2'b00;
defparam spx9_inst_9.BIT_WIDTH = 9;
defparam spx9_inst_9.BLK_SEL = 3'b001;
defparam spx9_inst_9.RESET_MODE = "SYNC";

SPX9 spx9_inst_10 (
    .DO({spx9_inst_10_dout_w[26:0],spx9_inst_10_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_10}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_10.READ_MODE = 1'b0;
defparam spx9_inst_10.WRITE_MODE = 2'b00;
defparam spx9_inst_10.BIT_WIDTH = 9;
defparam spx9_inst_10.BLK_SEL = 3'b001;
defparam spx9_inst_10.RESET_MODE = "SYNC";

SPX9 spx9_inst_11 (
    .DO({spx9_inst_11_dout_w[26:0],spx9_inst_11_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_11}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_11.READ_MODE = 1'b0;
defparam spx9_inst_11.WRITE_MODE = 2'b00;
defparam spx9_inst_11.BIT_WIDTH = 9;
defparam spx9_inst_11.BLK_SEL = 3'b001;
defparam spx9_inst_11.RESET_MODE = "SYNC";

SPX9 spx9_inst_12 (
    .DO({spx9_inst_12_dout_w[26:0],spx9_inst_12_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_12}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_12.READ_MODE = 1'b0;
defparam spx9_inst_12.WRITE_MODE = 2'b00;
defparam spx9_inst_12.BIT_WIDTH = 9;
defparam spx9_inst_12.BLK_SEL = 3'b001;
defparam spx9_inst_12.RESET_MODE = "SYNC";

SPX9 spx9_inst_13 (
    .DO({spx9_inst_13_dout_w[26:0],spx9_inst_13_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_13}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_13.READ_MODE = 1'b0;
defparam spx9_inst_13.WRITE_MODE = 2'b00;
defparam spx9_inst_13.BIT_WIDTH = 9;
defparam spx9_inst_13.BLK_SEL = 3'b001;
defparam spx9_inst_13.RESET_MODE = "SYNC";

SPX9 spx9_inst_14 (
    .DO({spx9_inst_14_dout_w[26:0],spx9_inst_14_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_14}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_14.READ_MODE = 1'b0;
defparam spx9_inst_14.WRITE_MODE = 2'b00;
defparam spx9_inst_14.BIT_WIDTH = 9;
defparam spx9_inst_14.BLK_SEL = 3'b001;
defparam spx9_inst_14.RESET_MODE = "SYNC";

SP sp_inst_15 (
    .DO({sp_inst_15_dout_w[30:0],sp_inst_15_dout[9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9]})
);

defparam sp_inst_15.READ_MODE = 1'b0;
defparam sp_inst_15.WRITE_MODE = 2'b00;
defparam sp_inst_15.BIT_WIDTH = 1;
defparam sp_inst_15.BLK_SEL = 3'b000;
defparam sp_inst_15.RESET_MODE = "SYNC";

SP sp_inst_16 (
    .DO({sp_inst_16_dout_w[30:0],sp_inst_16_dout[9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9]})
);

defparam sp_inst_16.READ_MODE = 1'b0;
defparam sp_inst_16.WRITE_MODE = 2'b00;
defparam sp_inst_16.BIT_WIDTH = 1;
defparam sp_inst_16.BLK_SEL = 3'b001;
defparam sp_inst_16.RESET_MODE = "SYNC";

SP sp_inst_17 (
    .DO({sp_inst_17_dout_w[30:0],sp_inst_17_dout[10]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[10]})
);

defparam sp_inst_17.READ_MODE = 1'b0;
defparam sp_inst_17.WRITE_MODE = 2'b00;
defparam sp_inst_17.BIT_WIDTH = 1;
defparam sp_inst_17.BLK_SEL = 3'b000;
defparam sp_inst_17.RESET_MODE = "SYNC";

SP sp_inst_18 (
    .DO({sp_inst_18_dout_w[30:0],sp_inst_18_dout[10]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[10]})
);

defparam sp_inst_18.READ_MODE = 1'b0;
defparam sp_inst_18.WRITE_MODE = 2'b00;
defparam sp_inst_18.BIT_WIDTH = 1;
defparam sp_inst_18.BLK_SEL = 3'b001;
defparam sp_inst_18.RESET_MODE = "SYNC";

SP sp_inst_19 (
    .DO({sp_inst_19_dout_w[30:0],sp_inst_19_dout[11]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11]})
);

defparam sp_inst_19.READ_MODE = 1'b0;
defparam sp_inst_19.WRITE_MODE = 2'b00;
defparam sp_inst_19.BIT_WIDTH = 1;
defparam sp_inst_19.BLK_SEL = 3'b000;
defparam sp_inst_19.RESET_MODE = "SYNC";

SP sp_inst_20 (
    .DO({sp_inst_20_dout_w[30:0],sp_inst_20_dout[11]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11]})
);

defparam sp_inst_20.READ_MODE = 1'b0;
defparam sp_inst_20.WRITE_MODE = 2'b00;
defparam sp_inst_20.BIT_WIDTH = 1;
defparam sp_inst_20.BLK_SEL = 3'b001;
defparam sp_inst_20.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[14]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ad[13]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ad[12]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(ad[11]),
  .CLK(clk),
  .CE(ce_w)
);
MUX2 mux_inst_0 (
  .O(mux_o_0),
  .I0(spx9_inst_0_dout[0]),
  .I1(spx9_inst_1_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_1 (
  .O(mux_o_1),
  .I0(spx9_inst_2_dout[0]),
  .I1(spx9_inst_3_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_2 (
  .O(mux_o_2),
  .I0(spx9_inst_4_dout[0]),
  .I1(spx9_inst_5_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_3 (
  .O(mux_o_3),
  .I0(spx9_inst_6_dout[0]),
  .I1(spx9_inst_7_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_4 (
  .O(mux_o_4),
  .I0(spx9_inst_8_dout[0]),
  .I1(spx9_inst_9_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_5 (
  .O(mux_o_5),
  .I0(spx9_inst_10_dout[0]),
  .I1(spx9_inst_11_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_6 (
  .O(mux_o_6),
  .I0(spx9_inst_12_dout[0]),
  .I1(spx9_inst_13_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_8 (
  .O(mux_o_8),
  .I0(mux_o_0),
  .I1(mux_o_1),
  .S0(dff_q_2)
);
MUX2 mux_inst_9 (
  .O(mux_o_9),
  .I0(mux_o_2),
  .I1(mux_o_3),
  .S0(dff_q_2)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(mux_o_4),
  .I1(mux_o_5),
  .S0(dff_q_2)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(mux_o_6),
  .I1(spx9_inst_14_dout[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(mux_o_8),
  .I1(mux_o_9),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(mux_o_10),
  .I1(mux_o_11),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(dout[0]),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_0)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(spx9_inst_0_dout[1]),
  .I1(spx9_inst_1_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(spx9_inst_2_dout[1]),
  .I1(spx9_inst_3_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_17 (
  .O(mux_o_17),
  .I0(spx9_inst_4_dout[1]),
  .I1(spx9_inst_5_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(spx9_inst_6_dout[1]),
  .I1(spx9_inst_7_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(spx9_inst_8_dout[1]),
  .I1(spx9_inst_9_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_20 (
  .O(mux_o_20),
  .I0(spx9_inst_10_dout[1]),
  .I1(spx9_inst_11_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(spx9_inst_12_dout[1]),
  .I1(spx9_inst_13_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(mux_o_15),
  .I1(mux_o_16),
  .S0(dff_q_2)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(mux_o_17),
  .I1(mux_o_18),
  .S0(dff_q_2)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(mux_o_19),
  .I1(mux_o_20),
  .S0(dff_q_2)
);
MUX2 mux_inst_26 (
  .O(mux_o_26),
  .I0(mux_o_21),
  .I1(spx9_inst_14_dout[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(mux_o_23),
  .I1(mux_o_24),
  .S0(dff_q_1)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(mux_o_25),
  .I1(mux_o_26),
  .S0(dff_q_1)
);
MUX2 mux_inst_29 (
  .O(dout[1]),
  .I0(mux_o_27),
  .I1(mux_o_28),
  .S0(dff_q_0)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(spx9_inst_0_dout[2]),
  .I1(spx9_inst_1_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(spx9_inst_2_dout[2]),
  .I1(spx9_inst_3_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(spx9_inst_4_dout[2]),
  .I1(spx9_inst_5_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(spx9_inst_6_dout[2]),
  .I1(spx9_inst_7_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(spx9_inst_8_dout[2]),
  .I1(spx9_inst_9_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(spx9_inst_10_dout[2]),
  .I1(spx9_inst_11_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(spx9_inst_12_dout[2]),
  .I1(spx9_inst_13_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_38 (
  .O(mux_o_38),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_32),
  .I1(mux_o_33),
  .S0(dff_q_2)
);
MUX2 mux_inst_40 (
  .O(mux_o_40),
  .I0(mux_o_34),
  .I1(mux_o_35),
  .S0(dff_q_2)
);
MUX2 mux_inst_41 (
  .O(mux_o_41),
  .I0(mux_o_36),
  .I1(spx9_inst_14_dout[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_42 (
  .O(mux_o_42),
  .I0(mux_o_38),
  .I1(mux_o_39),
  .S0(dff_q_1)
);
MUX2 mux_inst_43 (
  .O(mux_o_43),
  .I0(mux_o_40),
  .I1(mux_o_41),
  .S0(dff_q_1)
);
MUX2 mux_inst_44 (
  .O(dout[2]),
  .I0(mux_o_42),
  .I1(mux_o_43),
  .S0(dff_q_0)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(spx9_inst_0_dout[3]),
  .I1(spx9_inst_1_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(spx9_inst_2_dout[3]),
  .I1(spx9_inst_3_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_47 (
  .O(mux_o_47),
  .I0(spx9_inst_4_dout[3]),
  .I1(spx9_inst_5_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_48 (
  .O(mux_o_48),
  .I0(spx9_inst_6_dout[3]),
  .I1(spx9_inst_7_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_49 (
  .O(mux_o_49),
  .I0(spx9_inst_8_dout[3]),
  .I1(spx9_inst_9_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_50 (
  .O(mux_o_50),
  .I0(spx9_inst_10_dout[3]),
  .I1(spx9_inst_11_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_51 (
  .O(mux_o_51),
  .I0(spx9_inst_12_dout[3]),
  .I1(spx9_inst_13_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(mux_o_45),
  .I1(mux_o_46),
  .S0(dff_q_2)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(mux_o_47),
  .I1(mux_o_48),
  .S0(dff_q_2)
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(mux_o_49),
  .I1(mux_o_50),
  .S0(dff_q_2)
);
MUX2 mux_inst_56 (
  .O(mux_o_56),
  .I0(mux_o_51),
  .I1(spx9_inst_14_dout[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(mux_o_53),
  .I1(mux_o_54),
  .S0(dff_q_1)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(mux_o_55),
  .I1(mux_o_56),
  .S0(dff_q_1)
);
MUX2 mux_inst_59 (
  .O(dout[3]),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_0)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(spx9_inst_0_dout[4]),
  .I1(spx9_inst_1_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(spx9_inst_2_dout[4]),
  .I1(spx9_inst_3_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_62 (
  .O(mux_o_62),
  .I0(spx9_inst_4_dout[4]),
  .I1(spx9_inst_5_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(spx9_inst_6_dout[4]),
  .I1(spx9_inst_7_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_64 (
  .O(mux_o_64),
  .I0(spx9_inst_8_dout[4]),
  .I1(spx9_inst_9_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_65 (
  .O(mux_o_65),
  .I0(spx9_inst_10_dout[4]),
  .I1(spx9_inst_11_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_66 (
  .O(mux_o_66),
  .I0(spx9_inst_12_dout[4]),
  .I1(spx9_inst_13_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_68 (
  .O(mux_o_68),
  .I0(mux_o_60),
  .I1(mux_o_61),
  .S0(dff_q_2)
);
MUX2 mux_inst_69 (
  .O(mux_o_69),
  .I0(mux_o_62),
  .I1(mux_o_63),
  .S0(dff_q_2)
);
MUX2 mux_inst_70 (
  .O(mux_o_70),
  .I0(mux_o_64),
  .I1(mux_o_65),
  .S0(dff_q_2)
);
MUX2 mux_inst_71 (
  .O(mux_o_71),
  .I0(mux_o_66),
  .I1(spx9_inst_14_dout[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(mux_o_68),
  .I1(mux_o_69),
  .S0(dff_q_1)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(mux_o_70),
  .I1(mux_o_71),
  .S0(dff_q_1)
);
MUX2 mux_inst_74 (
  .O(dout[4]),
  .I0(mux_o_72),
  .I1(mux_o_73),
  .S0(dff_q_0)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(spx9_inst_0_dout[5]),
  .I1(spx9_inst_1_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_76 (
  .O(mux_o_76),
  .I0(spx9_inst_2_dout[5]),
  .I1(spx9_inst_3_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(spx9_inst_4_dout[5]),
  .I1(spx9_inst_5_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(spx9_inst_6_dout[5]),
  .I1(spx9_inst_7_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(spx9_inst_8_dout[5]),
  .I1(spx9_inst_9_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_80 (
  .O(mux_o_80),
  .I0(spx9_inst_10_dout[5]),
  .I1(spx9_inst_11_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(spx9_inst_12_dout[5]),
  .I1(spx9_inst_13_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_83 (
  .O(mux_o_83),
  .I0(mux_o_75),
  .I1(mux_o_76),
  .S0(dff_q_2)
);
MUX2 mux_inst_84 (
  .O(mux_o_84),
  .I0(mux_o_77),
  .I1(mux_o_78),
  .S0(dff_q_2)
);
MUX2 mux_inst_85 (
  .O(mux_o_85),
  .I0(mux_o_79),
  .I1(mux_o_80),
  .S0(dff_q_2)
);
MUX2 mux_inst_86 (
  .O(mux_o_86),
  .I0(mux_o_81),
  .I1(spx9_inst_14_dout[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_87 (
  .O(mux_o_87),
  .I0(mux_o_83),
  .I1(mux_o_84),
  .S0(dff_q_1)
);
MUX2 mux_inst_88 (
  .O(mux_o_88),
  .I0(mux_o_85),
  .I1(mux_o_86),
  .S0(dff_q_1)
);
MUX2 mux_inst_89 (
  .O(dout[5]),
  .I0(mux_o_87),
  .I1(mux_o_88),
  .S0(dff_q_0)
);
MUX2 mux_inst_90 (
  .O(mux_o_90),
  .I0(spx9_inst_0_dout[6]),
  .I1(spx9_inst_1_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_91 (
  .O(mux_o_91),
  .I0(spx9_inst_2_dout[6]),
  .I1(spx9_inst_3_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_92 (
  .O(mux_o_92),
  .I0(spx9_inst_4_dout[6]),
  .I1(spx9_inst_5_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_93 (
  .O(mux_o_93),
  .I0(spx9_inst_6_dout[6]),
  .I1(spx9_inst_7_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(spx9_inst_8_dout[6]),
  .I1(spx9_inst_9_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(spx9_inst_10_dout[6]),
  .I1(spx9_inst_11_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(spx9_inst_12_dout[6]),
  .I1(spx9_inst_13_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_98 (
  .O(mux_o_98),
  .I0(mux_o_90),
  .I1(mux_o_91),
  .S0(dff_q_2)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(mux_o_92),
  .I1(mux_o_93),
  .S0(dff_q_2)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(mux_o_94),
  .I1(mux_o_95),
  .S0(dff_q_2)
);
MUX2 mux_inst_101 (
  .O(mux_o_101),
  .I0(mux_o_96),
  .I1(spx9_inst_14_dout[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(mux_o_98),
  .I1(mux_o_99),
  .S0(dff_q_1)
);
MUX2 mux_inst_103 (
  .O(mux_o_103),
  .I0(mux_o_100),
  .I1(mux_o_101),
  .S0(dff_q_1)
);
MUX2 mux_inst_104 (
  .O(dout[6]),
  .I0(mux_o_102),
  .I1(mux_o_103),
  .S0(dff_q_0)
);
MUX2 mux_inst_105 (
  .O(mux_o_105),
  .I0(spx9_inst_0_dout[7]),
  .I1(spx9_inst_1_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_106 (
  .O(mux_o_106),
  .I0(spx9_inst_2_dout[7]),
  .I1(spx9_inst_3_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_107 (
  .O(mux_o_107),
  .I0(spx9_inst_4_dout[7]),
  .I1(spx9_inst_5_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_108 (
  .O(mux_o_108),
  .I0(spx9_inst_6_dout[7]),
  .I1(spx9_inst_7_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_109 (
  .O(mux_o_109),
  .I0(spx9_inst_8_dout[7]),
  .I1(spx9_inst_9_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_110 (
  .O(mux_o_110),
  .I0(spx9_inst_10_dout[7]),
  .I1(spx9_inst_11_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_111 (
  .O(mux_o_111),
  .I0(spx9_inst_12_dout[7]),
  .I1(spx9_inst_13_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_113 (
  .O(mux_o_113),
  .I0(mux_o_105),
  .I1(mux_o_106),
  .S0(dff_q_2)
);
MUX2 mux_inst_114 (
  .O(mux_o_114),
  .I0(mux_o_107),
  .I1(mux_o_108),
  .S0(dff_q_2)
);
MUX2 mux_inst_115 (
  .O(mux_o_115),
  .I0(mux_o_109),
  .I1(mux_o_110),
  .S0(dff_q_2)
);
MUX2 mux_inst_116 (
  .O(mux_o_116),
  .I0(mux_o_111),
  .I1(spx9_inst_14_dout[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_117 (
  .O(mux_o_117),
  .I0(mux_o_113),
  .I1(mux_o_114),
  .S0(dff_q_1)
);
MUX2 mux_inst_118 (
  .O(mux_o_118),
  .I0(mux_o_115),
  .I1(mux_o_116),
  .S0(dff_q_1)
);
MUX2 mux_inst_119 (
  .O(dout[7]),
  .I0(mux_o_117),
  .I1(mux_o_118),
  .S0(dff_q_0)
);
MUX2 mux_inst_120 (
  .O(mux_o_120),
  .I0(spx9_inst_0_dout[8]),
  .I1(spx9_inst_1_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_121 (
  .O(mux_o_121),
  .I0(spx9_inst_2_dout[8]),
  .I1(spx9_inst_3_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_122 (
  .O(mux_o_122),
  .I0(spx9_inst_4_dout[8]),
  .I1(spx9_inst_5_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(spx9_inst_6_dout[8]),
  .I1(spx9_inst_7_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_124 (
  .O(mux_o_124),
  .I0(spx9_inst_8_dout[8]),
  .I1(spx9_inst_9_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_125 (
  .O(mux_o_125),
  .I0(spx9_inst_10_dout[8]),
  .I1(spx9_inst_11_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_126 (
  .O(mux_o_126),
  .I0(spx9_inst_12_dout[8]),
  .I1(spx9_inst_13_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_128 (
  .O(mux_o_128),
  .I0(mux_o_120),
  .I1(mux_o_121),
  .S0(dff_q_2)
);
MUX2 mux_inst_129 (
  .O(mux_o_129),
  .I0(mux_o_122),
  .I1(mux_o_123),
  .S0(dff_q_2)
);
MUX2 mux_inst_130 (
  .O(mux_o_130),
  .I0(mux_o_124),
  .I1(mux_o_125),
  .S0(dff_q_2)
);
MUX2 mux_inst_131 (
  .O(mux_o_131),
  .I0(mux_o_126),
  .I1(spx9_inst_14_dout[8]),
  .S0(dff_q_2)
);
MUX2 mux_inst_132 (
  .O(mux_o_132),
  .I0(mux_o_128),
  .I1(mux_o_129),
  .S0(dff_q_1)
);
MUX2 mux_inst_133 (
  .O(mux_o_133),
  .I0(mux_o_130),
  .I1(mux_o_131),
  .S0(dff_q_1)
);
MUX2 mux_inst_134 (
  .O(dout[8]),
  .I0(mux_o_132),
  .I1(mux_o_133),
  .S0(dff_q_0)
);
MUX2 mux_inst_141 (
  .O(dout[9]),
  .I0(sp_inst_15_dout[9]),
  .I1(sp_inst_16_dout[9]),
  .S0(dff_q_0)
);
MUX2 mux_inst_148 (
  .O(dout[10]),
  .I0(sp_inst_17_dout[10]),
  .I1(sp_inst_18_dout[10]),
  .S0(dff_q_0)
);
MUX2 mux_inst_155 (
  .O(dout[11]),
  .I0(sp_inst_19_dout[11]),
  .I1(sp_inst_20_dout[11]),
  .S0(dff_q_0)
);
endmodule //spram
