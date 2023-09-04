module imem (input [31:0] a,
				 output [31:0] rd); // Read Data
	//    tamanho    numero  (de resgistradores)
	logic [31:0] RAM [63:0];
	initial
		$readmemh("riscvtest.txt", RAM);  // Quando for colocar as funções usa o $readmemh (hexadecimal)
	assign rd = RAM[a[31:2]]; // Quero mudar isso
endmodule
