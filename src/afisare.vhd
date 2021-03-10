library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_UNSIGNED.all;  
---CODIFICAREA LITERELOR
---O  0000001 
---P  0011000
---E	0110000
---L	1110001
entity afis is
	port(CLK: in std_logic;
	CATOD: out std_logic_vector(6 downto 0);
	AN: out std_logic_vector(3 downto 0); 
	sw: in std_logic_vector(1 downto 0));
end afis;	 

architecture arhafis of afis is	  

component divizor
	port(CLK_PLACA,RESET: in std_logic; CLK_1HZ: out std_logic);
end component;	

component DivizorMod is
    port(clk_in: in std_logic; reset: in std_logic; clk_out: out std_logic);
end component DivizorMod;  

component registru 	   
	port(CLK: in std_logic; Q: out std_logic_vector(3 downto 0));
end component;

component Numarator is
 port (Output: out std_logic_vector (1 downto 0); clk1: in std_logic);
end component Numarator;
	
signal num : std_logic_vector(1 downto 0);
signal sem: std_logic_vector(3 downto 0); 
signal clkdiv: std_logic;	
signal clkMod : std_logic;  
begin
	reg:registru port map(clkdiv,sem);
	div:divizor port map(CLK,'0',clkdiv); 
    div1:divizorMod port map(CLK,'0',clkMod); 
	numar: Numarator port map(num,clkMod);
	AN<=sem;
	process(sem,sw,num)
	begin
	case sw is
	when "00" =>   ---Shiftare stanga-dreapta
	  case num is
	      when "00" =>
		      case sem is
			    when "0111" => CATOD<="0000001";
			    when "1011" => CATOD<="0011000";
			    when "1101" => CATOD<="0110000";
		  	    when "1110" => CATOD<="1110001"; 
			    when others => CATOD<="1000001"; 
		     end case;
		 when "01" =>
		      case sem is   
                    when "0111" => CATOD<="1110001";
                    when "1011" => CATOD<="0000001";
                    when "1101" => CATOD<="0011000";
                    when "1110" => CATOD<="0110000"; 
                    when others => CATOD<="1000001"; 
                end case;
        when "10" =>
               case sem is   
                   when "0111" => CATOD<="0110000";
                   when "1011" => CATOD<="1110001";
                   when "1101" => CATOD<="0000001";
                   when "1110" => CATOD<="0011000"; 
                   when others => CATOD<="1000001"; 
               end case;
      when "11" =>  
               case sem is   
                     when "0111" => CATOD<="0011000";
                     when "1011" => CATOD<="0110000";
                     when "1101" => CATOD<="1110001";
                     when "1110" => CATOD<="0000001"; 
                     when others => CATOD<="1000001"; 
               end case;
      when others =>null;
      end case;
	
	
	when "01" =>   ---Clipire cuvant 
	  case num is
	      when "00" =>
		      case sem is
			    when "0111" => CATOD<="0000001";
			    when "1011" => CATOD<="0011000";
			    when "1101" => CATOD<="0110000";
		  	    when "1110" => CATOD<="1110001"; 
			    when others => CATOD<="1000001"; 
		     end case;
		 when "01" =>
		      case sem is   
                    when "0111" => CATOD<="1111111";
                    when "1011" => CATOD<="1111111";
                    when "1101" => CATOD<="1111111";
                    when "1110" => CATOD<="1111111"; 
                    when others => CATOD<="1111111"; 
                end case;
        when "10" =>
               case sem is   
                   when "0111" => CATOD<="0000001";
                   when "1011" => CATOD<="0011000";
                   when "1101" => CATOD<="0110000";
                   when "1110" => CATOD<="1110001"; 
                   when others => CATOD<="1000001"; 
               end case;
      when "11" =>  
               case sem is   
                     when "0111" => CATOD<="1111111";
                     when "1011" => CATOD<="1111111";
                     when "1101" => CATOD<="1111111";
                     when "1110" => CATOD<="1111111"; 
                     when others => CATOD<="1111111"; 
               end case;
      when others =>null;
      end case;  
	
	
	
	when "10" =>   ---Afisare litera cu litera 
	  case num is
	      when "00" =>
		      case sem is
			    when "0111" => CATOD<="0000001";
			    when "1011" => CATOD<="1111111";
			    when "1101" => CATOD<="1111111";
		  	    when "1110" => CATOD<="1111111"; 
			    when others => CATOD<="1111111"; 
		     end case;
		 when "01" =>
		      case sem is   
                    when "0111" => CATOD<="1111111";
                    when "1011" => CATOD<="0011000";
                    when "1101" => CATOD<="1111111";
                    when "1110" => CATOD<="1111111"; 
                    when others => CATOD<="1111111"; 
                end case;
        when "10" =>
               case sem is   
                   when "0111" => CATOD<="1111111";
                   when "1011" => CATOD<="1111111";
                   when "1101" => CATOD<="0110000";
                   when "1110" => CATOD<="1111111"; 
                   when others => CATOD<="1111111"; 
               end case;
      when "11" =>  
               case sem is   
                     when "0111" => CATOD<="1111111";
                     when "1011" => CATOD<="1111111";
                     when "1101" => CATOD<="1111111";
                     when "1110" => CATOD<="1110001"; 
                     when others => CATOD<="1111111"; 
               end case;
      when others =>null;
      end case;
	
	
	when "11" =>   ---Crestere cuvant
	  case num is
	      when "00" =>
		      case sem is
			    when "0111" => CATOD<="0000001";
			    when "1011" => CATOD<="1111111";
			    when "1101" => CATOD<="1111111";
		  	    when "1110" => CATOD<="1111111"; 
			    when others => CATOD<="1111111"; 
		     end case;
		 when "01" =>
		      case sem is   
                    when "0111" => CATOD<="0000001";
                    when "1011" => CATOD<="0011000";
                    when "1101" => CATOD<="1111111";
                    when "1110" => CATOD<="1111111"; 
                    when others => CATOD<="1111111"; 
                end case;
        when "10" =>
               case sem is   
                   when "0111" => CATOD<="0000001";
                   when "1011" => CATOD<="0011000";
                   when "1101" => CATOD<="0110000";
                   when "1110" => CATOD<="1111111"; 
                   when others => CATOD<="1111111"; 
               end case;
      when "11" =>  
               case sem is   
                     when "0111" => CATOD<="0000001";
                     when "1011" => CATOD<="0011000";
                     when "1101" => CATOD<="0110000";
                     when "1110" => CATOD<="1110001"; 
                     when others => CATOD<="1111111"; 
               end case;
      when others =>null;
      end case;
    when others => null;  
	
	end case;
end process;
end arhafis;
