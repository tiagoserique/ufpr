-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2017-2 trabalho semestral, autor: Roberto Hexsel, 21out
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- processador MICO XI
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee; use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.p_wires.all;


entity mico is
  port (rst,clk : in bit);
end mico;

architecture functional of mico is

  component mem_prog is                 -- no arquivo mem.vhd
    port (ender : in  reg7;
          instr : out reg32);
  end component mem_prog;

  component display is                  -- neste arquivo
    port (rst,clk : in bit;
          enable  : in bit;
          data    : in reg32);
  end component display;

  component ULA is                      -- neste arquivo
    port (fun : in reg4;
          alfa,beta : in  reg32;
          gama      : out reg32);
  end component ULA;
 
  component R is                        -- neste arquivo
    port (clk         : in  bit;
          wr_en       : in  bit;
          r_a,r_b,r_c : in  reg4;
          A,B         : out reg32;
          C           : in  reg32);
  end component R;

  component RAM is                      -- neste arquivo
    port (rst, clk : in  bit;
          sel      : in  bit;           -- ativo em 1
          wr       : in  bit;           -- ativo em 1
          ender    : in  reg16;
          data_inp : in  reg32;
          data_out : out reg32);
  end component RAM;


  type t_control_type is record
    selC       : reg2;     -- seleciona fonte da escrita no reg destino
    wr_reg     : bit;      -- atualiza banco de registradores
    selBeta    : bit;      -- seleciona fonte para entrada B da ULA
    mem_sel    : bit;      -- habilita acesso a RAM
    mem_wr     : bit;      -- habilita escrita na RAM
  end record;

  type t_control_mem is array (0 to 15) of t_control_type;
  
  constant ctrl_table : t_control_mem := (
  -- selC  WrR  selB MSel MWr
    ("11", '0', '0', '0', '0'),            -- NOP
    ("00", '1', '0', '0', '0'),            -- ADD
    ("00", '1', '0', '0', '0'),            -- SUB
    ("00", '1', '0', '0', '0'),            -- MUL
    ("00", '1', '0', '0', '0'),            -- AND
    ("00", '1', '0', '0', '0'),            -- OR
    ("00", '1', '0', '0', '0'),            -- XOR
    ("00", '1', '0', '0', '0'),            -- NOT
    ("00", '1', '1', '0', '0'),            -- ADDI
    ("00", '1', '0', '0', '0'),            -- SRA
    ("01", '1', '1', '1', '0'),            -- LD
    ("11", '0', '1', '1', '1'),            -- ST
    ("11", '0', '1', '0', '0'),            -- BRANCH
    ("10", '1', '1', '0', '0'),            -- JAL
    ("11", '0', '0', '0', '0'),            -- JR
    ("11", '0', '0', '0', '0'));           -- HALT

  constant op_BRA  : bit_vector := x"c";
  constant op_JAL  : bit_vector := x"d";
  constant op_JR   : bit_vector := x"e";
  constant op_HALT : bit_vector := x"f";

  subtype sml_int is integer range 0 to 65535;
  
  signal selC : reg2;
  signal selBeta, wr_display, wr_reg : bit;
  signal is_mem, mem_sel, mem_wr : bit;

  signal instr, A, B, C, beta, extended, ula_D, mem_D : reg32;
  signal this  : t_control_type;
  signal const, ip, ip_mais1, ext_zeros, ext_sinal : reg16;
  signal opcode : reg4;
  signal i_opcode : natural range 0 to 15;
  signal reg_a, reg_b, reg_c : reg4;
  
