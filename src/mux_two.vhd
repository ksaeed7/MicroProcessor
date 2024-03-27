----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:45 04/11/2020 
-- Design Name: 
-- Module Name:    mux_two - Behavioral 
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

entity mux_two is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_vector(1 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_two;

architecture Behavioral of mux_two is

begin

	process(A,B,sel)
	
	begin
	
	if(sel = "10") then
		O <= B;
	elsif(sel = "11") then
		O <= C;
	else
		O <= A;
	end if;
	
	end process;

end Behavioral;

