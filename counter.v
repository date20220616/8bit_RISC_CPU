//PC, program counter
module counter(pc_addr, clock, rst, en);
input clock, rst, en;
output reg [7:0] pc_addr;
always @(posedge clock or negedge rst) begin
if(!rst) pc_addr <= 8'd0;
else begin
if(en) pc_addr <= pc_addr+1;
else pc_addr <= pc_addr;
end
end
endmodule
