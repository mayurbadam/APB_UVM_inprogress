`define ADDR_WIDTH 32
class transaction extends uvm_sequence_item;
	rand bit [`ADDR_WIDTH-1:0]      paddr;
	rand bit [2:0]                  pprot;
	rand bit     	           pselx;
	rand bit                        penable;
	rand bit                        pwrite;
	rand bit [`DATA_WIDTH-1:0]      pwdata;
	rand bit [(`DATA_WIDTH/8)-1:0]  pstrb;	

	rand bit                        pready;
	rand bit [`DATA_WIDTH-1:0]      prdata;
	rand bit 	                   plsverr;
	rand bit                        pwakeup;
	rand bit [`USER_REQ_WIDTH-1:0]  pauser;
	rand bit [`USER_DATA_WIDTH-1:0] pwuser;
	rand bit [`USER_DATA_WIDTH-1:0] pruser;
	rand bit [`USER_RESP_WIDTH-1:0] pbuser;

endclass


interface intf(bit pclk, bit prst);
	bit [`ADDR_WIDTH-1:0]      paddr;
	bit [2:0]                  pprot;
	bit     	           pselx;
	bit                        penable;
	bit                        pwrite;
	bit [`DATA_WIDTH-1:0]      pwdata;
	bit [(`DATA_WIDTH/8)-1:0]  pstrb;	

	bit                        pready;
	bit [`DATA_WIDTH-1:0]      prdata;
	bit 	                   plsverr;
	bit                        pwakeup;
	bit [`USER_REQ_WIDTH-1:0]  pauser;
	bit [`USER_DATA_WIDTH-1:0] pwuser;
	bit [`USER_DATA_WIDTH-1:0] pruser;
	bit [`USER_RESP_WIDTH-1:0] pbuser;

	 
   //clocking block for driver
   clocking drv_cb@(posedge Clk);
      default input #0 output #1;
      output  Enable, Load,UpDown,InData;
   endclocking
   
   //clocking block for monitor
   clocking mon_cb@(posedge Clk);
      default input #0 output #1;
      input OutData, Enable, Load, UpDown,InData;
   endclocking
   
   //clocking block for reset
   clocking rst_cb@(negedge Clk);
      default input #0 output #0;
      output Reset;
   endclocking

   clocking sb_rst_cb@(negedge Clk);
      default input #0 output #0;
      input Reset;
   endclocking
   
   //modports for driver, monitor
   modport DRV_MP (output Clk, clocking drv_cb);
   modport MON_MP (input Clk, clocking mon_cb);
   
   //modport for only Reset signal
   modport RST_MP (clocking rst_cb);
   modport RST_SC_MP (clocking sb_rst_cb);

endinterface


class driver extends uvm_driver( );
endclass

class monitor extends uvm_monitor();
endclass

class sequencer extends uvm_sequencer();
endclass

class agent extends uvm_agent();
endclass

class scoreboard extends uvm_scoreboard();
endclass

class environment extends uvm_env();
endclass

class base_sequence extends uvm_sequence();
endclass

class base_test extends uvm_test();
endclass

module top();

bit clk;
bit reset;

intf inf();
initial begin

	runt_test();
end
endmodule
