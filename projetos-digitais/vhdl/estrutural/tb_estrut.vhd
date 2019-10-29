-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2013-2 autor: Roberto Hexsel, 16ago2018
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- testbench para modelagem estrutural de circuitos combinacionais
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE; use IEEE.std_logic_1164.all;
use work.p_wires.all;

entity tb_estrut is
end tb_estrut;

architecture TB of tb_estrut is

  -- declaracao dos componentes por testar
  component mux2 is
    port(A,B : in  bit; S : in  bit; Z : out bit);
  end component mux2;

  component mux4 is
    port(A,B,C,D : in  bit; S0,S1 : in bit; Z : out bit);
  end component mux4;

  component mux8 is
    port(A,B,C,D,E,F,G,H : in  bit; S0,S1,S2 : in bit; Z : out bit);
  end component mux8;

  component mux8vet is
    port(entr : in  bit_vector; sel: in bit_vector; Z : out bit);
  end component mux8vet;

  
  component demux2 is
    port(A : in  bit; S : in  bit; Z,W : out bit);
  end component demux2;

  component demux4 is
    port(A : in bit; S0,S1 : in bit; X,Y,Z,W : out bit);
  end component demux4;

  component demux8 is
    port(A : in  bit; S0,S1,S2 : in bit; P,Q,R,S,T,U,V,W : out bit);
  end component demux8;

  
  component decod2 is
    port(S : in  bit; Z,W : out bit);
  end component decod2;

  component decod4 is
    port(S0,S1 : in bit; X,Y,Z,W : out bit);
  end component decod4;

  component decod8 is
    port(S0,S1,S2 : in bit; P,Q,R,S,T,U,V,W : out bit);
  end component decod8;

  -----------------------------------------------------------------------------
  -- definicao do vetor de testes para MUX-2, DEMUX-2, DECOD-2  
  -----------------------------------------------------------------------------
  type test_record_2 is record
    k  : bit;       -- entrada de bit para demultiplexadores
    a  : reg2;      -- entrada para multiplexadores
    s  : bit;       -- entrada de selecao (para todos circuitos)
    mx : bit;       -- saida esperada do MUX
    dm : reg2;      -- saida esperada do DEMUX
    dc : reg2;      -- saida esperada do DECOD
  end record;
  type test_array_2 is array(positive range <>) of test_record_2;

  -- vetor de testes (somente com a metade dos elementos)
  constant test_vectors_2 : test_array_2 := (
    --k,   a,   s,  mx,  dm,   dc
    ('0',b"00",'0','0',b"00",b"01"),
    ('0',b"00",'1','0',b"00",b"10"),
    ('1',b"01",'0','1',b"01",b"01"),
    ('1',b"10",'1','1',b"10",b"10"),
    
    ('0',b"01",'1','0',b"00",b"10"),
    ('0',b"10",'0','0',b"00",b"01"),
    ('0',b"11",'0','1',b"00",b"01"),
    ('0',b"11",'1','1',b"00",b"10"),
    -- adicionar vetores de teste aqui
    --
    --
    -- nao alterar estes tres ultimos --
    ('0',b"00",'0','0',b"00",b"01"),
    ('0',b"00",'0','0',b"00",b"01"),
    ('0',b"00",'0','0',b"00",b"01")
    );

  -- troque a constante para FALSE para testar seus modelos
  constant TST_MUX_2   : boolean := true;
  constant TST_DEMUX_2 : boolean := true;
  constant TST_DECOD_2 : boolean := true;
  

  -----------------------------------------------------------------------------
  -- definicao do vetor de testes para MUX-4, DEMUX-4, DECOD-4
  -----------------------------------------------------------------------------
  type test_record_4 is record
    k  : bit;       -- entrada de bit para demultiplexadores
    a  : reg4;      -- entrada para multiplexadores
    s  : reg2;      -- entrada de selecao (para todos circuitos)
    mx : bit;       -- saida esperada do MUX
    dm : reg4;      -- saida esperada do DEMUX
    dc : reg4;      -- saida esperada do DECOD
  end record;
  type test_array_4 is array(positive range <>) of test_record_4;

  -- vetor de testes (somente com uma fracao dos elementos)
  constant test_vectors_4 : test_array_4 := (
    --k,   a,      s,   mx,  dm,     dc
    ('0',b"0000",b"00",'0',b"0000",b"0001"),
    ('1',b"0001",b"00",'1',b"0001",b"0001"),
    ('0',b"0000",b"01",'0',b"0000",b"0010"),
    ('1',b"0010",b"01",'1',b"0010",b"0010"),

    ('0',b"0100",b"10",'1',b"0000",b"0100"),
    ('1',b"1000",b"10",'0',b"0100",b"0100"),
    ('0',b"0000",b"11",'0',b"0000",b"1000"),
    ('1',b"1000",b"11",'1',b"1000",b"1000"),


    -- adicionar vetores de teste aqui
    --
    --
    -- nao alterar estes tres ultimos --
    ('0',b"0000",b"00",'0',b"0000",b"0001"),
    ('0',b"0000",b"00",'0',b"0000",b"0001"),
    ('0',b"0000",b"00",'0',b"0000",b"0001")
    );

  -- troque a constante para FALSE para testar seus modelos
  constant TST_MUX_4   : boolean := true;
  constant TST_DEMUX_4 : boolean := true;
  constant TST_DECOD_4 : boolean := true;


  -----------------------------------------------------------------------------
  -- definicao do vetor de testes para MUX-8, DEMUX-8, DECOD-8  
  -----------------------------------------------------------------------------
  type test_record_8 is record
    k  : bit;       -- entrada de bit para demultiplexadores
    a  : reg8;      -- entrada para multiplexadores
    s  : reg3;      -- entrada de selecao (para todos circuitos)
    mx : bit;       -- saida esperada do MUX
    dm : reg8;      -- saida esperada do DEMUX
    dc : reg8;      -- saida esperada do DECOD
  end record;
  type test_array_8 is array(positive range <>) of test_record_8;

  -- vetor de testes (somente com uma fracao dos elementos)
  constant test_vectors_8 : test_array_8 := (
    --k,   a,          s,   mx,   dm,         dc
    ('0',b"00000000",b"000",'0',b"00000000",b"00000001"),
    ('1',b"00000001",b"000",'1',b"00000001",b"00000001"),
    ('0',b"00000001",b"001",'0',b"00000000",b"00000010"),
    ('1',b"00000010",b"001",'1',b"00000010",b"00000010"),
    ('0',b"00100000",b"100",'0',b"00000000",b"00010000"),
    ('1',b"00010000",b"100",'1',b"00010000",b"00010000"),

    ('0',b"00001000",b"010",'0',b"00000000",b"00000100"),
    ('1',b"00000100",b"010",'1',b"00000100",b"00000100"),
    ('0',b"00000100",b"011",'0',b"00000000",b"00001000"),
    ('1',b"00001000",b"011",'1',b"00001000",b"00001000"),
    ('0',b"00010000",b"101",'0',b"00000000",b"00100000"),
    ('1',b"00100000",b"101",'1',b"00100000",b"00100000"),
    ('0',b"10000000",b"110",'0',b"00000000",b"01000000"),
    ('1',b"01000000",b"110",'1',b"01000000",b"01000000"),
    ('0',b"01000000",b"111",'0',b"00000000",b"10000000"),
    ('1',b"10000000",b"111",'1',b"10000000",b"10000000"),

    -- adicionar vetores de teste aqui
    --
    --
    -- nao alterar estes tres ultimos --
    ('0',b"00000000",b"000",'0',b"00000000",b"00000001"),
    ('0',b"00000000",b"000",'0',b"00000000",b"00000001"),
    ('0',b"00000000",b"000",'0',b"00000000",b"00000001")
    );

  -- troque a constante para FALSE para testar seus modelos
  constant TST_MUX_8   : boolean := true;
  constant TST_DEMUX_8 : boolean := true;
  constant TST_DECOD_8 : boolean := true;

  
  
  signal inp,s0,s1,s2 : bit;
  signal s : reg3;
  
  signal saidaMUX2, saidaMUX4, saidaMUX8, saidaMUX8vet, esperadaMUX : bit;
  signal entr_2, sDEMUX2, sDECOD2, esperadaDEMUX_2, esperadaDECOD_2 : reg2;
  signal entr_4, sDEMUX4, sDECOD4, esperadaDEMUX_4, esperadaDECOD_4 : reg4;
  signal entr_8, sDECOD8, sDEMUX8, esperadaDEMUX_8, esperadaDECOD_8 : reg8;

