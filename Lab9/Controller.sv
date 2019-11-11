module Controller(
	input logic Clk, Reset,
	input logic start, 
	output logic [3:0] key_sel,
	output logic [2:0] func_sel, COL_SEL,
	output logic done, Reg_load
);


enum logic [7:0] {

	WAIT, 
	
	LD_MSG_a,
	LD_MSG_b,
	
	ADD_ROUND_KEY0_a,
	ADD_ROUND_KEY0_b,	
	
	SHIFT_ROWS1_a, 
	SHIFT_ROWS1_b,
	SUB_BYTES1_a,
	SUB_BYTES1_b,	
	ADD_ROUND_KEY1_a,
	ADD_ROUND_KEY1_b, 	
	MIX_COLUMNS1_1_a,
	MIX_COLUMNS1_1_b,
	MIX_COLUMNS1_2_a,
	MIX_COLUMNS1_2_b,
	MIX_COLUMNS1_3_a,
	MIX_COLUMNS1_3_b,
	MIX_COLUMNS1_4_a,
	MIX_COLUMNS1_4_b,
	
	SHIFT_ROWS2_a, 
	SHIFT_ROWS2_b,
	SUB_BYTES2_a,
	SUB_BYTES2_b,	
	ADD_ROUND_KEY2_a,
	ADD_ROUND_KEY2_b, 	
	MIX_COLUMNS2_1_a,
	MIX_COLUMNS2_1_b,
	MIX_COLUMNS2_2_a,
	MIX_COLUMNS2_2_b,
	MIX_COLUMNS2_3_a,
	MIX_COLUMNS2_3_b,
	MIX_COLUMNS2_4_a,
	MIX_COLUMNS2_4_b,
	
	SHIFT_ROWS3_a, 
	SHIFT_ROWS3_b,
	SUB_BYTES3_a,
	SUB_BYTES3_b,	
	ADD_ROUND_KEY3_a,
	ADD_ROUND_KEY3_b, 	
	MIX_COLUMNS3_1_a,
	MIX_COLUMNS3_1_b,
	MIX_COLUMNS3_2_a,
	MIX_COLUMNS3_2_b,
	MIX_COLUMNS3_3_a,
	MIX_COLUMNS3_3_b,
	MIX_COLUMNS3_4_a,
	MIX_COLUMNS3_4_b,
	
	SHIFT_ROWS4_a, 
	SHIFT_ROWS4_b,
	SUB_BYTES4_a,
	SUB_BYTES4_b,	
	ADD_ROUND_KEY4_a,
	ADD_ROUND_KEY4_b, 	
	MIX_COLUMNS4_1_a,
	MIX_COLUMNS4_1_b,
	MIX_COLUMNS4_2_a,
	MIX_COLUMNS4_2_b,
	MIX_COLUMNS4_3_a,
	MIX_COLUMNS4_3_b,
	MIX_COLUMNS4_4_a,
	MIX_COLUMNS4_4_b,
	
	SHIFT_ROWS5_a, 
	SHIFT_ROWS5_b,
	SUB_BYTES5_a,
	SUB_BYTES5_b,	
	ADD_ROUND_KEY5_a,
	ADD_ROUND_KEY5_b, 	
	MIX_COLUMNS5_1_a,
	MIX_COLUMNS5_1_b,
	MIX_COLUMNS5_2_a,
	MIX_COLUMNS5_2_b,
	MIX_COLUMNS5_3_a,
	MIX_COLUMNS5_3_b,
	MIX_COLUMNS5_4_a,
	MIX_COLUMNS5_4_b,
	
	SHIFT_ROWS6_a, 
	SHIFT_ROWS6_b,
	SUB_BYTES6_a,
	SUB_BYTES6_b,	
	ADD_ROUND_KEY6_a,
	ADD_ROUND_KEY6_b, 	
	MIX_COLUMNS6_1_a,
	MIX_COLUMNS6_1_b,
	MIX_COLUMNS6_2_a,
	MIX_COLUMNS6_2_b,
	MIX_COLUMNS6_3_a,
	MIX_COLUMNS6_3_b,
	MIX_COLUMNS6_4_a,
	MIX_COLUMNS6_4_b,
	
