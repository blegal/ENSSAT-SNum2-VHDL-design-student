library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT RAM_dp_bloc IS
	PORT (
		CLOCK   : IN  STD_LOGIC;
		ADDR    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_R  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_W  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_We : IN  STD_LOGIC
		);
	END COMPONENT;

	COMPONENT RAM_dp_luts IS
	PORT (
		CLOCK   : IN  STD_LOGIC;
		ADDR    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_R  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_W  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DATA_We : IN  STD_LOGIC
		);
	END COMPONENT;

	SIGNAL CLOCK    : STD_LOGIC;
 	SIGNAL ADDR     : STD_LOGIC_VECTOR(3 downto 0);
 	SIGNAL DATA_W   : STD_LOGIC_VECTOR(3 downto 0);
 	SIGNAL DATA_WEN : STD_LOGIC;
 	SIGNAL DATA_R1  : STD_LOGIC_VECTOR(3 downto 0);
 	SIGNAL DATA_R2  : STD_LOGIC_VECTOR(3 downto 0);
		
BEGIN

	uu1 :  RAM_dp_bloc port map ( CLOCK, ADDR, DATA_R1, DATA_W, DATA_WEN );
	uu2 :  RAM_dp_luts port map ( CLOCK, ADDR, DATA_R2, DATA_W, DATA_WEN );

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

		-- ECRITURE
		ADDR     <= "0000";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0001";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0010";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0011";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0100";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0101";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0110";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0111";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1000";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1001";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 
		
		ADDR <= "1010";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1011";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1100";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1101";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1110";
		DATA_W   <= "0011";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1111";
		DATA_W   <= "1100";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 
		
		------------------------------------------------------------

		-- ECRITURE
		ADDR     <= "0000";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0001";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0010";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0011";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0100";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0101";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0110";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "0111";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1000";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1001";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 
		
		ADDR <= "1010";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1011";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1100";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1101";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1110";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 

		ADDR <= "1111";
		DATA_W   <= "0000";
		DATA_WEN <=    '1';
		wait for 10 ns; 
		-- LECTURE
		DATA_W   <= "0000";
		DATA_WEN <=    '0';
		wait for 10 ns; 
		
		wait;
	end process entree;
	
END comportement;