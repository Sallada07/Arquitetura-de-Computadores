module regfile(input logic clk, we3,          // write_enable
					input logic [4:0] a1, a2, a3, 
					input logic [31:0] wd3,        // write_data
					output logic [31:0] rd1, rd2);
	logic [31:0] rf[31:0];
	always_ff @(posedge clk)
		if (we3) rf[a3] <= wd3;
	assign rd1 = (a1 != 0) ? rf[a1] : 0;  // x0 = 0 sempre!
	assign rd2 = (a2 != 0) ? rf[a2] : 0;
endmodule
