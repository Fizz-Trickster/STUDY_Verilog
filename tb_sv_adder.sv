`timescale 1 ns / 1 ps

module tb_sv_adder;
localparam  T_WIDTH = 14;
    logic                           i_clk; 
    logic                           i_rst_n; 
    logic   [T_WIDTH-1    :   0]    i_a;            
    logic   [T_WIDTH-1    :   0]    i_b;            
    logic   [T_WIDTH      :   0]    o_sum;            

    always #10 i_clk = ~i_clk;

    adder #(T_WIDTH) u_adder
    (
           .i_clk               (i_clk              
        ), .i_rst_n             (i_rst_n             
        ), .i_a                 (i_a
        ), .i_b                 (i_b  
        ), .o_sum               (o_sum        
        )
    );

    initial begin
        i_clk       = 0; 
        i_rst_n     = 1;
        i_a         = 0;
        i_b         = 0;
        #24 i_a     = 20;
        #42 i_b     = 70;

//        #100;
        repeat (4) @(posedge i_clk);
        $finish;
    end

endmodule