	SHIFT_ROWS7_a, 
	SHIFT_ROWS7_b,
	SUB_BYTES7_a,
	SUB_BYTES7_b,	
	ADD_ROUND_KEY7_a,
	ADD_ROUND_KEY7_b, 	
	MIX_COLUMNS7_1_a,
	MIX_COLUMNS7_1_b,
	MIX_COLUMNS7_2_a,
	MIX_COLUMNS7_2_b,
	MIX_COLUMNS7_3_a,
	MIX_COLUMNS7_3_b,
	MIX_COLUMNS7_4_a,
	MIX_COLUMNS7_4_b,
	
	SHIFT_ROWS8_a, 
	SHIFT_ROWS8_b,
	SUB_BYTES8_a,
	SUB_BYTES8_b,	
	ADD_ROUND_KEY8_a,
	ADD_ROUND_KEY8_b, 	
	MIX_COLUMNS8_1_a,
	MIX_COLUMNS8_1_b,
	MIX_COLUMNS8_2_a,
	MIX_COLUMNS8_2_b,
	MIX_COLUMNS8_3_a,
	MIX_COLUMNS8_3_b,
	MIX_COLUMNS8_4_a,
	MIX_COLUMNS8_4_b,
	
	SHIFT_ROWS9_a, 
	SHIFT_ROWS9_b,
	SUB_BYTES9_a,
	SUB_BYTES9_b,	
	ADD_ROUND_KEY9_a,
	ADD_ROUND_KEY9_b, 	
	MIX_COLUMNS9_1_a,
	MIX_COLUMNS9_1_b,
	MIX_COLUMNS9_2_a,
	MIX_COLUMNS9_2_b,
	MIX_COLUMNS9_3_a,
	MIX_COLUMNS9_3_b,
	MIX_COLUMNS9_4_a,
	MIX_COLUMNS9_4_b,
	
	SHIFT_ROWS10_a, 
	SHIFT_ROWS10_b,
	SUB_BYTES10_a,
	SUB_BYTES10_b,
	ADD_ROUND_KEY10_a,
	ADD_ROUND_KEY10_b,
	DONE
	
}   curr_state, next_state; 

always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= WAIT;
        else 
            curr_state <= next_state;
    end

