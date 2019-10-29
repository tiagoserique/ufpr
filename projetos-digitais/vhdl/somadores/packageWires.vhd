-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210                        autor: Roberto Hexsel, 20mar2013
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

package p_WIRES is -- tipos para os barramentos e sinais

  constant simulate_time : integer := 1;  -- 1 para simular com tempo != zero

  constant t_inv  : time := simulate_time*10.0 ps;
  constant t_and2 : time := simulate_time*15.0 ps;
  constant t_and3 : time := simulate_time*21.0 ps;
  constant t_and4 : time := simulate_time*27.0 ps;
  constant t_and5 : time := simulate_time*33.0 ps;
  constant t_or2  : time := simulate_time*15.0 ps;
  constant t_or3  : time := simulate_time*22.0 ps;
  constant t_or4  : time := simulate_time*28.0 ps;
  constant t_or5  : time := simulate_time*34.0 ps;
  constant t_xor2 : time := simulate_time*25.0 ps;
  constant t_xor3 : time := simulate_time*33.0 ps;
  constant t_rej  : time := simulate_time*7.50 ps; -- rejeita pulsos estreitos

  constant contam : real := 0.125;  -- contaminacao: rejeita t_prop/8

  constant t_mux2 : time := simulate_time*(t_inv+t_and2+t_or2);
  
  subtype reg2  is bit_vector(1 downto 0);
  subtype reg3  is bit_vector(2 downto 0);
  subtype reg4  is bit_vector(3 downto 0);
  subtype reg5  is bit_vector(4 downto 0);
  subtype reg8  is bit_vector(7 downto 0);
  subtype reg9  is bit_vector(8 downto 0);
  subtype reg10 is bit_vector(9 downto 0);
  subtype reg12 is bit_vector(11 downto 0);
  subtype reg15 is bit_vector(14 downto 0);
  subtype reg16 is bit_vector(15 downto 0);
  subtype reg17 is bit_vector(16 downto 0);
  subtype reg31 is bit_vector(30 downto 0);
  subtype reg32 is bit_vector(31 downto 0);
  subtype reg33 is bit_vector(32 downto 0);
  
  function B2STR(s: in bit) return string;
  function BV2STR(s: in bit_vector) return string;
  
end p_WIRES;
-- ---------------------------------------------------------

-- ---------------------------------------------------------
package body p_WIRES is
  -- ---------------------------------------------------------
  function B2STR(s: in bit) return string is
    variable stmp : string(2 downto 1);
  begin
    if s = '1' then
      stmp(1) := '1';
    elsif s = '0' then
      stmp(1) := '0';
    else
      stmp(1) := 'x';
    end if;
    return stmp;
  end;
  -- ---------------------------------------------------------
  function BV2STR(s: in bit_vector) return string is
    variable stmp : string(s'left+1 downto 1);
  begin
    for i  in s'reverse_range loop
      if s(i) = '1' then
        stmp(i+1) := '1';
      elsif s(i) = '0' then
        stmp(i+1) := '0';
      else
        stmp(i+1) := 'x';
      end if;
    end loop;  -- i
    return stmp;
  end;
  -- ---------------------------------------------------------
  
end p_WIRES;
-- ---------------------------------------------------------
