`ifndef APB_DRIVER
`define APB_DRIVER

class apb_driver extends uvm_driver #(apb_seq_item);
 `uvm_component_utils(apb_driver)
  // Virtual Interface
  virtual apb_inter_f a_vif;

     
  // Constructor
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual apb_inter_f)::get(this, "", "apb_inter_f", a_vif))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".a_vif"});
  endfunction: build_phase
 
  // run phase
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);

        a_vif.psel <= 0;
        a_vif.enbl <= 0;
        a_vif.slerr <= 0;

        forever begin
            //@(posedge a_vif.clk);
            seq_item_port.get_next_item(req);
            $display("Transaction started");

            @(posedge a_vif.clk);
            if(req.pwrite)
                write_state(req.paddr, req.pwdata);
            else
                read_state(req.paddr, req.pwdata);

            seq_item_port.item_done();
        end
    endtask

    virtual task write_state(input bit [31:0] paddr, input bit [31:0] pwdata);
        a_vif.paddr <= paddr;
        a_vif.pwdata <= pwdata;
        a_vif.pwrite <= 1'b1;
        a_vif.psel <= 1'b1;
        @(posedge a_vif.clk);
        a_vif.pready <= 1'b1;
        a_vif.enbl <= 1'b1;
        @(posedge a_vif.clk);
        a_vif.pready <= 1'bx;
        a_vif.enbl <= 1'b0;
        a_vif.psel <= 1'b0;
    endtask

    virtual task read_state(input bit [31:0] paddr, output bit [31:0] pwdata);
        a_vif.paddr <= paddr;
        a_vif.pwdata <= pwdata;
        a_vif.pwrite <= 1'b0;
        a_vif.psel <= 1'b1;
        @(posedge a_vif.clk);
        a_vif.pready <= 1'b1;
        a_vif.enbl <= 1'b1;
        @(posedge a_vif.clk);
        a_vif.pready <= 1'bx;
        a_vif.enbl <= 1'b0;
        a_vif.psel <= 1'bx;
    endtask
 
endclass : apb_driver

`endif