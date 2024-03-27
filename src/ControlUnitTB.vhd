--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:41:22 04/07/2020
-- Design Name:   
-- Module Name:   D:/Khalid Saeed/School/College/2019-2020/Winter/ECE 475/FinalProject/ControlUnitTB.vhd
-- Project Name:  FinalProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit
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
 
ENTITY ControlUnitTB IS
END ControlUnitTB;
 
ARCHITECTURE behavior OF ControlUnitTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
         opcode : IN  std_logic_vector(3 downto 0);
         busControl : OUT  std_logic_vector(2 downto 0);
         OperSel1 : OUT  std_logic_vector(1 downto 0);
         OperSel2 : OUT  std_logic_vector(1 downto 0);
         MemWrite : OUT  std_logic;
         AluControl : OUT  std_logic_vector(1 downto 0);
         Jz : OUT  std_logic;
         Jc : OUT  std_logic;
         Jv : OUT  std_logic;
         PC_EN: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal opcode : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal busControl : std_logic_vector(2 downto 0);
   signal OperSel1 : std_logic_vector(1 downto 0);
   signal OperSel2 : std_logic_vector(1 downto 0);
   signal MemWrite : std_logic;
   signal AluControl : std_logic_vector(1 downto 0);
   signal Jz : std_logic;
   signal Jc : std_logic;
   signal Jv : std_logic;
   signal PC_EN : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          clk => clk,
          enable => enable,
          opcode => opcode,
          busControl => busControl,
          OperSel1 => OperSel1,
          OperSel2 => OperSel2,
          MemWrite => MemWrite,
          AluControl => AluControl,
          Jz => Jz,
          Jc => Jc,
          Jv => Jv,
          PC_EN => PC_EN
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
		enable <= '1';
		Opcode <= "0000";
		wait for 40 ns;
		Opcode <= "0001";
		wait for 40 ns;
		Opcode <= "0010";
		wait for 40 ns;
		Opcode <= "0011";
		wait for 40 ns;
		Opcode <= "0100";
		wait for 40 ns;
		Opcode <= "0101";
		wait for 40 ns;
		Opcode <= "0110";
		wait for 40 ns;
		Opcode <= "0111";
		wait for 40 ns;
		Opcode <= "1000";
		wait for 40 ns;
		Opcode <= "1001";
		wait for 40 ns;
		Opcode <= "1010";
		wait for 40 ns;
      Opcode <= "1011";
		wait for 40 ns;
		Opcode <= "1100";
		wait for 40 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
