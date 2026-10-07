library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
use IEEE.Std_Logic_Unsigned.all;

entity lu_table is
  port (inst:     in    std_logic_vector (3 downto 0);
        lu_in:    in    std_logic;
        rr:       in    std_logic;
        skip:     in    std_logic;
        lu_out:   out   std_logic
       );
end lu_table;

architecture a of lu_table is
signal lu_out_int: std_logic;
begin  
  with inst select
    lu_out_int <= rr                when "0000",
                  lu_in             when "0001",
                  not lu_in         when "0010",
                  lu_in and rr      when "0011",
                  not lu_in and rr  when "0100",
                  lu_in or rr       when "0101",
                  not lu_in or rr   when "0110",
                  lu_in xnor rr     when "0111",
                  rr                when "1000",
                  rr                when "1001", 
                  rr                when "1010", 
                  rr                when "1011", 
                  rr                when "1100", 
                  rr                when "1101", 
                  rr                when "1110", 
                  rr                when "1111";       
  lu_out <= lu_out_int when skip ='0' else rr;
end a;