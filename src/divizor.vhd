library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_UNSIGNED.all;  

entity divizor is
	port(CLK_PLACA,RESET: in std_logic; CLK_1HZ: out std_logic);
end divizor;

architecture comportamentala of divizor is
begin
	process(CLK_PLACA,RESET)
	variable v:std_logic_vector(12 downto 0):=(others=>'0');
	begin
		if RESET='1' then v:=(others=>'0');
		else
			if CLK_PLACA'EVENT and CLK_PLACA='1' then 
				v:=v+1;
			end if;
		CLK_1HZ<=v(12);
		end if;
end process;
end architecture;