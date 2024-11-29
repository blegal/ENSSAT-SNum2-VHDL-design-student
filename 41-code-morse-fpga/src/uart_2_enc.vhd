library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY uart_2_enc IS
	PORT (
		CLK        : in  STD_LOGIC;
		RST        : in  STD_LOGIC;
		CEN        : in  STD_LOGIC;
		DATA_I     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_I_EN  : in  STD_LOGIC;
		DATA_O     : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_O_EN  : out STD_LOGIC
	);
END uart_2_enc;

ARCHITECTURE Behavioral OF uart_2_enc IS
BEGIN

	PROCESS(RST, CLK)
	BEGIN
		IF RST = '1' THEN
			DATA_O    <= x"00";
			DATA_O_EN <=   '0';
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF DATA_I_EN = '1' THEN
				DATA_O    <= STD_LOGIC_VECTOR( UNSIGNED(DATA_I) - TO_UNSIGNED(65, 8));
				DATA_O_EN <=   '1';
			ELSIF CEN = '1' THEN
				DATA_O    <= x"00";
				DATA_O_EN <=   '0';
			END IF;
		END IF;
	END PROCESS;

END Behavioral;