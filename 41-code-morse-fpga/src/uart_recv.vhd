----------------------------------------------------------------------------------
-- UART_RECV_generic
-- author : Y. Bornat
-- company : ENSEIRB-MATMECA - Bordeaux INP / University of Bordeaux / CNRS
-- Licence : CC-BY
----------------------------------------------------------------------------------
-- Module to receive data with the UART HW protocol
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

entity UART_RECV_generic is
    Generic (CLK_FREQU : integer := 100000000;
             BAUDRATE  : integer := 921600;
             TIME_PREC : integer := 0;
             DATA_SIZE : integer := 8);
    Port ( clk   : in STD_LOGIC;
           reset : in STD_LOGIC;
           RX    : in STD_LOGIC;
           dout  : out STD_LOGIC_VECTOR (DATA_SIZE - 1 downto 0);
           den   : out STD_LOGIC);
end UART_RECV_generic;

architecture Behavioral of UART_RECV_generic is

-- This is to determine the actual value of time precision
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
    
    signal div_cnt    : integer range -clkfrequ_int/2 to (clkfrequ_int + baudrate_int);
    signal bitcounter : integer range 0 to DATA_SIZE + 2;
    signal shift_reg  : std_logic_vector(DATA_SIZE - 1 downto 0);
    signal RX_sampled : std_logic;
    signal new_bit    : std_logic;
    

begin

    -- this process synchronizes the module
    process(clk)
    begin
        if rising_edge(clk) then    
            RX_sampled <= RX;
            if reset = '1' then
                bitcounter <= 0;
                div_cnt    <= 0;
                new_bit    <= '0';
            elsif bitcounter=0 then -- if module was idle til then
                if RX_sampled = '0' then    -- if start bit received
                    bitcounter <= DATA_SIZE + 2;
                    -- the next line looks ugly, but it actually is a constant, so no problem
                    div_cnt      <= (13*BAUDRATE)/(4*TIME_PREC_i)  - clkfrequ_int/2 - 1;
                end if;
                new_bit    <= '0';
            elsif div_cnt >= clkfrequ_int then -- if bit period is over
                div_cnt    <= div_cnt - clkfrequ_int + baudrate_int;
                if bitcounter = 1 and RX_sampled = '1' then
                    bitcounter <= 0;
                    new_bit    <= '0';
                elsif bitcounter > 1 then
                    bitcounter <= bitcounter - 1;
                    new_bit    <= '1';
                end if;
            else
                new_bit    <= '0';
                div_cnt    <= div_cnt + baudrate_int;
                if bitcounter = 1 and RX_sampled = '1' then
                    bitcounter <= 0;
                end if;

            end if;
        end if;
    end process;

    -- this process controls the input shift register
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                shift_reg  <= (DATA_SIZE-1 downto 0 => '0');
            elsif new_bit = '1' then
                shift_reg  <= RX_sampled & shift_reg(DATA_SIZE - 1 downto 1);
            end if;
        end if;
    end process;

    -- to handle the outputs
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                dout  <= (DATA_SIZE-1 downto 0 => '0');
                den   <= '0';
            elsif new_bit = '1' and bitcounter = 1 then
                dout  <= shift_reg;
                den   <= RX_sampled;
            else
                den   <= '0';
            end if;
        end if;
    end process;


end Behavioral;
