module noteCounter(

input logic Clk, Reset, count_inc, note_change,
output logic count_done

);

logic [14:0] counter;
parameter COUNT_MAX = 15'd30870;

always_ff @ (posedge Clk)
begin
	if(Reset|note_change)
	begin
		counter <= 15'b0;
	end
	
	else
	begin
		if(count_inc)
		begin
			counter <= counter + 15'b1;
			
			if(counter > COUNT_MAX)
				counter <= 15'b0;
		end
		
		else
			counter <= counter;
	end

end

assign count_done = (counter < COUNT_MAX)?1'b0:1'b1;


endmodule
