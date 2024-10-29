LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY mul_16b_8b_8b IS
	PORT (
        A : IN  std_logic_vector( 7 downto 0);
        B : IN  std_logic_vector( 7 downto 0);
        C : OUT std_logic_vector(15 downto 0)
	);
END mul_16b_8b_8b;

ARCHITECTURE arch OF mul_16b_8b_8b IS
BEGIN

	PROCESS (A, B)
		VARIABLE D : unsigned(7 downto 0);
		VARIABLE E : unsigned(7 downto 0);
	BEGIN
		D := UNSIGNED(A);
		E := UNSIGNED(B);
		C <= STD_LOGIC_VECTOR( D * E );
	END PROCESS;

END arch;
