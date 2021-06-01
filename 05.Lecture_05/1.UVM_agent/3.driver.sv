import uvm_pkg::*;

class my_driver extends uvm_driver;
  
   `uvm_component_utils(my_driver)
  
   virtual dut_if dut_vi;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase)
  
endclass: my_driver