-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210                        autor: Roberto Hexsel, 31ago2016
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- testbench para somador com seleção de vai-um (carry select adder)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use work.p_wires.all;

entity tb_CSA is
end tb_CSA;

architecture TB of tb_CSA is

  component adderCSA32 is port(inpA, inpB : in bit_vector;
                          outC : out bit_vector;
                          vai  : out bit);
  end component adderCSA32;

  signal inpA,inpB : reg32;             -- entradas de teste
  signal resCSA    : reg32;             -- resultados
  signal vaiCSA    : bit;
  signal esp_res   : reg32;             -- valores esperados
  signal esp_vai   : bit;
  
  type test_record is record
    a : reg32;      -- entrada
    b : reg32;      -- entrada
    c : reg32;      -- saida
    v : bit;        -- vai-um
  end record;
  type test_array is array(positive range <>) of test_record;
    
  constant test_vectors : test_array := (
    -- a,        b,           c,         vai-um
    -- testes para soma
    (x"00000000",x"00000000",x"00000000",'0'),
    -- acrescente novos valores aqui
    (x"00000001",x"00000001",x"00000002",'0'),  -- corrija valores de c e v
    (x"00000fff",x"00000001",x"00001000",'0'),  

    (x"00010001",x"00010001",x"00020002",'0'),
    (x"0fff0fff",x"00010001",x"10001000",'0'),  

    (x"22222222",x"11111111",x"33333333",'0'),
    (x"44444444",x"11111111",x"55555555",'0'),
    (x"11111111",x"88888888",x"99999999",'0'),
    (x"88888888",x"88888888",x"11111110",'1'),
    
    (x"00000000",x"00000000",x"00000000",'0'),    
    (x"00000001",x"0000ffff",x"00010000",'0'),

    (x"00000000",x"00000000",x"00000000",'0'),    
    (x"00010000",x"ffff0000",x"00000000",'1'),

    (x"00000000",x"00000000",x"00000000",'0'),
    (x"00000000",x"00000000",x"00000000",'0'),
    (x"00000000",x"00000000",x"00000000",'0'),
    -- nao alterar estes dois ultimos --
    (x"00000000",x"00000000",x"00000000",'0'),
    (x"00000000",x"00000000",x"00000000",'0')
    );

begin  -- TB

  U_CSA: adderCSA32   port map(inpA, inpB, resCSA, vaiCSA);

  U_testValues: process                -- test the circuit
    variable v : test_record;
  begin

    for i in test_vectors'range loop
      v := test_vectors(i);
      inpA <= v.a;
      inpB <= v.b;
      esp_res <= v.c;
      esp_vai <= v.v;

      assert resCSA = esp_res
        report LF & "addCSA:  saida errada " &
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resCSA)  & " vai=" & B2STR(vaiCSA) &
        LF & "  esp="& BV2STR(esp_res) & " esp=" & B2STR(esp_vai)
        severity error;

      wait for 2 ns;                  -- if needed, increease waiting time

    end loop;

    wait;
    
    end process;
   
end TB;

----------------------------------------------------------------
configuration CFG_TB of TB_CSA is
	for TB
        end for;
end CFG_TB;
----------------------------------------------------------------
