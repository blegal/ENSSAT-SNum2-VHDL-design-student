-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT fonc_logique IS
  PORT (
    A : IN  std_logic_vector(3 downto 0);
    B : IN  std_logic_vector(3 downto 0);
    S : OUT std_logic
    );
  END COMPONENT;
  
  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal S : std_logic;

  function to_bstring(sl : std_logic) return string is
    variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
  begin
    sl_str_v := std_logic'image(sl);
    return "" & sl_str_v(2);  -- "" & character to get string
  end function;
  
  function to_bstring(slv : std_logic_vector) return string is
    alias    slv_norm : std_logic_vector(1 to slv'length) is slv;
    variable sl_str_v : string(1 to 1);  -- String of std_logic
    variable res_v    : string(1 to slv'length);
  begin
    for idx in slv_norm'range loop
      sl_str_v := to_bstring(slv_norm(idx));
      res_v(idx) := sl_str_v(1);
    end loop;
    return res_v;
  end function;

begin

  uut: fonc_logique port map (  A => A,
                                B => B,
                                S => S );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "0000";
    B <= "0001";
    wait for 10 ns;

    A <= "1101";
    B <= "0011";
    wait for 10 ns;

    A <= "1011";
    B <= "1101";
    wait for 10 ns;

    A <= "1111";
    B <= "0011";
    wait for 10 ns;

    A <= "0001";
    B <= "1000";
    wait for 10 ns;

    A <= "0111";
    B <= "0111";
    wait for 10 ns;

    REPORT "Simulation end...";
    wait;
  end process;

end;