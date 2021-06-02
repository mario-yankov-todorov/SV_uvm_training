`include "uvm_macros.svh"
import uvm_pkg::*;


class my_driver extends uvm_driver #(my_seq_item);
  
   `uvm_component_utils(my_driver)
  
   virtual dut_if dut_vi;
  
  // Driver constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vi", dut_vi))begin
      `uvm_error(get_type_name(), "Couldn't retrive driver virtual interface from config db!
                 ")
    end
  endfunction: build_phase
  
  task run_phase ( uvm_phase phase );
    bus_seq_item req_item;
    forever begin
      // Blocking call returning the next transaction
      seq_item_port.get_next_item(req_item);
      
      // Wiggle the pins on the vif
      // and set responce in sequence
      @(posedge my_interface.clk);
        my_interface.button <= 1'b1;
      @((data arrived)
        req_item.data = my_interfce.MEM_FULL;
        
       // Signal to the sequence that the driver has finished
        seq_item_port.item_done();
    end
  endtask: run_phase
        
  // Drive
  virtual task drive();
    
      vif.data_in<=0;

    @(posedge vif.clk);
    
      vif.data_in <= req.data_in;
  
  $display("-----------------------------------------");
  endtask : drive
  
endclass: my_driver