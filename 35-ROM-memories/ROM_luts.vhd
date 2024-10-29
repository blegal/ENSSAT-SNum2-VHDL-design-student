LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ROM_luts IS
PORT (
      CLOCK     : IN  STD_LOGIC;
      ADDR      : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      DATA_OUT  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
END ROM_luts;

ARCHITECTURE Behavioral OF ROM_luts IS
  SUBTYPE element  IS STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE rom_type IS ARRAY (0 TO 15) OF element;

  CONSTANT memory : rom_type := (
    "1010", "1101", "1001", "0001",
    "1111", "0101", "1011", "1001",
    "0000", "1111", "0000", "1111",
    "1001", "1001", "1001", "1001"
   );

BEGIN

  PROCESS ( ADDR )
    VARIABLE V : INTEGER;
  BEGIN
      V := to_integer(UNSIGNED(ADDR));
      DATA_OUT <= memory(V);
  END PROCESS;

END Behavioral;
