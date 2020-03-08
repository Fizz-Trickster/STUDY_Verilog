module inst_mem
#(parameter DWIDTH = 8, ADDR = 10)
(
    input                           i_mem_clk,
    input                           i_rst_n,

    input                           i_web,      // 'd0 : wrtie          'd1 : read
    input                           i_csb,      // 'd0 : chip select    'd1 : nop

    input   [ADDR-1     :   0]      i_read_addr,
    input   [ADDR-1     :   0]      i_write_addr,

    input   [DWIDTH-1   :   0]      i_data,
    output  [DWIDTH-1   :   0]      o_data
);

    reg     [DWIDTH-1   :   0]      data [1023:0];

    // initialize
    initial begin
        $readmemh("vectors.txt", data);
    end

    reg     [DWIDTH-1   :   0]      wr_data;

    always @ (posedge i_mem_clk) begin  
        if (~i_csb) begin
            if (~i_web)            
            // Memory write 
                data[i_write_addr] <= i_data;
            else if (i_web)         
            // Memory read
                wr_data <= data[i_read_addr];
        end
    end

    assign o_data = wr_data;

endmodule
