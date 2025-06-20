module uartrx(clock,reset_n,rx,DATAout,ReadSignal,idle,DataError,FrameError);

input clock;
input reset_n;
input rx;

output DATAout;
output ReadSignal;
output DataError;
output FrameError;
output idle;

reg [7:0]	DATAout;
reg ReadSignal,DataError,FrameError;

reg [7:0]	counter;
reg	ReceiveBuffer,ReceiveFall,receive;
reg 	presult,idle;
parameter paritymode = 1'b0;

//检测接受命令rx的下降沿
always @(posedge clock)
	begin
		ReceiveBuffer <= rx;
		ReceiveFall <= ReceiveBuffer &(~rx);
	end 

//接收状态的表示
always @(posedge clock)
begin	
	if(ReceiveFall && (~idle))
		begin
			receive <= 1'b1;
		end 
	else if (counter == 8'd152)
		begin
			receive <= 1'b0;
		end 
end

//串口接收，每16个clock接收同一个bit
always @(posedge clock or negedge reset_n )
begin 
	if (!reset_n)
		begin
			idle <= 1'b0;
			counter <= 8'b0;
			ReadSignal <= 1'b0;
			FrameError <= 1'b0;
			DataError <= 1'b0;
			presult <= 1'b0;
		end 
	else if(receive == 1'b1)
				begin
					case(counter)
						8'd0 :begin 
									idle <= 1'b1;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;
								end
						8'd24:begin 
									idle <= 1'b1;
									DATAout[0] 	<=	rx;
									presult <= paritymode ^ rx;
									counter <= counter  + 8'd1;
									ReadSignal <= 1'b0;
								end 
						8'd40 :begin 
									idle <= 1'b1;
									DATAout[1] <= rx;
									presult <= presult ^rx;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;	
								end 	
						8'd56 :begin 
									idle <= 1'b1;
									DATAout[2] <= rx;
									presult <= presult ^rx;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;
								end 
						8'd72 :begin 
									idle <= 1'b1;
									DATAout[3] <= rx ;
									presult <= presult ^ rx;
									counter <= counter +8'b1;
									ReadSignal <= 1'b0;
								end 
					   8'd88:begin
									idle <= 1'b1;
									DATAout[4] <= rx;
									presult <= presult ^ rx;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;
								end
						8'd104:begin 
									idle <= 1'b1;
									DATAout[5] <= rx;
									presult <= presult ^ rx;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;
								end
						8'd120:begin 
									idle <= 1'b1;
									DATAout[6] <= rx;
									presult <= presult ^ rx;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b0;
								end 
						8'd136:begin 
									idle <= 1'b1;
									DATAout[7] <= rx;
									presult <= presult ^rx;
									counter <= counter + 8'b1;
									ReadSignal  <= 1'b0;
								end 
//						8'd152:begin 
//									idle <= 1'b1;
//									if (presult == rx)
//										DataError <= 1'b0;
//									else 
//										DataError <= 1'b1;
//									counter <= counter + 8'b1;
//									ReadSignal <= 1'b1;
//							 end 
						8'd152:begin 
									idle <= 1'b1;
									if(1'b1 == rx)
										FrameError	<= 1'b0;
									else 
										FrameError 	<=	1'b1;
									counter <= counter + 8'b1;
									ReadSignal <= 1'b1;
							 end 
						default:begin 
								counter <= counter + 8'b1;
								end 
					endcase 
				end 
		else 
			begin 	
				counter <= 8'd0;
				idle <= 1'b0;
				ReadSignal <= 1'b0;
			end 
end 
endmodule 
