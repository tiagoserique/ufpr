-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210                        autor: Roberto Hexsel, 20mar2013
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

library IEEE; use IEEE.std_logic_1164.all; use IEEE.numeric_std.all;
                                          
package p_WIRES is -- tipos para os barramentos e sinais

  constant simulate_time : integer := 0;  -- 1 para simular com tempo != zero

  constant t_inv  : time := simulate_time*15.0 ps;
  constant t_and2 : time := simulate_time*20.0 ps;
  constant t_and3 : time := simulate_time*26.6 ps;
  constant t_and4 : time := simulate_time*33.2 ps;
  constant t_and5 : time := simulate_time*40.0 ps;
  constant t_or2  : time := simulate_time*20.0 ps;
  constant t_or3  : time := simulate_time*26.6 ps;
  constant t_or4  : time := simulate_time*33.2 ps;
  constant t_or5  : time := simulate_time*40.0 ps;
  constant t_xor2 : time := simulate_time*25.0 ps;
  constant t_xor3 : time := simulate_time*30.0 ps;
  constant t_rej  : time := simulate_time*10.0 ps; -- rejeita pulsos estreitos

  constant t_mux2 : time := simulate_time*0.0 ps;  -- ajuste este valor

  constant t_clock_period : time := 1000 ps;
  constant t_reset : time := 750 ps;
  
  subtype reg2  is bit_vector(1 downto 0);
  subtype reg3  is bit_vector(2 downto 0);
  subtype reg4  is bit_vector(3 downto 0);
  subtype reg5  is bit_vector(4 downto 0);
  subtype reg8  is bit_vector(7 downto 0);
  subtype reg9  is bit_vector(8 downto 0);
  subtype reg10 is bit_vector(9 downto 0);
  subtype reg12 is bit_vector(11 downto 0);
  subtype reg16 is bit_vector(15 downto 0);
  subtype reg17 is bit_vector(16 downto 0);
  subtype reg31 is bit_vector(30 downto 0);
  subtype reg32 is bit_vector(31 downto 0);
  subtype reg33 is bit_vector(32 downto 0);
  
  function rising_edge(signal S: bit) return boolean;
  
  function BV2INT16(s: bit_vector) return integer;
  function BV2SLV32(v: reg32) return std_logic_vector;
  function SLV2BV32(s: std_logic_vector(31 downto 0)) return reg32;
  function INT2BV32(s: integer) return reg32;
  function BV2INT32(v: reg32) return integer;

  function B2STR(s: in bit) return string;
  function BV2STR(s: in bit_vector) return string;
  function BV2HEX(w: in bit_vector) return string;

end p_WIRES;
-- ---------------------------------------------------------

-- ---------------------------------------------------------
package body p_WIRES is

  -- ---------------------------------------------------------
  function rising_edge(signal S: bit)
    return boolean is
  begin
    if (S'event) and         -- ocorreu evento em S
      (S = '1') and         --   e valor atual é '1'
      (S'last_value = '0')  --   e valor anterior era '0'
    then
      return TRUE;
    else
      return FALSE;
    end if;
  end rising_edge;  
  -- ---------------------------------------------------------
  function BV2INT16(s: bit_vector) return integer is
    variable result: integer := 0-(1024*1024*1024*2);
    variable size: integer := s'high;
  begin
    if s(size) = '0' then result := 0; end if;
    for i in s'range loop
      result := result * 2;
      if s(i) = '1' then
        result := result + 1;
      end if;
    end loop;
    return result;
  end BV2INT16;
  -- ---------------------------------------------------------
  function SLV2BV32(s: std_logic_vector(31 downto 0)) return reg32 is
    variable result: reg32;
  begin
    for i in s'range loop
      if s(i) = '1' then
        result(i) := '1';
      else
        result(i) := '0';
      end if;
    end loop;
    return result;
  end SLV2BV32;
  -- ---------------------------------------------------------
  function BV2SLV32(v: reg32) return std_logic_vector is
    variable result: std_logic_vector(31 downto 0);
  begin
    for i in v'range loop
      if v(i) = '1' then
        result(i) := '1';
      else
        result(i) := '0';
      end if;
    end loop;
    return result;
  end BV2SLV32;
  -- ---------------------------------------------------------
  function INT2BV32(s: integer) return reg32 is
    variable result: reg32;
  begin
    result := SLV2BV32( std_logic_vector(to_signed(s,32)) );
    return result;
  end INT2BV32;
  -- ---------------------------------------------------------
  function BV2INT32(v: reg32) return integer is
    variable result: integer;
  begin
    result := to_integer(signed( BV2SLV32(v) ));
    return result;
  end BV2INT32;
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

  -- ---------------------------------------------------------
  -- convert bit_vector(32) to an hexadecimal string, for debugging
  function BV2HEX(w: in bit_vector) return string is
    variable nibble: reg4;
    variable stmp : string(8 downto 1);
    variable size : integer := (w'high + 1) / 4; 
  begin
    for i in size downto 1 loop
      nibble := w(((i-1)*4+3) downto ((i-1)*4));
      case nibble is
        when b"0000" => stmp(i) := '0';
        when b"0001" => stmp(i) := '1';
        when b"0010" => stmp(i) := '2';
        when b"0011" => stmp(i) := '3';
        when b"0100" => stmp(i) := '4';
        when b"0101" => stmp(i) := '5';
        when b"0110" => stmp(i) := '6';
        when b"0111" => stmp(i) := '7';
        when b"1000" => stmp(i) := '8';
        when b"1001" => stmp(i) := '9';
        when b"1010" => stmp(i) := 'a';
        when b"1011" => stmp(i) := 'b';
        when b"1100" => stmp(i) := 'c';
        when b"1101" => stmp(i) := 'd';
        when b"1110" => stmp(i) := 'e';
        when b"1111" => stmp(i) := 'f';
        when others  => stmp(i) := 'x';
      end case;
    end loop;
    return stmp;
  end BV2HEX;
  -- ---------------------------------------------------------

  
end p_WIRES;
-- ---------------------------------------------------------
