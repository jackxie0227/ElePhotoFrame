//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.03 Education
//Part Number: GW1N-LV9LQ144C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Wed Jul 30 20:06:18 2025

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    spram_37000 your_instance_name(
        .dout(dout), //output [11:0] dout
        .clk(clk), //input clk
        .oce(oce), //input oce
        .ce(ce), //input ce
        .reset(reset), //input reset
        .wre(wre), //input wre
        .ad(ad), //input [15:0] ad
        .din(din) //input [11:0] din
    );

//--------Copy end-------------------
