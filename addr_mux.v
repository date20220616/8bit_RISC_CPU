// Address multiplexer
module addr_mux(addr, sel, ir_ad, pc_ad);
// To choose address of instruction register or address of program counter
input [7:0] ir_ad, pc_ad;
input sel;
output [7:0] addr;
assign addr = (sel)? ir_ad:pc_ad;
endmodule
