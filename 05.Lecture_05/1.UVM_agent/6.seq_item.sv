`include "uvm_macros.svh"
import uvm_pkg::*;

class my_seq_item extends uvm_sequence_item;
  
  rand bit [2    -1:0]   button;

  `uvm_object_utils_begin(my_seq_item)
  `uvm_field_int(button,UVM_ALL_ON)
  `uvm_object_utils_end

  // Seq_item constructor
  function new(string name = "my_seq_item");
    super.new(name);
   endfunction

endclass