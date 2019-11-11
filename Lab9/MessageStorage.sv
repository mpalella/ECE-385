module MessageStorage(

input logic[2:0] select,
input logic Ld_Reg, Clk, Reset,
input logic[31:0] AddRoundKey0,
input logic[31:0] AddRoundKey1,
input logic[31:0] AddRoundKey2,
input logic[31:0] AddRoundKey3,
input logic[31:0] InvShiftRow0,
input logic[31:0] InvShiftRow1,
input logic[31:0] InvShiftRow2,
input logic[31:0] InvShiftRow3,
input logic[31:0] InvMixCollumn0,
input logic[31:0] InvMixCollumn1,
input logic[31:0] InvMixCollumn2,
input logic[31:0] InvMixCollumn3,
input logic[31:0] InvSubByte0,
input logic[31:0] InvSubByte1,
input logic[31:0] InvSubByte2,
input logic[31:0] InvSubByte3,
input logic[31:0] Mess0,
input logic[31:0] Mess1,
input logic[31:0] Mess2,
input logic[31:0] Mess3,

output logic [31:0] C0, C1, C2, C3
);

logic [31:0] m0, m1, m2, m3;
logic [3:0] byte_in;

assign byte_in = 4'b1111;

always_comb
	begin
		case(select)
			3'b000 : 
				begin
					m0 = AddRoundKey0;
					m1 = AddRoundKey1;
					m2 = AddRoundKey2;
					m3 = AddRoundKey3;
				end
				
			3'b001 : 
				begin
					m0 = InvShiftRow0;
					m1 = InvShiftRow1;
					m2 = InvShiftRow2;
					m3 = InvShiftRow3;
				end
				
			3'b010 : 
				begin
					m0 = InvMixCollumn0;
					m1 = InvMixCollumn1;
					m2 = InvMixCollumn2;
					m3 = InvMixCollumn3;
				end
				
			3'b011 : 
				begin
					m0 = InvSubByte0;
					m1 = InvSubByte1;
					m2 = InvSubByte2;
					m3 = InvSubByte3;
				end
			
			3'b100 : 
				begin
					m0 = Mess0;
					m1 = Mess1;
					m2 = Mess2;
					m3 = Mess3;
				end
				
			default:
			begin
				m0 = Mess0;
				m1 = Mess1;
				m2 = Mess2;
				m3 = Mess3;
			end
		endcase
	end 
	
Reg_32		Word0(.Clk(Clk), .Reset(Reset), .Load(Ld_Reg), .byte_en(byte_in), .D(m0), .Q(C0));
Reg_32		Word1(.Clk(Clk), .Reset(Reset), .Load(Ld_Reg), .byte_en(byte_in), .D(m1), .Q(C1));
Reg_32		Word2(.Clk(Clk), .Reset(Reset), .Load(Ld_Reg), .byte_en(byte_in), .D(m2), .Q(C2));
Reg_32		Word3(.Clk(Clk), .Reset(Reset), .Load(Ld_Reg), .byte_en(byte_in), .D(m3), .Q(C3));

endmodule
