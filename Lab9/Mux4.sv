module Mux4(

input logic[32:0] D0, D1, D2, D3,
input logic [2:0] select,
output logic[32:0] Q

);


always_comb
begin
	case(select)
		3'b0:
		begin
			Q = D0;
		end
		
		3'b01:
		begin
			Q = D1;
		end
		
		3'b010:
		begin
			Q = D2;
		end
		
		3'b011:
		begin
			Q = D3;
		end
		
		default:
		begin
			Q = 32'b0;
		end
	endcase
end


endmodule
