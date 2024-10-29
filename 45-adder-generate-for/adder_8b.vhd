LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder_8b IS
	PORT (
		A : IN  std_logic_vector(7 downto 0);
		B : IN  std_logic_vector(7 downto 0);
		S : OUT std_logic_vector(8 downto 0)
	);
END adder_8b;

ARCHITECTURE arch OF adder_8b IS

	COMPONENT full_adder IS
	PORT (
		A   : IN  std_logic;
		B   : IN  std_logic;
		Cin : IN  std_logic;
		S   : OUT std_logic;
		Cou : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT half_adder IS
	PORT (
        A   : IN  std_logic;
        B   : IN  std_logic;
        S   : OUT std_logic;
        Cou : OUT std_logic
		);
	END COMPONENT;
	
	SIGNAL C : STD_LOGIC_VECTOR(7 DOWNTO 1);

BEGIN

	i1 : half_adder port map(A(0), B(0), S(0), C(1) );

	LOOP_ADD : for I in 1 to 6 generate
		inst : full_adder port map(A(i), B(i), C(i),   S(i), C(i+1));
	end generate;

	inst : full_adder port map(A(7), B(7), C(7), S(7), S(8));

END arch;
