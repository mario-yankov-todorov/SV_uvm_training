module assertion_penable_TB();
  
   reg   clk       ;
   reg   PWRITE    ;
   reg   PSEL      ;
   reg   PENABLE   ;   
  
   assertion_penable uut 
      (
         .clk      (clk)       ,
         .PWRITE   (PWRITE)    ,
         .PSEL     (PSEL)      ,
         .PENABLE  (PENABLE)         
      );
   
   always #5 clk = ~clk;
          
   initial begin 
      // TO DO
   end
  
   sequence p_write;
      (PSEL && PWRITE);
   endsequence
     
   sequence p_enable;
      ##1 PENABLE;
   endsequence
     
   property check_p_enable;
     @(posedge clk) p_write |-> p_enable;
   endproperty
     
   assertion_penable: assert property (check_p_enable);
   
    
   initial begin 
      $dumpfile("dump.vcd"); $dumpvars;
   end
     
endmodule      