/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic Clk,
	
	// Avalon Reset Input
	input logic Reset,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

logic r, w;
logic [31:0] OUT;

assign r = AVL_READ & AVL_CS;
assign w = AVL_WRITE & AVL_CS;

always_comb
begin
	case(r)
		1'b0:
			AVL_READDATA <= 32'b0;
		1'b1:
			AVL_READDATA <= OUT;
	endcase
end

registerFile		Register_mod(.Clk(Clk), .Reset(Reset), .byte_en(AVL_BYTE_EN), .select(AVL_ADDR), .D(AVL_WRITEDATA), .Q(OUT), .write(w), .DATA_EXPORT(EXPORT_DATA));

endmodule




module registerFile(

	input logic [3:0] select, byte_en,
	input logic [31:0] D,
	input logic Clk, Reset, write,
	output logic [31:0] Q, DATA_EXPORT

);

logic LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7, LD8, LD9, LD10, LD11, LD12, LD13, LD14, LD15;
logic [31:0] Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, D0;
logic [127:0] full_decript;


AES		DECRIPTION(.CLK(Clk), .RESET(Reset), .AES_START(Q14[0]), .AES_DONE(D0[0]), .AES_KEY({Q0[31:0], Q1[31:0], Q2[31:0], Q3[31:0]}), .AES_MSG_ENC({Q4[31:0], Q5[31:0], Q6[31:0], Q7[31:0]}), .AES_MSG_DEC(full_decript));

always_comb
begin
	
	case(select)
		4'b0000:
		begin
			LD0 <= write;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q0;
		end
		4'b0001:
		begin
			LD0 <= 1'b0;
			LD1 <= write;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q1;
		end
		4'b0010:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= write;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q2;
		end
		4'b0011:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= write;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q3;
		end
		4'b0100:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= write;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q4;
		end	
		4'b0101:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= write;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q5;
		end
		4'b0110:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= write;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q6;
		end
		4'b0111:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= write;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q7;
		end
		4'b1000:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= write;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q8;
		end
		4'b1001:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= write;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q9;
		end
		4'b1010:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= write;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q10;
		end
		4'b1011:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= write;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q11;
		end
		4'b1100:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= write;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q12;
		end
		4'b1101:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= write;
			LD14 <= 1'b0;
			LD15 <= 1'b0;
			Q <= Q13;
		end
		4'b1110:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= write;
			LD15 <= 1'b0;
			Q <= Q14;
		end
		4'b1111:
		begin
			LD0 <= 1'b0;
			LD1 <= 1'b0;
			LD2 <= 1'b0;
			LD3 <= 1'b0;
			LD4 <= 1'b0;
			LD5 <= 1'b0;
			LD6 <= 1'b0;
			LD7 <= 1'b0;
			LD8 <= 1'b0;
			LD9 <= 1'b0;
			LD10 <= 1'b0;
			LD11 <= 1'b0;
			LD12 <= 1'b0;
			LD13 <= 1'b0;
			LD14 <= 1'b0;
			LD15 <= write;
			Q <= Q15;
		end

	endcase

end

assign DATA_EXPORT = {Q4[31:16], Q7[15:0]};

Reg_32	AES_KEY0(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD0), .Q(Q0));
Reg_32	AES_KEY1(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD1), .Q(Q1));
Reg_32	AES_KEY2(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD2), .Q(Q2));
Reg_32	AES_KEY3(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD3), .Q(Q3));
Reg_32	AES_MSG_EN0(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD4), .Q(Q4));
Reg_32	AES_MSG_EN1(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD5), .Q(Q5));
Reg_32	AES_MSG_EN2(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD6), .Q(Q6));
Reg_32	AES_MSG_EN3(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD7), .Q(Q7));
Reg_32	AES_MSG_DE0(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(full_decript[127:96]), .Load(LD8), .Q(Q8));
Reg_32	AES_MSG_DE1(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(full_decript[95:64]), .Load(LD9), .Q(Q9));
Reg_32	AES_MSG_DE2(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(full_decript[63:32]), .Load(LD10), .Q(Q10));
Reg_32	AES_MSG_DE3(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(full_decript[31:0]), .Load(LD11), .Q(Q11));
Reg_32	jun1(.Clk(Clk), .Reset(Reset), .D(D), .byte_en(byte_en), .Load(LD12), .Q(Q12));
Reg_32	jun0(.Clk(Clk), .Reset(Reset), .D(D), .byte_en(byte_en), .Load(LD13), .Q(Q13));
Reg_32	AES_START(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D), .Load(LD14), .Q(Q14));
Reg_32	AES_DONE(.Clk(Clk), .Reset(Reset), .byte_en(byte_en), .D(D0), .Load(LD15), .Q(Q15));


endmodule
