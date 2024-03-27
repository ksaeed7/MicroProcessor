----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:41 04/11/2020 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end mux;

architecture Behavioralmux of mux is

signal tempDataFlow : STD_LOGIC_VECTOR (7 downto 0);

begin

	process(A,B,C,D,sel) 
	
	begin
		if(sel = "00") then
			tempDataFlow <= A;
		elsif(sel = "01") then
			tempDataFlow <= B;
		elsif(sel = "10") then
			tempDataFlow <= C;
		elsif(sel = "11") then
			tempDataFlow <= D;
		else 
			tempDataFlow <= A;
	end if;
	end process;
			O <= tempDataFlow;
end Behavioralmux;

