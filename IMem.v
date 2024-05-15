module IMem(
  input wire [15:0] iaddr,
  input wire clk,
  output reg [23:0] instr
);
  reg [23:0] imemory [32767:0]; 
 // loads istruction from memory based on iaddr
  always @(posedge clk) begin
    instr <= imemory[iaddr];
  end
  /* for loading instructions for now it just loads each with 0 to 32768: the corresponding number to number instruction ex: imemory[100] = 24'b0000000001100100 */
  initial begin
    for (int k = 0; k < 32768; k = k + 1) begin
      imemory[k] = k; 
    end
  end
endmodule 
