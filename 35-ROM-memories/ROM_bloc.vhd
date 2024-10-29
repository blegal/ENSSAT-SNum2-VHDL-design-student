LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ROM_bloc IS
PORT (
      CLOCK     : IN  STD_LOGIC;
      ADDR      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      DATA_OUT  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
END ROM_bloc;

ARCHITECTURE Behavioral OF ROM_bloc IS
--TYPE  rom_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
  SUBTYPE element  IS STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE rom_type IS ARRAY (0 TO 15) OF element;

  CONSTANT memory : rom_type := (
    "1010", "1101", "1001", "0001",
    "1111", "0101", "1011", "1001",
    "0000", "1111", "0000", "1111",
    "1001", "1001", "1001", "1001"
   );

BEGIN

  PROCESS (CLOCK)
    VARIABLE V : INTEGER;
  BEGIN
    IF (CLOCK'event AND CLOCK = '1') THEN
      V := to_integer(UNSIGNED(ADDR));
      DATA_OUT <= memory(V);
    END IF;
  END PROCESS;

END Behavioral;
