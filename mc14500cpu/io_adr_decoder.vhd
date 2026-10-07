-- ----------------------------------------------------------------------------
--	
--
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
use IEEE.Std_Logic_Unsigned.all;

-- ----------------------------------------------------------------------------
--	ENTYTY definition
-- ----------------------------------------------------------------------------

entity io_adr_decoder is
  port (
    wr		    : in std_logic;	
    adr       	: in std_logic_vector(1 downto 0);
	out_wr		: out std_logic
  );
end io_adr_decoder;


-- ----------------------------------------------------------------------------
--	BEHAVIOR
--  0 inputs
--  1 outputs
--  2 ram
--  3 not used
-- ----------------------------------------------------------------------------
architecture a of io_adr_decoder is

begin
  out_wr_proc: process (adr, wr)  
  begin          
    if conv_integer(adr) = 1 then
      out_wr <= wr;
    else
      out_wr <= '0';
    end if;   
  end process out_wr_proc;     
    
end a;

