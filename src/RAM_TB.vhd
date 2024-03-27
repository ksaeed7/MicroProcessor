--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:29:15 04/05/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/FinalProject/RAM_TB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY RAM_TB IS
END RAM_TB;
 
ARCHITECTURE behavior OF RAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         MemWriteEn : IN  std_logic;
         Address : IN  std_logic_vector(7 downto 0);
         Data : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MemWriteEn : std_logic := '0';
   signal Address : std_logic_vector(7 downto 0) := (others => '0');
   signal Data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          MemWriteEn => MemWriteEn,
          Address => Address,
          Data => Data,
          output => output
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		MemWriteEn <= '0';
      wait for 100 ns;	
		address <= "10100110";
      data <= "11111111";
		MemWriteEn <= '1';
		wait for 10 ns;
		address <= "10100110";
		wait for 10 ns;
		MemWriteEn <= '0';
		data <= "00000000";
		address <= "10111110";
		wait for 100 ns;
		address <= "10100110";
      -- insert stimulus here 

      wait;
   end process;

END;
