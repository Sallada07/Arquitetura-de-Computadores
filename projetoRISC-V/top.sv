module top (input logic clk, rst,
				output logic MemWrite,
				output logic [31:0] WriteData, DataAdr,
				output logic [1:0] ALUOp_DBG,
				output logic [2:0] ALUCont_DBG, funct3_DBG,
				output logic [31:0] PC_DBG, Instr_DBG, SrcA_DBG, SrcB_DBG);
				
	logic [31:0] PC, Instr, ReadData;
	
	riscvsingle rvsingle (clk, rst, Instr, ReadData,
								 MemWrite, PC, DataAdr, WriteData,
								 ALUOp_DBG, ALUCont_DBG, funct3_DBG, SrcA_DBG, SrcB_DBG);
	
	imem imem(PC, 
				 Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData,
				 ReadData);
				 
	assign PC_DBG = PC;
	assign Instr_DBG = Instr;
	
endmodule
