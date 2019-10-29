-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210                        autor: Roberto Hexsel, 31ago2016
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- testbench para três somadores, dois com adiantamento de vai-um
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE;
use IEEE.std_logic_1164.all;
use work.p_wires.all;

entity tb_somador is
end tb_somador;

architecture TB of tb_somador is

  component adderCadeia is port(inpA, inpB : in bit_vector;
                          outC : out bit_vector;
                          vem  : in bit;
                          vai  : out bit);
  end component adderCadeia;

  component adderAdianta4 is port(inpA, inpB : in bit_vector;
                          outC : out bit_vector;
                          vem  : in bit;
                          vai  : out bit);
  end component adderAdianta4;

  component adderAdianta16 is port(inpA, inpB : in bit_vector;
                          outC : out bit_vector;
                          vem  : in bit;
                          vai  : out bit);
  end component adderAdianta16;

  signal inpA,inpB : reg16;             -- entradas de teste
  signal resCad,resAd4,resAd16 : reg16; -- resultados
  signal vaiCad,vaiAd4,vaiAd16 : bit;
  signal addsub : bit;
  signal esp_res : reg16;               -- valores esperados
  signal esp_vai : bit;
  
  type test_record is record
                        a : reg16;      -- entrada
                        b : reg16;      -- entrada
                        f : bit;        -- funcao: 0=ADD, 1=SUB
                        c : reg16;      -- saida
                        v : bit;        -- vai-um
                      end record;
  type test_array is array(positive range <>) of test_record;
    
  constant test_vectors : test_array := (
    -- a,     b,      f, c,       vai-um
    -- testes para soma
    (x"0000",x"0000",'0',x"0000",'0'),
    -- acrescente novos valores aqui
    (x"0001",x"0001",'0',x"0002",'0'),
    (x"0fff",x"0001",'0',x"1000",'0'),  -- corrija valores de c e v
    (x"1111",x"1111",'0',x"2222",'0'),
    (x"2222",x"2222",'0',x"4444",'0'),
    (x"4444",x"4444",'0',x"8888",'0'),
    (x"0000",x"0000",'0',x"0000",'0'),

    (x"8888",x"8888",'0',x"1110",'1'),
    (x"ffff",x"0001",'0',x"0000",'1'),
    (x"5555",x"5555",'0',x"aaaa",'0'),
    (x"5555",x"ffff",'0',x"5554",'1'),
    (x"aaaa",x"aaaa",'0',x"5554",'1'),
    (x"aaff",x"aabb",'0',x"55ba",'1'),
    (x"bbcc",x"adcb",'0',x"6997",'1'),

    (x"ffff",x"0100",'0',x"00ff",'1'),

    -- testes para diferença
    (x"0000",x"0000",'1',x"0000",'1'),  -- inverte vai-um (empresta)
    -- acrescente novos valores aqui
    (x"0000",x"0000",'1',x"0000",'1'),
    (x"0000",x"0000",'1',x"0000",'1'),
    -- nao alterar estes dois ultimos --
    (x"0000",x"0000",'1',x"0000",'1'),
    (x"0000",x"0000",'1',x"0000",'1')
    );

  -- troque a constante para FALSE para testar seus modelos
  constant TST_CADEIA   : boolean := true;
  constant TST_ADIANT4  : boolean := true;
  constant TST_ADIANT16 : boolean := true;


  
begin  -- TB

  U_addCad: adderCadeia     port map(inpA, inpB, resCad,  addsub, vaiCad);
  U_addAd4: adderAdianta4   port map(inpA, inpB, resAd4,  addsub, vaiAd4);
  U_addAd16: adderAdianta16 port map(inpA, inpB, resAd16, addsub, vaiAd16);

  U_testValues: process                -- test the circuit
    variable v : test_record;
  begin

    for i in test_vectors'range loop
      v := test_vectors(i);
      inpA <= v.a;
      if v.f = '0' then                 -- soma
        inpB <= v.b;
      else
        inpB <= not(v.b);               -- subtracao= A + not(B)+1
      end if;
      addsub <= v.f;                    -- vem-um(0)=1 na subtracao
      esp_res <= v.c;
      esp_vai <= v.v;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_CADEIA or (resCad = esp_res)
        report LF & "cadeia: saida errada " & " som0/1sub="& B2STR(v.f) &
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resCad) &
        LF & "  esp="& BV2STR(esp_res) 
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_CADEIA or (vaiCad = esp_vai)
        report LF & "cadeia: vai-um errado " & " som0/1sub=" & B2STR(v.f) &
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resCad) &
        LF & "  esp="& BV2STR(esp_res) &
        LF & "  vai="& B2STR(vaiCad) &" esp="& B2STR(esp_vai)
        severity error;



      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_ADIANT4 or (resAd4 = esp_res)
        report LF & "adianta4: saida errada " & " som0/1sub="& B2STR(v.f) &
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resAd4) &
        LF & "  esp="& BV2STR(esp_res) 
        severity error;

      assert TST_ADIANT4 or (vaiAd4 = esp_vai)
        report LF & "adianta4: vai-um errado " & " som0/1sub=" & B2STR(v.f)&
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resAd4) &
        LF & "  esp="& BV2STR(esp_res) &
        LF & "  vai="& B2STR(vaiAd4) &" esp="& B2STR(esp_vai)
        severity error;


      
      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_ADIANT16 or (resAd16 = esp_res)
        report LF & "adianta16: saida errada " & " som0/1sub="& B2STR(v.f) &
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resAd16) &
        LF & "  esp="& BV2STR(esp_res) 
        severity error;

      assert TST_ADIANT16 or (vaiAd16 = esp_vai)
        report LF &"adianta16: vai-um errado " & " som0/1sub=" & B2STR(v.f)&
        LF & "    A="& BV2STR(inpA) &
        LF & "    B="& BV2STR(inpB) &
        LF & " soma="& BV2STR(resAd16) &
        LF & "  esp="& BV2STR(esp_res) &
        LF & "  vai="& B2STR(vaiAd16) &" esp="& B2STR(esp_vai)
        severity error;

      wait for 2 ns;                  -- se necessario, aumente este valor
    end loop;

    wait;
    
    end process;
   
end TB;

----------------------------------------------------------------
configuration CFG_TB of TB_SOMADOR is
	for TB
        end for;
end CFG_TB;
----------------------------------------------------------------
