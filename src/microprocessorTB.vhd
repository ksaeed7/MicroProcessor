--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:27 04/11/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/FinalProject/microprocessorTB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: microProcessor
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
 
ENTITY microprocessorTB IS
END microprocessorTB;
 
ARCHITECTURE behavior OF microprocessorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT microProcessor
    PORT(
         clk : IN  std_logic;
         Program_Counter : OUT  std_logic_vector(7 downto 0):= (OTHERS => '0');
         A : OUT  std_logic_vector(7 downto 0):= (OTHERS => '0');
         B : OUT  std_logic_vector(7 downto 0):= (OTHERS => '0');
         IR : OUT  std_logic_vector(7 downto 0):= (OTHERS => '0');
         MDR : OUT  std_logic_vector(7 downto 0):= (OTHERS => '0');
			carry : out std_logic;
			overflow : out std_logic;
			zero : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal Program_Counter : std_logic_vector(7 downto 0):= (OTHERS => '0');
   signal A : std_logic_vector(7 downto 0):= (OTHERS => '0');
   signal B : std_logic_vector(7 downto 0):= (OTHERS => '0');
   signal IR : std_logic_vector(7 downto 0):= (OTHERS => '0');
   signal MDR : std_logic_vector(7 downto 0):= (OTHERS => '0');
	signal carry : std_logic;
	signal overflow : std_logic;
	signal zero : std_logic;
   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: microProcessor PORT MAP (
          clk => clk,
          Program_Counter => Program_Counter,
          A => A,
          B => B,
          IR => IR,
          MDR => MDR,
			 carry => carry,
			 overflow => overflow,
			 zero => zero
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      -- insert stimulus here 

      wait;
   end process;

END;
