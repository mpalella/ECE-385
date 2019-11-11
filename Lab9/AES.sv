/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);


logic [1407:0] KeySchedule;
logic [3:0]		key_select;
logic [2:0]		function_select;
logic [2:0]		col_sel;
logic [127:0]	key, ISR, ARK, ISB;
logic				mess_ld;
logic [31:0]	IMC_out, IMC0, IMC1, IMC2, IMC3, M_OUT0, M_OUT1, M_OUT2, M_OUT3, Col_Mux_Out;



KeyExpansion			key_expansion(.clk(CLK), .Cipherkey(AES_KEY), .KeySchedule(KeySchedule));
KeyMux					KEY_MUX(.key_expand(KeySchedule), .select(key_select), .out(key));
MessageStorage			MESS_REG(.Clk(CLK), .Reset(RESET), .Ld_Reg(mess_ld), .select(function_select),.Mess0(AES_MSG_ENC[127:96]), .Mess1(AES_MSG_ENC[95:64]), .Mess2(AES_MSG_ENC[63:32]), .Mess3(AES_MSG_ENC[31:0]), .AddRoundKey0(ARK[127:96]), .AddRoundKey1(ARK[95:64]), .AddRoundKey2(ARK[63:32]), .AddRoundKey3(ARK[31:0]), .InvShiftRow0(ISR[127:96]), .InvShiftRow1(ISR[95:64]), .InvShiftRow2(ISR[63:32]), .InvShiftRow3(ISR[31:0]), .InvMixCollumn0(IMC0), .InvMixCollumn1(IMC1), .InvMixCollumn2(IMC2), .InvMixCollumn3(IMC3), .InvSubByte0(ISB[127:96]), .InvSubByte1(ISB[95:64]), .InvSubByte2(ISB[63:32]), .InvSubByte3(ISB[31:0]), .C0(AES_MSG_DEC[127:96]), .C1(AES_MSG_DEC[95:64]), .C2(AES_MSG_DEC[63:32]), .C3(AES_MSG_DEC[31:0]));
InvShiftRows			SHIFTROWS(.data_in(AES_MSG_DEC), .data_out(ISR));
InvMixColumns			MIX_COLUMNS0(.in(Col_Mux_Out), .out(IMC_out));
Mux4						MIX_COLUMN_MUX(.select(col_sel), .D0(AES_MSG_DEC[127:96]), .D1(AES_MSG_DEC[95:64]), .D2(AES_MSG_DEC[63:32]), .D3(AES_MSG_DEC[31:0]), .Q(Col_Mux_Out));
selector					COL_SEL(.select(col_sel), .col_in(IMC_out), .state(AES_MSG_DEC), .Out0(IMC0), .Out1(IMC1), .Out2(IMC2), .Out3(IMC3));
AddRoundKey				ADD_ROUND_KEY0(.state(AES_MSG_DEC), .round_key(key), .result(ARK));
InvSubBytesArray		SUB_BYTES(.clk(CLK), .in(AES_MSG_DEC), .out(ISB));
Controller				CONTROL(.Clk(CLK), .Reset(RESET), .start(AES_START), .done(AES_DONE), .key_sel(key_select), .func_sel(function_select), .Reg_load(mess_ld), .COL_SEL(col_sel));


endmodule


