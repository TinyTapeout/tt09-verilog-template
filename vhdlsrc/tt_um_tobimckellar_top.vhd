library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- Author : Tobias McKellar

entity tt_um_tobimckellar_top is
    port(
        ui_in   : in  std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in  std_logic_vector(7 downto 0);
        uio_out : in  std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0);
        ena     : in std_logic;
        clk     : in std_logic; -- Assuming 10 kHz Clock
        rst_n   : in std_logic
    );
end entity tt_um_tobimckellar_top;


-- module tt_um_tobimckellar_top (
--     input  wire [7:0] ui_in,    // Dedicated inputs
--     output wire [7:0] uo_out,   // Dedicated outputs
--     input  wire [7:0] uio_in,   // IOs: Input path
--     output wire [7:0] uio_out,  // IOs: Output path -- connect to ground
--     output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
--     input  wire       ena,      // always 1 when the design is powered, so you can ignore it
--     input  wire       clk,      // clock
--     input  wire       rst_n     // reset_n - low to reset
-- );


architecture behavioural of tt_um_tobimckellar_top is

    constant MAX_COUNT : integer := 64 - 1; -- 1 MHz / 1000
    constant MAX_AMPLITUDE : integer := MAX_COUNT;
    constant ROM_ENTRIES : integer := 100;

    signal ref_in : std_logic_vector(5 downto 0);
    signal pwm_out : std_logic;
    signal counter : integer range 0 to MAX_COUNT;
    signal enable_pwm : std_logic;
    signal breathe_state : std_logic;


    signal triangle_value : integer range 0 to max_amplitude;
    signal count_up : std_logic;

    signal clock_divisor : integer range 0 to 10 * 63;
    signal clock_divisor_ticks : integer range 0 to 10 * 63;
    signal divided_clock : std_logic;

begin

    enable_pwm <= ui_in(7);
    breathe_state <= ui_in(6);
    ref_in <= ui_in(5 downto 0);
    uo_out(7) <= pwm_out;
    uo_out(6 downto 0) <= (others => '0');
    uio_oe(7 downto 0) <= (others => '0');
    -- uio_out(7 downto 0) <= (others => '0');

    counter_proc : process (clk)
    begin
        if rising_edge(clk) then
            if (rst_n = '0') then
                counter <= 0;
            else
                if counter = MAX_COUNT then
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;


    pwm_proc : process (clk)
    begin
        if rising_edge(clk) then
            if (rst_n = '0') then
                pwm_out <= '0';
            else
                if breathe_state = '0' then
                    if (to_integer(unsigned(ref_in)) > counter) then
                        pwm_out <= '1' and enable_pwm;
                    else
                        pwm_out <= '0';
                    end if;
                    if ref_in = "111111" then
                        pwm_out <= '1' and enable_pwm;
                    end if;
                    if ref_in = "000000" then
                        pwm_out <= '0' and enable_pwm;
                    end if;
                else
                    if (triangle_value > counter) then
                            pwm_out <= '1' and enable_pwm;
                    else
                        pwm_out <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    clock_div_proc : process(clk) is
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                clock_divisor <= 0;
                clock_divisor_ticks <= 0;
                divided_clock <= '0';
                count_up <= '1';
                triangle_value <= 0;
            else
                clock_divisor <= 10*to_integer(unsigned(ref_in));
                if clock_divisor_ticks < clock_divisor then
                    clock_divisor_ticks <= clock_divisor_ticks + 1;
                else
                    clock_divisor_ticks <= 0;
                    divided_clock <= not divided_clock;
                    if ((triangle_value = MAX_COUNT-1 and count_up = '1') or (triangle_value = 1 and count_up = '0')) then
                        count_up <= not count_up;
                    end if;
                    if count_up = '1' then
                        triangle_value <= triangle_value + 1;
                    else
                        triangle_value <= triangle_value - 1;

                    end if;
                end if;
            end if;
        end if;
    end process;

    -- triangle_gen : process (clk, divided_clock) is
    -- begin
    --     if rising_edge(clk) then
    --         if rst_n = '0' then
    --             count_up <= '1';
    --         end if;
    --     end if;
    --     if rising_edge(divided_clock) then

    --         if ((triangle_value = MAX_COUNT-1 and count_up = '1') or (triangle_value = 1 and count_up = '0')) then
    --             count_up <= not count_up;
    --         end if;
    --         if count_up = '1' then
    --             triangle_value <= triangle_value + 1;
    --         else
    --             triangle_value <= triangle_value - 1;

    --         end if;
    --     end if;
    -- end process;

end architecture behavioural;