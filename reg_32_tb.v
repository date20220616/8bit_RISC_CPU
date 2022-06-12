`timescale 1ps/1ps
module reg_32_tb;
reg read;
reg write;
reg [4:0] addr;
reg [7:0] in;
wire [7:0] data=(!read)?in:8'hZ;
integer i;
memory (
.data(data),
.addr(addr),
.read(read),
.write(write),
.clk(clk),
.in(in)
);

task write_val;
input [7:0] addr;
input [7:0] data;
begin
reg_32_tb.addr =addr;
reg_32_tb.in =data;
#1 write = 1;
#1 write =0;
end
endtask

task read_val;
input [4:0] addr;
input [7:0] data;
begin
reg_32_tb.addr =addr;
reg_32_tb.read =1;
end
endtask

initial begin
write = 0;
read =0;
for (i=0; i<=31; i=i+1)
write_val(i,i);
for (i=0; i<=31; i=i+1)
read_val(i,i);
$display("test passed");
$finish;
end

endmodule
