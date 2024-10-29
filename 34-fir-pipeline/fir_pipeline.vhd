LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY fir_pipeline IS
PORT (
        clock : IN  std_logic;
        reset : IN  std_logic;
        Xn    : IN  std_logic_vector(7 downto 0);   -- ENTRE -128 et 127
        Yn    : OUT std_logic_vector(7 downto 0)    -- ENTRE -128 et 127
	);
END fir_pipeline;

ARCHITECTURE arch OF fir_pipeline IS

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

END arch;
