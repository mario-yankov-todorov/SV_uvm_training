`include "uvm_macros.svh"
import uvm_pkg::*;

`include "driver.sv"
`include "sequencer.sv"
`include "monitor.sv"

class my_agent extends uvm_agent;
  
  `uvm_component_utils(my_agent)
  
  // Agent containing a driver and a sequencer
  my_driver m_driver;
  uvm_sequencer #(my_seq_item) m_sequencer;
  my_monitor m_monitor;
  
  my_agent_config m_cfg;
  
  
  // Sequencer - Driver connection:
  function void connect_phase(uvm_phase phase);
    if(m_cfg.active == UVM_ACTIVE) begin
       // Driver - Sequencer TLM connection
       m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
       // Virtual interface assignment
       m_driver.vif = cfg.vif;
      
    end
  endfunction: connect_phase
  
  
endclass: my_agent