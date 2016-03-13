library ieee;
use ieee.std_logic_1164.all;

entity Comb is
port(	
		A : in 	std_logic_vector (7 downto 0);
		S : out	std_logic_vector (7 downto 0);
		
		x : in 	std_logic
);
end entity Comb;  

architecture rtl of Comb is
begin

S <= A when x = '0' else not A;

end architecture rtl;


