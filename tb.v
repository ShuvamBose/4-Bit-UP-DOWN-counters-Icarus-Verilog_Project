module counter_tb();
    reg clock, reset;
    wire [3:0] counter_1,counter_2;

    up_counter up(clock, reset, counter_1);
    down_counter down(clock, reset, counter_2);
 
	initial 
	begin
		
        reset = 1;
		#0 
		reset = 0;
	    
    end
	
	initial
	begin
	$monitor($time," clock=%d  reset=%d counter_1[0]=%h counter_2[0]=%h",clock,reset,counter_1,counter_2);
	end
	
	initial 
	begin 
        clock=0;
        repeat(100) 
            #1 clock=~clock;
			
    end
    initial 
	begin
        $dumpfile("counter_tb.vcd");
        $dumpvars(0,counter_tb);
    end
    
endmodule
//vvp=Virtual Verilog Processor.