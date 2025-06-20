module wifi(
    output CNT,
    output BOOT,
    output wifi_reset
);

assign wifi_reset = 1;
assign BOOT = 1;
assign CNT = 0;

endmodule
