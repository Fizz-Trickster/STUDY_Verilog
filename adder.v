module adder
#(parameter WIDTH = 8)
(
    input                           i_clk,
    input                           i_rst_n, 
    input   [WIDTH-1    :   0]      i_a, 
    input   [WIDTH-1    :   0]      i_b, 
    output  [WIDTH      :   0]      o_sum
);
    reg     [WIDTH      :   0]      y;
    always @ (posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n)
            y <= 'd0;
        else
            y <= i_a + i_b;
    end

    assign o_sum = y;

endmodule