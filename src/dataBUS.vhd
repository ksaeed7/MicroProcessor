----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:59 04/10/2020 
-- Design Name: 
-- Module Name:    BUS - Behavioral 
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

entity dataBUS is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           MDR : in  STD_LOGIC_VECTOR (7 downto 0);
           AluOut,outputMultiplier : in  STD_LOGIC_VECTOR (15 downto 0);
           memory : in  STD_LOGIC_VECTOR (7 downto 0);
           Control : in  STD_LOGIC_VECTOR (2 downto 0);
           outputA : out  STD_LOGIC_VECTOR (7 downto 0);
           outputB : out  STD_LOGIC_VECTOR (7 downto 0));
end dataBUS;

architecture Behavioral of dataBUS is

begin
	
	process(A,B,MDR,AluOut,memory,control)
	
		begin
			case Control is
				when "000" => 	 --Transfer
					outputA <= A;
					outputB <= B;
				when "001" => 	 --Immediate
					outputA <= MDR;
					outputB <= B;
				when "010" =>   --ALU into A
					outputA <= AluOut(7 downto 0);
					outputB <= B;
				when "011" =>   --Multiplication to A and B
					outputA <= AluOut(15 downto 8);
					outputB <= AluOut(7 downto 0);
				when "100" => 	 --SWAP
					outputA <= B;
					outputB <= A;
				when "101" => 	 --Memory to A
					outputA <= memory;
					outputB <= B;
				when "110" => 	 --Memory to A
					outputA <= outputMultiplier(15 downto 8);
					outputB <= outputMultiplier(7 downto 0);
				when others => 
					outputA <= A;
					outputB <= B;
			end case;
	end process;
	
				
end Behavioral;

