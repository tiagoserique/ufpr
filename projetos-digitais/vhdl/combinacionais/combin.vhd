-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- UFPR, BCC, ci210 2013-2, autor: Roberto Hexsel, 25ago2016
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mux2(a,b,s,z)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux2 is
  port(a,b : in  bit;                   -- entradas de dados
       s   : in  bit;                   -- entrada de selecao
       z   : out bit);                  -- saida
end mux2;

architecture estrut of mux2 is 

  -- declara componentes que sao instanciados
  component inv is
    generic (prop : time; cont : time);
    port(A : in bit; S : out bit);
  end component inv;

  component nand2 is
    generic (prop : time; cont : time);
    port(A,B : in bit; S : out bit);
  end component nand2;

  component nor2 is
    generic (prop : time; cont : time);
    port(A,B : in bit; S : out bit);
  end component nor2;

  component nand3 is
    generic (prop : time; cont : time);
    port(A,B,C : in bit; S : out bit);
  end component nand3;


  signal p, q, r: bit;  -- sinais internos
  
begin  -- compare ligacoes dos sinais com diagrama das portas logicas

  Ui:  inv   generic map (t_inv,   t_cont) port map(s, r);
  Ua0: nand2 generic map (t_nand2, t_cont) port map(a, r, p);
  Ua1: nand2 generic map (t_nand2, t_cont) port map(b, s, q);
  Uor: nand2 generic map (t_nand2, t_cont) port map(p, q, z);
  
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mux4(a,b,c,d,s0,s1,z)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux4 is
  port(a,b,c,d : in  bit;               -- quatro entradas de dados
       s0,s1   : in  bit;               -- dois sinais de selecao
       z       : out bit);              -- saida
end mux4;

architecture estrut of mux4 is 

  component mux2 is
    port(A,B : in  bit; S : in  bit; Z : out bit);
  end component mux2;

  signal p,q : bit;                   -- sinais internos
begin

  -- copie seu o modelo da aula passada

  Um0: mux2 port map(a, b, s0, p);
  Um1: mux2 port map(c, d, s0, q);
  Um2: mux2 port map(p, q, s1, z);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mux8(a,b,c,d,e,f,g,h,s0,s1,s2,z)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux8 is
  port(a,b,c,d,e,f,g,h : in  bit;       -- oito entradas de dados
       s0,s1,s2        : in  bit;       -- tres sinais de controle
       z               : out bit);      -- saida
end mux8;

architecture estrut of mux8 is 

  component mux2 is
    port(A,B : in  bit; S : in  bit; Z : out bit);
  end component mux2;

  component mux4 is
    port(A,B,C,D : in  bit; S0,S1 : in  bit; Z : out bit);
  end component mux4;

  signal p,q : bit;                   -- sinais internos
  
begin
  
  -- copie seu o modelo da aula passada
  Umx0: mux2 port map(p, q, s2, z);
  Um0: mux4 port map(a, b, c, d, s0, s1, p);
  Um1: mux4 port map(e, f, g, h, s0, s1, q);
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- escreva a arquitetura when-else do mux8 aqui
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux8 is
  port(a,b,c,d,e,f,g,h : in bit;       -- oito entradas de dados
      s0,s1,s2        : in  bit;       -- tres sinais de controle
      z               : out bit);      -- saida
end mux8;

architecture when_else of mux8 is

  signal p,q : bit;

begin

  -- copie seu o modelo da aula passada


 p <= a when (s0='0')and(s1='0') else 
       b when (s0='1')and(s1='0') else
       c when (s0='0')and(s1='1') else
       d;

  q <= e when (s0='0')and(s1='0') else
       f when (s0='1')and(s1='0') else
       g when (s0='0')and(s1='1') else
       h;
 
  z <= p when (s2='0') else
      q;

end architecture when_else;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- escreva a arquitetura with-select do mux8 aqui
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux8 is
  port(a,b,c,d,e,f,g,h : in bit;       -- oito entradas de dados
      s0,s1,s2        : in  bit;       -- tres sinais de controle
       z               : out bit);      -- saida
 end mux8;

 architecture with_select of mux8 is

  signal p,q,r,s,t,u : bit;

 begin

  -- copie seu o modelo da aula passada

  with s0 select
    p <= a when '0',
         b when others;

  with s0 select
    q <= c when '0',
         d when others;

   with s0 select
    r <=  e when '0',
         f when others;

  with s0 select
    s <= g when '0',
         h when others;

  with s1 select
    t <= p when '0',
         q when others;

  with s1 select
    u <= r when '0',
         s when others;

  with s2 select
    z <= t when '0',
         u when others;

 end architecture with_select;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mux8vet(entr(7downto0),sel(2downto1),z)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity mux8vet is
  port(entr : in  reg8;
       sel  : in  reg3;
       Z    : out bit);
end mux8vet;

