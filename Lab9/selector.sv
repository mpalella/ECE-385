module selector(

input logic [32:0] col_in, 
input logic [127:0] state,
input logic [2:0] select,
output logic [32:0] Out0, Out1, Out2, Out3

);

always_comb
begin
	case(select)
		3'b00:
		begin
			Out0 = col_in;
			Out1 = state[95:64];
			Out2 = state[63:32];
			Out3 = state[31:0];
		end
		
		3'b01:
		begin
			Out0 = state[127:96];
			Out1 = col_in;
			Out2 = state[63:32];
			Out3 = state[31:0];
		end
		
		3'b010:
		begin
			Out0 = state[127:96];
			Out1 = state[95:64];
			Out2 = col_in;
			Out3 = state[31:0];
		end
		
		3'b011:
		begin
			Out0 = state[127:96];
			Out1 = state[95:64];
			Out2 = state[63:32];
			Out3 = col_in;
		end
		
		default:
		begin
			Out0 = 32'b0;
			Out1 = 32'b0;
			Out2 = 32'b0;
			Out3 = 32'b0;
		end
	endcase
end


endmodule
