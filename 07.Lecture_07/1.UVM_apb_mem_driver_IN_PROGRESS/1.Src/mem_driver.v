`timescale 1ns/1ns
module memory_dr(datain, clk, stop, mem_full, dataout, write_tr, res, addr, valid_fifo);

	input [31:0] datain;
	input clk, res;
  	input valid_fifo;
	output stop;
  	output reg mem_full;
	output reg write_tr;
   output reg [6:0] addr = 0;
	output [31:0] dataout;
	wire empt;
   wire full;
  	reg valid_fifo_bar = 1'b1;
	
   reg [2:0]  counter = 0;
	
	
  FIFO inst(.data_i(datain),
            .wr_en_i(valid_fifo), 
            .rd_en_i(valid_fifo_bar), 
            .clk(clk), 
            .rst_n(res), 
            .data_o(dataout), 
            .empty_o(empt),
            .full_o(full));
	
	
	always @(datain) begin
           
		  counter = counter + 3'b001;
        if (counter == 3'b100)begin
            counter = 3'b000;
            addr = addr + 7'b1;
        end
          else
            addr = addr;
   end
 	
   always @(posedge clk) begin
      if(res) begin
        write_tr = 1;
        mem_full = 0;
      end
      else if (addr == 7'd64) begin
      write_tr = 0;
		mem_full = 1;
    end
     else if(mem_full) begin
        valid_fifo_bar = 0;
      end
  end         	
assign stop = mem_full;	

endmodule