begin

  -- instanciacao dos componentes por testar
  U_mux2:  mux2  port map (entr_2(0), entr_2(1), s0, saidaMUX2);

  U_mux4:  mux4 port map (entr_4(0),entr_4(1),entr_4(2),entr_4(3),
                          s0,s1, saidaMUX4);

  U_mux8:  mux8 port map (entr_8(0),entr_8(1),entr_8(2),entr_8(3),
                          entr_8(4),entr_8(5),entr_8(6),entr_8(7),
                          s0,s1,s2, saidaMUX8);
  
  U_mux8vet:  mux8vet port map (entr_8, s, saidaMUX8vet);
  

  U_demux2: demux2 port map (inp, s0, sDEMUX2(0),sDEMUX2(1));

  U_demux4: demux4 port map (inp, s0,s1,
                             sDEMUX4(0),sDEMUX4(1),sDEMUX4(2),sDEMUX4(3));

  U_demux8: demux8 port map (inp, s0,s1,s2,
                             sDEMUX8(0),sDEMUX8(1),sDEMUX8(2),sDEMUX8(3),
                             sDEMUX8(4),sDEMUX8(5),sDEMUX8(6),sDEMUX8(7));


  U_decod2: decod2 port map (s0, sDECOD2(0),sDECOD2(1));

  U_decod4: decod4 port map (s0,s1,
                             sDECOD4(0),sDECOD4(1),sDECOD4(2),sDECOD4(3));

  U_decod8: decod8 port map (s0,s1,s2,
                             sDECOD8(0),sDECOD8(1),sDECOD8(2),sDECOD8(3),
                             sDECOD8(4),sDECOD8(5),sDECOD8(6),sDECOD8(7));

  
  -- este processo efetua os testes, executa em paralelo com seus modelos
  U_testValues: process
    variable v_2 : test_record_2;
    variable v_4 : test_record_4;
    variable v_8 : test_record_8;
  begin

    -- circuitos de DUAS entradas
    for i in test_vectors_2'range loop
      v_2    := test_vectors_2(i);           -- atribui valores de teste
      s0     <= v_2.s;
      inp    <= v_2.k;
      entr_2 <= v_2.a;
      esperadaMUX     <= v_2.mx;
      esperadaDEMUX_2 <= v_2.dm;
      esperadaDECOD_2 <= v_2.dc;

      wait for 200 ps;                  -- espera propagacao dos sinais

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_MUX_2 or (saidaMUX2 = esperadaMUX)
        report LF & "mux2: saida errada sel="& B2STR(s0) &
        " saiu=" & B2STR(saidaMUX2) & " esperada=" & B2STR(esperadaMUX)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_DEMUX_2 or (sDEMUX2 = esperadaDEMUX_2)
        report LF & "demux2: saida errada sel="& B2STR(s0) &
        " entr="& B2STR(inp) &
        " saiu=" & BV2STR(sDEMUX2) &
        " esperada=" & BV2STR(esperadaDEMUX_2)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_DECOD_2 or (sDECOD2 = esperadaDECOD_2)
        report LF & "decod2: saida errada sel="& B2STR(s0) &
        " saiu=" & BV2STR(sDECOD2) &
        " esperada=" & BV2STR(esperadaDECOD_2)
        severity error;

    end loop;  -- DUAS entradas -----------------------------------


    
    -- circuitos de QUATRO entradas -------------------------------
    for i in test_vectors_4'range loop
      v_4 := test_vectors_4(i);           -- atribui valores de teste
      s0     <= v_4.s(0);
      s1     <= v_4.s(1);
      inp    <= v_4.k;
      entr_4 <= v_4.a;
      esperadaMUX     <= v_4.mx;
      esperadaDEMUX_4 <= v_4.dm;
      esperadaDECOD_4 <= v_4.dc;

      wait for 200 ps;                  -- espera propagacao dos sinais

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_MUX_4 or (saidaMUX4 = esperadaMUX)
        report LF & "mux4: saida errada sel="& BV2STR(s(1 downto 0)) &
        " saiu=" & B2STR(saidaMUX4) & " esperada=" & B2STR(esperadaMUX)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_DEMUX_4 or (sDEMUX4 = esperadaDEMUX_4)
        report LF & "demux4: saida errada sel="& BV2STR(s(1 downto 0)) &
        " entr="& B2STR(inp) &
        " saiu=" & BV2STR(sDEMUX4) &
        " esperada=" & BV2STR(esperadaDEMUX_4)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_DECOD_4 or (sDECOD4 = esperadaDECOD_4)
        report LF & "decod4: saida errada sel="& BV2STR(s(1 downto 0)) &
        " saiu=" & BV2STR(sDECOD4) &
        " esperada=" & BV2STR(esperadaDECOD_4)
        severity error;

    end loop; -- QUATRO entradas-----------------------------------


    -- circuitos de OITO entradas ---------------------------------
    for i in test_vectors_8'range loop
      v_8    := test_vectors_8(i);      -- atribui valores de teste
      s      <= v_8.s;
      s0     <= v_8.s(0);
      s1     <= v_8.s(1);
      s2     <= v_8.s(2);
      inp    <= v_8.k;
      entr_8 <= v_8.a;
      esperadaMUX     <= v_8.mx;
      esperadaDEMUX_8 <= v_8.dm;
      esperadaDECOD_8 <= v_8.dc;

      wait for 200 ps;                  -- espera propagacao dos sinais

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_MUX_8 or (saidaMUX8 = esperadaMUX)
        report LF & "mux8: saida errada sel="& BV2STR(s) &
        " saiu=" & B2STR(saidaMUX8) & " esperada=" & B2STR(esperadaMUX)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_MUX_8 or (saidaMUX8vet = esperadaMUX)
        report LF & "mux8vet: saida errada sel="& BV2STR(s) &
        " saiu=" & B2STR(saidaMUX8vet) & " esperada=" & B2STR(esperadaMUX)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
      assert TST_DEMUX_8 or (sDEMUX8 = esperadaDEMUX_8)
        report LF & "demux8: saida errada sel=" & BV2STR(s) &
        " entr="& B2STR(inp) &
        " saiu=" & BV2STR(sDEMUX8) & " esperada=" & BV2STR(esperadaDEMUX_8)
        severity error;

      --------------------------------------------------------------
      -- altere a constante para FALSE para testar
      --------------------------------------------------------------
       assert TST_DECOD_8 or (sDECOD8 = esperadaDECOD_8)
         report LF & "decod8: saida errada sel=" & BV2STR(s) &
         " saiu=" & BV2STR(sDECOD8) & " esperada=" & BV2STR(esperadaDECOD_8)
         severity error;
          
    end loop;  -- OITO entradas ----------------------------------
    
    wait;
    
    end process U_testValues;

end architecture TB;
-- --------------------------------------------------------------

-- --------------------------------------------------------------
configuration CFG_TB of TB_ESTRUT is
        for TB
        end for;
end CFG_TB;
-- --------------------------------------------------------------

