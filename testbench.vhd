library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_tb is
end counter_tb;

architecture acounter_tb of counter_tb is
component counter is
port ( x, clk : in std_logic );
end component;
signal  x, clk : std_logic ;
begin
dut : counter port map (x, clk);

Clock : process
begin
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
end process;

sim : process
begin

x<='0';
wait for 25 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='0';
wait for 20 ns;
x<='1';
wait for 20 ns;
x<='1';
wait for 20 ns;
wait;
end process;

end acounter_tb;