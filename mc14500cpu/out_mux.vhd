-- ----------------------------------------------------------------------------
--	
--
-- ----------------------------------------------------------------------------

library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_Unsigned.all;

-- ----------------------------------------------------------------------------
--	ENTYTY definition
-- ----------------------------------------------------------------------------

entity out_mux is
 generic (
    out_size : integer := 15;
    adr_size : integer := 3
  );  
  port (
    clk			: in std_logic;
    rst			: in std_logic;
    adr       	: in std_logic_vector(adr_size downto 0);
    wr			: in std_logic;
	data_in	    : in std_logic;		
	data_out	: out std_logic;
	data_output	: inout std_logic_vector (out_size downto 0)
  );
end out_mux;


-- ----------------------------------------------------------------------------
--	BEHAVIOR
-- ----------------------------------------------------------------------------
architecture a of out_mux is
begin
  
  mux_reg: process (clk, rst)
  begin
    if rst = '1' then
      l1: for i in 0 to out_size loop
        data_output(i) <= '0';
      end loop l1;
    elsif rising_edge(clk) then
      if wr= '1' then
        data_output(conv_integer(adr)) <= data_in;
      end if;  
    end if;     
  end process mux_reg;
  
  data_out <= data_output(conv_integer(adr));
end a;

