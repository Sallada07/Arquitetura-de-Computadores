module mux3 #(parameter WIDTH = 8)(input [1:0] s,
											  input [WIDTH-1:0] d0, d1, d2,
											  output [WIDTH-1:0] out);
	assign out = &s ? 0 : (s[1] ? d2 : (s[0] ? d1: d0));
endmodule
