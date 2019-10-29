-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2018-2 lab Maq Estados, autor: Roberto Hexsel, 10set
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ESTE ARQUIVO NAO PODE SER ALTERADO

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- inversor
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity inv is
  generic (prop : time := t_inv);
  port(A : in bit;
       S : out bit);
end inv;

architecture comport of inv is 
begin
    S <= (not A) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta AND de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity and2 is
  generic (prop : time := t_and2);
  port(A, B : in  bit;  -- entradas A,B
       S    : out bit); -- saida C
end and2;

architecture and2 of and2 is 
begin
    S <= A and B after prop;
end and2;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta OR de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity or2 is
  generic (prop : time := t_or2);
  port(A,B : in bit;
       S   : out bit);
end or2;

architecture comport of or2 is 
begin
  S <= reject t_rej inertial (A or B) after prop;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta OR de 3 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity or3 is
  generic (prop : time := t_or3);
  port(A, B, C : in  bit;  -- entradas A,B,C
       S       : out bit); -- saida S 
end or3;

architecture or3 of or3 is 
begin
    S <= A or B or C after prop;
end or3;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta XOR de 2 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity xor2 is
  port(A,B : in bit;
       S   : out bit);
end xor2;

architecture comport of xor2 is 
begin
  S <= reject t_rej inertial (A xor B) after t_xor2;
end architecture comport;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- porta XOR de 3 entradas
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity xor3 is
  generic (prop : time := t_xor3);
  port(A, B, C : in  bit;   -- entradas A,B,C
       S       : out bit);  -- saida S 
end xor3;

architecture xor3 of xor3 is 
begin
    S <= A xor B xor C after prop;
end xor3;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mux2(a,b,s,z)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux2 is
  port(A,B : in  bit;
       S   : in  bit;
       Z   : out bit);
end mux2;

architecture estrut of mux2 is 
  component inv is
    generic (prop : time);
    port(A : in bit; S : out bit);
  end component inv;
  component and2 is
    generic (prop : time);
    port(A,B : in bit; S : out bit);
  end component and2;
  component or2 is
    generic (prop : time);
    port(A,B : in bit; S : out bit);
  end component or2;
  signal negs,f0,f1 : bit;
 begin

  Ui:  inv  generic map (t_inv)  port map(s,negs);
  Ua0: and2 generic map (t_and2) port map(a,negs,f0);
  Ua1: and2 generic map (t_and2) port map(b,s,f1);
  Uor: or2  generic map (t_or2)  port map(f0,f1,z);
    
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- flip-flop tipo D com set,reset=0 assincronos
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_WIRES.all;
entity FFD is
  port(clk, rst, set : in bit;
        D : in  bit;
        Q : out bit);
end FFD;

architecture funcional of FFD is
  signal estado : bit := '0';
begin

  process(clk, rst, set)
  begin
    if rst = '0' then
      estado <= '0';
    elsif set = '0' then
      estado <= '1';
    elsif rising_edge(clk) then
      estado <= D;
    end if;
  end process;

  Q <= estado after t_FFD;

end funcional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- flip-flop tipo D com set,reset=0 assincronos, saidas Q e /Q
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_WIRES.all;
entity FFDQQ is
  port(clk, rst, set : in bit;
        D    : in  bit;
        Q, N : out bit);
end FFDQQ;

architecture funcional of FFDQQ is
  signal estado : bit := '0';
begin

  process(clk, rst, set)
  begin
    if rst = '0' then
      estado <= '0';
    elsif set = '0' then
      estado <= '1';
    elsif rising_edge(clk) then
      estado <= D;
    end if;
  end process;

  Q <= estado after t_FFD;
  N <= not estado after t_FFD;

end funcional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- registrador de 32 bits, reset=0 assincrono, load=1 sincrono
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_WIRES.all;

entity registrador32 is
  port(clk, rst, ld: in  bit;
        D:           in  reg32;
        Q:           out reg32);
end registrador32;

architecture funcional of registrador32 is
  signal value: reg32;
begin

  process(clk, rst, ld)
  begin
    if rst = '0' then
      value <= x"00000000";
    elsif ld = '1' and rising_edge(clk) then
      value <= D;
    end if;
  end process;

  Q <= value after t_FFD;
end funcional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ULA
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.p_wires.all;

entity ULA is
  port (alfa,beta : in  reg32;
        oper      : in  reg3;
        delta     : out reg32);
end entity ULA;

architecture functional of ULA is
  signal soma, prod: integer;
  signal b_soma, b_prod : reg32;
begin

  soma   <= BV2INT(alfa) + BV2INT(beta);
  b_soma <= SLV2BV32( std_logic_vector(to_signed(soma,32)) );

  prod   <= BV2INT(alfa) * BV2INT(beta);
  b_prod <= SLV2BV32( std_logic_vector(to_signed(prod,32)) );
  
  with oper select
    delta <= alfa xor beta when "000",
             alfa and beta when "001",
             alfa or  beta when "010",
             b_soma        when "011",
             b_prod        when "100",
             x"00000000" when others;

end functional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- escreve um inteiro na saida padrao do simulador
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.textio.all;
use work.p_wires.all;

entity write_int is
  port (rst, clk : in    bit;
        sel   : in    bit;              -- active in '1'
        data  : in    reg32);
end write_int;

architecture behavioral of write_int is

  file output : text open write_mode is "STD_OUTPUT";
  
begin

  U_write_uint: process(clk, sel)
    variable msg : line;
  begin
    
    if rising_edge(clk) and sel = '1' then
      write ( msg, string'(BV32HEX(data)) );
      writeline( output, msg );
    end if;
      
  end process U_write_uint;

end behavioral;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
