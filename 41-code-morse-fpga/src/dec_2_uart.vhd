library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY dec_2_uart IS
	PORT (
		CLK        : in  STD_LOGIC;
		RST        : in  STD_LOGIC;
		CEN        : in  STD_LOGIC;
		DATA_I     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_I_EN  : in  STD_LOGIC;
		DATA_O     : out STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_O_EN  : out STD_LOGIC
	);
END dec_2_uart;

ARCHITECTURE Behavioral OF dec_2_uart IS
BEGIN

    --
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    --

END Behavioral;