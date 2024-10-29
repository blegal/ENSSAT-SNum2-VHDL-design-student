----------------------------------------------------------------------------------
-- UART_SEND_generic
-- author : Y. Bornat
-- company : ENSEIRB-MATMECA - Bordeaux INP / University of Bordeaux / CNRS
-- Licence : CC-BY
----------------------------------------------------------------------------------
-- Module to send data with the UART HW protocol
-- CLK_FREQU : clk frequency in Hz. Default is 100000000 (100MHz)
-- BAURATE   : bitrate of the line transfer Default is 921600.
-- DATA_SIZE : size of word to send (start and stop bits excluded). Default is 8
-- TIME_PREC : Time precision to compute bit time. counted is clk periods.
--             Useful to reduce resources when time precision is not critical
--             if TIME_PREC = 0, the module computes the best compromise (e.g the
--             gcd og CLK_FREQU and BAUDRATE). Default value is 0 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UART_SEND_generic is
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
end UART_SEND_generic;

architecture Behavioral of UART_SEND_generic is

-- This is to determine the actual value of time precicion
pure function timeprecgcd (timeprec_r : integer;
                          clk_frequ_i : integer;
                           baudrate_i : integer)
            return integer is
        variable a, b, t : integer;
        variable res     : integer;
    begin
        if timeprec_r = 0 then
            -- compute gcd of clk_frequ and baudrate
            a := clk_frequ_i;
            b := baudrate_i;
            while b>0 loop
                t := a mod b;
                a := b;
                b := t;
            end loop;
            res := a;
        else
            -- simply copy the value given
            res := timeprec_r;
        end if;
        return res;
    end;


    constant TIME_PREC_i  : integer := timeprecgcd(TIME_PREC, CLK_FREQU, BAUDRATE);
    constant clkfrequ_int : integer := CLK_FREQU/TIME_PREC_i;
    constant baudrate_int : integer := BAUDRATE /TIME_PREC_i;
    
    signal div_cnt    : integer range 0 to (clkfrequ_int + baudrate_int);       -- clock divider counter
    signal bitcounter : integer range 0 to DATA_SIZE + 2;                       -- word bit counter
    signal shift_reg  : std_logic_vector(DATA_SIZE downto 0):= (others => '1'); -- data to send in a shift register

begin


    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                bitcounter <= 0;
                div_cnt    <= 0;
                shift_reg  <= (DATA_SIZE downto 0 => '1');
                bsy        <= '0';
            elsif bitcounter=0 then -- if not sending data
                if den = '1' then   -- if new data provided
                    bitcounter <= DATA_SIZE + 2;
                    div_cnt    <= baudrate_int/2;
                    shift_reg  <= din & '0';
                    bsy        <= '1';
                else
                    bsy        <= '0';
                end if;
            elsif div_cnt >= clkfrequ_int then  -- if clock divider expired (end of bit time)
                div_cnt    <= div_cnt - clkfrequ_int + baudrate_int;
                bitcounter <= bitcounter - 1;
                shift_reg  <= '1' & shift_reg(DATA_SIZE downto 1);
                if bitcounter = 1 then
                    bsy        <= '0';
                end if;
            else
                div_cnt    <= div_cnt + baudrate_int;
            end if;
        end if;
    end process;

    TX <= shift_reg(0);    


end Behavioral;
