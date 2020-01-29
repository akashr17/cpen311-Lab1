
module my_clock_divider_tb();
 reg  inclk_tb;
  reg [31:0] clk_count_to_tb;
  wire  outclk_tb;

//instantiating module we want to test
my_clock_divider DUT(.inclk(inclk_tb),.outclk(outclk_tb),.clk_count_to(clk_count_to_tb));
 

initial begin
//clk is 0 
inclk_tb = 0;

forever begin  //make a clock go up and down every #1
inclk_tb = 0;
#1;
inclk_tb =1;
#1;
end
end

initial begin
clk_count_to_tb = 32'd5;  //should be a wave of period 10, up for 5 down for 5
#50;
clk_count_to_tb = 32'd2; //should be a wave of period 4, up for 2 down for 2
#50;
clk_count_to_tb = 32'd10; //should be a wave of period 20, up for 10 down for 10
#50;


end
endmodule
