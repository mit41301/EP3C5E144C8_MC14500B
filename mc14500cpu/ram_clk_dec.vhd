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

entity ram_clk_dec is
  port (
    clk         : in std_logic;	
    clk2       	: in std_logic;
    clk4        : in std_logic;
    rst         : in std_logic;
	ram_clk		: out std_logic
  );
end ram_clk_dec;


-- ----------------------------------------------------------------------------
-- Not just the data to be written in to the RAM is clocked in, 
-- but also the address used for both read and write access. Therefore: 	
-- Writing: 
--   The clock pulse must be late since the data comes late out of the mc14500
-- Reading: 
--   The clock pulse must be early since it must be there before the mc14500 reads it
-- And finally the RAM clock is a clock and needs therefore be registred to not
-- contain glitches caused by the combinatorial logic
-- ----------------------------------------------------------------------------
architecture a of ram_clk_dec is
  signal ram_clk_comb : std_logic;
begin
  ram_clk_comb <= clk ;      

  process (clk4, rst)
  begin
    if rst = '1' then
      ram_clk <= '0';
    elsif rising_edge(clk4) then
      ram_clk <= ram_clk_comb; 
    end if;   
  end process;

end a;

