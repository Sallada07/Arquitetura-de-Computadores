module riscvsingle (input logic clk, rst,
						  input logic [31:0] Instr, ReadData,
						  output logic MemWrite,
						  output logic [31:0] PC, ALUResult, WriteData, 
						  output logic [1:0] ALUOp_DBG,
						  output logic [2:0] ALUCont_DBG, funct3_DBG,
						  output logic [31:0] SrcA_DBG, SrcB_DBG);
	
	logic ALUSrc, RegWrite, Jump, Zero;
	logic [1:0] ResultSrc, ImmSrc;
	logic [2:0] ALUControl;
	
	controller c (Zero, Instr[30], Instr[14:12], Instr[6:0], 
					  MemWrite, PCSrc, ALUSrc, RegWrite, Jump, ResultSrc, ImmSrc, ALUControl,
					  ALUOp_DBG, ALUCont_DBG, funct3_DBG);
	
	datapath  dp (clk, rst, PCSrc, ALUSrc, RegWrite, ResultSrc, ImmSrc, ALUControl, Instr, ReadData,
					  Zero, PC, ALUResult, WriteData,
					  SrcA_DBG, SrcB_DBG);

endmodule // Falta testar de verdade
