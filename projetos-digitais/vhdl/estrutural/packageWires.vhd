-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2012-2 autor: Roberto Hexsel, 28jul2015
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

package p_WIRES is -- tipos para os barramentos e sinais

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
      stmp(1) := 'X';
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
        stmp(i+1) := 'X';
      end if;
    end loop;  -- i
    return stmp;
  end;
  -- ---------------------------------------------------------
  
end p_WIRES;
-- ---------------------------------------------------------
