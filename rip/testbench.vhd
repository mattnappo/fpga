library ieee;
use ieee.std_logic_1164.ALL;
 
entity ripple_adder_test is
	end ripple_adder_test;
		 
architecture test of ripple_adder_test is
    component ripple_adder
        port (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            S : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;

    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');
    signal Cin : std_logic := '0';

    signal S : std_logic_vector(3 downto 0);
    signal Cout : std_logic;
		 
begin

    uut: ripple_adder port map (
        A => A,
        B => B,
        Cin => Cin,
        S => S,
        Cout => Cout
    );

    stim_proc: process
    begin
        wait for 100 ns;
        report "START TIME = " & time'image(now);

        for i in 0 to 10000000 loop
            wait for 100 ns;
            A <= "1111";
            B <= "1111";
        end loop;
        
        report "end TIME = " & time'image(now);
        wait;
                        
    end process;
end;
