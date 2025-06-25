module clkdiv(clk_50m,clk_uart, clk_100k);
	input clk_50m;         // 输入50MHz时钟
	output reg clk_uart;        // 输出UART时钟(9600bps×16=153.6KHz)
    output reg clk_100k; // 输出100KHz时钟
	
	reg [15:0] counter;    // UART时钟分频计数器
    reg [31:0] cnt;        // 100KHz时钟分频计数器
	
	always @(posedge clk_50m )
	begin
        // UART时钟生成
		if (counter == 16'd152)
			begin	
				clk_uart <= 1;
				counter <= counter + 1;
			end 
		else 	if (counter == 16'd325)
			begin 
				clk_uart <= 0;
				counter <= 0;
			end 
		else 
			begin
				counter <= counter + 1 ;
			end

        // 100KHz时钟生成
        if(cnt == 250-1)
                begin
                    clk_100k<= ~clk_100k;
                    cnt<=0;
                end
         else cnt<= cnt + 1;
	end 			
endmodule 
