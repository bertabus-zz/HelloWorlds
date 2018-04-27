// Blink an LED provided an input clock
/* module */
module top (hwclk, led1, led2, led3, led4, led5, led6, led7, led8 );
    /* I/O */
    input hwclk;
    output led1;
    output led2;
    output led3;
    output led4;
    output led5;
    output led6;
    output led7;
    output led8;

    /* Counter register */
    reg [24:0] counter = 25'b0;
    reg [7:0] leds = 8'b0;

    /* LED drivers */
    assign led1 = leds[0];
    assign led2 = leds[1];
    assign led3 = leds[2];
    assign led4 = leds[3];
    assign led5 = leds[4];
    assign led6 = leds[5];
    assign led7 = leds[6];
    assign led8 = leds[7];

    /* always */
    always @ (posedge hwclk) begin
        counter <= counter + 1;
        	//12Mhz count, gives one second counter
        	//Since period of oscillator is 12Mhz, every clock rise
        	//is start of new period
        	if (counter == 12000000)
        	begin
        		leds <= leds +1;
        		counter <= 0;
        	end 
    end

endmodule