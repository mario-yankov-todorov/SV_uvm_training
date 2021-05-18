/*
*	M. Todorov 2021
*/

module map_TB;
   // Create a instance of class map
   map map_01;
  
   // Variables for testing get method
   int peak_01;
   int peak_02;
   int peak_03;
  
   // Variables for testing put method  
   int bool_01;
   int bool_02;
   int bool_03;
   int bool_04;
  
   // Variables for testing delete method
   int bool_05;
   int bool_06;
   int bool_07;
   int bool_08;
   int bool_09;

		
   initial begin
     
      map_01 = new ();
      
      // Get test
      $display ("*******************");
      $display (" !!! Get test !!!");
     
      peak_01 = map_01.get ("1.Musala");
      peak_02 = map_01.get ("2.Vihren");
      peak_03 = map_01.get ("3.Kutelo");
     
      $display (peak_01);
      $display (peak_02);
      $display (peak_03);
     
      $display ("*******************");
     
     
      // Put test
      $display ("*******************");
      $display (" !!! Put test !!!");
     
      bool_01 = map_01.put ("4.Irechek", 2852);
      bool_02 = map_01.put ("1.Musala", 1000);
      bool_03 = map_01.put ("5.Aleko", 2713);
      bool_04 = map_01.put ("4.Irechek", 1000);
     
      $display (bool_01);
      $display (bool_02);
      $display (bool_03);
      $display (bool_04);
     
      $display ("*******************");
     
      // Display current values of map_01 
      map_01.display ();
     
     
      // Delete test
      $display ("*******************");
      $display (" !!! Delete test !!!");
     
      bool_05 = map_01.delete ("2.Vihren");
      bool_06 = map_01.delete ("3.Kutelo");
      bool_07 = map_01.delete ("5.Aleko");
      bool_08 = map_01.delete ("6.Kom");
      bool_09 = map_01.delete ("2.Vihren");
     
      $display (bool_05);
      $display (bool_06);
      $display (bool_07);
      $display (bool_08);
      $display (bool_09);
     
      $display ("*******************");
     
      // Display current values of map_01      
      map_01.display ();
      	  
   end
  
endmodule 
