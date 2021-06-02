`include "uvm_macros.svh"
import uvm_pkg::*;

class my_sequence extends uvm_sequence#(my_seq_item);

  `uvm_object_utils(my_sequence)

// Sequence constructor
  function new(string name="my_sequence",uvm_component parent=null);
    super.new(name);
  endfunction

  virtual task body();
    repeat(10) begin
      req=my_seq_item::type_id::create("req");
      start_item(req);
      req.randomize();
      finish_item(req);
    end
  endtask
endclass: sequence