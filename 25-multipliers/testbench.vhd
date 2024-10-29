library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT mul_8b_8b_8b IS
	PORT (
        A : IN  std_logic_vector(7 downto 0);
        B : IN  std_logic_vector(7 downto 0);
        C : OUT std_logic_vector(7 downto 0)
	);
	END COMPONENT;

	COMPONENT mul_16b_8b_8b IS
	PORT (
        A : IN  std_logic_vector( 7 downto 0);
        B : IN  std_logic_vector( 7 downto 0);
        C : OUT std_logic_vector(15 downto 0)
	);
	END COMPONENT;

	SIGNAL A : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL B : STD_LOGIC_VECTOR(7 downto 0);

	SIGNAL S1 : STD_LOGIC_VECTOR(7  downto 0);
	SIGNAL S2 : STD_LOGIC_VECTOR(15 downto 0);
		
BEGIN

	dut1 :  mul_8b_8b_8b  port map ( A, B, S1 );
	dut2 :  mul_16b_8b_8b port map ( A, B, S2 );
	
	entree: PROCESS
	begin
		A <= "00000000";
		B <= "00000000";
	    wait for 10 ns; 

		A <= "00000001";
		B <= "00000001";
	    wait for 10 ns; 

		A <= "00000010";
		B <= "00000010";
	    wait for 10 ns; 

		A <= "10000001";
		B <= "01000001";
	    wait for 10 ns; 

		A <= "11111111";
		B <= "00000001";
	    wait for 10 ns; 

		A <= "00001111";
		B <= "11110000";
	    wait for 10 ns; 

		A <= "10000000";
		B <= "10000000";
	    wait for 10 ns; 

		A <= "10000001";
		B <= "01111111";
	    wait for 10 ns; 

		wait;
	end process entree;
	
	
END comportement;