module _1HZ_BLINK (
   input clk_50MHz,
   input set_n,
   output reg clk_1Hz = 0
	
   );
 
//Used to gain a 1Hz signal from 50MHz
parameter div_1HZ = 100000000;
 
//The counter:
reg [31:0] count_1HZ = 0;
   
//Lowers Clock signal to 1HZ 
  always @ (posedge clk_50MHz)
    begin
      if (count_1HZ == div_1HZ-1)
        begin        
          clk_1Hz <= !clk_1Hz;
          count_1HZ    <= 0;
        end
      else
        count_1HZ <= count_1HZ + 1;
    end

endmodule
