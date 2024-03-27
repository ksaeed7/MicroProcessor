--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:26:26 04/07/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/FinalProject/ALU_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         operand1 : IN  std_logic_vector(7 downto 0);
         operand2 : IN  std_logic_vector(7 downto 0);
         aluSel : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(15 downto 0);
			 z,c,v : out std_logic := '0'
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(7 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(7 downto 0) := (others => '0');
   signal aluSel : std_logic_vector(1 downto 0) := (others => '0');
	signal  z,c,v : std_logic;
	
 	--Outputs
   signal output : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
          aluSel => aluSel,
          output => output,
			 z => z,
			 c => c,
			 v => v
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		operand1 <= "11000011";
		operand2 <= "11000011";
		aluSel <= "00";
		wait for 10 ns;
		aluSel <= "01";
      wait for 10 ns;
		aluSel <= "10";
		wait for 10 ns;
		aluSel <= "11";
		wait for 10 ns;
		aluSel <= "00";

      -- insert stimulus here 

      wait;
   end process;

END;
