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
ENTITY rst_sync IS
	PORT								
	(
		clkn 		: IN STD_LOGIC;		-- Referance clock input 
		nrst_ext	: IN STD_LOGIC;		-- External HW reset
		nrst_int	: Out std_logic		-- internal reset signal	
	);	
END rst_sync;

-- ----------------------------------------------------------------------------
--	BEHAVIOR
-- ----------------------------------------------------------------------------
architecture a of rst_sync is
begin
  rst_sync_proc:process (clkn, nrst_ext)
  begin
	if nrst_ext = '0' then
	  nrst_int <= '0';
	elsif falling_edge(clkn) then
	  if nrst_ext = '1' then 
	    nrst_int <= '1';
	  end if;
    end if;
  end process rst_sync_proc;	

end a;

