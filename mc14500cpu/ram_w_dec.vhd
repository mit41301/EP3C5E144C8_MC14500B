library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
use IEEE.Std_Logic_Unsigned.all;

entity ram_w_dec is
  port (
        wr		    : in std_logic;	
        adr         : in    std_logic_vector (1 downto 0);
        wren        : out   std_logic
       );
end ram_w_dec;
-- ----------------------------------------------------------------------------
--	BEHAVIOR
--  0 inputs
--  1 outputs
--  2 ram
--  3 not used
-- ----------------------------------------------------------------------------

architecture a of ram_w_dec is
begin
  wren_proc: process (adr, wr)  
  begin          
    if conv_integer(adr) = 2 then
      wren <= wr;
    else
      wren <= '0';
    end if;   
  end process wren_proc;         
end a;