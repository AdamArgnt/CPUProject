module DMem(
  input wire [7:0] data_in,
  input wire [15:0] daddr,
  input wire clk,
  input wire we, //write enable
  input wire read_e, //read enable
  output reg [15:0] data_out
);
  reg [23:0] dmemory [16383:0]; /*not sure if this is right or if it should be 16:0 or something */
 // loads  from memory based on iaddr
  always @(posedge clk) begin
    if (read_e == 1) begin /*Memory read (not sure if this will work in this module or 
      if it should be separate*/
    data_out <= dmemory[daddr];
    end
    else if (we == 1) begin
      dmemory[daddr] <= data_in; /*memory write, same questioning as read*/
    end
  end
  // for loading instructions for now it just loads each with # of address
  initial begin
    for (int k = 0; k < 16383; k = k + 1) begin //all data memory starts as zero
      dmemory[k] = 0; 
    end
  end
endmodule 
