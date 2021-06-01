import uvm_pkg::*;

class my_sequence extends uvm_sequence;
   
  `uvm_object_utils(my_sequence)
  
  function new ( string name = "");
    super.new(name);
  endfunction
  
  
  
endclass: my_sequence