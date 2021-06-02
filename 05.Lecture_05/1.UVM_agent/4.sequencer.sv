`include "uvm_macros.svh"
import uvm_pkg::*;


class my_sequencer extends uvm_sequencer#(my_seq_item);
   
  `uvm_object_utils(my_sequencer)
  
  // Sequence constructor
  function new ( string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  
endclass: my_sequencer