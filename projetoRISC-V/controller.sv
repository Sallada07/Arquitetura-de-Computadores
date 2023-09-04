module controller(input logic Zero, func7b5,
						input logic [2:0] funct3,
						input logic [6:0] op,
						output logic MemWrite, PCSrc, ALUSrc, RegWrite, Jump,
						output logic [1:0] ResultSrc, ImmSrc,
						output logic [2:0] ALUControl,
						output logic [1:0] ALUOp_DBG,
						output logic [2:0] ALUCont_DBG, funct3_DBG);
						
	logic [1:0] ALUOp;
	logic Branch;
	
	maindec md (op, 
					MemWrite, Branch, ALUSrc, RegWrite, Jump, ResultSrc, ImmSrc, ALUOp);
						
	aludec  ad (op[5], funct7b5, ALUOp, funct3, 
					ALUControl,
					ALUOp_DBG, ALUCont_DBG, funct3_DBG);

	assign PCSrc = Branch & Zero | Jump;
	
endmodule  // Falta testar de verdade esse controller
