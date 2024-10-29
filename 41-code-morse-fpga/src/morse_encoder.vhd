LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY morse_encoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		c_en      : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC;
		data_o_en : OUT STD_LOGIC
	);
END morse_encoder;

ARCHITECTURE behavior OF morse_encoder IS

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