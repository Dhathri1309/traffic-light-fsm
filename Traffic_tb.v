`timescale 1ns/1ps

module traffic_tb;

reg clk;
reg rst;

wire [2:0] light;

traffic_light DUT(
    .clk(clk),
    .rst(rst),
    .light(light)
);

always #10 clk = ~clk;

initial
begin

    $dumpfile("traffic.vcd");
    $dumpvars(0, traffic_tb);

    $monitor("Time=%0t Light=%b",
             $time, light);

    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #200;

    $finish;

end

endmodule