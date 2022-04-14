module _1HZ_BLINK (
   input clk_50MHz, //PIN_N14
   input set_n, //PIN_C10
   output clk_1Hz //PIN_A19
	
   );
 
//Used to gain a 1Hz signal from 50MHz
parameter div_1HZ = 100000000;
 
//The counter:
reg [31:0] count_1HZ = 0;
   
//The frequency register:
reg r_1HZ;
   
//Lowers Clock signal to 1HZ 
  always @ (posedge clk_50MHz)
    begin
      if (count_1HZ == div_1HZ-1)
        begin        
          r_1HZ <= !r_1HZ;
          count_1HZ    <= 0;
        end
      else
        count_1HZ <= count_1HZ + 1;
    end

//Ouput the clock singal or 0 if set_n is on 
assign clk_1Hz = r_1HZ & set_n;

endmodule
