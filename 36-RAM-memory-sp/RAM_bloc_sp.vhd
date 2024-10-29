LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RAM_bloc_sp IS
PORT (
      CLOCK   : IN  STD_LOGIC;
      ADDR    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      DATA_R  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      DATA_W  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      DATA_We : IN  STD_LOGIC
      );
END RAM_bloc_sp;

ARCHITECTURE Behavioral OF RAM_bloc_sp IS
  SUBTYPE element  IS STD_LOGIC_VECTOR(3 DOWNTO 0);
  TYPE ram_type IS ARRAY (0 TO 15) OF element;

  SIGNAL memory : ram_type;
BEGIN

  PROCESS (CLOCK)
    VARIABLE V : INTEGER;
  BEGIN
    IF (CLOCK'event AND CLOCK = '1') THEN
      V := to_integer(UNSIGNED(ADDR));

      IF DATA_We = '1' THEN
        memory(V) <= DATA_W;
      ELSE
        DATA_R <= memory(V);
      END IF;

    END IF;
  END PROCESS;

END Behavioral;