module InstructionMemory(
    input           clk,
    input   [31:0]  read_addr,
    output  [31:0]  o_instruction
);

    reg [7:0]   data [1023:0];

    initial begin
        $readmemh("vectors.txt", data);
    end

    assign o_instruction = {data[read_addr],data[read_addr+1],data[read_addr+2],data[read_addr+3]};  

endmodule