always_comb
    begin
        
		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            WAIT	 				:    if (start == 1'b1)
												next_state = LD_MSG_a;
												
				LD_MSG_a				: 	  next_state = LD_MSG_b;
				LD_MSG_b				:	  next_state = ADD_ROUND_KEY0_a;
									
            ADD_ROUND_KEY0_a 	:    next_state = ADD_ROUND_KEY0_b;
				ADD_ROUND_KEY0_b 	:    next_state = SHIFT_ROWS1_a;
				
				SHIFT_ROWS1_a 		:    next_state = SHIFT_ROWS1_b;
				SHIFT_ROWS1_b 		:    next_state = SUB_BYTES1_a;
				SUB_BYTES1_a		:    next_state = SUB_BYTES1_b;
				SUB_BYTES1_b		:    next_state = ADD_ROUND_KEY1_a;
				ADD_ROUND_KEY1_a	:	  next_state = ADD_ROUND_KEY1_b;
				ADD_ROUND_KEY1_b	:	  next_state = MIX_COLUMNS1_1_a;
				MIX_COLUMNS1_1_a 	:    next_state = MIX_COLUMNS1_1_b;
				MIX_COLUMNS1_1_b 	:    next_state = MIX_COLUMNS1_2_a;
				MIX_COLUMNS1_2_a 	:    next_state = MIX_COLUMNS1_2_b;
				MIX_COLUMNS1_2_b 	:    next_state = MIX_COLUMNS1_3_a;
				MIX_COLUMNS1_3_a 	:    next_state = MIX_COLUMNS1_3_b;
				MIX_COLUMNS1_3_b 	:    next_state = MIX_COLUMNS1_4_a;
				MIX_COLUMNS1_4_a 	:    next_state = MIX_COLUMNS1_4_b;
				MIX_COLUMNS1_4_b 	:    next_state = SHIFT_ROWS2_a;
				
				SHIFT_ROWS2_a 		:    next_state = SHIFT_ROWS2_b;
				SHIFT_ROWS2_b 		:    next_state = SUB_BYTES2_a;
				SUB_BYTES2_a		:    next_state = SUB_BYTES2_b;
				SUB_BYTES2_b		:    next_state = ADD_ROUND_KEY2_a;
				ADD_ROUND_KEY2_a	:	  next_state = ADD_ROUND_KEY2_b;
				ADD_ROUND_KEY2_b	:	  next_state = MIX_COLUMNS2_1_a;
				MIX_COLUMNS2_1_a 	:    next_state = MIX_COLUMNS2_1_b;
				MIX_COLUMNS2_1_b 	:    next_state = MIX_COLUMNS2_2_a;
				MIX_COLUMNS2_2_a 	:    next_state = MIX_COLUMNS2_2_b;
				MIX_COLUMNS2_2_b 	:    next_state = MIX_COLUMNS2_3_a;
				MIX_COLUMNS2_3_a 	:    next_state = MIX_COLUMNS2_3_b;
				MIX_COLUMNS2_3_b 	:    next_state = MIX_COLUMNS2_4_a;
				MIX_COLUMNS2_4_a 	:    next_state = MIX_COLUMNS2_4_b;
				MIX_COLUMNS2_4_b 	:    next_state = SHIFT_ROWS3_a;
				
				SHIFT_ROWS3_a 		:    next_state = SHIFT_ROWS3_b;
				SHIFT_ROWS3_b 		:    next_state = SUB_BYTES3_a;
				SUB_BYTES3_a		:    next_state = SUB_BYTES3_b;
				SUB_BYTES3_b		:    next_state = ADD_ROUND_KEY3_a;
				ADD_ROUND_KEY3_a	:	  next_state = ADD_ROUND_KEY3_b;
				ADD_ROUND_KEY3_b	:	  next_state = MIX_COLUMNS3_1_a;
				MIX_COLUMNS3_1_a 	:    next_state = MIX_COLUMNS3_1_b;
				MIX_COLUMNS3_1_b 	:    next_state = MIX_COLUMNS3_2_a;
				MIX_COLUMNS3_2_a 	:    next_state = MIX_COLUMNS3_2_b;
				MIX_COLUMNS3_2_b 	:    next_state = MIX_COLUMNS3_3_a;
				MIX_COLUMNS3_3_a 	:    next_state = MIX_COLUMNS3_3_b;
				MIX_COLUMNS3_3_b 	:    next_state = MIX_COLUMNS3_4_a;
				MIX_COLUMNS3_4_a 	:    next_state = MIX_COLUMNS3_4_b;
				MIX_COLUMNS3_4_b 	:    next_state = SHIFT_ROWS4_a;
				
				SHIFT_ROWS4_a 		:    next_state = SHIFT_ROWS4_b;
				SHIFT_ROWS4_b 		:    next_state = SUB_BYTES4_a;
				SUB_BYTES4_a		:    next_state = SUB_BYTES4_b;
				SUB_BYTES4_b		:    next_state = ADD_ROUND_KEY4_a;
				ADD_ROUND_KEY4_a	:	  next_state = ADD_ROUND_KEY4_b;
				ADD_ROUND_KEY4_b	:	  next_state = MIX_COLUMNS4_1_a;
				MIX_COLUMNS4_1_a 	:    next_state = MIX_COLUMNS4_1_b;
				MIX_COLUMNS4_1_b 	:    next_state = MIX_COLUMNS4_2_a;
				MIX_COLUMNS4_2_a 	:    next_state = MIX_COLUMNS4_2_b;
				MIX_COLUMNS4_2_b 	:    next_state = MIX_COLUMNS4_3_a;
				MIX_COLUMNS4_3_a 	:    next_state = MIX_COLUMNS4_3_b;
				MIX_COLUMNS4_3_b 	:    next_state = MIX_COLUMNS4_4_a;
				MIX_COLUMNS4_4_a 	:    next_state = MIX_COLUMNS4_4_b;
				MIX_COLUMNS4_4_b 	:    next_state = SHIFT_ROWS5_a;
				
				SHIFT_ROWS5_a 		:    next_state = SHIFT_ROWS5_b;
				SHIFT_ROWS5_b 		:    next_state = SUB_BYTES5_a;
				SUB_BYTES5_a		:    next_state = SUB_BYTES5_b;
				SUB_BYTES5_b		:    next_state = ADD_ROUND_KEY5_a;
				ADD_ROUND_KEY5_a	:	  next_state = ADD_ROUND_KEY5_b;
				ADD_ROUND_KEY5_b	:	  next_state = MIX_COLUMNS5_1_a;
				MIX_COLUMNS5_1_a 	:    next_state = MIX_COLUMNS5_1_b;
				MIX_COLUMNS5_1_b 	:    next_state = MIX_COLUMNS5_2_a;
				MIX_COLUMNS5_2_a 	:    next_state = MIX_COLUMNS5_2_b;
				MIX_COLUMNS5_2_b 	:    next_state = MIX_COLUMNS5_3_a;
				MIX_COLUMNS5_3_a 	:    next_state = MIX_COLUMNS5_3_b;
				MIX_COLUMNS5_3_b 	:    next_state = MIX_COLUMNS5_4_a;
				MIX_COLUMNS5_4_a 	:    next_state = MIX_COLUMNS5_4_b;
				MIX_COLUMNS5_4_b 	:    next_state = SHIFT_ROWS6_a;
				
				SHIFT_ROWS6_a 		:    next_state = SHIFT_ROWS6_b;
				SHIFT_ROWS6_b 		:    next_state = SUB_BYTES6_a;
				SUB_BYTES6_a		:    next_state = SUB_BYTES6_b;
				SUB_BYTES6_b		:    next_state = ADD_ROUND_KEY6_a;
				ADD_ROUND_KEY6_a	:	  next_state = ADD_ROUND_KEY6_b;
				ADD_ROUND_KEY6_b	:	  next_state = MIX_COLUMNS6_1_a;
				MIX_COLUMNS6_1_a 	:    next_state = MIX_COLUMNS6_1_b;
				MIX_COLUMNS6_1_b 	:    next_state = MIX_COLUMNS6_2_a;
				MIX_COLUMNS6_2_a 	:    next_state = MIX_COLUMNS6_2_b;
				MIX_COLUMNS6_2_b 	:    next_state = MIX_COLUMNS6_3_a;
				MIX_COLUMNS6_3_a 	:    next_state = MIX_COLUMNS6_3_b;
				MIX_COLUMNS6_3_b 	:    next_state = MIX_COLUMNS6_4_a;
				MIX_COLUMNS6_4_a 	:    next_state = MIX_COLUMNS6_4_b;
				MIX_COLUMNS6_4_b 	:    next_state = SHIFT_ROWS7_a;
				
				SHIFT_ROWS7_a 		:    next_state = SHIFT_ROWS7_b;
				SHIFT_ROWS7_b 		:    next_state = SUB_BYTES7_a;
				SUB_BYTES7_a		:    next_state = SUB_BYTES7_b;
				SUB_BYTES7_b		:    next_state = ADD_ROUND_KEY7_a;
				ADD_ROUND_KEY7_a	:	  next_state = ADD_ROUND_KEY7_b;
				ADD_ROUND_KEY7_b	:	  next_state = MIX_COLUMNS7_1_a;
				MIX_COLUMNS7_1_a 	:    next_state = MIX_COLUMNS7_1_b;
				MIX_COLUMNS7_1_b 	:    next_state = MIX_COLUMNS7_2_a;
				MIX_COLUMNS7_2_a 	:    next_state = MIX_COLUMNS7_2_b;
				MIX_COLUMNS7_2_b 	:    next_state = MIX_COLUMNS7_3_a;
				MIX_COLUMNS7_3_a 	:    next_state = MIX_COLUMNS7_3_b;
				MIX_COLUMNS7_3_b 	:    next_state = MIX_COLUMNS7_4_a;
				MIX_COLUMNS7_4_a 	:    next_state = MIX_COLUMNS7_4_b;
				MIX_COLUMNS7_4_b 	:    next_state = SHIFT_ROWS8_a;
				
				SHIFT_ROWS8_a 		:    next_state = SHIFT_ROWS8_b;
				SHIFT_ROWS8_b 		:    next_state = SUB_BYTES8_a;
				SUB_BYTES8_a		:    next_state = SUB_BYTES8_b;
				SUB_BYTES8_b		:    next_state = ADD_ROUND_KEY8_a;
				ADD_ROUND_KEY8_a	:	  next_state = ADD_ROUND_KEY8_b;
				ADD_ROUND_KEY8_b	:	  next_state = MIX_COLUMNS8_1_a;
				MIX_COLUMNS8_1_a 	:    next_state = MIX_COLUMNS8_1_b;
				MIX_COLUMNS8_1_b 	:    next_state = MIX_COLUMNS8_2_a;
				MIX_COLUMNS8_2_a 	:    next_state = MIX_COLUMNS8_2_b;
				MIX_COLUMNS8_2_b 	:    next_state = MIX_COLUMNS8_3_a;
				MIX_COLUMNS8_3_a 	:    next_state = MIX_COLUMNS8_3_b;
				MIX_COLUMNS8_3_b 	:    next_state = MIX_COLUMNS8_4_a;
				MIX_COLUMNS8_4_a 	:    next_state = MIX_COLUMNS8_4_b;
				MIX_COLUMNS8_4_b 	:    next_state = SHIFT_ROWS9_a;
				
				SHIFT_ROWS9_a 		:    next_state = SHIFT_ROWS9_b;
				SHIFT_ROWS9_b 		:    next_state = SUB_BYTES9_a;
				SUB_BYTES9_a		:    next_state = SUB_BYTES9_b;
				SUB_BYTES9_b		:    next_state = ADD_ROUND_KEY9_a;
				ADD_ROUND_KEY9_a	:	  next_state = ADD_ROUND_KEY9_b;
				ADD_ROUND_KEY9_b	:	  next_state = MIX_COLUMNS9_1_a;
				MIX_COLUMNS9_1_a 	:    next_state = MIX_COLUMNS9_1_b;
				MIX_COLUMNS9_1_b 	:    next_state = MIX_COLUMNS9_2_a;
				MIX_COLUMNS9_2_a 	:    next_state = MIX_COLUMNS9_2_b;
				MIX_COLUMNS9_2_b 	:    next_state = MIX_COLUMNS9_3_a;
				MIX_COLUMNS9_3_a 	:    next_state = MIX_COLUMNS9_3_b;
				MIX_COLUMNS9_3_b 	:    next_state = MIX_COLUMNS9_4_a;
				MIX_COLUMNS9_4_a 	:    next_state = MIX_COLUMNS9_4_b;
				MIX_COLUMNS9_4_b 	:    next_state = SHIFT_ROWS10_a;
				
				SHIFT_ROWS10_a 	:    next_state = SHIFT_ROWS10_b;
				SHIFT_ROWS10_b 	:    next_state = SUB_BYTES10_a;
				SUB_BYTES10_a		:    next_state = SUB_BYTES10_b;
				SUB_BYTES10_b		:    next_state = ADD_ROUND_KEY10_a;
				ADD_ROUND_KEY10_a	:	  next_state = ADD_ROUND_KEY10_b;
				ADD_ROUND_KEY10_b	:	  next_state = DONE;
				DONE					:	  if(start == 1'b0)
													next_state = WAIT;
        endcase
		  
	 case (curr_state) 
				
	   	   WAIT: 
	         begin
               key_sel = 4'd11;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
		      end
				
				
				
				LD_MSG_a : 
					begin
						key_sel = 4'd11;
						func_sel = 3'b100;
						Reg_load = 1'b0;
						done = 1'b0;
						COL_SEL = 3'b100;
		         end
					
				LD_MSG_b	:
				begin
					key_sel = 4'd11;
					func_sel = 3'b100;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
		      end
				
				ADD_ROUND_KEY0_a:
				begin
					key_sel = 4'd0;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY1_a:
				begin
					key_sel = 4'd1;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY2_a:
				begin
					key_sel = 4'd2;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY3_a:
				begin
					key_sel = 4'd3;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY4_a:
				begin
					key_sel = 4'd4;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY5_a:
				begin
					key_sel = 4'd5;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY6_a:
				begin
					key_sel = 4'd6;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY7_a:
				begin
					key_sel = 4'd7;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY8_a:
				begin
					key_sel = 4'd8;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY9_a:
				begin
					key_sel = 4'd9;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY10_a:
				begin
					key_sel = 4'd10;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				
				
				ADD_ROUND_KEY0_b:
				begin
					key_sel = 4'd0;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY1_b:
				begin
					key_sel = 4'd1;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY2_b:
				begin
					key_sel = 4'd2;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY3_b:
				begin
					key_sel = 4'd3;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY4_b:
				begin
					key_sel = 4'd4;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY5_b:
				begin
					key_sel = 4'd5;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY6_b:
				begin
					key_sel = 4'd6;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY7_b:
				begin
					key_sel = 4'd7;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY8_b:
				begin
					key_sel = 4'd8;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY9_b:
				begin
					key_sel = 4'd9;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				ADD_ROUND_KEY10_b:
				begin
					key_sel = 4'd10;
					func_sel = 3'b0;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				SHIFT_ROWS1_a, SHIFT_ROWS2_a, SHIFT_ROWS3_a, SHIFT_ROWS4_a, SHIFT_ROWS5_a, SHIFT_ROWS6_a, SHIFT_ROWS7_a, SHIFT_ROWS8_a, SHIFT_ROWS9_a, SHIFT_ROWS10_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b01;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				SHIFT_ROWS1_b, SHIFT_ROWS2_b, SHIFT_ROWS3_b, SHIFT_ROWS4_b, SHIFT_ROWS5_b, SHIFT_ROWS6_b, SHIFT_ROWS7_b, SHIFT_ROWS8_b, SHIFT_ROWS9_b, SHIFT_ROWS10_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b01;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				SUB_BYTES1_a, SUB_BYTES2_a, SUB_BYTES3_a, SUB_BYTES4_a, SUB_BYTES5_a, SUB_BYTES6_a, SUB_BYTES7_a, SUB_BYTES8_a, SUB_BYTES9_a, SUB_BYTES10_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b011;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				SUB_BYTES1_b, SUB_BYTES2_b, SUB_BYTES3_b, SUB_BYTES4_b, SUB_BYTES5_b, SUB_BYTES6_b, SUB_BYTES7_b, SUB_BYTES8_b, SUB_BYTES9_b, SUB_BYTES10_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b011;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
				
				MIX_COLUMNS1_1_a, MIX_COLUMNS2_1_a, MIX_COLUMNS3_1_a, MIX_COLUMNS4_1_a, MIX_COLUMNS5_1_a, MIX_COLUMNS6_1_a, MIX_COLUMNS7_1_a, MIX_COLUMNS8_1_a, MIX_COLUMNS9_1_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b0;
				end
				
				MIX_COLUMNS1_1_b, MIX_COLUMNS2_1_b, MIX_COLUMNS3_1_b, MIX_COLUMNS4_1_b, MIX_COLUMNS5_1_b, MIX_COLUMNS6_1_b, MIX_COLUMNS7_1_b, MIX_COLUMNS8_1_b, MIX_COLUMNS9_1_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b0;
				end
				
				MIX_COLUMNS1_2_a, MIX_COLUMNS2_2_a, MIX_COLUMNS3_2_a, MIX_COLUMNS4_2_a, MIX_COLUMNS5_2_a, MIX_COLUMNS6_2_a, MIX_COLUMNS7_2_a, MIX_COLUMNS8_2_a, MIX_COLUMNS9_2_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b01;
				end
				
				MIX_COLUMNS1_2_b, MIX_COLUMNS2_2_b, MIX_COLUMNS3_2_b, MIX_COLUMNS4_2_b, MIX_COLUMNS5_2_b, MIX_COLUMNS6_2_b, MIX_COLUMNS7_2_b, MIX_COLUMNS8_2_b, MIX_COLUMNS9_2_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b01;
				end
				
				MIX_COLUMNS1_3_a, MIX_COLUMNS2_3_a, MIX_COLUMNS3_3_a, MIX_COLUMNS4_3_a, MIX_COLUMNS5_3_a, MIX_COLUMNS6_3_a, MIX_COLUMNS7_3_a, MIX_COLUMNS8_3_a, MIX_COLUMNS9_3_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b010;
				end
				
				MIX_COLUMNS1_3_b, MIX_COLUMNS2_3_b, MIX_COLUMNS3_3_b, MIX_COLUMNS4_3_b, MIX_COLUMNS5_3_b, MIX_COLUMNS6_3_b, MIX_COLUMNS7_3_b, MIX_COLUMNS8_3_b, MIX_COLUMNS9_3_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b010;
				end
				
				MIX_COLUMNS1_4_a, MIX_COLUMNS2_4_a, MIX_COLUMNS3_4_a, MIX_COLUMNS4_4_a, MIX_COLUMNS5_4_a, MIX_COLUMNS6_4_a, MIX_COLUMNS7_4_a, MIX_COLUMNS8_4_a, MIX_COLUMNS9_4_a:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b011;
				end
				
				MIX_COLUMNS1_4_b, MIX_COLUMNS2_4_b, MIX_COLUMNS3_4_b, MIX_COLUMNS4_4_b, MIX_COLUMNS5_4_b, MIX_COLUMNS6_4_b, MIX_COLUMNS7_4_b, MIX_COLUMNS8_4_b, MIX_COLUMNS9_4_b:
				begin
					key_sel = 4'd11;
					func_sel = 3'b010;
					Reg_load = 1'b1;
					done = 1'b0;
					COL_SEL = 3'b011;
				end
				
				DONE:
				begin
					key_sel = 4'd11;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b1;
					COL_SEL = 3'b100;
				end
				
				default:
				begin
					key_sel = 4'd11;
					func_sel = 3'b0;
					Reg_load = 1'b0;
					done = 1'b0;
					COL_SEL = 3'b100;
				end
        endcase
    end
endmodule
