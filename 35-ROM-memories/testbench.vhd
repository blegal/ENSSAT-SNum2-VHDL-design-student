library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT ROM_bloc IS
	PORT (
		CLOCK     : IN  STD_LOGIC;
		ADDR      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_OUT  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT ROM_luts IS
	PORT (
		CLOCK     : IN  STD_LOGIC;
		ADDR      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_OUT  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL clock  : STD_LOGIC;
 	SIGNAL addr   : STD_LOGIC_VECTOR(3 downto 0);
 	SIGNAL s1     : STD_LOGIC_VECTOR(3 downto 0);
 	SIGNAL s2     : STD_LOGIC_VECTOR(3 downto 0);
		
BEGIN

	uu1 :  ROM_bloc port map ( CLOCK => clock, ADDR => addr, DATA_OUT => s1 );
	uu2 :  ROM_luts port map ( CLOCK => clock, ADDR => addr, DATA_OUT => s2 );

	PROCESS 
	BEGIN
		clock <= '0';
		for i in 0 to 40 loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait;
	END PROCESS;
	
	entree: PROCESS
	begin
		addr <= "0000"; wait for 10 ns; 
		addr <= "0001"; wait for 10 ns; 
		addr <= "0010"; wait for 10 ns; 
		addr <= "0011"; wait for 10 ns; 
		addr <= "0100"; wait for 10 ns; 
		addr <= "0101"; wait for 10 ns; 
		addr <= "0110"; wait for 10 ns; 
		addr <= "0111"; wait for 10 ns; 
		addr <= "1000"; wait for 10 ns; 
		addr <= "1001"; wait for 10 ns; 
		addr <= "1010"; wait for 10 ns; 
		addr <= "1011"; wait for 10 ns; 
		addr <= "1100"; wait for 10 ns; 
		addr <= "1101"; wait for 10 ns; 
		addr <= "1110"; wait for 10 ns; 
		addr <= "1111"; wait for 10 ns; 
		wait;
	end process entree;
	
END comportement;