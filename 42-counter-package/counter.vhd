library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.conf_counter.all;

ENTITY counter IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		O   : out STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END counter;

ARCHITECTURE Behavioral OF counter IS
	SIGNAL COUNTER : UNSIGNED(N-1 DOWNTO 0);
BEGIN

	PROCESS(RST, CLK)
	BEGIN
		IF RST = '1' THEN
			COUNTER <= TO_UNSIGNED( MINV, N );
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF COUNTER = TO_UNSIGNED( MAXV, N ) THEN
				COUNTER <= TO_UNSIGNED( MINV, N );
			ELSE
				COUNTER <= COUNTER + TO_UNSIGNED( 1, N );
			END IF;
		END IF;
	END PROCESS;

	O <= STD_LOGIC_VECTOR( COUNTER );

END Behavioral;