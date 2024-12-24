
module fifo_ram_tb();
    parameter BITWIDTH = 8;
    parameter DEPTH = 16;
    reg iClk;
    reg iRstN;
    reg w_en;
    reg r_en;
    reg [BITWIDTH-1:0] in;
    wire [BITWIDTH-1:0] out;
    wire empty;
    wire full;
    
    fifo_ram#(
        .BITWIDTH(BITWIDTH), .DEPTH(DEPTH)
    ) u_fifo_ram ( 
        .iClk(iClk),
        .iRstN(iRstN),
        .w_en(w_en),
        .r_en(r_en),
        .in(in),
        .out(out),
        .empty(empty),
        .full(full)
    );
    
    always #5 iClk = ~iClk;
    
    initial begin
        $dumpfile("fifo_ram_tb.vcd"); $dumpvars;
        iClk = 0;
        iRstN = 0;
        w_en = 0;
        r_en = 0;
        
        #10;
        iRstN = 1;
        
        w_en = 1;
        in = $random;
        
        #10;
        w_en = 0;
        r_en = 1;
        
        #10;
        $finish;
        
    end
   
endmodule
