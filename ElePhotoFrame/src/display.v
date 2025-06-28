module display(
    input clk,
    input [9:0] xpos ,
    input [9:0] ypos ,
    output reg [11:0] VGA_RGB
);

wire valid ;
assign valid=(xpos>200)&&(xpos<600)&&(ypos>150)&&(ypos<450);
//产生彩色条纹
always @(posedge clk)
    begin
        if(valid)
        begin
            if ((xpos>200)&&(xpos<250)) VGA_RGB=12'b1111_1111_1111;
            else if ((xpos>250)&&(xpos<300)) VGA_RGB=12'b0000_0000_1111;
            else if ((xpos>300)&&(xpos<350)) VGA_RGB=12'b0000_1111_0000;
            else if ((xpos>350)&&(xpos<400)) VGA_RGB=12'b0000_1111_1111;
            else if ((xpos>400)&&(xpos<450)) VGA_RGB=12'b1111_0000_0000;
            else if ((xpos>450)&&(xpos<500)) VGA_RGB=12'b1111_0000_1111;
            else if ((xpos>500)&&(xpos<550)) VGA_RGB=12'b1111_1111_0000;
            else if ((xpos>550)&&(xpos<600)) VGA_RGB=12'b1111_1111_1111;
        end
        else  VGA_RGB=12'b0000_0000_0000;
    end

endmodule
