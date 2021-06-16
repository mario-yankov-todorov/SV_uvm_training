`ifndef BASE_TEST
`define BASE_TEST

class base_test extends uvm_test;
   `uvm_component_utils(base_test)

   mem_env env;

   function new(string name = "base_test",uvm_component parent= null);
      super.new(name,parent);
   endfunction: new

  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
      env = mem_env::type_id::create("env",this);

   endfunction


endclass
`endif