-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2018-2 labMaqEst, autor: Roberto Hexsel, 12set2018
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- curcuito que computa reducoes
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity reduz is
  port (rst, clk : in    bit;
        valor    : in    bit_vector;
        saida    : out   bit_vector;
        sel      : out   bit);         -- active in '1'
end reduz;

architecture functional of reduz is

  component ULA
    port (alfa,beta : in  bit_vector;
          oper      : in  bit_vector;
          delta     : out bit_vector);
  end component ULA;

  component registrador32 is
    port(clk, rst, ld: in  bit;
         D:           in  reg32;
         Q:           out reg32);
  end component registrador32;

  -- por completar: acrescente tantos estados quantos necessarios
  type states is (st_sync, st_oper, st_digi0, st_digi1, st_digi2, st_digi3, st_digi4, st_digi5, st_digi6, st_digi7);

  signal curr_st, next_st : states;

  signal alfa, beta, delta, inp_red, oper32 : reg32;
  signal oper : reg3;
  signal ld_b, ld_op, init_b, sync, pronto : bit;
  signal dbg_st : integer;
  
begin  -- functional


  -- circuito de dados ---------------------------------------------

  sync     <= '1' when valor = x"ffffffff" else '0';

  U_oper: registrador32 port map(clk, rst, ld_op, valor, oper32);

  inp_red <= valor when init_b = '1' else delta;
  
  U_red:  registrador32 port map(clk, rst, ld_b, inp_red, beta);

  oper <= oper32(2 downto 0);
  alfa <= valor;
  
  U_ula:  ULA port map(alfa, beta, oper, delta);

  saida <= delta;


  -- maquina de estados ---------------------------------------------

  dbg_st <= integer(states'pos(curr_st));  -- debugging only

  U_state_reg: process(rst, clk)
  begin
    if rst = '0' then
      curr_st <= st_sync;
    elsif rising_edge(clk) then
      curr_st <= next_st;
    end if;
  end process U_state_reg;

  U_st_transitions: process(curr_st, sync)  -- por completar
  begin                  
    case curr_st is

      when st_sync =>          -- sync
        if sync = '1' then
          next_st <= st_sync;
        else
          next_st <= st_oper;
        end if;
        
      when st_oper =>          -- oper
        next_st <= st_digi0;

      when st_digi0 =>
       next_st <= st_digi1;

      when st_digi1 =>
       next_st <= st_digi2;

      when st_digi2 =>
       next_st <= st_digi3;

      when st_digi3 =>
       next_st <= st_digi4;

      when st_digi4 =>
       next_st <= st_digi5;

      when st_digi5 =>
       next_st <= st_digi6;

      when st_digi6 =>
       next_st <= st_digi7;

      when st_digi7 =>
	if sync = '1' then
          next_st <= st_sync;
	end if;

        -- complete a ME
        

    end case;
  end process U_st_transitions;

  
  U_output_fun: process(curr_st, sync)  -- por completar
  begin                  
    case curr_st is

      when st_sync =>
        if sync = '1' then
          ld_op  <= '0';  -- estes sinais sao Mealy
          ld_b   <= '0';
          init_b <= '0';
        else
          ld_op  <= '1';
          ld_b   <= '0';
          init_b <= '0';
        end if;
        sel    <= '0';      

      when st_oper =>     -- estes sinais são Moore
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '1';        
        sel    <= '0';
        
      when st_digi0 =>
	ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi1 =>
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi2 =>
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi3 =>
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi4 =>
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi5 =>
        ld_op  <= '0';
        ld_b   <= '1';
        init_b <= '0';
        sel    <= '0';

      when st_digi6 =>
        ld_op  <= '0';
        ld_b   <= '0';
        init_b <= '0';
        sel    <= '1';

      when st_digi7 =>
        ld_op  <= '0';
        ld_b   <= '0';
        init_b <= '0';
        sel    <= '0';

        -- complete a funcao de saida
        
    end case;
  end process U_output_fun;


  
  
end functional;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


