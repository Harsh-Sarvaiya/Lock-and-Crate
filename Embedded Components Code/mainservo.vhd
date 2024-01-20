library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_pwm_clk64kHz is
    PORT(
        clk  : IN  STD_LOGIC;
        reset: IN  STD_LOGIC;
        sw: in std_logic_vector(15 downto 0);
        led: out std_logic;
        servo: OUT STD_LOGIC
    );
end servo_pwm_clk64kHz;

architecture Behavioral of servo_pwm_clk64kHz is
    COMPONENT clk64kHz
        PORT(
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT servo_pwm
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
            servo : OUT STD_LOGIC
        );
    END COMPONENT;
    
    component Llock
        Port ( sw : in STD_LOGIC_vector(15 downto 0);
             led: out std_logic;
             pos: out std_logic_vector(6 downto 0));
    end component;
    
    signal pos : std_logic_vector(6 downto 0) := "0000000";
    signal clk_out : STD_LOGIC := '0';
begin
    clk64kHz_map: clk64kHz PORT MAP(
        clk, reset, clk_out
    );
    
    servo_pwm_map: servo_pwm PORT MAP(
        clk_out, reset, pos, servo
    );
    
    lever_lock_map: Llock port map(
        sw, led, pos
    );
end Behavioral;