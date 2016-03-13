library ieee;
use ieee.std_logic_1164.all;

entity dec_seg is
port(	
		N : in 	std_logic_vector (3 downto 0);
		S : out	std_logic_vector (6 downto 0)
);
end entity dec_seg;  

architecture rtl of dec_seg is
begin

process (N)
begin
case N is
	when "0000" =>
		S <= "1000000";
	when "0001" =>
		S <= "1111001";
	when "0010" => 
		S <= "0100100";
	when "0011" => 
		S <= "0110000";
	when "0100" => 
		S <= "0011001";
	when "0101" => 
		S <= "0010010";
	when "0110" => 
		S <= "0000111";
	when "0111" => 
		S <= "0111000";
	when "1000" => 
		S <= "0000000";
	when others => 
		S <= "1111111";
end case;
end process;
end architecture rtl;

