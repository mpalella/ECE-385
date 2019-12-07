module samplerAddressControl(


input logic Clk, Reset, init, sample_clk,
input logic [7:0] keycode,
output logic [19:0] note_address,
output logic done


);

logic new_note, count_done, count_inc, increment, invalid_note;
logic [19:0] keymapper_address;

incrementControl		CONTROL(.Clk(Clk), .Reset(Reset), .new_note(new_note), .count_done(count_done), .sample_clk(sample_clk), .init(init), .Done(done), .count_inc(count_inc), .increment(increment));
SamplerKeymapper		MAPPER(.keyboard_in(keycode), .note_addr(keymapper_address), .invalid_note(invalid_note));
Address_Incrementer	INCREMENTER(.Address(keymapper_address), .invalid_note(invalid_note), .increment(increment), .Clk(Clk), .Reset(Reset), .next_Address(note_address), .note_start(new_note));
noteCounter				COUNTER(.Clk(Clk), .Reset(Reset), .count_inc(count_inc), .note_change(new_note), .count_done(count_done));


endmodule
