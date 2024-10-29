library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY clock_divider IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		O   : out STD_LOGIC
	);
END clock_divider;

ARCHITECTURE Behavioral OF clock_divider IS
	SIGNAL COUNTER : UNSIGNED(2 DOWNTO 0);
	SIGNAL OUT_V   : STD_LOGIC;
BEGIN

	PROCESS(RST, CLK)
	BEGIN
		IF RST = '1' THEN
			OUT_V   <= '0';
			COUNTER <= TO_UNSIGNED( 0, 3 );
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF COUNTER = TO_UNSIGNED( 7, 3 ) THEN
				COUNTER <= TO_UNSIGNED( 0, 3 );
				OUT_V   <= NOT OUT_V;
			ELSE
				COUNTER <= COUNTER + TO_UNSIGNED( 1, 3 );
			END IF;
		END IF;
	END PROCESS;

	O <= OUT_V;

END Behavioral;