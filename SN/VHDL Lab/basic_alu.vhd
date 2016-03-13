library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
port(	
		A 		: in std_logic_vector(5 downto 0);
		B 		: in std_logic_vector(5 downto 0);
		
		I 		: in std_logic_vector(2 downto 0);
	
		S		: out std_logic_vector(5 downto 0);
		
		Ov 	: out std_logic;
		Z 		: out std_logic;
		N 		: out std_logic
		

);
end entity alu;  

architecture rtl of alu is

signal sig_out : std_logic_vector (5 downto 0);

begin

Z <= '1' when sig_out = "000000" else '0';
N <= '1' when signed(sig_out) < 0 else '0';
S <= sig_out;

process (I, A, B)
begin

if (I = "000") then
	Ov <= '0';
	sig_out <= A;
elsif (I = "001") then
	Ov <= '0';
	sig_out <= A and B;
elsif (I = "010") then
	Ov <= '0';
	sig_out <= A or B;
elsif (I = "011") then
	Ov <= '0';
	sig_out <= not B;
elsif (I = "100") then
	sig_out <= std_logic_vector(signed(A) + signed(B));
	
	if ((signed(A) > 0) and (signed(B) > 0) and ((signed(A) + signed(B)) < 0)) then
		Ov <= '1';
	elsif ((signed(A) < 0) and (signed(B) < 0) and ((signed(A) + signed(B)) > 0)) then
		Ov <= '1';
	else
		Ov <= '0';
	end if;
elsif (I = "101") then
	sig_out <= std_logic_vector(signed(A) - signed(B));
	
	if ((signed(A) > 0) and (signed(B) < 0) and ((signed(A) + signed(B)) < 0)) then
		Ov <= '1';
	elsif ((signed(A) < 0) and (signed(B) > 0) and ((signed(A) + signed(B)) > 0)) then
		Ov <= '1';
	else
		Ov <= '0';
	end if;
elsif (I = "110") then
	Ov <= '0';
	sig_out <= '0' & A ( 5 downto 1);
elsif (I = "111") then
	Ov <= '0';
	sig_out <= A ( 4 downto 0) & '0';
end if;
end process;

end architecture rtl;