begin  -- functional

  -- controla IP
  U_ip: process (clk, rst, opcode, const, A, B)
    variable i_ip    : sml_int := 0;
    variable i_ip_m1 : sml_int := 0;
  begin
    if rst = '1' then
      i_ip := 0;
    else
      if rising_edge(clk) then
        if (opcode = op_JAL) then -- jal
          i_ip    := BV2INT16(const);
        elsif (opcode = op_JR) then -- jr
          i_ip := BV2INT16(A(15 downto 0));
        elsif (opcode = op_BRA) then 
          if (A = B) then                -- branch taken
            i_ip := BV2INT16(const);
          else                           -- branch not-taken
            i_ip := i_ip + 1;
          end if;
        elsif opcode = op_HALT then         -- halt
          i_ip := i_ip + 0;

          assert opcode /= op_HALT
            report LF & LF & "simulation halted: " & 
            "ender = "&integer'image(BV2INT16(ip))&" = "&BV16HEX(ip)&LF
            severity failure;

        else
          i_ip    := i_ip + 1;
          i_ip_m1 := i_ip + 1;
        end if;
      end if;
    end if;
    ip       <= INT2BV16(i_ip);
    ip_mais1 <= INT2BV16(i_ip_m1);
  end process U_ip; 
  

  -- memoria de programa contem somente 128 palavras
  U_mem_prog: mem_prog port map(ip(6 downto 0), instr);

  
  opcode   <= instr(31 downto 28);
  i_opcode <= BV2INT4(opcode);          -- indice do vetor DEVE ser inteiro
  const    <= instr(15 downto 0);
  
  this     <= ctrl_table(i_opcode);         -- sinais de controle

  selBeta  <= this.selBeta;
  wr_reg   <= this.wr_reg;
  selC     <= this.selC;
  is_mem   <= this.mem_sel;
  mem_wr   <= this.mem_wr;

  reg_a    <= instr(27 downto 24);
  reg_b    <= instr(23 downto 20);
  reg_c    <= instr(19 downto 16);
  
  ext_sinal <= x"0000" when instr(15) = '0' else
               x"ffff";
  
  extended <= ext_sinal & instr(15 downto 0);
  
  beta <= B when selBeta = '0' else extended;

  with selC select
    C <= ula_D              when "00",   -- ULA
         mem_D              when "01",   -- LD 
         x"0000" & ip_mais1 when "10",   -- JAL
         x"00000000"        when others; -- nil
  
  U_regs: R port map (clk, wr_reg, reg_a, reg_b, reg_c,
                      A,B,C);

  U_ULA: ULA port map (opcode, A, beta, ula_D);

  U_mem: RAM port map (rst, clk, mem_sel, mem_wr,
                       ula_D(15 downto 0), B, mem_D);
  
  mem_sel <= '1' when ( (ula_D(15 downto 0) /= x"ffff")
                        and (is_mem = '1')              ) else
             '0';

  wr_display <= '1' when ( (ula_D(15 downto 0) = x"ffff") and
                           (is_mem  = '1')                and
                           (mem_wr  = '1')                    ) else
                '0';
    
  U_display: display port map (rst, clk, wr_display, B);

  
end functional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE; use ieee.std_logic_1164.all;
use work.p_wires.all;

entity ULA is
  port (fun : in reg4;
        alfa,beta : in  reg32;
        gama      : out reg32);
end ULA;

architecture behaviour of ULA is
  signal a,b,c, sh_pos : integer;
begin  -- behaviour

  a <= BV2INT(alfa);
  b <= BV2INT(beta);

  sh_pos <= BV2INT5(beta(4 downto 0));
  
  with fun select
    gama <= (others => '0')   when "0000",
            INT2BV32( a + b ) when "0001",
            INT2BV32( a - b ) when "0010",
            INT2BV32( a * b ) when "0011",
            alfa and beta     when "0100",
            alfa or  beta     when "0101",
            alfa xor beta     when "0110",
            not(alfa)         when "0111",
            INT2BV32( a + b ) when "1000",
            alfa sra sh_pos   when "1001",
            INT2BV32( a + b ) when "1010",
            INT2BV32( a + b ) when "1011",
            (others => '0')   when others;

end behaviour;
-- -----------------------------------------------------------------------



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- display: exibe inteiro na saida padrao do simulador
--          NAO ALTERE ESTE MODELO
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library IEEE; use std.textio.all;
use work.p_wires.all;

