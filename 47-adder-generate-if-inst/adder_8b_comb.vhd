LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder_8b_comb IS
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
END adder_8b_comb;

ARCHITECTURE arch OF adder_8b IS
	SIGNAL C : std_logic_vector(0 to 8);
BEGIN

	C(0) <= '0';
	LOOP_ADD : for I in 0 to 7 generate
		S(I)     <=  A(I) xor B(I) xor C(I);
		C(I + 1) <= (A(I) and B(I)) or (A(I) and C(I)) or (B(I) and C(I));
	end generate;
	S(8) <= C(8);

END arch;
