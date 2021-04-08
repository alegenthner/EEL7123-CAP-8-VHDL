library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity top is
	port(
    inA, inB, inC, inD: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(14 downto 0)
	 );
end top;

architecture Structural of top is

	signal sigV0, sigV1, sigV2, sigV3: std_logic_vector(12 downto 0);
	signal sigV4, sigV5, sigV6, sigV7: std_logic_vector(12 downto 0);
	signal comS0, comS1: std_logic_vector(13 downto 0);
    -- aux9 is not used effectvely

  component info_array is
		port(
	    A, B, C, D: in std_logic_vector(3 downto 0);
	    V0, V1, V2, V3, V4, V5, V6, V7: out std_logic_vector(12 downto 0)
		 );
  end component;

	component compressor is
		port(
			V0, V1, V2, V3, V4, V5, V6, V7: in std_logic_vector(12 downto 0);
			S0, S1: out std_logic_vector(13 downto 0)
		 );
	 end component;

	 component adder_8 is
		 port(
			operand_a, operand_b: in std_logic_vector(7 downto 0);
			result: out std_logic_vector(8 downto 0)
			);
		end component;

  begin

		U0: info_array port map(inA, inB, inC, inD,
														sigV0, sigV1, sigV2, sigV3, sigV4, sigV5, sigV6, sigV7
		);
		U1: compressor port map(sigV0, sigV1, sigV2, sigV3, sigV4, sigV5, sigV6, sigV7,
														comS0, comS1
		);
		U2: adder_8 port map(comS0(13 downto 6), comS1(13 downto 6),
												S(14 downto 6)
		);

		S(5 downto 0) <= comS0(5 downto 0);

end Structural;
