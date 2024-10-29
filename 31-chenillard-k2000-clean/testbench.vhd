library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT top_module IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		leds  : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL leds   : STD_LOGIC_VECTOR(7 downto 0);
		
BEGIN

	uut :  top_module port map ( clock, reset, leds );

	PROCESS 
	BEGIN
		clock <= '0';
		while TRUE loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait;
	END PROCESS;
	
	entree: PROCESS
	begin
		reset <= '1';
	    wait for 10 ns; 
		reset <= '0';
		wait;
	end process entree;
	
	
END comportement;