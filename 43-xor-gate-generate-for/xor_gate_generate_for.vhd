LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate_generate_for IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : OUT std_logic_vector(3 downto 0)
	);
END xor_gate_generate_for;

ARCHITECTURE arch OF xor_gate_generate_for IS
BEGIN

        LOOP_ADD : for I in 0 to 3 generate
                C(i) <= A(i) XOR B(i);
        end generate;

END arch;


