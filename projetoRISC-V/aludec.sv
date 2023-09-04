module aludec (input logic opb5, funct7b5,
					input logic [1:0] ALUOp,
					input logic [2:0] funct3,
					output logic [2:0] ALUControl,
					output logic [1:0] ALUOp_DBG,
					output logic [2:0] ALUCont_DBG, funct3_DBG);

	logic RtypeSub;
	assign RtypeSub = funct7b5 & opb5; // True para instrucao R-type sub
	
	always_comb
		case (ALUOp)
			2'b00:   ALUControl = 3'b000; // add
			2'b01:   ALUControl = 3'b001; // sub
			default: case(funct3) // R-tyoe or I-type ALU
			3'b000:  ALUControl = RtypeSub ? 3'b001 : 3'b000; // sub : add
			3'b010:  ALUControl = 3'b101; // slt
			3'b110:  ALUControl = 3'b011; // or
			3'b111:  ALUControl = 3'b010; // and
			default: ALUControl = 3'b111; // ???
			endcase
		endcase
	
	assign ALUOp_DBG = ALUOp;
	assign ALUCont_DBG = ALUControl;
	assign funct3_DBG = funct3;
	
endmodule
