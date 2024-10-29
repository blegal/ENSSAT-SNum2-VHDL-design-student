LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY morse_decoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		c_en      : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC;
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_o_en : OUT STD_LOGIC
	);
END morse_decoder;

ARCHITECTURE behavior OF morse_decoder IS

    --
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    --

BEGIN

    --
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    -- ... ... ... ... ... ...
    --

END;