`timescale 1 ns / 1 ps

module tb_inst_mem;
localparam  T_DWIDTH = 8;
localparam  T_ADDR  = 10;
integer     idx;
    logic                           i_mem_clk; 
    logic                           i_rst_n; 
    logic                           i_web; 
    logic                           i_csb; 
    logic   [T_ADDR-1       :   0]  i_read_addr;            
    logic   [T_ADDR-1       :   0]  i_write_addr;            
    logic   [T_DWIDTH-1     :   0]  i_data;            
    logic   [T_DWIDTH-1     :   0]  o_data;            
    

    always #5 i_mem_clk = ~i_mem_clk;

    inst_mem #(.DWIDTH(T_DWIDTH), .ADDR(T_ADDR)) u_inst_mem (
           .i_mem_clk           (i_mem_clk              
        ), .i_rst_n             (i_rst_n            

        ), .i_web               (i_web
        ), .i_csb               (i_csb

        ), .i_read_addr         (i_read_addr  
        ), .i_write_addr        (i_write_addr  
        
        ), .i_data              (i_data  
        ), .o_data              (o_data
        )
    );

    initial begin
        i_mem_clk           = 0; 
        i_rst_n             = 1;

        i_csb               = 1;
        #24 i_csb           = 0;

        i_web               = 0;
        i_write_addr        = 'd20;
        i_data              = 'h20;

        #52 i_write_addr    = 'd21;
        #4  i_data          = 'h21;

        repeat (2) @(negedge i_mem_clk);
        i_web               = 1;
        i_read_addr         = 'd0;

        for(idx=0; idx< 22; idx++) begin
            i_read_addr = idx;
            repeat (2) @(negedge i_mem_clk);
        end

        repeat (4) @(posedge i_mem_clk);
        $finish;
    end

endmodule