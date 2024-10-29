LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder_8b IS
	GENERIC(
		NATIVE : INTEGER := 1
	);
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
END adder_8b;

ARCHITECTURE arch OF adder_8b IS

	COMPONENT adder_8b_comb IS
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
	END COMPONENT;

	COMPONENT adder_8b_native IS
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
	END COMPONENT;

BEGIN

	cnd : if NATIVE = 0 generate
		
		ASSERT FALSE REPORT "- USING CUSTOM ADDER DESCRIPTION" SEVERITY NOTE;
		add : adder_8b_comb( A => A, B => B, S => S);

	else generate

		ASSERT FALSE REPORT "- USING CUSTOM ADDER DESCRIPTION" SEVERITY NOTE;
		add : adder_8b_native( A => A, B => B, S => S);

	end generate;


END arch;
