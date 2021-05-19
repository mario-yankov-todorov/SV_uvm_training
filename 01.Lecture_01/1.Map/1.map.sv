/*
*	M. Todorov 2021
*/

`ifndef __map
`define __map

class map;
  
  local int data [string];
  local string decorative_line = "-------------------------------------";
	
   // Create a constructor
   function new 
      (
        int data [string] = '{"1.Musala" : 2925,
                              "2.Vihren" : 2914,
                              "3.Kutelo" : 2908}
      );    
         this.data = data;     
   endfunction
    
   // Create a function to GET a
   // specific value from the map
   function int get (string key);
     
      return data[key]; 
     
   endfunction
  
   // Create a function to PUT a
   // specific value in the map
   function put (string key, int value); 
     
      if (data.exists(key)) begin 
         return 0;
      end
      else begin
         data[key] = value;
         return 1;
      end
     
   endfunction
  
   // Create a function to DELETE a
   // specific value from the map
   function delete (string key);  
     
      if (data.exists(key)) begin 
         data.delete(key);
         return 1;
      end
      else begin
         return 0;
      end
     
   endfunction
  
   // Create a function to DISPLAY the
   // key-value pairs stored in the map 
   function display ();
     
      $display ("Current map values:"); 
     
      foreach (data[key]) begin      
         $display (decorative_line);
         $display
            (
               "Peak: %S  --->  Height: %0d", 
               key, data[key]
             );
      end  
     
      $display (decorative_line);
    
   endfunction
  
endclass

`endif
