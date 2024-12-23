module fifo_ram#(
    parameter BITWIDTH = 8,
    parameter DEPTH = 16
) (
    input iClk,
    input iRstN,
    input w_en,
    input r_en,
    input [BITWIDTH-1:0] in,
    output reg [BITWIDTH-1:0] out,
    output empty, 
    output full
    );
    
    reg [$clog2(DEPTH)-1:0] wad;
    reg [$clog2(DEPTH)-1:0] rad;
    
    reg [BITWIDTH-1:0] memory [0:DEPTH-1];
    
    
    always@(posedge iClk or negedge iRstN) begin
        //finds if the 
        if(!iRstN) begin
            rad <= 0;
            wad <= 0;
        end else if(r_en && !empty) begin
            out <= memory[rad];
            rad <= rad + 1; 
        end else if(w_en && !full) begin
            memory[rad] <= in;
            wad <= wad + 1;
        end
   
    end
    
    assign full = (wad == DEPTH);
    assign empty = wad == 0;
    
endmodule
