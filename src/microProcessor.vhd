----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:36 04/11/2020 
-- Design Name: 
-- Module Name:    microProcessor - Behavioral 
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

entity microProcessor is
    Port ( clk : in  STD_LOGIC;
           Program_Counter : out  STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');
           A : out  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '1');
           B : out  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '1');
           IR : out  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '0');
           MDR : out  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '0');
			  carry, overflow, zero : out std_logic := '0');
end microProcessor;

architecture Behavioral of microProcessor is

component multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           clk, En : in  STD_LOGIC;
           clkPause : inout  STD_LOGIC := '0';
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component ALU 
	Port (  operand1 : in  STD_LOGIC_VECTOR (7 downto 0);
           operand2 : in  STD_LOGIC_VECTOR (7 downto 0);
           aluSel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0) := (OTHERS=>'0');
			  z,c,v : out std_logic := '0');
end component;

component ControlUnit is
	port(
		clk : in std_logic;
		enable : in std_logic;
		opcode : in std_logic_vector(3 downto 0);
		busControl : out std_logic_vector(2 downto 0);
		OperSel1,OperSel2 : out std_logic_vector(1 downto 0);
		MemWrite : out std_logic;
		AluControl : out std_logic_vector(1 downto 0);
		Jz,Jc,Jv, PC_EN,MultiplyEn,MultiplySel : out std_logic);
end component;

component RAM is
    Port ( MemWriteEn : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (7 downto 0);
           Data : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component ROM_IR is
	port(
		address : in std_logic_vector(7 downto 0);
		instruction : out std_logic_vector(7 downto 0);
		data : out std_logic_vector(7 downto 0));
end component;

component Register8bit is
    Port ( input : in  STD_LOGIC_VECTOR (7 downto 0):="00000000";
           clk : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component dataBUS is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           MDR : in  STD_LOGIC_VECTOR (7 downto 0);
           AluOut,outputMultiplier : in  STD_LOGIC_VECTOR (15 downto 0);
           memory : in  STD_LOGIC_VECTOR (7 downto 0);
           Control : in  STD_LOGIC_VECTOR (2 downto 0);
           outputA : out  STD_LOGIC_VECTOR (7 downto 0);
           outputB : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component incPC is
    Port ( PCcounter : in  STD_LOGIC_VECTOR (7 downto 0);
           outPCcounter : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux_two is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_vector(1 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux_2_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC;
           C : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
--Controlled_Clock
signal clk_control : std_logic := '0';
signal clkPaused : std_logic := '0';
signal clkPaused1 : std_logic := '0';
--Controls Signal
signal busControl : std_logic_vector(2 downto 0) := "000";
signal operSel1,OperSel2 : std_logic_vector(1 downto 0) := "00";
signal MemWrite : std_logic := '0';
signal AluControl : std_logic_vector(1 downto 0) := "00";
signal Jz,Jc,Jv, PC_EN, MultiplyEn,MultiplySel : std_logic := '0';
--ALU signals
signal outputALU,outputMultiplier : STD_LOGIC_VECTOR (15 downto 0) := (OTHERS=>'0');
signal zflag,cflag,vflag : std_logic := '0';
--MUX signals
signal outputMUX_two,outputMUX_four1,outputMUX_four2,outputMuxMultiplier : STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '0');
--Reg signals
signal IR_reg : STD_LOGIC_VECTOR (7 downto 0) := (OTHERS => '0');
signal A_Reg, B_Reg, PC , MDR_Reg : std_logic_vector(7 downto 0) := (OTHERS => '0');
--BUS signals
signal outputA , outputB :  STD_LOGIC_VECTOR (7 downto 0):= (OTHERS => '0');
--ROM signals
signal instruction_ROM : std_logic_vector(7 downto 0):= (OTHERS => '0');
signal data_ROM : std_logic_vector(7 downto 0):= (OTHERS => '0');
--RAM
signal outputRAM : std_logic_vector(7 downto 0):= (OTHERS => '0');  
--PC
signal pc_inc : std_logic_vector(7 downto 0):= (OTHERS => '0');
--Jump
signal jump_enable : std_logic := '0';


begin

clk_control <= clk and (not clkPaused);
-- Registers
PC_map : Register8bit port map(outputMUX_two, clk_control,	PC);
IR_map : Register8bit port map(instruction_ROM,	clk_control,	IR_reg);
A_reg_map : Register8bit port map(outputA, clk_control,	A_Reg);
B_reg_map : Register8bit port map(outputB, clk_control,	B_Reg);
MDR_reg_map : Register8bit port map(data_ROM,	clk_control,	MDR_reg);
	
--CONTROL UNIT
ControlUNIT_map : ControlUnit port map(clk_control, '1', IR_reg(3 downto 0), busControl,operSel1,OperSel2,memWrite,AluControl,Jz,Jc,Jv, PC_EN,MultiplyEn,MultiplySel);

--ALU 

ALU_map : ALU port map(outputMUX_four1,outputMUX_four2,AluControl,outputALU,zflag,cflag,vflag);

--RAM

RAM_map : RAM port map(MemWrite, MDR_reg, A_Reg, outputRAM);

--ROM 

ROM_IR_map : ROM_IR port map(PC,instruction_ROM,data_ROM);

--dataBUS

dataBUS_map : dataBUS port map(A_Reg,B_Reg,MDR_reg,outputALU,outputMultiplier,outputRAM,"000",outputA,outputB);

--PC counter 

incPC_map : incPC port map(PC,pc_inc);

--MUX

mux_two_map: mux_two port map(PC,pc_inc,MDR_reg,PC_EN & jump_enable ,outputMUX_two);
muxForMultiplier : mux_2_8 port map(MDR_reg,MDR_reg, MultiplySel, outputMuxMultiplier);
mux_4map1 : mux port map(B_Reg,B_Reg,outputRAM,MDR_reg,operSel1,outputMUX_four2);
mux_4map2 : mux port map(A_Reg,outputRAM,MDR_reg,A_Reg,operSel2,outputMUX_four1);

--JUMP ENABLE

jump_enable <= (Jz and zflag) or (Jc and cflag) or (Jv and vflag);

--Multiplier

MultiplyFunction : multiplier port map(B_Reg,A_Reg,clk,'1',clkPaused,outputMultiplier);


--OUTPUTS

Program_counter <= PC;

A <= outputMultiplier(15 downto 8);
B <= outputMultiplier(7 downto 0);
IR <= IR_reg;
MDR <= MDR_reg;
carry <= MultiplyEn;
overflow <= MultiplySel;
zero <= clkpaused;
			  
--process(multiplyEn)
--
--begin
--
--	if(multiplyEn = '1'  and clkPaused1 = '1') then 
--		clkPaused <= '1';
--	else
--		clkPaused <= '0';
--	end if;
--
--end process;


end Behavioral;


