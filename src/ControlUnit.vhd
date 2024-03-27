----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:03 04/05/2020 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
	port(
		clk : in std_logic;
		enable : in std_logic;
		opcode : in std_logic_vector(3 downto 0);
		busControl : out std_logic_vector(2 downto 0);
		OperSel1,OperSel2 : out std_logic_vector(1 downto 0);
		MemWrite : out std_logic;
		AluControl : out std_logic_vector(1 downto 0);
		Jz,Jc,Jv, PC_EN,MultiplyEn,MultiplySel : out std_logic);
end ControlUnit;

architecture Behavioral of ControlUnit is

component CONTROLFSM is 
	port(
		  clk,enable : in std_logic;
		  busEn, opSelEn, MemWriteEn, AluEn, PC_EN : out std_logic);
end component;

component AND_bit3
	port(
		A : in std_logic_vector( 2 downto 0);
		B : in std_logic;
		C : out std_logic_vector( 2 downto 0));
end component;

component AND_bit2
	port(
		A : in std_logic_vector( 1 downto 0);
		B : in std_logic;
		C : out std_logic_vector( 1 downto 0));
end component;

type ROM is array (0 to 15) of std_logic_vector(13 downto 0);
constant CONTROL_ROM : ROM := ("01010000000000","00010000000000","00000000100000",
										 "00101000001000","00101100001000","00101000010000",
										 "00101100010000","11100101000000","11100110000000",
										 "01000000000000","00000000000100","00000000000010",
										 "00000000000001","XXXXXXXXXXXXXX","XXXXXXXXXXXXXX","XXXXXXXXXXXXXX");
										 
signal busEn, opSelEn, MemWriteEn, AluEn : std_logic := '0';
signal ROMValue : std_logic_vector(13 downto 0);
BEGIN
		
		process(opcode)
		
		begin
		ROMValue <= CONTROL_ROM(conv_integer(opcode));  -- read ROM 
		
		end process;
		--Get enabled control signals depending on state
		myFSM: ControlFSM port map(clk,enable,busEn, opSelEn, MemWriteEn, AluEn, PC_EN); 
		
		--Determine if output is enabled depending on 
		andBus: AND_bit3 port map(ROMValue(12 downto 10),busEn,busControl);
		andOpSel1: AND_bit2 port map(ROMValue(9 downto 8),opSelEn,OperSel1);
		andOpSel2: AND_bit2 port map(ROMValue(7 downto 6),opSelEn,OperSel2);
		MemWrite <= ROMValue(5) and MemWriteEn;
		andAlu: AND_bit2 port map(ROMValue(4 downto 3),AluEn,AluControl);
		--Bit
		multiplyEn  <= ROMvalue(13);
		multiplySel <= ROMvalue(5);
--		busControl <= ROMValue(12 downto 10);
--		OperSel1 <= ROMValue(9 downto 8);
--		OperSel2 <= ROMValue(7 downto 6);
--		MemWrite <= ROMValue(5);
--		AluControl <= ROMValue(4 downto 3);
	Jz <= ROMValue(2);
	Jc <= ROMValue(1);
	Jv <= ROMValue(0);
end Behavioral;

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

entity CONTROLFSM is 
	port(
		  clk,enable : in std_logic;
		  busEn, opSelEn, MemWriteEn, AluEn, PC_EN : out std_logic);
end CONTROLFSM;

architecture behControlFSM of CONTROLFSM is 

type state is (Fetch, Decode, Execute, Store);

signal FSM : state := Fetch;

begin
		process(FSM,clk,enable)
		
		begin
	if(clk'event and clk = '1') then
		if(enable = '1') then 
				CASE (FSM) is
				when Fetch => 
						busEn <= '0';
						opSelEn <= '0';
						MemWriteEn <= '0';
						AluEn <= '0';
						PC_EN <= '0';
					FSM <= Decode;
				when Decode => 
						busEn <= '1';
						opSelEn <= '0';
						MemWriteEn <= '0';
						AluEn <= '0';
						PC_EN <= '0';
					FSM <= Execute;
				when Execute => 
						busEn <= '1';
						opSelEn <= '1';
						MemWriteEn <= '1';
						AluEn <= '1';
						PC_EN <= '0';
					FSM <= Store;
				when Store   => 
						busEn <= '1';
						opSelEn <= '0';
						MemWriteEn <= '0';
						AluEn <= '0';
						PC_EN <= '1';
				FSM <= Fetch;
				when OTHERS  => FSM <= Fetch;
				end CASE;
		end if;
	end if;
		
		end process;
		
end behControlFSM;

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

entity AND_bit3 is
	port(
		A : in std_logic_vector( 2 downto 0);
		B : in std_logic;
		C : out std_logic_vector( 2 downto 0));
end AND_bit3;

architecture behAnd of AND_bit3 is

begin

	C(2) <= A(2) and B;
	C(1) <= A(1) and B;
	C(0) <= A(0) and B;
end behAnd;
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

entity AND_bit2 is
	port(
		A : in std_logic_vector( 1 downto 0);
		B : in std_logic;
		C : out std_logic_vector( 1 downto 0));
end AND_bit2;

architecture behAnd2 of AND_bit2 is

begin
	C(1) <= A(1) and B;
	C(0) <= A(0) and B;
end behAnd2;









