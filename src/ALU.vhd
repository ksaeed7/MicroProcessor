----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:20:11 04/07/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ALU is
    Port ( operand1 : in  STD_LOGIC_VECTOR (7 downto 0);
           operand2 : in  STD_LOGIC_VECTOR (7 downto 0);
           aluSel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0) := (OTHERS=>'0');
			  z,c,v : out std_logic := '0');
end ALU;

architecture Behavioral of ALU is

signal register1,register2 : std_logic_vector(16 downto 0);

begin

		register1 <= std_logic_vector(resize(unsigned(operand1), Register1'length));
		register2 <= std_logic_vector(resize(unsigned(operand2), Register2'length));

	process(operand1,operand2,aluSel,register1,register2)
	
	variable temp : std_logic_vector(16 downto 0);
	begin
			if(aluSel = "01") then
				temp := register1 + register2;
				if((temp(7) = '1' and operand1(7)='0' and operand2(7) = '0') or (temp(7) = '0' and operand1(7)='1' and operand2(7) = '1')) then
				v <= '1';
				else 
				v<= '0';
				end if;
				if(temp = 0) then
				z <= '1';
				else 
				z<= '0';
				end if;
				c <= temp(8);
				--multiplyEn <= '0';
			elsif(aluSel = "10") then
				--multiplyEn <= '0';		  
				temp := std_logic_vector(to_signed(to_integer(unsigned(register1)) - to_integer(unsigned(register2)), register1'length));
				if((temp(7) = '1' and operand1(7)='0' and operand2(7) = '0') or (temp(7) = '0' and operand1(7)='1' and operand2(7) = '1')) then
				v <= '1';
				else 
				v<= '0';
				end if;
				if(temp = 0) then
				z <= '1';
				else 
				z<= '0';
				end if;
				c <= temp(8);
--			elsif(aluSel = "11") then
--				multiplyEn <= '1';
--				temp := std_logic_vector(to_signed(to_integer(unsigned(operand1)) * to_integer(unsigned(operand2)),Register1'length));
--						  --std_logic_vector(to_signed(to_integer(signed(operand1)) * to_integer(signed(operand2)),Register1length));
--				if(temp = 0) then
--				z <= '1';
--				else 
--				z<= '0';
--				end if;
--				c <= '0';
--				if((operand1(7)='1' and operand2(7)='1' and temp(15)= '1') or (operand1(7)='0' and operand2(7)='1' and temp(15)= '0')or (operand1(7)='1' and operand2(7)='0' and temp(15)= '0') or (operand1(7)='0' and operand2(7)='0' and temp(15)= '1')) then
--				v <= '1';
--				else
--				v<='0';
--				end if;
			else
				--multiplyEn <= '0';
				temp := register1;
			end if;
		output<= temp(15 downto 0);
		
	end process;

end Behavioral;

		
		
		
		
		