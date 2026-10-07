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

entity in_mux is
  generic (
    in_size  : integer := 79;
    adr_size : integer := 6
  );  
  port (
    rst			: in std_logic;
    adr       	: in std_logic_vector(adr_size downto 0);
   	data_in	    : in std_logic_vector (in_size downto 0);	
   	clk         : in std_logic;
	data_out	: out std_logic
  );
end in_mux;


-- ----------------------------------------------------------------------------
--	BEHAVIOR
-- ----------------------------------------------------------------------------
architecture a of in_mux is
signal data_out_comb : std_logic;
begin
  data_out_comb <= data_in(conv_integer(adr)) when rst='0' else '1';
   
  process (clk, rst)
  begin
    if rst = '1' then
      data_out <= '0';
    elsif falling_edge(clk) then
      data_out <= data_out_comb; 
    end if;    
  end process;
end a;

