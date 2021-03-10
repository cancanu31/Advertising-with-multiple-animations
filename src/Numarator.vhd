library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Numarator is
 port (Output: out std_logic_vector (1 downto 0); clk1: in std_logic);
end Numarator;

architecture Arch of Numarator is
signal B:std_logic_vector(1 downto 0):="00";
begin 
    process(clk1)
      begin
         if clk1'event and clk1='1' then
              B<=B+1;
         end if;
    end process;
Output <= B;
end Arch;