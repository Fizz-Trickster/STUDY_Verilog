`timescale 1 ns / 1 ps

module tb_adder;
localparam  T_WIDTH = 12;
    reg                             i_clk; 
    reg                             i_rst_n; 
    reg     [T_WIDTH-1    :   0]    i_a;            
    reg     [T_WIDTH-1    :   0]    i_b;            
    wire    [T_WIDTH      :   0]    o_sum;            

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