module dmem(input logic clk, we,
				input logic [31:0] a, wd,
				output logic [31:0] rd);
	logic [31:0] RAM[63:1];
	assign rd = RAM[a[31:2]]; // Verificar depois as ondas, estão estranhas
	always_ff @(posedge clk) begin
		if (we) RAM[a[31:2]] <= wd;
		$writememh("memory_hex.txt", RAM);
	end
endmodule
