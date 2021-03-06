`timescale 1ns/1ns
module memory(

  			     input [6:0] address,
              input [31:0] data_in,
              input write_enable,
              input clk, res
			  );
  
  reg [31:0] memory [0:63];
  reg [6:0] n;

   always @(posedge clk) begin
     if (res)
       for(n = 0; n < 64; n = n+1)
         memory[n] <= 0;

      else if (write_enable)
         memory[address] <= data_in;
end

endmodule