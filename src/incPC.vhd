----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:10 04/11/2020 
-- Design Name: 
-- Module Name:    incPC - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity incPC is
    Port ( PCcounter : in  STD_LOGIC_VECTOR (7 downto 0) := (OTHERS=> '0');
           outPCcounter : out  STD_LOGIC_VECTOR (7 downto 0));
end incPC;

architecture Behavioral of incPC is

begin
	
	outPCcounter <= PCcounter + "00000010";


end Behavioral;

