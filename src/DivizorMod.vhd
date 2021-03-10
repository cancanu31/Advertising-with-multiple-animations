library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DivizorMod is
    port(clk_in: in  std_logic; reset: in  std_logic; clk_out: out std_logic);
end DivizorMod;

architecture Behavioral of DivizorMod is	

signal temporal: std_logic;
signal counter : integer range 0 to 40_000_000 := 0;	 

begin
    frequency_divider: process (reset,clk_in) 
	begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 40_000_000) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

	clk_out <= temporal;
end Behavioral;
