module adder #(parameter WIDTH = 32)(input cin,
				  input [WIDTH-1:0] a, b,
				  output [WIDTH-1:0] out,
				  output cout);
	assign {cout,out} = a + b + cin;
endmodule
