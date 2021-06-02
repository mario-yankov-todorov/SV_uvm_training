`include "uvm_macros.svh"
import uvm_pkg::*;

class my_monitor extends uvm_monitor;
  // Registering component with factory
  `uvm_component_utils(my_monitor)
  
   virtual dut_if dut_vi;
   
  uvm_analysis_port #(m_packet) my_mon_ap;
  
  // Monitor constructor
  function new(string name, uvm_component parent);
  endfunction
  
  // Override monitor build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
      if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vi", dut_vi))begin
        `uvm_error(get_type_name(), "Couldn't retrive monitor virtual interface from config db!")
      end
    // Create analysis port instance
    my_mon_ap = new("my_mon_ap", this)
      
  endfunction
endclass: my_monitor