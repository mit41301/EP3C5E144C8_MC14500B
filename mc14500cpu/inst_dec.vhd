library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.Std_Logic_arith.all;
use IEEE.Std_Logic_Unsigned.all;

entity inst_dec is
  port (inst_in:  in    std_logic_vector (3 downto 0);
        skip:     in    std_logic;
        rst:      in    std_logic;
        inst_out: out   std_logic_vector (15 downto 0)
       );
end inst_dec;

architecture a of inst_dec is
signal inst_out_int: std_logic_vector (15 downto 0);
begin     
  with inst_in select
    inst_out_int <= "0000000000000001"  when "0000",
                    "0000000000000010"  when "0001",
                    "0000000000000100"  when "0010",
                    "0000000000001000"  when "0011",
                    "0000000000010000"  when "0100",
                    "0000000000100000"  when "0101",
                    "0000000001000000"  when "0110",
                    "0000000010000000"  when "0111",
                    "0000000100000000"  when "1000",
                    "0000001000000000"  when "1001",
                    "0000010000000000"  when "1010",
                    "0000100000000000"  when "1011",
                    "0001000000000000"  when "1100",
                    "0010000000000000"  when "1101",
                    "0100000000000000"  when "1110",
                    "1000000000000000"  when "1111";
  inst_out <= inst_out_int when (skip ='0' and rst='0') else "0000000000000000";          
end a;