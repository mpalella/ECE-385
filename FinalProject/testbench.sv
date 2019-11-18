module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

//for top level
logic CLOCK_50 = 0;
logic AUD_BCLK = 0;
logic AUD_DACLRCK = 0;
logic [3:0] KEY;
logic [6:0]  HEX0, HEX1;
logic AUD_XCK, AUD_DACDAT, I2C_SDAT, I2C_SCLK;
logic [7:0] keycode;

Final_Project_top plat(.*);





//for wavetable synth
//logic Clk = 0;
//logic Reset, CS, sample_Clk;
//logic [23:0] freq;
//logic [15:0] out;
//
//wavetable_synthesizer synth(.*);
//
//initial begin: CLOCK_INITIALIZATION
//    Clk = 0;
//	 sample_Clk = 0;
//end
//
//always begin : CLOCK_GENERATION
//#1 Clk = ~Clk;
//end
//
//always begin : SAMPLE_CLOCK_GENERATION
//#8 sample_Clk = ~sample_Clk;
//#2 sample_Clk = ~sample_Clk;
//end


for toplevel
initial begin: CLOCK_INITIALIZATION
    CLOCK_50 = 0;
	 AUD_BCLK = 0;
	 AUD_DACLRCK = 0;
end 

always begin : CLOCK_GENERATION
#1 CLOCK_50 = ~CLOCK_50;
end

always begin : BCLK_GENERATE
#1042 AUD_BCLK = ~AUD_BCLK;
end

always begin : LR_GENERATION
#8000 AUD_DACLRCK = ~AUD_DACLRCK;
end

initial begin: TEST_VECTORS

//for wavetable synth
Reset = 0;
CS = 0;
freq = 24'h021287;

#2 Reset = 1;
#2 Reset = 0;

#2 CS = 1;

//for top project
//KEY = 4'b1111;
//keycode = 256'd26;
//AUD_BCLK = 0;
//AUD_DACLRCK = 0;
//
//#1041 KEY[0] = 1'b1;
//#6 KEY[0] = 1'b1;
//
//#2 KEY[3] = 1'b0;
//#2 KEY[3] = 1'b1;
end
endmodule
