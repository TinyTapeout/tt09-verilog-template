library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_tt_um_tobimckellar_top is
end entity tb_tt_um_tobimckellar_top;

architecture testbench of tb_tt_um_tobimckellar_top is

    -- Component declaration of the Unit Under Test (UUT)
    -- Component rather than entity as ports are hardened
    -- and this avoids syntax error with terosHDL.
    component tt_um_tobimckellar_top
        port(
            ui_in   : in  std_logic_vector(7 downto 0);
            uo_out  : out std_logic_vector(7 downto 0);
            uio_in  : in  std_logic_vector(7 downto 0);
            uio_out : in  std_logic_vector(7 downto 0);
            uio_oe  : out std_logic_vector(7 downto 0);
            en      : in std_logic;
            clk     : in std_logic;
            rst_n   : in std_logic
        );
    end component;

    -- Signal declarations
    signal ui_in   : std_logic_vector(7 downto 0) := (others => '0');
    signal uo_out  : std_logic_vector(7 downto 0);
    signal uio_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal uio_out : std_logic_vector(7 downto 0);
    signal uio_oe  : std_logic_vector(7 downto 0);
    signal en      : std_logic := '1';
    signal clk     : std_logic := '0';
    signal rst_n   : std_logic := '0';

    signal simDone : std_logic := '0';

    constant CLK_PERIOD : time := 100 us;  -- 10 kHz clock period

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: tt_um_tobimckellar_top
        port map(
            ui_in   => ui_in,
            uo_out  => uo_out,
            uio_in  => uio_in,
            uio_out => uio_out,
            uio_oe  => uio_oe,
            en      => en,
            clk     => clk,
            rst_n   => rst_n
        );

    -- Clock process definitions
    clk_process : process
    begin
        if simDone = '0' then
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        else
            wait;
        end if;
    end process;

    -- Reset process
    reset_process : process
    begin
        rst_n <= '0';
        wait for 5 us;
        rst_n <= '1';
        wait;
    end process;

    -- Stimulus process to test the behavior of the module
    stimulus_process : process
    begin
        ui_in(5 downto 0) <= "000110"; -- 6 (~10% duty cycle)
        ui_in(6) <= '0';
        -- Test 1: disable the system and observe initial output
        ui_in(7) <= '0';

        wait for 1000 us;
        assert (uo_out(7) = '0')
            report "Test 1 failed: uo_out(7) (pwm_out) should be '0' when ui_in(7) (pwm_enable) is '0'."
            severity error;

        ui_in(7) <= '1';
        wait for 5000 us;

        ui_in(6) <= '1';
        wait for 5000 ms;

        ui_in(5 downto 0) <= "000001";
        wait for 5000 ms;

        ui_in(5 downto 0) <= "000010";
        wait for 5000 ms;

        ui_in(5 downto 0) <= "010000";
        wait for 5000 ms;

        ui_in(5 downto 0) <= "100000";
        wait for 5000 ms;

        ui_in(6) <= '0';
        wait for 50 ms;

        ui_in(5 downto 0) <= "100000";
        wait for 50 ms;

        ui_in(5 downto 0) <= "110000";
        wait for 50 ms;

        ui_in(5 downto 0) <= "000001";
        wait for 50 ms;

        -- Test 3: Disable PWM and observe output
        ui_in(7) <= '0'; -- Disable PWM
        wait for 500 us;

        assert (uo_out(7) = '0')
            report "Test 2 failed: uo_out(7) should be '0' when enable_pwm is '0'."
            severity error;

        simDone <= '1';
        wait;
    end process;

end architecture testbench;
