module KeyMapper(

input logic [7:0] keyboard_in,
output logic [23:0] note_out

);

always_comb
begin
	case(keyboard_in)
		256'd53: //`
			note_out = 24'h00c264;//C3
		
		256'd30: //1
			note_out = 24'h00cdf4;//C3#
			
		256'd31: //2
			note_out = 24'h00da33;//D3
			
		256'd32: //3
			note_out = 24'h00e72c;//D3#
			
		256'd33: //4
			note_out = 24'h00f4eb;//E3
			
		256'd34: //5
			note_out = 24'h01037b;//F3
			
		256'd35: //6
			note_out = 24'h0112ec;//F3#
			
		256'd36: //7
			note_out = 24'h012345;//G3
			
		256'd37: //8
			note_out = 24'h013495;//G3#
			
		256'd38: //9
			note_out = 24'h0146ef;//A3
			
		256'd39: //0
			note_out = 24'h015a5f;//A3#
			
		256'd45: //-
			note_out = 24'h016ef8;//B3
			
		256'd43: //Tab
			note_out = 24'h0184cd;//C4
			
		256'd20: //Q
			note_out = 24'h019be9;//C4#
			
		256'd26: //W
			note_out = 24'h01b466;//D4
			
		256'd8:  //E
			note_out = 24'h01ce5c;//D4#
		
		256'd21: //R
			note_out = 24'h01e9db;//E4
			
		256'd23: //T 
			note_out = 24'h0206fb;//F4
			
		256'd28: //Y
			note_out = 24'h0225d5;//F4#
			
		256'd24: //U
			note_out = 24'h02468a;//G4
			
		256'd12: //I
			note_out = 24'h02692a;//G4#
			
		256'd18: //O
			note_out = 24'h028ddf;//A4
	
		256'd19: //P
			note_out = 24'h02b4bf;//A4#
		
		256'd47: //{
			note_out = 24'h02ddf1;//B4
			
		256'd57: //CAPS LOCK
			note_out = 24'h030996;//C5
			
		256'd4: //A
			note_out = 24'h0337d6;//C5#
		
		256'd22: //S
			note_out = 24'h0368d1;//D5
			
		256'd07: //D
			note_out = 24'h039cb6;//D5#	
		
		256'd9: //F
			note_out = 24'h03d3b2;//E5
		
		256'd10: //G
			note_out = 24'h040df7;//F5
			
		256'd11: //H
			note_out = 24'h044bae;//F5#		
		
		256'd13: //J
			note_out = 24'h048d11;//G5
			
		256'd14: //K
			note_out = 24'h04d259;//G5#
			
		256'd15: //L
			note_out = 24'h051bbf;//A5	
		
		256'd51: //;
			note_out = 24'h056983;//A5#
		
		256'd52: //'
			note_out = 24'h05bbe7;//B5
		
		default:
			note_out = 24'h000000;
		
	endcase
end



endmodule
