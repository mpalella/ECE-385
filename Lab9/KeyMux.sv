module KeyMux(

	input logic [1407:0] key_expand,
	input logic [3:0] select,
	output logic[127:0] out

);


always_comb
begin
	case(select)
		4'd0:
			begin
				out = key_expand[127:0];
			end
		4'd1:
			begin
				out = key_expand[255:128];
			end
		4'd2:
			begin
				out = key_expand[383:256];
			end
		4'd3:
			begin
				out = key_expand[511:384];
			end
		4'd4:
			begin
				out = key_expand[639:512];
			end
		4'd5:
			begin
				out = key_expand[767:640];
			end
		4'd6:
			begin
				out = key_expand[895:768];
			end
		4'd7:
			begin
				out = key_expand[1023:896];
			end
		4'd8:
			begin
				out = key_expand[1151:1024];
			end
		4'd9:
			begin
				out = key_expand[1279:1152];
			end
		4'd10:
			begin
				out = key_expand[1407:1280];
			end
		default:
		begin
			out = 128'b0;
		end
	endcase
end


endmodule
