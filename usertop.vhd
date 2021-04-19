library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity usertop is

	port(

		CLOCK_50: in STD_LOGIC;
		CLK_500Hz: in STD_LOGIC;
		RKEY: in STD_LOGIC_VECTOR(3 downto 0);
		KEY: in STD_LOGIC_VECTOR(3 downto 0);
		RSW: in STD_LOGIC_VECTOR(17 downto 0);
		SW    : in STD_LOGIC_VECTOR(17 downto 0);
		LEDR : out STD_LOGIC_VECTOR(17 downto 0);
		HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7: out std_logic_vector(6 downto 0)

    --C: in std_logic;
		-- SW(17) == C
		--A: in std_logic_vector(3 downto 0);
		-- SW(3 downto 0) == A
    --S: out std_logic_vector(10 downto 0)
		-- LEDR(10 downto 0) == S
	 );
end usertop;

--entity top is
--	port(
--    inA, inB, inC, inD: in std_logic_vector(3 downto 0);
--    S: out std_logic_vector(14 downto 0)
--	 );
--end top;

architecture Structural of usertop is

	signal inA, inB, inC, inD: std_logic_vector(3 downto 0);
	signal sigV0, sigV1, sigV2, sigV3: std_logic_vector(12 downto 0);
	signal sigV4, sigV5, sigV6, sigV7: std_logic_vector(12 downto 0);
	signal comS0, comS1: std_logic_vector(13 downto 0);
	-- signals for 7 segment display
	signal signalResult: std_logic_vector(14 downto 0);
	signal aux: std_logic_vector(3 downto 0);

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

	 component adder_6 is
		 port(
			operand_a, operand_b: in std_logic_vector(5 downto 0);
			result: out std_logic_vector(6 downto 0)
			);
		end component;

	component decod7seg is
		port(
			c : in  std_logic_vector(3 downto 0);
			f : out std_logic_vector(6 downto 0)
		);
	end component;

  begin

		inA <= SW(3 downto 0);
		inB <= SW(7 downto 4);
		inC <= SW(11 downto 8);
		inD <= SW(15 downto 12);

		U0: info_array port map(inA, inB, inC, inD,
														sigV0, sigV1, sigV2, sigV3, sigV4, sigV5, sigV6, sigV7
		);
		U1: compressor port map(sigV0, sigV1, sigV2, sigV3, sigV4, sigV5, sigV6, sigV7,
														comS0, comS1
		);
		U2: adder_6 port map(comS0(13 downto 8), comS1(13 downto 8),
												signalResult(14 downto 8)
		);

		signalResult(7 downto 0) <= comS0(7 downto 0);
		LEDR <= "000" & signalResult;

		U3: decod7seg port map(	c => signalResult(3 downto 0),
														f => HEX0
		);

		U4: decod7seg port map(	c => signalResult(7 downto 4),
														f => HEX1
		);

		U5: decod7seg port map(	c => signalResult(11 downto 8),
														f => HEX2
		);

		aux <= '0' & signalResult(14 downto 12);

		U6: decod7seg port map(	c => aux,
														f => HEX3
		);
end Structural;
