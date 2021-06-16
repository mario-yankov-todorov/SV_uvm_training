//`ifndef ENV_CONFIG
//`define ENV_CONFIG

//class env_config extends uvm_object;
//  `uvm_object_utils(env_config)
  
//  function new(string name = "env_config");
//    super.new(name);
//  endfunction
  
//  uvm_active_passive_enum is_active = UVM_ACTIVE;
  
//endclass
//`endif

`ifndef MEM_ENV
`define MEM_ENV

class mem_env extends uvm_env;
`uvm_component_utils(mem_env)

  virtual inter_f vif;
  virtual apb_inter_f a_vif;

//Declaration of Agent
mem_agent agent;
apb_agent a_agent;

agent_config conf;
apb_agent_config a_conf;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);

agent = mem_agent::type_id::create("agent",this);
a_agent = apb_agent::type_id::create("a_agent",this);
  
   uvm_config_db#(virtual inter_f)::set(this, "agent","inter_f", vif);
   uvm_config_db#(agent_config)::set(this, "*", "agent_config", conf);
   
   uvm_config_db#(virtual apb_inter_f)::set(this, "a_agent","apb_inter_f", a_vif);
   uvm_config_db#(apb_agent_config)::set(this, "*", "apb_agent_config", a_conf);
endfunction

endclass: mem_env

`endif