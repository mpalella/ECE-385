module KeyMapper(

input logic [7:0] keyboard_in
output logic [5:0] note_out;

);

always_comb
begin
	case(keyboard_in)
		256'd53: //`
			note_out = 64'd0;
		
		256'd30: //1
			note_out = 64'd1;
			
		256'd31: //2
			note_out = 64'd2;
			
		256'd32: //3
			note_out = 64'd3;
			
		256'd33: //4
			note_out = 64'd4;
			
		256'd34: //5
			note_out = 64'd5;
			
		256'd35: //6
			note_out = 64'd6;
			
		256'd36: //7
			note_out = 64'd7;
			
		256'd37: //8
			note_out = 64'd8;
			
		256'd38: //9
			note_out = 64'd9;
			
		256'd39: //0
			note_out = 64'd10;
			
		256'd45: //-
			note_out = 64'd11;
			
		256'd43: //Tab
			note_out = 64'd12;
			
		256'd20: //Q
			note_out = 64'd13;
			
		256'd26: //W
			note_out = 64'd14;
			
		256'd8:  //E
			note_out = 64'd15;
		
		256'd21: //R
			note_out = 64'd16;
			
		256'd23: //T 
			note_out = 64'd17;
			
		256'd28: //Y
			note_out = 64'd18;
			
		256'd24: //U
			note_out = 64'd19;
			
		256'd12: //I
			note_out = 64'd20;
			
		256'd18: //O
			note_out = 64'd21;
	
		256'd19: //P
			note_out = 64'd22;
		
		256'd47: //{
			note_out = 64'd23;
			
		256'd57: //CAPS LOCK
			note_out = 64'd24;
			
		256'd4: //A
			note_out = 64'd18;
		
		256'd22: //S
			note_out = 64'd18;
			
		256'd07: //D
			note_out = 64'd18;	
		
		256'd9: //F
			note_out = 64'd18;
		
		256'd10: //G
			note_out = 64'd18;
			
		256'd11: //H
			note_out = 64'd18;
		
		256'd13: //J
			note_out = 64'd18;
			
		256'd14: //K
			note_out = 64'd18;
			
		256'd15: //L
			note_out = 64'd18;	
		
		256'd51: //;
			note_out = 64'd18;
		
		256'd52: //'
			note_out = 64'd18;
		
	endcase
end



endmodule
