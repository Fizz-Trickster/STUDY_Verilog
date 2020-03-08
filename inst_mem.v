module inst_mem(
#(parameter DWIDTH = 8)

    input           i_mem_clk,
    input           i_rst_n,
    input   [31:0]  i_read_addr,
    input   [31:0]  i_write_addr,
    output  [31:0]  o_instruction
);

    reg [DWIDTH-1:0]   data [1023:0];

    // initialize
    initial begin
        $readmemh("vectors.txt", data);
    end

    assign o_instruction = {data[i_read_addr],data[i_read_addr+1],data[i_read_addr+2],data[i_read_addr+3]};  

endmodule