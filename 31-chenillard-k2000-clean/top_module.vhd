library IEEE;
use IEEE.std_logic_1164.all;

ENTITY top_module IS
	PORT ( 
		CLOCK : IN  STD_LOGIC;
		RESET : IN  STD_LOGIC;
		LEDS  : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END top_module;

ARCHITECTURE behavior OF top_module IS

	COMPONENT chip_enable IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		O   : out STD_LOGIC
	);
	END COMPONENT;

	COMPONENT chenillard IS
	PORT ( 
		clock  : IN  STD_LOGIC;
		reset  : IN  STD_LOGIC;
		enable : IN  STD_LOGIC;
		s      : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
	END COMPONENT;

	SIGNAL c_en : STD_LOGIC;

BEGIN

	uu1 : chip_enable port map( clock, reset, c_en       );
	uu2 : chenillard  port map( clock, reset, c_en, leds );

END;