library IEEE;
use IEEE.std_logic_1164.all;

ENTITY top_module IS 
	Port ( 
		CLOCK         : in  STD_LOGIC;
		RESET         : in  STD_LOGIC;
		LEDS 		  : out STD_LOGIC_VECTOR (15 downto 0); -- NEXYS A7
--		LEDS 		  : out STD_LOGIC_VECTOR ( 1 downto 0); -- CMOD  A7
		UART_RXD_OUT  : out STD_LOGIC;
		UART_TXD_IN   : in  STD_LOGIC
	);
end top_module;

ARCHITECTURE comportement OF top_module IS

	COMPONENT chip_enable IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		O   : out STD_LOGIC
	);
	END COMPONENT;

	COMPONENT UART_RECV_generic is
		Generic (CLK_FREQU : integer := 100000000;
				 BAUDRATE  : integer := 921600;
				 TIME_PREC : integer := 0;
				 DATA_SIZE : integer := 8);
		Port ( clk   : in STD_LOGIC;
			   reset : in STD_LOGIC;
			   RX    : in STD_LOGIC;
			   dout  : out STD_LOGIC_VECTOR (DATA_SIZE - 1 downto 0);
			   den   : out STD_LOGIC);
	end COMPONENT;
	
	 COMPONENT uart_2_enc IS
		PORT (
			CLK        : in  STD_LOGIC;
			RST        : in  STD_LOGIC;
			CEN        : in  STD_LOGIC;
			DATA_I     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
			DATA_I_EN  : in  STD_LOGIC;
			DATA_O     : out STD_LOGIC_VECTOR(7 DOWNTO 0);
			DATA_O_EN  : out STD_LOGIC
		);
	END COMPONENT;

	COMPONENT morse_encoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		c_en      : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC;
		data_o_en : OUT STD_LOGIC
	);
	END COMPONENT;

	COMPONENT morse_decoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		c_en      : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC;
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_o_en : OUT STD_LOGIC
	);
	END COMPONENT;

	COMPONENT dec_2_uart IS
	PORT (
		CLK        : in  STD_LOGIC;
		RST        : in  STD_LOGIC;
		CEN        : in  STD_LOGIC;
		DATA_I     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_I_EN  : in  STD_LOGIC;
		DATA_O     : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATA_O_EN  : out  STD_LOGIC
	);
	END COMPONENT;

	COMPONENT UART_SEND_generic is
		Generic (CLK_FREQU : integer := 100000000;
				 BAUDRATE  : integer := 921600;
				 TIME_PREC : integer := 0;
				 DATA_SIZE : integer := 8);
	Port ( clk   : in  STD_LOGIC;
		   reset : in  STD_LOGIC;
		   TX    : out STD_LOGIC;
		   din   : in  STD_LOGIC_VECTOR (DATA_SIZE - 1 downto 0);
		   den   : in  STD_LOGIC;
		   bsy   : out STD_LOGIC);
	end COMPONENT;
	

	SIGNAL ce_1_Hz      : STD_LOGIC;

 	SIGNAL pc_data      : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL pc_data_en   : STD_LOGIC;

	SIGNAL idata        : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL idata_en     : STD_LOGIC;

	SIGNAL tdata        : STD_LOGIC;
 	SIGNAL tdata_en     : STD_LOGIC;

	SIGNAL odata        : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL odata_en     : STD_LOGIC;

	SIGNAL uart_data    : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL uart_data_en : STD_LOGIC;

BEGIN

	ce : chip_enable -- 921600 ( 100 MHz )
	PORT MAP(
		clk => CLOCK,
		rst => RESET,
		O   => ce_1_Hz
	);

	UART_r : UART_RECV_generic -- 921600 ( 100 MHz )
	GENERIC MAP(
		CLK_FREQU => 100000000, -- NEXYS A7
--		CLK_FREQU => 12000000,	-- CMOD  A7
		CLK_FREQU => 12000000,
		BAUDRATE  => 115200
	)
	PORT MAP(
		clk        => CLOCK,
		reset      => RESET,
		rx         => UART_TXD_IN, -- FPGA PIN
		dout       => pc_data,
		den        => pc_data_en
	);

	conv : uart_2_enc
	PORT MAP (
		CLK        => CLOCK,
		RST        => RESET,
		CEN        => ce_1_Hz,
		DATA_I     => pc_data,
		DATA_I_EN  => pc_data_en,
		DATA_O     => idata,
		DATA_O_EN  => idata_en
	);

	enc :  morse_encoder port map ( CLOCK, RESET, ce_1_Hz, idata, idata_en, tdata, tdata_en );

	LEDS <= (others => '1') WHEN (tdata = '1') AND (tdata_en = '1') ELSE (others => '0');

	dec :  morse_decoder port map ( CLOCK, RESET, ce_1_Hz, tdata, tdata_en, odata, odata_en );

	iconv : dec_2_uart
	PORT MAP (
		CLK        => CLOCK,
		RST        => RESET,
		CEN        => ce_1_Hz,
		DATA_I     => odata,
		DATA_I_EN  => odata_en,
		DATA_O     => uart_data,
		DATA_O_EN  => uart_data_en
	);

	UART_s : UART_SEND_generic -- 921600 ( 100 MHz )
	GENERIC MAP(
		CLK_FREQU => 100000000, -- NEXYS A7
--		CLK_FREQU => 12000000,	-- CMOD  A7
		BAUDRATE  => 115200
	)
	PORT MAP(
		clk   => CLOCK,
		reset => RESET,
		TX    => UART_RXD_OUT,
		din   => uart_data,
		den   => uart_data_en,
		bsy   => open
	);

	
END comportement;