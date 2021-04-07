library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity adder_55_1111 is
	port(
    in_0, in_1, in_2, in_3, in_4: in std_logic_vector(1 downto 0);
    out_0: out std_logic_vector(3 downto 0)
	 );
end adder_55_1111;

architecture Structural of adder_55_1111 is

  signal aux0, aux1, aux2, aux3, aux4: std_logic;
  signal aux5, aux6, aux7: std_logic;

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
    U0: full_adder port map(A => in_0(0) ,B => in_1(0) , Cin => in_2(0) , S => aux0 , Cout => aux2 );
    U1: full_adder port map(A => in_0(1) ,B => in_1(1) , Cin => in_2(1) , S => aux1 , Cout => aux3 );
    -- level 2
    U2: full_adder port map(A => in_3(0) ,B => in_4(0) , Cin => aux0 , S => out_0(0) , Cout => aux4 );
    U3: full_adder port map(A => in_3(1) ,B => in_4(1) , Cin => aux1 , S => aux5 , Cout => aux6 );
    -- level 3
    U4: full_adder port map(A => aux2 ,B => aux4 , Cin => aux5 , S => out_0(1) , Cout => aux7);
    -- level 4
    U5: full_adder port map(A => aux3 ,B => aux6 , Cin => aux7 , S => out_0(2) , Cout => out_0(3) );
end Structural;
