----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:22:36 04/05/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity RAM is
    Port ( MemWriteEn : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (7 downto 0);
           Data : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is

type RAM_Data is array (0 to 255) of std_logic_vector(7 downto 0);

signal myRAM : RAM_data := (others => "00000000");

begin

		process(MemWriteEn, Address, Data, myRAM)
		
		variable RAMvalue : std_logic_vector(7 downto 0);

		begin
		
		if(MemWriteEn = '1') then
		
		myRam(conv_integer(address)) <= data;
		
		end if;
		
		RAMvalue := myRam(conv_integer(address));
		
		output <= RAMvalue;
	
		end process;
		
		

end Behavioral;

