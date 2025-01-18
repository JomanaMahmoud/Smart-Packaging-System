library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity projectDSD is
    Port (
        clk                 : in  STD_LOGIC;               -- Clock signal
        in1                 : out STD_LOGIC;               -- Control signal for L298N IN1 (direction)
        in2                 : out STD_LOGIC;               -- Control signal for L298N IN2 (direction)
        in3                 : out STD_LOGIC;               -- Control signal for L298N IN3 (direction)
        in4                 : out STD_LOGIC;               -- Control signal for L298N IN4 (direction)
        enable_outA         : out STD_LOGIC;               -- Control signal for L298N EN (PWM)
        enable_outB         : out STD_LOGIC;               -- Control signal for L298N EN (PWM)
        alert               : out STD_LOGIC;               -- Alert signal for workers
        worker_near         : in  STD_LOGIC;               -- Worker proximity sensor signal
        magnetic_sensor     : in  STD_LOGIC;               -- Magnetic sensor input
        seven_segment_display : out STD_LOGIC_VECTOR(6 downto 0); -- 7-segment display output
        Reset               : in  STD_LOGIC                -- Reset signal
    );
end projectDSD;

architecture Behavioral of projectDSD is
    signal product_count        : integer range 0 to 5 := 0;
    signal working_belt         : std_logic := '1';
    signal prev_magnetic_sensor : std_logic := '0'; -- To store previous state
    signal prev_Reset           : std_logic := '1';

    -- Signals for PWM
    signal pwm_counter          : integer range 0 to 99 := 0; -- PWM counter (0 to 99 for 1% resolution)
    signal pwm_signal           : std_logic := '0';          -- PWM output signal
begin

-- PWM process for 40% speed
process(clk)
begin
    if rising_edge(clk) then
        if pwm_counter < 39 then -- High for 40% of the time
            pwm_signal <= '1';
        else
            pwm_signal <= '0';
        end if;

        pwm_counter <= pwm_counter + 1;

        if pwm_counter = 99 then -- Reset counter after 100 cycles
            pwm_counter <= 0;
        end if;
    end if;
end process;

-- Main process
process(Reset, clk)
begin
    if Reset = '0' then
        alert <= '0';
        working_belt <= '1';                -- Restart the belt
        prev_magnetic_sensor <= '0';
        product_count <= 0;                 -- Initialize product count to 0
        prev_Reset <= '0';
    elsif rising_edge(clk) then
        prev_Reset <= '1';
        -- Detect both rising edge and toggling sequence
        if (magnetic_sensor = '1' and prev_magnetic_sensor = '0' and prev_Reset = '1') or
           (prev_magnetic_sensor = '1' and magnetic_sensor = '0') then
            if product_count < 5 then
                product_count <= product_count + 1;
            end if;
        end if;

        if product_count = 5 then
            working_belt <= '0'; -- Stop the belt
            if worker_near = '1' then
                alert <= '1'; 
            else
                alert <= '0'; 
            end if;
        end if;

        -- Update previous state of the magnetic sensor
        prev_magnetic_sensor <= magnetic_sensor;
    end if;

    -- 7-segment display decoding
    case product_count is
        when 0 => seven_segment_display <= "1000000"; -- Display 0
        when 1 => seven_segment_display <= "1111001"; -- Display 1
        when 2 => seven_segment_display <= "0100100"; -- Display 2
        when 3 => seven_segment_display <= "0110000"; -- Display 3
        when 4 => seven_segment_display <= "0011001"; -- Display 4
        when 5 => seven_segment_display <= "0010010"; -- Display 5
        when others => seven_segment_display <= "1111111"; -- Default: blank display
    end case;
end process;

-- Assign PWM signal to motor enable signals
enable_outA <= pwm_signal when working_belt = '1' else '0';
enable_outB <= pwm_signal when working_belt = '1' else '0';

-- Set motor direction
in1 <= '1'; -- Forward direction
in2 <= '0'; -- Forward direction
in3 <= '1'; -- Forward direction
in4 <= '0'; -- Forward direction

end Behavioral;
