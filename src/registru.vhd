library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_UNSIGNED.all;   

entity registru is
	port(CLK: in std_logic;
	Q: out std_logic_vector(3 downto 0));   
end registru;

architecture arh of registru is
signal reg: std_logic_vector(3 downto 0):="1110";
begin
	process(clk,reg)
	begin 
		if CLK'EVENT and CLK='1' then 
			reg(2 downto 0)<=reg(3 downto 1);
			reg(3)<=reg(0);
		end if;
	end process;
Q<=reg;
end arh;