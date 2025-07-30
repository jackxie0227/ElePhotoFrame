//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.11.03 Education
//Part Number: GW1N-LV9LQ144C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Wed Jul 30 20:17:11 2025

module spram (dout, clk, oce, ce, reset, wre, ad, din);

output [11:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [15:0] ad;
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
wire lut_f_15;
wire lut_f_16;
wire lut_f_17;
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
wire [26:0] spx9_inst_15_dout_w;
wire [8:0] spx9_inst_15_dout;
wire [30:0] sp_inst_16_dout_w;
wire [9:9] sp_inst_16_dout;
wire [30:0] sp_inst_17_dout_w;
wire [9:9] sp_inst_17_dout;
wire [30:0] sp_inst_18_dout_w;
wire [10:10] sp_inst_18_dout;
wire [30:0] sp_inst_19_dout_w;
wire [10:10] sp_inst_19_dout;
wire [30:0] sp_inst_20_dout_w;
wire [11:11] sp_inst_20_dout;
wire [30:0] sp_inst_21_dout_w;
wire [11:11] sp_inst_21_dout;
wire [27:0] sp_inst_22_dout_w;
wire [3:0] sp_inst_22_dout;
wire [27:0] sp_inst_23_dout_w;
wire [7:4] sp_inst_23_dout;
wire [27:0] sp_inst_24_dout_w;
wire [11:8] sp_inst_24_dout;
wire [19:0] sp_inst_25_dout_w;
wire [11:0] sp_inst_25_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire dff_q_4;
wire mux_o_18;
wire mux_o_19;
wire mux_o_20;
wire mux_o_21;
wire mux_o_22;
wire mux_o_23;
wire mux_o_24;
wire mux_o_25;
wire mux_o_28;
wire mux_o_29;
wire mux_o_30;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_34;
wire mux_o_36;
wire mux_o_57;
wire mux_o_58;
wire mux_o_59;
wire mux_o_60;
wire mux_o_61;
wire mux_o_62;
wire mux_o_63;
wire mux_o_64;
wire mux_o_67;
wire mux_o_68;
wire mux_o_69;
wire mux_o_70;
wire mux_o_71;
wire mux_o_72;
wire mux_o_73;
wire mux_o_75;
wire mux_o_96;
wire mux_o_97;
wire mux_o_98;
wire mux_o_99;
wire mux_o_100;
wire mux_o_101;
wire mux_o_102;
wire mux_o_103;
wire mux_o_106;
wire mux_o_107;
wire mux_o_108;
wire mux_o_109;
wire mux_o_110;
wire mux_o_111;
wire mux_o_112;
wire mux_o_114;
wire mux_o_135;
wire mux_o_136;
wire mux_o_137;
wire mux_o_138;
wire mux_o_139;
wire mux_o_140;
wire mux_o_141;
wire mux_o_142;
wire mux_o_145;
wire mux_o_146;
wire mux_o_147;
wire mux_o_148;
wire mux_o_149;
wire mux_o_150;
wire mux_o_151;
wire mux_o_153;
wire mux_o_174;
wire mux_o_175;
wire mux_o_176;
wire mux_o_177;
wire mux_o_178;
wire mux_o_179;
wire mux_o_180;
wire mux_o_181;
wire mux_o_184;
wire mux_o_185;
wire mux_o_186;
wire mux_o_187;
wire mux_o_188;
wire mux_o_189;
wire mux_o_190;
wire mux_o_192;
wire mux_o_213;
wire mux_o_214;
wire mux_o_215;
wire mux_o_216;
wire mux_o_217;
wire mux_o_218;
wire mux_o_219;
wire mux_o_220;
wire mux_o_223;
wire mux_o_224;
wire mux_o_225;
wire mux_o_226;
wire mux_o_227;
wire mux_o_228;
wire mux_o_229;
wire mux_o_231;
wire mux_o_252;
wire mux_o_253;
wire mux_o_254;
wire mux_o_255;
wire mux_o_256;
wire mux_o_257;
wire mux_o_258;
wire mux_o_259;
wire mux_o_262;
wire mux_o_263;
wire mux_o_264;
wire mux_o_265;
wire mux_o_266;
wire mux_o_267;
wire mux_o_268;
wire mux_o_270;
wire mux_o_291;
wire mux_o_292;
wire mux_o_293;
wire mux_o_294;
wire mux_o_295;
wire mux_o_296;
wire mux_o_297;
wire mux_o_298;
wire mux_o_301;
wire mux_o_302;
wire mux_o_303;
wire mux_o_304;
wire mux_o_305;
wire mux_o_306;
wire mux_o_307;
wire mux_o_309;
wire mux_o_330;
wire mux_o_331;
wire mux_o_332;
wire mux_o_333;
wire mux_o_334;
wire mux_o_335;
wire mux_o_336;
wire mux_o_337;
wire mux_o_340;
wire mux_o_341;
wire mux_o_342;
wire mux_o_343;
wire mux_o_344;
wire mux_o_345;
wire mux_o_346;
wire mux_o_348;
wire mux_o_361;
wire mux_o_365;
wire mux_o_378;
wire mux_o_382;
wire mux_o_395;
wire mux_o_399;
wire ce_w;
wire gw_vcc;
wire gw_gnd;

assign ce_w = ~wre & ce;
assign gw_vcc = 1'b1;
assign gw_gnd = 1'b0;

LUT5 lut_inst_0 (
  .F(lut_f_0),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_0.INIT = 32'h00000001;
LUT5 lut_inst_1 (
  .F(lut_f_1),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_1.INIT = 32'h00000002;
LUT5 lut_inst_2 (
  .F(lut_f_2),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_2.INIT = 32'h00000004;
LUT5 lut_inst_3 (
  .F(lut_f_3),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_3.INIT = 32'h00000008;
LUT5 lut_inst_4 (
  .F(lut_f_4),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_4.INIT = 32'h00000010;
LUT5 lut_inst_5 (
  .F(lut_f_5),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_5.INIT = 32'h00000020;
LUT5 lut_inst_6 (
  .F(lut_f_6),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_6.INIT = 32'h00000040;
LUT5 lut_inst_7 (
  .F(lut_f_7),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_7.INIT = 32'h00000080;
LUT5 lut_inst_8 (
  .F(lut_f_8),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_8.INIT = 32'h00000100;
LUT5 lut_inst_9 (
  .F(lut_f_9),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_9.INIT = 32'h00000200;
LUT5 lut_inst_10 (
  .F(lut_f_10),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_10.INIT = 32'h00000400;
LUT5 lut_inst_11 (
  .F(lut_f_11),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_11.INIT = 32'h00000800;
LUT5 lut_inst_12 (
  .F(lut_f_12),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_12.INIT = 32'h00001000;
LUT5 lut_inst_13 (
  .F(lut_f_13),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_13.INIT = 32'h00002000;
LUT5 lut_inst_14 (
  .F(lut_f_14),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_14.INIT = 32'h00004000;
LUT5 lut_inst_15 (
  .F(lut_f_15),
  .I0(ad[11]),
  .I1(ad[12]),
  .I2(ad[13]),
  .I3(ad[14]),
  .I4(ad[15])
);
defparam lut_inst_15.INIT = 32'h00008000;
LUT4 lut_inst_16 (
  .F(lut_f_16),
  .I0(ad[12]),
  .I1(ad[13]),
  .I2(ad[14]),
  .I3(ad[15])
);
defparam lut_inst_16.INIT = 16'h0100;
LUT6 lut_inst_17 (
  .F(lut_f_17),
  .I0(ad[10]),
  .I1(ad[11]),
  .I2(ad[12]),
  .I3(ad[13]),
  .I4(ad[14]),
  .I5(ad[15])
);
defparam lut_inst_17.INIT = 64'h0000001000000000;
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

SPX9 spx9_inst_15 (
    .DO({spx9_inst_15_dout_w[26:0],spx9_inst_15_dout[8:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_15}),
    .AD({ad[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[8:0]})
);

defparam spx9_inst_15.READ_MODE = 1'b0;
defparam spx9_inst_15.WRITE_MODE = 2'b00;
defparam spx9_inst_15.BIT_WIDTH = 9;
defparam spx9_inst_15.BLK_SEL = 3'b001;
defparam spx9_inst_15.RESET_MODE = "SYNC";

SP sp_inst_16 (
    .DO({sp_inst_16_dout_w[30:0],sp_inst_16_dout[9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9]})
);

defparam sp_inst_16.READ_MODE = 1'b0;
defparam sp_inst_16.WRITE_MODE = 2'b00;
defparam sp_inst_16.BIT_WIDTH = 1;
defparam sp_inst_16.BLK_SEL = 3'b000;
defparam sp_inst_16.RESET_MODE = "SYNC";

SP sp_inst_17 (
    .DO({sp_inst_17_dout_w[30:0],sp_inst_17_dout[9]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[9]})
);

defparam sp_inst_17.READ_MODE = 1'b0;
defparam sp_inst_17.WRITE_MODE = 2'b00;
defparam sp_inst_17.BIT_WIDTH = 1;
defparam sp_inst_17.BLK_SEL = 3'b001;
defparam sp_inst_17.RESET_MODE = "SYNC";

SP sp_inst_18 (
    .DO({sp_inst_18_dout_w[30:0],sp_inst_18_dout[10]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[10]})
);

defparam sp_inst_18.READ_MODE = 1'b0;
defparam sp_inst_18.WRITE_MODE = 2'b00;
defparam sp_inst_18.BIT_WIDTH = 1;
defparam sp_inst_18.BLK_SEL = 3'b000;
defparam sp_inst_18.RESET_MODE = "SYNC";

SP sp_inst_19 (
    .DO({sp_inst_19_dout_w[30:0],sp_inst_19_dout[10]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[10]})
);

defparam sp_inst_19.READ_MODE = 1'b0;
defparam sp_inst_19.WRITE_MODE = 2'b00;
defparam sp_inst_19.BIT_WIDTH = 1;
defparam sp_inst_19.BLK_SEL = 3'b001;
defparam sp_inst_19.RESET_MODE = "SYNC";

SP sp_inst_20 (
    .DO({sp_inst_20_dout_w[30:0],sp_inst_20_dout[11]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11]})
);

defparam sp_inst_20.READ_MODE = 1'b0;
defparam sp_inst_20.WRITE_MODE = 2'b00;
defparam sp_inst_20.BIT_WIDTH = 1;
defparam sp_inst_20.BLK_SEL = 3'b000;
defparam sp_inst_20.RESET_MODE = "SYNC";

SP sp_inst_21 (
    .DO({sp_inst_21_dout_w[30:0],sp_inst_21_dout[11]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,ad[15],ad[14]}),
    .AD(ad[13:0]),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11]})
);

defparam sp_inst_21.READ_MODE = 1'b0;
defparam sp_inst_21.WRITE_MODE = 2'b00;
defparam sp_inst_21.BIT_WIDTH = 1;
defparam sp_inst_21.BLK_SEL = 3'b001;
defparam sp_inst_21.RESET_MODE = "SYNC";

SP sp_inst_22 (
    .DO({sp_inst_22_dout_w[27:0],sp_inst_22_dout[3:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_16}),
    .AD({ad[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]})
);

defparam sp_inst_22.READ_MODE = 1'b0;
defparam sp_inst_22.WRITE_MODE = 2'b00;
defparam sp_inst_22.BIT_WIDTH = 4;
defparam sp_inst_22.BLK_SEL = 3'b001;
defparam sp_inst_22.RESET_MODE = "SYNC";

SP sp_inst_23 (
    .DO({sp_inst_23_dout_w[27:0],sp_inst_23_dout[7:4]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_16}),
    .AD({ad[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]})
);

defparam sp_inst_23.READ_MODE = 1'b0;
defparam sp_inst_23.WRITE_MODE = 2'b00;
defparam sp_inst_23.BIT_WIDTH = 4;
defparam sp_inst_23.BLK_SEL = 3'b001;
defparam sp_inst_23.RESET_MODE = "SYNC";

SP sp_inst_24 (
    .DO({sp_inst_24_dout_w[27:0],sp_inst_24_dout[11:8]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_16}),
    .AD({ad[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11:8]})
);

defparam sp_inst_24.READ_MODE = 1'b0;
defparam sp_inst_24.WRITE_MODE = 2'b00;
defparam sp_inst_24.BIT_WIDTH = 4;
defparam sp_inst_24.BLK_SEL = 3'b001;
defparam sp_inst_24.RESET_MODE = "SYNC";

SP sp_inst_25 (
    .DO({sp_inst_25_dout_w[19:0],sp_inst_25_dout[11:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,lut_f_17}),
    .AD({ad[9:0],gw_gnd,gw_gnd,gw_vcc,gw_vcc}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[11:0]})
);

defparam sp_inst_25.READ_MODE = 1'b0;
defparam sp_inst_25.WRITE_MODE = 2'b00;
defparam sp_inst_25.BIT_WIDTH = 16;
defparam sp_inst_25.BLK_SEL = 3'b001;
defparam sp_inst_25.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ad[15]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ad[14]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ad[13]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(ad[12]),
  .CLK(clk),
  .CE(ce_w)
);
DFFE dff_inst_4 (
  .Q(dff_q_4),
  .D(ad[11]),
  .CLK(clk),
  .CE(ce_w)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(spx9_inst_0_dout[0]),
  .I1(spx9_inst_1_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_19 (
  .O(mux_o_19),
  .I0(spx9_inst_2_dout[0]),
  .I1(spx9_inst_3_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_20 (
  .O(mux_o_20),
  .I0(spx9_inst_4_dout[0]),
  .I1(spx9_inst_5_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_21 (
  .O(mux_o_21),
  .I0(spx9_inst_6_dout[0]),
  .I1(spx9_inst_7_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_22 (
  .O(mux_o_22),
  .I0(spx9_inst_8_dout[0]),
  .I1(spx9_inst_9_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_23 (
  .O(mux_o_23),
  .I0(spx9_inst_10_dout[0]),
  .I1(spx9_inst_11_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_24 (
  .O(mux_o_24),
  .I0(spx9_inst_12_dout[0]),
  .I1(spx9_inst_13_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_25 (
  .O(mux_o_25),
  .I0(spx9_inst_14_dout[0]),
  .I1(spx9_inst_15_dout[0]),
  .S0(dff_q_4)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(mux_o_18),
  .I1(mux_o_19),
  .S0(dff_q_3)
);
MUX2 mux_inst_29 (
  .O(mux_o_29),
  .I0(mux_o_20),
  .I1(mux_o_21),
  .S0(dff_q_3)
);
MUX2 mux_inst_30 (
  .O(mux_o_30),
  .I0(mux_o_22),
  .I1(mux_o_23),
  .S0(dff_q_3)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(mux_o_24),
  .I1(mux_o_25),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(sp_inst_22_dout[0]),
  .I1(sp_inst_25_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(mux_o_28),
  .I1(mux_o_29),
  .S0(dff_q_2)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(mux_o_30),
  .I1(mux_o_31),
  .S0(dff_q_2)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_1)
);
MUX2 mux_inst_38 (
  .O(dout[0]),
  .I0(mux_o_36),
  .I1(mux_o_32),
  .S0(dff_q_0)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(spx9_inst_0_dout[1]),
  .I1(spx9_inst_1_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(spx9_inst_2_dout[1]),
  .I1(spx9_inst_3_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_59 (
  .O(mux_o_59),
  .I0(spx9_inst_4_dout[1]),
  .I1(spx9_inst_5_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(spx9_inst_6_dout[1]),
  .I1(spx9_inst_7_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(spx9_inst_8_dout[1]),
  .I1(spx9_inst_9_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_62 (
  .O(mux_o_62),
  .I0(spx9_inst_10_dout[1]),
  .I1(spx9_inst_11_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(spx9_inst_12_dout[1]),
  .I1(spx9_inst_13_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_64 (
  .O(mux_o_64),
  .I0(spx9_inst_14_dout[1]),
  .I1(spx9_inst_15_dout[1]),
  .S0(dff_q_4)
);
MUX2 mux_inst_67 (
  .O(mux_o_67),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_3)
);
MUX2 mux_inst_68 (
  .O(mux_o_68),
  .I0(mux_o_59),
  .I1(mux_o_60),
  .S0(dff_q_3)
);
MUX2 mux_inst_69 (
  .O(mux_o_69),
  .I0(mux_o_61),
  .I1(mux_o_62),
  .S0(dff_q_3)
);
MUX2 mux_inst_70 (
  .O(mux_o_70),
  .I0(mux_o_63),
  .I1(mux_o_64),
  .S0(dff_q_3)
);
MUX2 mux_inst_71 (
  .O(mux_o_71),
  .I0(sp_inst_22_dout[1]),
  .I1(sp_inst_25_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_72 (
  .O(mux_o_72),
  .I0(mux_o_67),
  .I1(mux_o_68),
  .S0(dff_q_2)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(mux_o_69),
  .I1(mux_o_70),
  .S0(dff_q_2)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(mux_o_72),
  .I1(mux_o_73),
  .S0(dff_q_1)
);
MUX2 mux_inst_77 (
  .O(dout[1]),
  .I0(mux_o_75),
  .I1(mux_o_71),
  .S0(dff_q_0)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(spx9_inst_0_dout[2]),
  .I1(spx9_inst_1_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(spx9_inst_2_dout[2]),
  .I1(spx9_inst_3_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_98 (
  .O(mux_o_98),
  .I0(spx9_inst_4_dout[2]),
  .I1(spx9_inst_5_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(spx9_inst_6_dout[2]),
  .I1(spx9_inst_7_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(spx9_inst_8_dout[2]),
  .I1(spx9_inst_9_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_101 (
  .O(mux_o_101),
  .I0(spx9_inst_10_dout[2]),
  .I1(spx9_inst_11_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(spx9_inst_12_dout[2]),
  .I1(spx9_inst_13_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_103 (
  .O(mux_o_103),
  .I0(spx9_inst_14_dout[2]),
  .I1(spx9_inst_15_dout[2]),
  .S0(dff_q_4)
);
MUX2 mux_inst_106 (
  .O(mux_o_106),
  .I0(mux_o_96),
  .I1(mux_o_97),
  .S0(dff_q_3)
);
MUX2 mux_inst_107 (
  .O(mux_o_107),
  .I0(mux_o_98),
  .I1(mux_o_99),
  .S0(dff_q_3)
);
MUX2 mux_inst_108 (
  .O(mux_o_108),
  .I0(mux_o_100),
  .I1(mux_o_101),
  .S0(dff_q_3)
);
MUX2 mux_inst_109 (
  .O(mux_o_109),
  .I0(mux_o_102),
  .I1(mux_o_103),
  .S0(dff_q_3)
);
MUX2 mux_inst_110 (
  .O(mux_o_110),
  .I0(sp_inst_22_dout[2]),
  .I1(sp_inst_25_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_111 (
  .O(mux_o_111),
  .I0(mux_o_106),
  .I1(mux_o_107),
  .S0(dff_q_2)
);
MUX2 mux_inst_112 (
  .O(mux_o_112),
  .I0(mux_o_108),
  .I1(mux_o_109),
  .S0(dff_q_2)
);
MUX2 mux_inst_114 (
  .O(mux_o_114),
  .I0(mux_o_111),
  .I1(mux_o_112),
  .S0(dff_q_1)
);
MUX2 mux_inst_116 (
  .O(dout[2]),
  .I0(mux_o_114),
  .I1(mux_o_110),
  .S0(dff_q_0)
);
MUX2 mux_inst_135 (
  .O(mux_o_135),
  .I0(spx9_inst_0_dout[3]),
  .I1(spx9_inst_1_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_136 (
  .O(mux_o_136),
  .I0(spx9_inst_2_dout[3]),
  .I1(spx9_inst_3_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_137 (
  .O(mux_o_137),
  .I0(spx9_inst_4_dout[3]),
  .I1(spx9_inst_5_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_138 (
  .O(mux_o_138),
  .I0(spx9_inst_6_dout[3]),
  .I1(spx9_inst_7_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_139 (
  .O(mux_o_139),
  .I0(spx9_inst_8_dout[3]),
  .I1(spx9_inst_9_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_140 (
  .O(mux_o_140),
  .I0(spx9_inst_10_dout[3]),
  .I1(spx9_inst_11_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_141 (
  .O(mux_o_141),
  .I0(spx9_inst_12_dout[3]),
  .I1(spx9_inst_13_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_142 (
  .O(mux_o_142),
  .I0(spx9_inst_14_dout[3]),
  .I1(spx9_inst_15_dout[3]),
  .S0(dff_q_4)
);
MUX2 mux_inst_145 (
  .O(mux_o_145),
  .I0(mux_o_135),
  .I1(mux_o_136),
  .S0(dff_q_3)
);
MUX2 mux_inst_146 (
  .O(mux_o_146),
  .I0(mux_o_137),
  .I1(mux_o_138),
  .S0(dff_q_3)
);
MUX2 mux_inst_147 (
  .O(mux_o_147),
  .I0(mux_o_139),
  .I1(mux_o_140),
  .S0(dff_q_3)
);
MUX2 mux_inst_148 (
  .O(mux_o_148),
  .I0(mux_o_141),
  .I1(mux_o_142),
  .S0(dff_q_3)
);
MUX2 mux_inst_149 (
  .O(mux_o_149),
  .I0(sp_inst_22_dout[3]),
  .I1(sp_inst_25_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_150 (
  .O(mux_o_150),
  .I0(mux_o_145),
  .I1(mux_o_146),
  .S0(dff_q_2)
);
MUX2 mux_inst_151 (
  .O(mux_o_151),
  .I0(mux_o_147),
  .I1(mux_o_148),
  .S0(dff_q_2)
);
MUX2 mux_inst_153 (
  .O(mux_o_153),
  .I0(mux_o_150),
  .I1(mux_o_151),
  .S0(dff_q_1)
);
MUX2 mux_inst_155 (
  .O(dout[3]),
  .I0(mux_o_153),
  .I1(mux_o_149),
  .S0(dff_q_0)
);
MUX2 mux_inst_174 (
  .O(mux_o_174),
  .I0(spx9_inst_0_dout[4]),
  .I1(spx9_inst_1_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_175 (
  .O(mux_o_175),
  .I0(spx9_inst_2_dout[4]),
  .I1(spx9_inst_3_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_176 (
  .O(mux_o_176),
  .I0(spx9_inst_4_dout[4]),
  .I1(spx9_inst_5_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_177 (
  .O(mux_o_177),
  .I0(spx9_inst_6_dout[4]),
  .I1(spx9_inst_7_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_178 (
  .O(mux_o_178),
  .I0(spx9_inst_8_dout[4]),
  .I1(spx9_inst_9_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_179 (
  .O(mux_o_179),
  .I0(spx9_inst_10_dout[4]),
  .I1(spx9_inst_11_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_180 (
  .O(mux_o_180),
  .I0(spx9_inst_12_dout[4]),
  .I1(spx9_inst_13_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_181 (
  .O(mux_o_181),
  .I0(spx9_inst_14_dout[4]),
  .I1(spx9_inst_15_dout[4]),
  .S0(dff_q_4)
);
MUX2 mux_inst_184 (
  .O(mux_o_184),
  .I0(mux_o_174),
  .I1(mux_o_175),
  .S0(dff_q_3)
);
MUX2 mux_inst_185 (
  .O(mux_o_185),
  .I0(mux_o_176),
  .I1(mux_o_177),
  .S0(dff_q_3)
);
MUX2 mux_inst_186 (
  .O(mux_o_186),
  .I0(mux_o_178),
  .I1(mux_o_179),
  .S0(dff_q_3)
);
MUX2 mux_inst_187 (
  .O(mux_o_187),
  .I0(mux_o_180),
  .I1(mux_o_181),
  .S0(dff_q_3)
);
MUX2 mux_inst_188 (
  .O(mux_o_188),
  .I0(sp_inst_23_dout[4]),
  .I1(sp_inst_25_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_189 (
  .O(mux_o_189),
  .I0(mux_o_184),
  .I1(mux_o_185),
  .S0(dff_q_2)
);
MUX2 mux_inst_190 (
  .O(mux_o_190),
  .I0(mux_o_186),
  .I1(mux_o_187),
  .S0(dff_q_2)
);
MUX2 mux_inst_192 (
  .O(mux_o_192),
  .I0(mux_o_189),
  .I1(mux_o_190),
  .S0(dff_q_1)
);
MUX2 mux_inst_194 (
  .O(dout[4]),
  .I0(mux_o_192),
  .I1(mux_o_188),
  .S0(dff_q_0)
);
MUX2 mux_inst_213 (
  .O(mux_o_213),
  .I0(spx9_inst_0_dout[5]),
  .I1(spx9_inst_1_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_214 (
  .O(mux_o_214),
  .I0(spx9_inst_2_dout[5]),
  .I1(spx9_inst_3_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_215 (
  .O(mux_o_215),
  .I0(spx9_inst_4_dout[5]),
  .I1(spx9_inst_5_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_216 (
  .O(mux_o_216),
  .I0(spx9_inst_6_dout[5]),
  .I1(spx9_inst_7_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_217 (
  .O(mux_o_217),
  .I0(spx9_inst_8_dout[5]),
  .I1(spx9_inst_9_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_218 (
  .O(mux_o_218),
  .I0(spx9_inst_10_dout[5]),
  .I1(spx9_inst_11_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_219 (
  .O(mux_o_219),
  .I0(spx9_inst_12_dout[5]),
  .I1(spx9_inst_13_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_220 (
  .O(mux_o_220),
  .I0(spx9_inst_14_dout[5]),
  .I1(spx9_inst_15_dout[5]),
  .S0(dff_q_4)
);
MUX2 mux_inst_223 (
  .O(mux_o_223),
  .I0(mux_o_213),
  .I1(mux_o_214),
  .S0(dff_q_3)
);
MUX2 mux_inst_224 (
  .O(mux_o_224),
  .I0(mux_o_215),
  .I1(mux_o_216),
  .S0(dff_q_3)
);
MUX2 mux_inst_225 (
  .O(mux_o_225),
  .I0(mux_o_217),
  .I1(mux_o_218),
  .S0(dff_q_3)
);
MUX2 mux_inst_226 (
  .O(mux_o_226),
  .I0(mux_o_219),
  .I1(mux_o_220),
  .S0(dff_q_3)
);
MUX2 mux_inst_227 (
  .O(mux_o_227),
  .I0(sp_inst_23_dout[5]),
  .I1(sp_inst_25_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_228 (
  .O(mux_o_228),
  .I0(mux_o_223),
  .I1(mux_o_224),
  .S0(dff_q_2)
);
MUX2 mux_inst_229 (
  .O(mux_o_229),
  .I0(mux_o_225),
  .I1(mux_o_226),
  .S0(dff_q_2)
);
MUX2 mux_inst_231 (
  .O(mux_o_231),
  .I0(mux_o_228),
  .I1(mux_o_229),
  .S0(dff_q_1)
);
MUX2 mux_inst_233 (
  .O(dout[5]),
  .I0(mux_o_231),
  .I1(mux_o_227),
  .S0(dff_q_0)
);
MUX2 mux_inst_252 (
  .O(mux_o_252),
  .I0(spx9_inst_0_dout[6]),
  .I1(spx9_inst_1_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_253 (
  .O(mux_o_253),
  .I0(spx9_inst_2_dout[6]),
  .I1(spx9_inst_3_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_254 (
  .O(mux_o_254),
  .I0(spx9_inst_4_dout[6]),
  .I1(spx9_inst_5_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_255 (
  .O(mux_o_255),
  .I0(spx9_inst_6_dout[6]),
  .I1(spx9_inst_7_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_256 (
  .O(mux_o_256),
  .I0(spx9_inst_8_dout[6]),
  .I1(spx9_inst_9_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_257 (
  .O(mux_o_257),
  .I0(spx9_inst_10_dout[6]),
  .I1(spx9_inst_11_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_258 (
  .O(mux_o_258),
  .I0(spx9_inst_12_dout[6]),
  .I1(spx9_inst_13_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_259 (
  .O(mux_o_259),
  .I0(spx9_inst_14_dout[6]),
  .I1(spx9_inst_15_dout[6]),
  .S0(dff_q_4)
);
MUX2 mux_inst_262 (
  .O(mux_o_262),
  .I0(mux_o_252),
  .I1(mux_o_253),
  .S0(dff_q_3)
);
MUX2 mux_inst_263 (
  .O(mux_o_263),
  .I0(mux_o_254),
  .I1(mux_o_255),
  .S0(dff_q_3)
);
MUX2 mux_inst_264 (
  .O(mux_o_264),
  .I0(mux_o_256),
  .I1(mux_o_257),
  .S0(dff_q_3)
);
MUX2 mux_inst_265 (
  .O(mux_o_265),
  .I0(mux_o_258),
  .I1(mux_o_259),
  .S0(dff_q_3)
);
MUX2 mux_inst_266 (
  .O(mux_o_266),
  .I0(sp_inst_23_dout[6]),
  .I1(sp_inst_25_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_267 (
  .O(mux_o_267),
  .I0(mux_o_262),
  .I1(mux_o_263),
  .S0(dff_q_2)
);
MUX2 mux_inst_268 (
  .O(mux_o_268),
  .I0(mux_o_264),
  .I1(mux_o_265),
  .S0(dff_q_2)
);
MUX2 mux_inst_270 (
  .O(mux_o_270),
  .I0(mux_o_267),
  .I1(mux_o_268),
  .S0(dff_q_1)
);
MUX2 mux_inst_272 (
  .O(dout[6]),
  .I0(mux_o_270),
  .I1(mux_o_266),
  .S0(dff_q_0)
);
MUX2 mux_inst_291 (
  .O(mux_o_291),
  .I0(spx9_inst_0_dout[7]),
  .I1(spx9_inst_1_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_292 (
  .O(mux_o_292),
  .I0(spx9_inst_2_dout[7]),
  .I1(spx9_inst_3_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_293 (
  .O(mux_o_293),
  .I0(spx9_inst_4_dout[7]),
  .I1(spx9_inst_5_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_294 (
  .O(mux_o_294),
  .I0(spx9_inst_6_dout[7]),
  .I1(spx9_inst_7_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_295 (
  .O(mux_o_295),
  .I0(spx9_inst_8_dout[7]),
  .I1(spx9_inst_9_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_296 (
  .O(mux_o_296),
  .I0(spx9_inst_10_dout[7]),
  .I1(spx9_inst_11_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_297 (
  .O(mux_o_297),
  .I0(spx9_inst_12_dout[7]),
  .I1(spx9_inst_13_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_298 (
  .O(mux_o_298),
  .I0(spx9_inst_14_dout[7]),
  .I1(spx9_inst_15_dout[7]),
  .S0(dff_q_4)
);
MUX2 mux_inst_301 (
  .O(mux_o_301),
  .I0(mux_o_291),
  .I1(mux_o_292),
  .S0(dff_q_3)
);
MUX2 mux_inst_302 (
  .O(mux_o_302),
  .I0(mux_o_293),
  .I1(mux_o_294),
  .S0(dff_q_3)
);
MUX2 mux_inst_303 (
  .O(mux_o_303),
  .I0(mux_o_295),
  .I1(mux_o_296),
  .S0(dff_q_3)
);
MUX2 mux_inst_304 (
  .O(mux_o_304),
  .I0(mux_o_297),
  .I1(mux_o_298),
  .S0(dff_q_3)
);
MUX2 mux_inst_305 (
  .O(mux_o_305),
  .I0(sp_inst_23_dout[7]),
  .I1(sp_inst_25_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_306 (
  .O(mux_o_306),
  .I0(mux_o_301),
  .I1(mux_o_302),
  .S0(dff_q_2)
);
MUX2 mux_inst_307 (
  .O(mux_o_307),
  .I0(mux_o_303),
  .I1(mux_o_304),
  .S0(dff_q_2)
);
MUX2 mux_inst_309 (
  .O(mux_o_309),
  .I0(mux_o_306),
  .I1(mux_o_307),
  .S0(dff_q_1)
);
MUX2 mux_inst_311 (
  .O(dout[7]),
  .I0(mux_o_309),
  .I1(mux_o_305),
  .S0(dff_q_0)
);
MUX2 mux_inst_330 (
  .O(mux_o_330),
  .I0(spx9_inst_0_dout[8]),
  .I1(spx9_inst_1_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_331 (
  .O(mux_o_331),
  .I0(spx9_inst_2_dout[8]),
  .I1(spx9_inst_3_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_332 (
  .O(mux_o_332),
  .I0(spx9_inst_4_dout[8]),
  .I1(spx9_inst_5_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_333 (
  .O(mux_o_333),
  .I0(spx9_inst_6_dout[8]),
  .I1(spx9_inst_7_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_334 (
  .O(mux_o_334),
  .I0(spx9_inst_8_dout[8]),
  .I1(spx9_inst_9_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_335 (
  .O(mux_o_335),
  .I0(spx9_inst_10_dout[8]),
  .I1(spx9_inst_11_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_336 (
  .O(mux_o_336),
  .I0(spx9_inst_12_dout[8]),
  .I1(spx9_inst_13_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_337 (
  .O(mux_o_337),
  .I0(spx9_inst_14_dout[8]),
  .I1(spx9_inst_15_dout[8]),
  .S0(dff_q_4)
);
MUX2 mux_inst_340 (
  .O(mux_o_340),
  .I0(mux_o_330),
  .I1(mux_o_331),
  .S0(dff_q_3)
);
MUX2 mux_inst_341 (
  .O(mux_o_341),
  .I0(mux_o_332),
  .I1(mux_o_333),
  .S0(dff_q_3)
);
MUX2 mux_inst_342 (
  .O(mux_o_342),
  .I0(mux_o_334),
  .I1(mux_o_335),
  .S0(dff_q_3)
);
MUX2 mux_inst_343 (
  .O(mux_o_343),
  .I0(mux_o_336),
  .I1(mux_o_337),
  .S0(dff_q_3)
);
MUX2 mux_inst_344 (
  .O(mux_o_344),
  .I0(sp_inst_24_dout[8]),
  .I1(sp_inst_25_dout[8]),
  .S0(dff_q_3)
);
MUX2 mux_inst_345 (
  .O(mux_o_345),
  .I0(mux_o_340),
  .I1(mux_o_341),
  .S0(dff_q_2)
);
MUX2 mux_inst_346 (
  .O(mux_o_346),
  .I0(mux_o_342),
  .I1(mux_o_343),
  .S0(dff_q_2)
);
MUX2 mux_inst_348 (
  .O(mux_o_348),
  .I0(mux_o_345),
  .I1(mux_o_346),
  .S0(dff_q_1)
);
MUX2 mux_inst_350 (
  .O(dout[8]),
  .I0(mux_o_348),
  .I1(mux_o_344),
  .S0(dff_q_0)
);
MUX2 mux_inst_361 (
  .O(mux_o_361),
  .I0(sp_inst_24_dout[9]),
  .I1(sp_inst_25_dout[9]),
  .S0(dff_q_3)
);
MUX2 mux_inst_365 (
  .O(mux_o_365),
  .I0(sp_inst_16_dout[9]),
  .I1(sp_inst_17_dout[9]),
  .S0(dff_q_1)
);
MUX2 mux_inst_367 (
  .O(dout[9]),
  .I0(mux_o_365),
  .I1(mux_o_361),
  .S0(dff_q_0)
);
MUX2 mux_inst_378 (
  .O(mux_o_378),
  .I0(sp_inst_24_dout[10]),
  .I1(sp_inst_25_dout[10]),
  .S0(dff_q_3)
);
MUX2 mux_inst_382 (
  .O(mux_o_382),
  .I0(sp_inst_18_dout[10]),
  .I1(sp_inst_19_dout[10]),
  .S0(dff_q_1)
);
MUX2 mux_inst_384 (
  .O(dout[10]),
  .I0(mux_o_382),
  .I1(mux_o_378),
  .S0(dff_q_0)
);
MUX2 mux_inst_395 (
  .O(mux_o_395),
  .I0(sp_inst_24_dout[11]),
  .I1(sp_inst_25_dout[11]),
  .S0(dff_q_3)
);
MUX2 mux_inst_399 (
  .O(mux_o_399),
  .I0(sp_inst_20_dout[11]),
  .I1(sp_inst_21_dout[11]),
  .S0(dff_q_1)
);
MUX2 mux_inst_401 (
  .O(dout[11]),
  .I0(mux_o_399),
  .I1(mux_o_395),
  .S0(dff_q_0)
);
endmodule //spram
