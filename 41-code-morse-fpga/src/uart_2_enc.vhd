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

    --
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    --

END Behavioral;