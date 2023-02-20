library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TFF is
Port ( T, CLK, RST, TEMP : in STD_LOGIC;
Q, Qb : out STD_LOGIC);
end TFF;

architecture tf of TFF is
begin
 process(CLK, RST, T)
 variable TEMP :std_logic :='0';
 begin
  if(RST='1') then 
 TEMP := '0';
  else if (clk'event and clk='1') then 
  if(T='1') then
  TEMP := not TEMP;
  end if; 
  end if; 
  Q <= TEMP;
  Qb <= not TEMP ;
  end if;
 end process;
end tf;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is 
port ( x, clk : in std_logic );
end counter;

architecture acounter of counter is
component TFF is
Port ( T, CLK, RST, TEMP : in STD_LOGIC;
Q, Qb : out STD_LOGIC);
end component;
signal  q1, q2, q3, q4, q1b, q2b, q3b, q4b, TEMP, RST : std_logic;
begin
T1 : TFF port map(T=> ((not x) and q2 and q3 and q4 ) or (x and q2b and q3b and q4b) or ((not x) and q1 and q4) ,
CLK => clk , Q => q1, Qb => q1b, RST=>RST, TEMP => TEMP );

T2 : TFF port map(T=>(x and q2 and q3b and q4b) or (x and q1 and q4b) or ((not x) and  q3 and q4 ), CLK => clk , Q => q2, Qb => q2b, RST=>RST, TEMP => TEMP );

T3 : TFF port map(T=> ((not x) and q1b and q4) or
(x and q3 and q4b) or (x and q2 and q4b) or
(x and q1 and q4b),
CLK => clk , Q => q3, Qb => q3b, RST=>RST, TEMP => TEMP );

T4 : TFF port map(T=>'1' ,
CLK => clk , Q => q4, Qb => q4b, RST=>RST, TEMP => TEMP );
end acounter;