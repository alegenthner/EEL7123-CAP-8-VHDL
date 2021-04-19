library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity info_array is

	port(
    A, B, C, D: in std_logic_vector(3 downto 0);
    V0, V1, V2, V3, V4, V5, V6, V7: out std_logic_vector(12 downto 0)
	 );
end info_array;

architecture Structural of info_array is

  begin
    V0 <= D(3 downto 2) & C(3 downto 2) & A(3 downto 1) & A(3 downto 0) & "00";
    V1 <= "00" & D(1 downto 0) & B(3 downto 1) & A(0) & B(2 downto 0) & "00";
    V2 <= "0000" & C(3 downto 2) & B(1) & B(3) &B(1 downto 0) & C(0) & "00";
    V3 <= "0000" & C(1 downto 0) & C(1) & B(2) & C(2 downto 1) & D(0) & "00";
    V4 <= "0000" & D(3 downto 1) & B(0) & D(2 downto 1) & "100";
    V5 <= "0000000" & C(3) & D(3) & "0000";
    V6 <= "000000" & D(0) & C(0) & D(3) & "0000";
    V7 <= "0000000" & not(D(0)) & "00000";

end Structural;
