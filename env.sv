`define ADDR_WIDTH 32
class transaction;

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

endinterface
