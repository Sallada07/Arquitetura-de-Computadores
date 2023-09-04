module alu #(parameter WIDHT = 32)(input logic [WIDHT-1:0] a, b,
			  input logic [2:0] alucontrol,
			  output logic [WIDHT-1:0] result,
			  output logic Z, N, C, V,
			  output logic [WIDHT-1:0] SrcA_DBG, SrcB_DBG);
			  
logic [WIDHT-1:0] condinvb, sum;
logic cout, isAddSub;  

assign condinvb = alucontrol[0] ? ~b : b;
assign {cout, sum} = {a + condinvb + alucontrol[0]};
assign isAddSub = &(~alucontrol[2:1]) | (~alucontrol[1] & alucontrol[0]);

always_comb
	case (alucontrol)
		3'b000: result = sum;               // add
		3'b001: result = sum;               // sub
		3'b010: result = a & b;             // and 
		3'b011: result = a | b;             // or
		3'b101: result = sum[WIDHT-1] ^ V;  // slt
		default: result = {(WIDHT-1){1'bx}};
	endcase

assign Z = (result == {(WIDHT-1){1'b0}});
assign V = ~(alucontrol[0] ^ a[WIDHT-1] ^ b[WIDHT-1]) & (a[WIDHT-1] ^ sum[WIDHT-1]) & isAddSub;  // Eu mudei aqui (caso dê problema)
assign C = cout & ~alucontrol[1];  // Parece não estar funcionando
assign N = result[WIDHT-1];

assign SrcA_DBG = a;
assign SrcB_DBG = b;

endmodule
