TYPE element  IS STD_LOGIC_VECTOR(3 DOWNTO 0);
TYPE tab_type IS ARRAY (0 TO 7) OF element;

CONSTANT table : rom_type := (
  "1010", "1101", "1001", "0001",
  "1111", "0101", "1011", "1001"
 );

TYPE element  IS UNSIGNED(3 DOWNTO 0);
TYPE tab_type IS ARRAY (0 TO 15) OF element;
SIGNAL table : tab_type;