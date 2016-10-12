----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:21 10/03/2016 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           selec : in  STD_LOGIC_VECTOR (3 downto 0);
           shamth : in  STD_LOGIC_VECTOR (4 downto 0);
           zero : out  STD_LOGIC;
           resul : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Arq_ALU of ALU is

begin
process (A,B,Selec,Shamth)
begin
if (A=B)then
		Zero<='1';
	else 
		Zero<='0';
end if;
case Selec is 
	when "0000" => Resul <= A + B ;
	when "0001" => Resul <= A - B;
	when "0010" => Resul <= A and B;
	when "0011" => Resul <= A or B;
	when "0100" => Resul <= A xor B;
	when "0101" => Resul <= A nor B;
	when "0110" => if (A<B) then
							Resul <=x"00000001";
							else
							Resul <=x"00000000";
						end if;
	when "0111" => Resul <= to_stdlogicvector(to_bitvector(A) sll conv_integer(Shamth))	;
	when "1000" =>	Resul <= to_stdlogicvector(to_bitvector(A) srl conv_integer(Shamth));
	when others => Resul <=x"00000000";
end case;

end process;
	

end Arq_ALU;

