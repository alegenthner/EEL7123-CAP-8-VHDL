library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity compressor is
	port(
    V0, V1, V2, V3, V4, V5, V6, V7: in std_logic_vector(12 downto 0);
    S0, S1: out std_logic_vector(13 downto 0)
	 );
end compressor;

architecture Structural of compressor is

  signal v10, v11, v12: std_logic_vector(12 downto 0) := "0000000000000";
  signal v20, v21, v22: std_logic_vector(12 downto 0) := "0000000000000";
  signal v30,v31: std_logic_vector(13 downto 0) := "00000000000000";

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

    v12(11) <= V0(11); -- v12(11) receives d_2
    v21(12) <= V0(12); -- v21(12) receives d_3
    v22 <= V7;         -- v22 is equal to V_7

    -- level 1
    U0: adder_55_1111 port map( -- t_1,1
      in_0 => V0(3 downto 2) ,
      in_1 => V1(3 downto 2) ,
      in_2 => V2(3 downto 2) ,
      in_3 => V3(3 downto 2) ,
      in_4 => V4(3 downto 2) ,
      out_0(1 downto 0) => v30(3 downto 2),
      out_0(3 downto 2) => v10(5 downto 4)
    );
    U1: adder_7_111 port map(  -- t_1,2
      in_0 => V0(4) ,
      in_1 => V1(4) ,
      in_2 => V2(4) ,
      in_3 => V3(4) ,
      in_4 => V4(4) ,
      in_5 => V5(4) ,
      in_6 => V6(4) ,
      out_0(0) => v11(4) ,
      out_0(1) => v11(5) ,
      out_0(2) => v10(6)
    );
    U2: adder_7_111 port map( -- t_1,3
      in_0 => V0(5) ,
      in_1 => V1(5) ,
      in_2 => V2(5) ,
      in_3 => V3(5) ,
      in_4 => V4(5) ,
      in_5 => V5(5) ,
      in_6 => V6(5) ,
			out_0(0) => v12(5) ,
      out_0(1) => v11(6) ,
      out_0(2) => v10(7)
    );
    U3: adder_7_111 port map( -- t_1,4
      in_0 => V0(6) ,
      in_1 => V1(6) ,
      in_2 => V2(6) ,
      in_3 => V3(6) ,
      in_4 => V4(6) ,
      in_5 => V5(6) ,
      in_6 => V6(6) ,
			out_0(0) => v12(6) ,
      out_0(1) => v11(7) ,
      out_0(2) => v10(8)
    );
    U4: adder_55_1111 port map( -- t_1,5
      in_0 => V0(8 downto 7) ,
      in_1 => V1(8 downto 7) ,
      in_2 => V2(8 downto 7) ,
      in_3 => V3(8 downto 7) ,
      in_4 => V4(8 downto 7) ,
      out_0(0) => v11(8) ,
			out_0(3 downto 1) => v10(11 downto 9)
    );
    U5: adder_22_111 port map(  -- t_1,6
      in_0 => V0(10 downto 9),
      in_1 => V1(10 downto 9),
      out_0 => v11(11 downto 9)
    );
    -- level 2
    U6: full_adder port map( -- t_2,1
      A => v10(4), 				-- checked
      B => v11(4), 				-- checked
      Cin => '0', 				-- checked
      S => v30(4), 				-- checked
      Cout => v20(5) 			-- checked
    );
    U7: adder_223_1111 port map( -- t_2,2
      in_0 => v10(7 downto 5),	 	-- checked
      in_1 => v11(7 downto 5), 		-- checked
      in_2 => v12(5), 						-- checked
      out_0(0) => v21(5), 				-- checked
      out_0(1) => v20(6), 				-- checked
      out_0(2) => v31(7), 				-- checked
      out_0(3) => v20(8) 					-- checked
    );
    U8: adder_22_111 port map(  -- t_2,3
      in_0 => v10(9 downto 8), 	-- checked
      in_1 => v11(9 downto 8), 	-- checked
      out_0(0) => v21(8),				-- checked
      out_0(1) => v31(9) ,			-- checked
      out_0(2) => v20(10)				-- checked
    );
    U9: full_adder port map(  -- t_2,4
      A => v10(10), 					-- checked
      B => v11(10), 					-- checked
      Cin => '0', 						-- checked
      S => v21(10),						-- checked
      Cout => v20(11)					-- checked
    );
    U10: full_adder port map(  -- t_2,5
      A => v10(11), 						-- checked
      B => v11(11), 						-- checked
      Cin => v12(11), 					-- checked
      S => v21(11), 						-- checked
      Cout => v20(12)						-- checked
    );
    -- level 3
    U11: full_adder port map(  -- t_3,1
      A => v20(5) ,							-- checked
      B => v21(5) ,							-- checked
      Cin => v22(5) ,						-- checked
      S => v30(5) ,							-- checked
      Cout => v30(6)						-- checked
    );
    U12: full_adder port map(  -- t_3,2
      A => v20(6) ,						-- checked
      B => v21(6) ,						-- checked
      Cin => '0' ,						-- checked
      S => v31(6) ,						-- checked
      Cout => v30(7)					-- checked
    );
    U13: full_adder port map(  -- t_3,3
      A => v20(8) ,						-- checked
      B => v21(8) ,						-- checked
      Cin => '0' ,						-- checked
      S => v30(8) ,						-- checked
      Cout => v30(9)					-- checked
    );
    U14: adder_22_111 port map(  -- t_3,4
      in_0 => v20(11 downto 10) ,	-- checked
      in_1 => v21(11 downto 10) ,	-- checked
      out_0 => v30(12 downto 10)	-- checked
    );
    U15: full_adder port map(  -- t_3,5
      A => v20(12) ,					-- checked
      B => v21(12) ,					-- checked
      Cin => '0' ,						-- checked
      S => v31(12) ,					-- checked
      Cout => v30(13)					-- checked
    );

		S0 <= v30;
		S1 <= v31;

end Structural;
