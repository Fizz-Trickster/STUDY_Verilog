//reference : https://verificationguide.com/systemverilog/systemverilog-queue/

// Queue 
// Method 1 : insert, delete
// Method 2 : push_front, push_back
// Method 3 : pop_front, pop_back
`timescale 1 ns / 1 ps

module tb_queue;
int j = 1;
int q[$];
bit [31:0] q1[$];
string q2[$];

int         idx;
bit [31:0]  bvar;
string      svar;        

initial begin
    q   = {0,2,5};
    q1  = {0,1,2,3};
    q2  = {"RED","GREEN","BLUE"};

    // Method 1 : insert, delete
    q.insert(1,j);
    foreach(q[i])
        $display(q[i]);

    $display("------------------------"); 

    q.delete(1);
    foreach(q[i])
        $display(q[i]);

    $display("----- q1 size is %0d  -----",q1.size());
    foreach(q1[i]) $display("\tq1[%0d] = %0d",i,q1[i]);   

    $display("----- q2 size is %0d  -----",q2.size());
    foreach(q2[i]) $display("\tq2[%0d] = %0s",i,q2[i]);

    // Method 2 : push_front, push_back
    q1.push_front(10);
    q2.push_back("WHITE");

    $display("----- q1 size is %0d  -----",q1.size());
    foreach(q1[i]) $display("\tq1[%0d] = %0d",i,q1[i]);   

    $display("----- q2 size is %0d  -----",q2.size());
    foreach(q2[i]) $display("\tq2[%0d] = %0s",i,q2[i]);


    // Method 3 : pop_front, pop_back
    bvar = q1.pop_front();
    svar = q2.pop_back();

    $display("----- q1 pop_front    = %0d  -----", bvar);
    $display("----- q2 pop_back     = %0s  -----", svar);

    repeat(6) begin 
        idx = $urandom_range(0,2);
        svar = q2[idx];

        $display("q2[%0d] = %0s",idx,q2[idx]);
    end
   
end

endmodule
