----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:29 04/15/2020 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           clk, En : in  STD_LOGIC;
           clkPause : inout  STD_LOGIC := '0';
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplier;

architecture Behavioral of multiplier is

--signal multiplicant : STD_LOGIC_VECTOR(15 downto 0):= (OTHERS => '0');



begin
	
	
	--SHIFTER
--	process(A,B,En)
--	variable count : integer range 0 to 7 := 0;
--	variable multiplicant : STD_LOGIC_VECTOR(15 downto 0):= (OTHERS => '0');
--	variable carry : std_logic := '0';
--	variable addEn : std_logic := '0';
--	variable temporary : std_logic_vector(8 downto 0) := (OTHERS => '0');
--	begin
--   process(A) 
--
--	
--	
--	
--	--begin
--		--if(rising_edge(clk)) then
--			if(En = '1' and count <= 7) then
--			
--			multiplicant(14 downto 0) := multiplicant(15 downto 1);
--			multiplicant(15) := carry;
--			count := count +1;
--			addEn := B(count);
--			--clkPause <= '1';
--			if(addEn = '1') then
--					temporary := std_logic_vector(to_unsigned(to_integer(unsigned(multiplicant(15 downto 8))) + to_integer(unsigned(A)), temporary'length));
--						multiplicant(15 downto 8) := temporary(7 downto 0);
--						carry := temporary(8);
--			end if;
--			
--		end if;
--		--end if;
--		if(clkPause = '1' and count = 7) then
--			clkPause <= '0';
--		end if;
--		if(count > 7) then
--			clkPause <= '0';
--			count := 0;
--			multiplicant := "0000000000000000";
--		end if;
--		C(14 downto 0) <= multiplicant(15 downto 1);
--		C(15) <= carry;
--	--	addEn <= addEn1;
--	end process;
--	end process;


	process(A,B,En) 
	
	variable count : integer range 0 to 7 := 0;
	variable multiplicant : STD_LOGIC_VECTOR(15 downto 0):= (OTHERS => '0');
	variable carry : std_logic := '0';
	variable addEn : std_logic := '0';
	variable temporary : std_logic_vector(8 downto 0) := (OTHERS => '0');
	begin
		if(En = '1') then
		while(count <=6 ) loop
			multiplicant(14 downto 0) := multiplicant(15 downto 1);
			multiplicant(15) := carry;
			count := count +1;
			addEn := B(count);
			--clkPause <= '1';
			if(addEn = '1') then
					temporary := std_logic_vector(to_unsigned(to_integer(unsigned(multiplicant(15 downto 8))) + to_integer(unsigned(A)), temporary'length));
						multiplicant(15 downto 8) := temporary(7 downto 0);
						carry := temporary(8);
			end if;
		end loop;
		end if;
		count := 0;
	C(14 downto 0) <= multiplicant(15 downto 1);
	C(15) <= carry;
	multiplicant := "0000000000000000";
	end process;
		
	
end Behavioral;
	
	

