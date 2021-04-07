library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity adder_7_111 is
	port(
    in_0, in_1, in_2, in_3, in_4, in_5, in_6: in std_logic;
    out_0: out std_logic_vector(2 downto 0)
	 );
end adder_7_111;

architecture Structural of adder_7_111 is

  signal aux0, aux1, aux2, aux3, aux4: std_logic;

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
    -- level 1
    U0: full_adder port map(A => in_0 ,B => in_1 , Cin => in_2 , S => aux0, Cout => aux1);
    U1: full_adder port map(A => in_3 ,B => in_4 , Cin => in_5 , S => aux2, Cout => aux3);
    -- level 2
    U2: full_adder port map(A => aux0 ,B => aux2, Cin => in_6 , S => out_0(0), Cout => aux4);
    -- level 3
    U3: full_adder port map(A => aux1 ,B => aux4, Cin => aux3 , S => out_0(1), Cout => out_0(2));

end Structural;
