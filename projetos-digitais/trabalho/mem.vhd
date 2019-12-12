-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2019-2 trabalho semestral, autor: Roberto Hexsel, 14nov
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

use work.p_wires.all;

entity mem_prog is
  port (ender : in  reg7;
        instr : out reg32);

  type t_prog_mem is array (0 to 127) of reg32;

  -- memoria de programa contem somente 128 palavras
  constant program : t_prog_mem := (

    x"800efffe", -- main:	addi sp, r0, fffe       0x00 # inicializa sp
    x"80040004", -- 		addi r4, r0, 4          0x01 # i (r4) <- 4 
    x"c400000c", -- for:	bran r4, r0, fim        0x02 # if i == 0 -> branch to fim
    x"b040ffff", -- 		show r4                 0x03 # print i
    x"84020000", -- 		addi a0, r4, 0          0x04 # move i pra argumento a0
    x"80030004", -- 		addi a1, r0, 4          0x05 # move 4 pra argumento a1
    x"d00f000d", -- 		jal power               0x06 # chama funcao power
    x"81020000", -- 		addi a0, v0, 0          0x08 # move resultado de power pra argumento a0
    x"d00f001d", -- 		jal log                 0x08 # chama funcao log2
    x"b010ffff", -- 		show v0                 0x09 # imprime resultado
    x"8404ffff", -- 		addi r4, r4, -1         0x0a # i = i - 1
    x"c0000002", -- 		bran: for               0x0b # volta pro loop
    x"f0000000", -- fim:	halt                    0x0c # fim do main


    x"8e0efffe", -- power:	addi sp, sp, -2         0x0d # aloca espaco na pilha
    x"be400001", -- 		st r4, 1(sp)            0x0e # salva registrador r4 para ser utilizado
    x"80040001", -- 		addi r4, r0, 1          0x0f # r4 <- 1
    x"c3400019", -- 		bran a1, r4, return     0x10 # se exp = 1, sai da funcao
    x"bef00000", -- 		st ra, 0(sp)            0x11 # salva o return address
    x"8303ffff", -- 		addi a1, a1, -1         0x12 # exp - 1
    x"d00f000d", -- 		jal power               0x13 # chamada recursiva
    x"31210000", -- 		mul v0, v0, a0          0x14 # n * resultado recursivo anterior
    x"ae0f0000", -- 		ld ra, 0(sp)            0x15 # load no return address
    x"ae040001", -- 		ld r4, 1(sp)            0x16 # load no r4
    x"8e0e0002", -- 		addi sp, sp, 2          0x17 # libera o espaco na pilha
    x"ef000000", -- 		jr ra                   0x18 # volta da funcao
    x"82010000", -- return:	addi v0, a0, 0          0x19 # retorna n
    x"ae040001", --	 	ld r4, 1(sp)            0x1a # load no r4
    x"8e0e0002", --		addi sp, sp, 2          0x1b # libera o espaco na pilha
    x"ef000000", --		jr ra                   0x1c # volta da funcao


    x"8e0efffe", -- log:	addi sp, sp, -2         0x1d # aloca espaco na pilha
    x"be400001", -- 		st r4, 1(sp)            0x1e # salva registrador r4 pra ser utilizado
    x"80040001", -- 		addi r4, r0, 1          0x1f # r4 <- 1
    x"c2400029", -- 		bran a0, r4, end        0x20 # se n = 1, retorna
    x"92420000", -- 		sra a0, a0, r4          0x21 # n = n / 2
    x"bef00000", -- 		st ra, 0(sp)            0x22 # salva o return address
    x"d00f001d", -- 		jal log                 0x23 # chamada recursiva
    x"81010001", -- 		addi v0, v0, 1          0x24 # retorna 1 + resultado anterior
    x"ae0f0000", -- 		ld ra, 0(sp)            0x25 # load no return address
    x"ae040001", -- 		ld r4, 1(sp)            0x26 # load no r4
    x"8e0e0002", -- 		addi sp, sp, 2          0x27 # libera o espaco na pilha
    x"ef000000", -- 		jr ra                   0x28 # volta da funcao
    x"80010000", -- end:	addi v0, r0, 0          0x29 # retorna 0
    x"ae040001", -- 		ld r4, 1(sp)            0x2a # load no r4
    x"8e0e0002", -- 		addi sp, sp, 2          0x2b # libera o espaco na pilha
    x"ef000000", -- 		jr ra                   0x2c # volta da funcao
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000"
  );


  function BV2INT7(S: reg7) return integer is
    variable result: integer;
  begin
    for i in S'range loop
      result := result * 2;
      if S(i) = '1' then
        result := result + 1;
      end if;
    end loop;
    return result;
  end BV2INT7;
  
end mem_prog;

-- nao altere esta arquitetura
architecture tabela of mem_prog is
begin  -- tabela

  instr <= program( BV2INT7(ender) );

end tabela;

