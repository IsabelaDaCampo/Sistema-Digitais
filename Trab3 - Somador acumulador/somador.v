module somador(input clock,
	input [43:0] E1,
	input [43:0] E2,
	output[43:0] S0
	);
reg [43:0] saida;
assign S0 = saida;
always @(posedge clock) begin
	saida <= E1 + E2;
end
endmodule
module teste;
	reg clock;
	reg[43:0] E1, E2;
	wire[43:0] S0;
	always #2 clock = ~clock;
	somador B(clock, E1, E2, S0);
	initial begin
		$dumpvars(0, B);
#0 clock <= 0;
E1 <= 4;
E2 <= 8;
#30
E1 <= 11;
E2 <= 40;
#60
E1 <= 4;
E2 <= 5;
#90;
E1 <= 38;
E2 <= 62;
#500;
$finish;
end
endmodule
