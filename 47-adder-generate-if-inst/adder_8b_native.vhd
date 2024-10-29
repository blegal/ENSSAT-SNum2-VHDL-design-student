LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder_8b_native IS
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
END adder_8b_native;

ARCHITECTURE arch OF adder_8b_native IS
BEGIN

	S <= STD_LOGIC_VECTOR( RESIZE(UNSIGNED(A), 9) +  RESIZE(UNSIGNED(B), 9));

END arch;
