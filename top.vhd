library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity top is

	port(
    N, M, P: in std_logic_vector(2 downto 0);
    S: out std_logic_vector(4 downto 0)
	 );
end top;

architecture Structural of top is

  signal aux0, aux1, aux2, aux3, aux4: std_logic;
  signal aux5, aux6, aux7, aux8, aux9: std_logic;
  signal aux10: std_logic;
    -- aux9 is not used effectvely
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
        
    U0: full_adder port map(A => N(0),B => M(0), Cin => P(0), S => S(0), Cout => aux0);
    U1: full_adder port map(A => M(1),B => N(1), Cin => aux0, S => aux1, Cout => aux2);
    U2: full_adder port map(A => '0',B => '0', Cin => aux2, S => aux3, Cout => aux4);
    U3: full_adder port map(A => P(1),B => aux1, Cin => aux4, S => S(1), Cout => aux5);
    U4: full_adder port map(A => M(2),B => N(2), Cin => P(2), S => aux6, Cout => aux7);
    U5: full_adder port map(A => '0',B => '0', Cin => aux7, S => aux8, Cout => aux9);
    U6: full_adder port map(A => aux5,B => aux3, Cin => aux6, S => S(2), Cout => aux10);
    U7: full_adder port map(A => '0',B => aux8, Cin => aux10, S => S(3), Cout => S(4));

end Structural;
