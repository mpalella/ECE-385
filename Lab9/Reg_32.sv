module Reg_32 (input  logic Clk, Reset, Load,
				  input logic  [3:0] byte_en,
              input  logic [31:0]  D,
              output logic [31:0]  Q);

	 logic [31:0] byte_control;
	 
	 assign byte_control[7:0] = {byte_en[0], byte_en[0], byte_en[0], byte_en[0], byte_en[0], byte_en[0], byte_en[0], byte_en[0]};
	 assign byte_control[15:8] = {byte_en[1], byte_en[1], byte_en[1], byte_en[1], byte_en[1], byte_en[1], byte_en[1], byte_en[1]};
	 assign byte_control[23:16] = {byte_en[2], byte_en[2], byte_en[2], byte_en[2], byte_en[2], byte_en[2], byte_en[2], byte_en[2]};
	 assign byte_control[31:24] = {byte_en[3], byte_en[3], byte_en[3], byte_en[3], byte_en[3], byte_en[3], byte_en[3], byte_en[3]};
				  
    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Q <= 32'h0;
		 else if (Load)
			  Q <= (D & byte_control);
    end
	 
	 

endmodule
