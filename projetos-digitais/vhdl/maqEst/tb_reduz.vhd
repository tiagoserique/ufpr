-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2018-2 lab Maq de Estado, autor: Roberto Hexsel, 10set
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- testbench do circuito que computa a redução de vetores
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee; use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.p_wires.all;

entity tb_reduz is
end tb_reduz;

architecture TB of tb_reduz is

  component write_int is
    port (rst,clk : in    bit;
          sel     : in    bit;         -- active in '1'
          data    : in    bit_vector);
  end component write_int;

  component reduz is
    port (rst,clk : in    bit;
          valor   : in    bit_vector;
          saida   : out   bit_vector;
          sel     : out   bit);         -- active in '1';
  end component reduz;

  type test_record is record
    entr : reg32;       -- entrada
    esp  : reg32;       -- TESTE: saida esperada
  end record test_record;

  type test_array is array(positive range <>) of test_record;
  
  constant test_vector : test_array := (
    -- nao altere estes tres primeiros --
    (x"ffffffff", x"00000000"), -- sync sync sync
    (x"ffffffff", x"00000000"),
    (x"ffffffff", x"00000000"),

    (x"00000004", x"00000000"), -- mult
    (x"00000001", x"00000000"),
    (x"00000002", x"00000000"),
    (x"00000003", x"00000000"),
    (x"00000004", x"00000000"), 
    (x"00000005", x"00000000"),
    (x"00000006", x"00000000"),
    (x"00000007", x"00000000"),
    (x"00000008", x"00009d80"), -- 0000.9d80 = 8!

    (x"ffffffff", x"00000000"), -- sync

    (x"00000003", x"00000000"), -- soma
    (x"11111111", x"00000000"),
    (x"22222222", x"00000000"),
    (x"33333333", x"00000000"),
    (x"00000000", x"00000000"),
    (x"11111111", x"00000000"),
    (x"00000000", x"00000000"),
    (x"11111111", x"00000000"),
    (x"11111111", x"99999999"), -- 9999.9999

    (x"ffffffff", x"00000000"), -- sync
    
    (x"00000002", x"00000000"), -- or
    (x"11110000", x"00000000"),
    (x"22220000", x"00000000"),
    (x"44440000", x"00000000"),
    (x"88880000", x"00000000"),
    (x"00001111", x"00000000"),
    (x"00002222", x"00000000"),
    (x"00004444", x"00000000"),
    (x"00008888", x"ffffffff"), -- ffff.ffff

    (x"ffffffff", x"00000000"), -- sync sync
    (x"ffffffff", x"00000000"),

    (x"00000001", x"00000000"), -- and
    (x"ffff7777", x"00000000"),
    (x"ffff3333", x"00000000"),
    (x"ffff1111", x"00000000"),
    (x"ffff5555", x"00000000"),
    (x"ffffffff", x"00000000"),
    (x"aaaa5555", x"00000000"),
    (x"5555ffff", x"00000000"),
    (x"1111ffff", x"00001111"), -- 0000.1111

    (x"ffffffff", x"00000000"), -- sync sync sync
    (x"ffffffff", x"00000000"),
    (x"ffffffff", x"00000000"), 

    (x"00000000", x"00000000"), -- xor
    (x"0000ffff", x"00000000"),
    (x"00005555", x"00000000"),
    (x"0000aaaa", x"00000000"),
    (x"00001111", x"00000000"),
    (x"11110000", x"00000000"),
    (x"22220000", x"00000000"),
    (x"44440000", x"00000000"),
    (x"88880000", x"ffff1111"), -- ffff.1111

    (x"ffffffff", x"00000000"), -- sync sync sync
    (x"ffffffff", x"00000000"), 
    (x"ffffffff", x"00000000"), 
    -- acrescente casos adicionais de teste aqui


    -- nao altere estes tres ultimos --
    (x"ffffffff", x"00000000"), -- sync sync sync
    (x"ffffffff", x"00000000"),
    (x"ffffffff", x"00000000")
    );
  
  signal clk, rst, w_sel: bit;
  signal entrada, saida, esp_res : reg32;
  signal fim_da_simulacao : boolean := false;
  
begin  -- TB

  U_reduz: reduz port map (rst, clk, entrada, saida, w_sel);

  U_write_output:  write_int port map (rst, clk, w_sel, saida);


  U_testValues: process                -- test the model
    variable v : test_record;
  begin

    fim_da_simulacao <= false;

    for i in test_vector'range loop
      
      v := test_vector(i);
      entrada <= v.entr;                -- valor na entrada
      esp_res <= v.esp;                 -- resultado esperado

      assert ( w_sel = '0' or saida = esp_res )
        report LF & LF & HT & "saida errada" &
               LF & HT      & "saida = " & BV32HEX(saida) &
               LF & HT      & "esper = " & BV32HEX(esp_res) & LF
        severity error;

      wait until rising_edge(clk);
      
    end loop;

    fim_da_simulacao <= true;
    wait;
    
  end process U_testValues;  

  
  U_clock: process
  begin
    clk <= '1';      -- executa e
    wait for t_clock_period / 2;  -- espera meio ciclo
    clk <= '0';      -- volta a executar e
    wait for t_clock_period / 2;  -- espera meio ciclo e volta ao topo

    if fim_da_simulacao then
      wait;          -- termina a simulacao
    end if;

  end process U_clock;


  U_reset: process
  begin
    rst <= '0';      -- executa e
    wait for t_clock_period * 0.75;  -- espera por 3/4 de ciclo
    rst <= '1';      -- volta a executar e
    wait;            -- espera para sempre
  end process u_reset;

end TB;
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

----------------------------------------------------------------
configuration CFG_TB of tb_reduz is
	for TB
        end for;
end CFG_TB;
----------------------------------------------------------------