entity display is
  port (rst,clk : in bit;
        enable  : in bit;
        data    : in reg32);
end display;

architecture functional of display is
  file output : text open write_mode is "STD_OUTPUT";
begin  -- functional

  U_WRITE_OUT: process(clk)
    variable msg : line;
  begin
    if falling_edge(clk) and enable = '1' then
      write ( msg, string'(BV32HEX(data)) );
      writeline( output, msg );
    end if;
  end process U_WRITE_OUT;

end functional;
-- ++ display ++++++++++++++++++++++++++++++++++++++++++++++++++++++++



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- memoria RAM, com capacidade de 64K palavras de 32 bits
--          NAO ALTERE ESTE MODELO
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
library ieee; use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.p_wires.all;

entity RAM is
  port (rst, clk : in  bit;
        sel      : in  bit;          -- ativo em 1
        wr       : in  bit;          -- ativo em 1
        ender    : in  reg16;
        data_inp : in  reg32;
        data_out : out reg32);

  constant DATA_MEM_SZ : natural := 2**16;
  constant DATA_ADDRS_BITS : natural := log2_ceil(DATA_MEM_SZ);

end RAM;

architecture rtl of RAM is
  
  subtype t_address is unsigned((DATA_ADDRS_BITS - 1) downto 0);
  
  subtype word is bit_vector(31 downto 0);
  type storage_array is
    array (natural range 0 to (DATA_MEM_SZ - 1)) of word;
  signal storage : storage_array;
begin
  
  accessRAM: process(rst, clk, sel, wr, ender, data_inp)
    variable u_addr : t_address;
    variable index, latched : natural;

    variable d : reg32 := (others => '0');
    variable val, i : integer;

  begin

    if (rst = '0') and (sel = '1') then -- normal operation

      index := BV2INT16(ender);

      if  (wr = '1') and rising_edge(clk) then
        
        assert (index >= 0) and (index < DATA_MEM_SZ)
          report "ramWR index out of bounds: " & natural'image(index)
          severity failure;

        storage(index) <= data_inp;
        
        assert TRUE report "ramWR["& natural'image(index) &"] "
          & BV32HEX(data_inp); -- DEBUG
        
      else

        assert (index >= 0) and (index < DATA_MEM_SZ)
          report "ramRD index out of bounds: " & natural'image(index)
          severity failure;

        d := storage(index);
        
        assert TRUE report "ramRD["& natural'image(index) &"] "
          & BV32HEX(d);  -- DEBUG

      end if; -- normal operation

      data_out <= d;

    else

      data_out <= (others=>'0');

    end if; -- is reset?
    
  end process accessRAM; -- ---------------------------------------------
  
end rtl;
-- -----------------------------------------------------------------------



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- banco de registradores
--          NAO ALTERE ESTE MODELO
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity R is
  port (clk         : in  bit;
        wr_en       : in  bit;          -- ativo em 1
        r_a,r_b,r_c : in  reg4;
        A,B         : out reg32;
        C           : in  reg32);
end R;

architecture rtl of R is
  type reg_file is array(0 to 15) of reg32;
  signal reg_file_A : reg_file;
  signal reg_file_B : reg_file;
  signal int_ra, int_rb, int_rc : integer range 0 to 15;
begin

  int_ra <= BV2INT4(r_a);
  int_rb <= BV2INT4(r_b);
  int_rc <= BV2INT4(r_c);

  A <= reg_file_A( int_ra ) when r_a /= b"0000" else
       x"00000000";                        -- reg0 always zero
  B <= reg_file_B( int_rb ) when r_b /= b"0000" else
       x"00000000";

  WRITE_REG_BANKS: process(clk)
  begin
    if rising_edge(clk) then
      if wr_en = '1' and r_c /= b"0000" then
        reg_file_A( int_rc ) <= C;
        reg_file_B( int_rc ) <= C;
      end if;
    end if;
  end process WRITE_REG_BANKS;
  
end rtl;
-- -----------------------------------------------------------------------
