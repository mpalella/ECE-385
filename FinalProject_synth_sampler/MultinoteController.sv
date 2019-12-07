module MultinoteController(

input logic Clk, Reset, sample_clk, init, done1, done2, done3, done4,
output logic MAR_LD, MDR_LD1, MDR_LD2, MDR_LD3, MDR_LD4, OE, 
output logic [1:0] select

);

enum logic [2:0] {

WAIT_START,
WAIT_SCLK_HIGH,
WAIT_SCLK_LOW,
SANC1_WAIT,
LOAD_MAR1,
RAM_WAIT1_1,
RAM_WAIT1_2,
STORE_MDR1

}   curr_state, next_state;

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= WAIT_START;
        else 
            curr_state <= next_state;
    end

	 
always_comb
    begin
        
			next_state  = curr_state;	
			unique case (curr_state) 
			
					WAIT_START 			: if(init)
												next_state = WAIT_SCLK_LOW;
												
					WAIT_SCLK_HIGH		: if(sample_clk)
												next_state = WAIT_SCLK_HIGH;
												
					SANC1_WAIT			: if(done1)
												next_state = LOAD_MAR1;
												
					LOAD_MAR1			:  next_state = RAM_WAIT1_1;
					
					RAM_WAIT1_1       :  next_state = RAM_WAIT1_2;
					
					RAM_WAIT1_2			:  next_state = STORE_MDR1;
					
					STORE_MDR1			:  next_state = WAIT_SCLK_LOW;
					
					WAIT_SCLK_LOW		:  if(~sample_clk)
													next_state = SANC1_WAIT;
										
					
												
			endcase
			
			
			
			case (curr_state)
				WAIT_START, WAIT_SCLK_HIGH, WAIT_SCLK_LOW, SANC1_WAIT:
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				LOAD_MAR1 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b1;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				RAM_WAIT1_1 :
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				RAM_WAIT1_2 :
				begin
					OE = 1'b0;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b0;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
				STORE_MDR1 :
				begin
					OE = 1'b1;
					MAR_LD = 1'b0;
					MDR_LD1 = 1'b1;
					MDR_LD2 = 1'b0;
					MDR_LD3 = 1'b0;
					MDR_LD4 = 1'b0;
					select= 2'b00;
				end
				
			endcase
	end
	 
endmodule
