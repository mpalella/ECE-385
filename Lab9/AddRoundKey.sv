module AddRoundKey (
	input logic [127:0] state,
	input logic [127:0] round_key,
	output logic [127:0] result
);


assign result = state ^ round_key;

endmodule
