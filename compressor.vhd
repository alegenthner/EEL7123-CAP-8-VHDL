library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity compressor is
	port(
    V0, V1, V2, V3, V4, V5, V6, V7: in std_logic_vector(12 downto 0);
    S0, S1: out std_logic_vector(13 downto 0)
	 );
end compressor;

architecture Structural of compressor is

  -- signal v10, v11, v12: std_logic_vector(12 downto 0) := "0000000000000";
  -- signal v20, v21, v22: std_logic_vector(12 downto 0) := "0000000000000";
  -- signal v30,v31: std_logic_vector(13 downto 0) := "00000000000000";

	-- 4 bit signals
	signal t1_1, t1_5, t3_1: std_logic_vector(3 downto 0);
	-- 3 bit signals
	signal t1_2, t1_3, t1_4, t1_6, t2_5, t2_6: std_logic_vector(2 downto 0);
	-- 2 bit signals
	signal t2_1, t2_2, t2_3, t2_4, t3_2, t3_3, t3_4: std_logic_vector(1 downto 0);
	-- auxiliar signal
	signal aux, aux0, aux1: std_logic;

  component full_adder is
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      S: out std_logic;
      Cout: out std_logic
    );
  end component;

  component adder_7_111 is
    port(
      in_0, in_1, in_2, in_3, in_4, in_5, in_6: in std_logic;
      out_0: out std_logic_vector(2 downto 0)
     );
   end component;

  component adder_22_111 is
    port(
      in_0, in_1: in std_logic_vector(1 downto 0);
      out_0: out std_logic_vector(2 downto 0)
     );
   end component;

  component adder_55_1111 is
    port(
      in_0, in_1, in_2, in_3, in_4: in std_logic_vector(1 downto 0);
      out_0: out std_logic_vector(3 downto 0)
     );
   end component;

  component adder_223_1111 is
    port(
      in_0, in_1: in std_logic_vector(2 downto 0);
      in_2: std_logic;
      out_0: out std_logic_vector(3 downto 0)
     );
   end component;

  begin

    --v12(11) <= V0(11); -- v12(11) receives d_2
    --v21(12) <= V0(12); -- v21(12) receives d_3
    --v22 <= V7;         -- v22 is equal to V_7

		aux <= V7(5);
		aux0 <= V0(12);
		aux1 <= V0(11);

    -- level 1
    U0: adder_55_1111 port map( -- t_1,1
      in_0 => V0(3 downto 2) ,
      in_1 => V1(3 downto 2) ,
      in_2 => V2(3 downto 2) ,
      in_3 => V3(3 downto 2) ,
      in_4 => V4(3 downto 2) ,
			out_0 => t1_1							-- checked
    );
    U1: adder_7_111 port map(  -- t_1,2
      in_0 => V0(4) ,
      in_1 => V1(4) ,
      in_2 => V2(4) ,
      in_3 => V3(4) ,
      in_4 => V4(4) ,
      in_5 => V5(4) ,
      in_6 => V6(4) ,
      out_0 => t1_2
    );
    U2: adder_7_111 port map( -- t_1,3
      in_0 => V0(5) ,
      in_1 => V1(5) ,
      in_2 => V2(5) ,
      in_3 => V3(5) ,
      in_4 => V4(5) ,
      in_5 => V5(5) ,
      in_6 => V6(5) ,
			out_0 => t1_3
    );
    U3: adder_7_111 port map( -- t_1,4
      in_0 => V0(6) ,
      in_1 => V1(6) ,
      in_2 => V2(6) ,
      in_3 => V3(6) ,
      in_4 => V4(6) ,
      in_5 => V5(6) ,
      in_6 => V6(6) ,
			out_0 => t1_4
    );
    U4: adder_55_1111 port map( -- t_1,5
      in_0 => V0(8 downto 7) ,
      in_1 => V1(8 downto 7) ,
      in_2 => V2(8 downto 7) ,
      in_3 => V3(8 downto 7) ,
      in_4 => V4(8 downto 7) ,
      out_0 => t1_5
    );
    U5: adder_22_111 port map(  -- t_1,6
      in_0 => V0(10 downto 9),
      in_1 => V1(10 downto 9),
      out_0 => t1_6
    );
    -- level 2
    U6: full_adder port map( -- t_2,1
      A => t1_1(2), 					-- checked
      B => t1_2(0), 					-- checked
      Cin => '0', 						-- checked
      S => t2_1(0), 					-- checked
      Cout => t2_1(1) 				-- checked
    );
    U7: full_adder port map( -- t_2,2
			A => t1_1(3), 					-- checked
			B => t1_2(1), 					-- checked
			Cin => t1_3(0), 				-- checked
			S => t2_2(0), 					-- checked
			Cout => t2_2(1)					-- checked
    );
    U8: full_adder port map(  -- t_2,3
			A => t1_2(2), 					-- checked
			B => t1_3(1), 					-- checked
			Cin => t1_4(0), 				-- checked
			S => t2_3(0), 					-- checked
			Cout => t2_3(1) 				-- checked
    );
    U9: full_adder port map(  -- t_2,4
      A => t1_3(2) , 					-- checked
      B => t1_4(1) , 					-- checked
      Cin => t1_5(0), 				-- checked
      S => t2_4(0),						-- checked
      Cout => t2_4(1)					-- checked
    );
    U10: adder_22_111 port map(  -- t_2,5
			in_0(0) => t1_4(2) ,			-- checked
			in_0(1) => t1_5(2) ,			-- checked
			in_1(0) => t1_5(1) ,			-- checked
			in_1(1) => t1_6(0) ,			-- checked
			out_0 => t2_5							-- checked
    );
		U11: adder_22_111 port map(  -- t_2,6
			in_0(0) => t1_5(3) ,				-- checked
			in_0(1) => t1_6(2) ,				-- checked
			in_1(0) => t1_6(1) ,				-- checked
			in_1(1) => aux1 ,						-- checked
			out_0 => t2_6								-- checked
    );
    -- level 3
    U12: adder_223_1111 port map( -- t_3,1
			in_0(0) => t2_1(1) ,				-- checked
			in_0(1) => t2_2(1) ,				-- checked
			in_0(2) => t2_3(1) ,				-- checked
			in_1(0) => t2_2(0) ,				-- checked
			in_1(1) => t2_3(0) ,				-- checked
			in_1(2) => t2_4(0) ,				-- checked
			in_2 => aux ,								-- checked
			out_0 => t3_1								-- checked
		);
		U13: full_adder port map(	-- t_3,2
			A => t2_4(1) ,					-- checked
			B => t2_5(0) ,					-- checked
			Cin => '0' ,						-- checked
			S => t3_2(0) ,					-- checked
			Cout => t3_2(1)					-- checked
		);
		U14: full_adder port map(	-- t_3,3
			A => t2_5(2) ,					-- checked
			B => t2_6(0) ,					-- checked
			Cin => '0' ,						-- checked
			S => t3_3(0) ,					-- checked
			Cout => t3_3(1)					-- checked
		);
		U15: full_adder port map(	-- t_3,4
			A => t2_6(2) ,					-- checked
			B => aux0 ,							-- checked
			Cin => '0' ,						-- checked
			S => t3_4(0) ,					-- checked
			Cout => t3_4(1)					-- checked
		);


		S0 <= t3_4(1) & t3_4(0) & t3_3(1) & t3_3(0) & t2_5(1) & t3_1(3) & t3_1(2) & t3_1(1) & t3_1(0) & t2_1(0) & t1_1(1) & t1_1(0) & "00";
		S1 <= "00" & t2_6(1) & '0' & t3_2(1) & t3_2(0) & "00000000";

end Structural;
