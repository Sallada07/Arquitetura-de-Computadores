module datapath(input logic clk, rst, PCSrc, ALUSrc, RegWrite,
					 input logic [1:0] ResultSrc, ImmSrc,
					 input logic [2:0] ALUControl,
					 input logic [31:0] Instr, ReadData,
					 output logic Zero,
					 output logic [31:0] PC, ALUResult, WriteData,
					 output logic [31:0] SrcA_DBG, SrcB_DBG);
					 
	logic [31:0] PCNext, PCPlus4, PCTarget, ImmExt, SrcA, SrcB, Result;
	
	// Proximo PC logic
	flopr #(32) pcreg (clk, rst, PCNext, PC);
	adder #(32) pcadd4 (1'b0, PC, 32'd4, PCPlus4);
	adder #(32) pcaddbranch (1'b0, PC, ImmExt, PCTarget);
	mux2 #(32)  pcmux (PCPlus4, PCTarget, PCSrc, PCNext);
	
	// register file logic
	regfile rf (clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, SrcA, WriteData);
	extend ext (Instr[31:7], ImmSrc, ImmExt);
	
	// ALU logic
	mux2 #(32) srcbmux (WriteData, ImmExt, ALUSrc, SrcB);
	alu        alu (.a(SrcA), .b(SrcB), .alucontrol(ALUControl), .result(ALUResult), .Z(Zero), .SrcA_DBG(SrcA_DBG), .SrcB_DBG(SrcB_DBG)); // Falta implementar as outras flags
	mux3 #(32) resultmux (ResultSrc, ALUResult, ReadData, PCPlus4, Result);
	
endmodule // Falta testar de verdade