architecture estrut of mux8vet is 

  component mux2 is
    port(A,B : in  bit; S : in  bit; Z : out bit);
  end component mux2;

  component mux4 is
    port(A,B,C,D : in  bit; S0,S1 : in  bit; Z : out bit);
  end component mux4;

  signal p,q : bit;                   -- sinais internos
  
begin

  -- copie seu o modelo da aula passada
  Umx0: mux2 port map(p, q, sel(2), z);
  Um0: mux4 port map(entr(0),entr(1), entr(2), entr(3), sel(0), sel(1), p);
  Um1: mux4 port map(entr(4), entr(5), entr(6), entr(7), sel(0), sel(1), q);
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- demux2(a,s,z,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity demux2 is
  port(a   : in  bit;
       s   : in  bit;
       z,w : out bit);
end demux2;

architecture estrut of demux2 is 

  -- declare as portas logicas com temporizacao aqui
  component inv is
    generic (prop : time; cont : time);
    port(A : in bit; S : out bit);
  end component inv;

  component nor2 is
    generic (prop : time; cont : time);
    port(A,B : in bit; S : out bit);
  end component nor2;  

  signal p,q : bit;

begin

-- implemente com portas logicas
  Ui0:  inv generic map (t_inv,   t_cont)  port map(a, p);
  Ui1:  inv generic map (t_inv,   t_cont)  port map(s,q);
  Ua0: nor2 generic map (t_nor2,   t_cont)  port map(s, p, z);
  Ua1: nor2 generic map (t_nor2,   t_cont)  port map(p, q, w);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- demux4(a,s0,s1,x,y,z,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity demux4 is
  port(a       : in  bit;
       s0,s1   : in  bit;
       x,y,z,w : out bit);
end demux4;

architecture estrut of demux4 is

  -- declara componentes que sao instanciados

  component demux2 is
    port(A : in bit; S : in bit; Z,W : out bit);
  end component demux2;


  signal p,q : bit;             -- declare sinais internos, se precisar
begin

  -- copie seu o modelo da aula passada
  Udm0:  demux2   port map(a, s1, p, q);
  Udm1:  demux2   port map(p, s0, x, y);
  Udm2:  demux2   port map(q, s0, z, w);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- demux8(a,s0,s1,s2,p,q,r,s,t,u,v,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity demux8 is
  port(a               : in  bit;
       s0,s1,s2        : in  bit;
       p,q,r,s,t,u,v,w : out bit);
end demux8;

architecture estrut of demux8 is

  -- declara componentes que sao instanciados
  component demux2 is
    port(A : in bit; S : in bit; Z,W : out bit);
  end component demux2;

  component demux4 is
    port(A : in bit; S0,S1 : in bit; X,Y,Z,W : out bit);
  end component demux4;

  signal e,f : bit;             -- declare sinais internos, se precisar  
begin

    -- copie seu o modelo da aula passada
   Udm0:  demux2 port map(a, s2, e, f);
   Udm1:  demux4 port map(e, s0, s1, p, q, r, s);
   Udm2:  demux4 port map(f, s0, s1, t, u, v, w);
  
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- decod2(s,z,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity decod2 is
  port(s   : in  bit;
       z,w : out bit);
end decod2;

architecture estrut of decod2 is 

  -- declare as portas logicas com temporizacao aqui
  component inv is
    generic (prop : time; cont : time);
    port(A : in bit; S : out bit);
  end component inv;
  
begin

-- implemente com portas logicas
  Ui0:  inv  generic map (t_inv,   t_cont) port map(s, z);
  w <= s;
end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- decod4(s0,s1,x,y,z,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity decod4 is
  port(s0,s1   : in  bit;
       x,y,z,w : out bit);
end decod4;

architecture estrut of decod4 is

  -- declara componentes que sao instanciados
  component decod2 is
    port(S : in bit; Z,W : out bit);
  end component decod2;
  
  component demux2 is
    port(A : in bit; S : in bit; Z,W : out bit);
  end component demux2;

  signal a,b : bit;

begin
  
  -- copie seu o modelo da aula passada
   Udc0:  decod2   port map(s1, a, b);
   Udm0:  demux2   port map(a, s0, x, y);
   Udm1:  demux2   port map(b, s0, z, w);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- decod8(s0,s1,s2,p,q,r,s,t,u,v,w)
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
use work.p_wires.all;

entity decod8 is
  port(s0,s1,s2        : in  bit;
       p,q,r,s,t,u,v,w : out bit);
end decod8;

architecture estrut of decod8 is 

  -- declara componentes que sao instanciados
  component decod2 is
    port(S : in bit; Z,W : out bit);
  end component decod2;

  component demux4 is
    port(A : in bit; S0,S1 : in bit; X,Y,Z,W : out bit);
  end component demux4;
  
  signal a,b : bit;

begin

  -- copie seu o modelo da aula passada
   Udc0:  decod2   port map(s2, a, b);
   Udm0:  demux4   port map(a, s0, s1, p, q, r, s); 
   Udm1:  demux4   port map(b, s0, s1, t, u, v, w);

end architecture estrut;
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
