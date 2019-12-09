module multiple_wavetable_module(

input logic Clk, Reset, CS, sample_clk,
input logic [31:0] keycode,
output logic data_out

);

logic [23:0] freq1, freq2, freq3, freq4;
logic [15:0] dataOut1, dataOut2, dataOut3, dataOut4;

wavetable_synthesizer 		sine_synth1(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut1), .sample_Clk(sample_clk)); 
KeyMapper   					Mapper1(.keyboard_in(keycode[7:0]), .note_out(freq1));

wavetable_synthesizer 		sine_synth2(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq2), .out(dataOut2), .sample_Clk(sample_clk)); 
KeyMapper   					Mapper2(.keyboard_in(keycode[15:8]), .note_out(freq2));

wavetable_synthesizer 		sine_synth3(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut3), .sample_Clk(sample_clk)); 
KeyMapper   					Mapper3(.keyboard_in(keycode[23:16]), .note_out(freq3));

wavetable_synthesizer 		sine_synth4(.Clk(Clk), .Reset(Reset), .CS(CS), .freq(freq1), .out(dataOut4), .sample_Clk(sample_clk)); 
KeyMapper   					Mapper4(.keyboard_in(keycode[31:24]), .note_out(freq4));

assign data_out = dataOut1 + dataOut2 + dataOut3 + dataOut4;

endmodule
