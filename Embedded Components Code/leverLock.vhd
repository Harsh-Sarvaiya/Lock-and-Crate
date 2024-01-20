library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LLock is
    Port ( sw : in STD_LOGIC_vector(15 downto 0);
            led: out std_logic;
            pos: out std_logic_vector(6 downto 0));
end LLock;

architecture LLock_arch of LLock is
signal rightcode: std_logic_vector(15 downto 0) := "1000000000000001";
begin
    process(sw)
    begin
        if(sw = rightcode) then
            led <= '0'; --unlocked
            pos <= "1111111";
        else
            led <= '1'; --locked
            pos <= "0000000";
        end if;
    end process;

end LLock_arch;
