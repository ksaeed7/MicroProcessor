----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:08:44 04/05/2020 
-- Design Name: 
-- Module Name:    Register8bit - Behavioral 
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

entity Register8bit is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0):="00000000";
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0):="00000000");
end Register8bit;

architecture Behavioral of Register8bit is

begin

	process(clk,input)
	
	begin
	
		if(clk'event and clk = '1') then
		output <= input;
		
		end if;
	end process;

end Behavioral;

