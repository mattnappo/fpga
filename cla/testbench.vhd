library ieee;
use ieee.std_logic_1164.ALL;
 
entity carry_look_ahead_test is
	end carry_look_ahead_test;
		 
architecture test of carry_look_ahead_test is
    component carry_look_ahead
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
		 
    uut: carry_look_ahead port map (
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
        
		for i in 0 to 5000000 loop
            wait for 100 ns;
            A <= "1111";
            B <= "1111";
            Cin <= '1';
		end loop

		for i in 0 to 5000000 loop
            wait for 100 ns;
            A <= "1111";
            B <= "1111";
            Cin <= '0';
		end loop

    report "end TIME = " & time'image(now);
	wait;
		 
end process;
end;

