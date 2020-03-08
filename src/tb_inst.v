`timescale 1 ns / 1ps

module tb_inst;
    
    reg     [31:0]  read_addr;        
    wire    [31:0]  o_instruction;
 
    InstructionMemory u_inst (.read_addr(read_addr), .o_instruction(o_instruction));
   
    initial begin
        read_addr = 32'h0000_0000;
        #25 read_addr = 32'h0000_0004;
        #25 read_addr = 32'h0000_0008;

    end
endmodule
