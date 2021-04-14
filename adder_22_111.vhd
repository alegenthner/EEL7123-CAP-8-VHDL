library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity adder_22_111 is

	port(
    in_0, in_1: in std_logic_vector(1 downto 0);
    out_0: out std_logic_vector(2 downto 0)
	 );
end adder_22_111;

architecture Structural of adder_22_111 is

  signal aux0, aux1: std_logic;

  component full_adder is
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      S: out std_logic;
      Cout: out std_logic
    );
  end component;

  begin

    U0: full_adder port map(A => in_0(0) ,B => in_1(0), Cin => '0' , S => out_0(0), Cout => aux0);
    U1: full_adder port map(A => in_0(1) ,B => in_1(1), Cin => aux0 , S => out_0(1), Cout => out_0(2));

end Structural;
