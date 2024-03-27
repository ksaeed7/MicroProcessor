----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:13 04/15/2020 
-- Design Name: 
-- Module Name:    mux_2_8 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_2_8;


architecture Behavioral of mux_2_8 is

begin

	process(A,B,sel)
	
	begin
	
	if(sel = '1') then
		C <= B;
	else
		C <= A;
	end if;
	
	end process;

end Behavioral;

