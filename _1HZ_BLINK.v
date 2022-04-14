module _1HZ_BLINK (

	input clk_50M,				//An input clock sginal from FPGA - PIN_N14
	input set,	//Switch 0 - PIN_C10
	output reg CLK_ind = 0 //Decimal Segment 2 - PIN_A19
	
   );
 
reg clk_1hz = 0;
 
 ClockDivider blink (

	clk_50M,
	set,
	clk_1hz
	
);

assign CLK_ind = clk_1hz & set;

endmodule
