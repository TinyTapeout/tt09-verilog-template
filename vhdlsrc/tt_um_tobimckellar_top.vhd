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

    type rom_type is array(0 to ROM_ENTRIES - 1) of integer range 0 to MAX_AMPLITUDE;

    function init_rom return rom_type is
        variable rom_v : rom_type;
        variable angle : real;
        variable sin_scaled : real;

      begin

        for i in 0 to rom_entries - 1 loop

          angle := real(i) * ((2.0 * MATH_PI) / real(ROM_ENTRIES));
          sin_scaled := ((1.0 + sin(angle - MATH_PI_OVER_2)) * real(MAX_AMPLITUDE) / 2.0);
          rom_v(i) := integer(round(real(sin_scaled)));

        end loop;

        return rom_v;
      end init_rom;

     constant rom : rom_type := init_rom;

     constant start_index : integer := 0;
     signal sin_value : integer range 0 to max_amplitude;
     signal index : integer range 0 to rom_entries - 1;

     signal clock_div : integer range 0 to 10 * 63;
     signal clock_ticks : integer range 0 to 10 * 63;

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
                    if (to_integer(unsigned(ref_in)) >= counter) then
                        pwm_out <= '1' and enable_pwm;
                    else
                        pwm_out <= '0';
                    end if;
                else
                    if (sin_value >= counter) then
                        pwm_out <= '1' and enable_pwm;
                    else
                        pwm_out <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;


    sin_ref : process (clk) is
    begin
        if rising_edge(clk) then
            if rst_n = '0' then
                index <= start_index;
                clock_ticks <= 0;
                clock_div <= 0;
            else
                clock_div <= 10*to_integer(unsigned(ref_in));
                if clock_ticks >= clock_div then
                    clock_ticks <= 0;
                else
                    clock_ticks <= clock_ticks + 1;
                end if;
                if clock_ticks = 0 then
                    if index = rom_entries - 1 then
                        index <= 0;
                    else
                        index <= index + 1;
                    end if;
                end if;
                sin_value <= rom(index);
            end if;
        end if;
    end process;

end architecture behavioural;